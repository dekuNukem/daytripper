#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "helpers.h"
#include "VL53L0X.h"
#include "animation.h"
#include "nrf24.h"

#define BASELINE_SAMPLE_SIZE 16
#define STM32_UUID ((uint32_t *)0x1FFFF7AC)

uint16_t stat_packet_count;
uint16_t baseline_data[BASELINE_SAMPLE_SIZE];
uint8_t test_data[NRF_PAYLOAD_SIZE];

uint16_t get_baseline(void)
{
  while(1)
  {
    uint32_t mean = 0;
    for (int i = 0; i < BASELINE_SAMPLE_SIZE; ++i)
    {
      baseline_data[i] = readRangeSingleMillimeters();
      mean += baseline_data[i];
      // HAL_IWDG_Refresh(&hiwdg);
      HAL_Delay(100);
    }
    mean /= BASELINE_SAMPLE_SIZE;

    uint32_t variance = 0;
    for (int i = 0; i < BASELINE_SAMPLE_SIZE; ++i)
      variance += (baseline_data[i] - mean) * (baseline_data[i] - mean);
    variance /= BASELINE_SAMPLE_SIZE;

    if(variance <= 300)
    {
      printf("mean: %d\n", mean);
      return mean;
    }

    printf("calibration failed - variance too large: %d, retrying...\n", variance);
  }
}

uint16_t get_trigger_threshold(uint16_t baseline)
{
  // smaller number narrower deadzone, more sensitive
  return 0.333*baseline;
}

void tof_calibrate(uint16_t* base, uint16_t* threshold)
{
  start_animation(ANIMATION_TYPE_BREATHING);
  for (int i = 0; i < 4; i++)
  {
    // HAL_IWDG_Refresh(&hiwdg);
    HAL_Delay(500);
  }
  printf("calibrating...\n");
  *base = get_baseline();
  *threshold = get_trigger_threshold(*base);
  printf("done!\n");
  start_animation(ANIMATION_TYPE_CONST_OFF);
}

void check_battery(uint32_t* vbat_mV, uint8_t* flag)
{
  uint8_t vbat_8b, vrefint;
  HAL_ADC_Start(&hadc);
  HAL_ADC_PollForConversion(&hadc, 100);
  vbat_8b = HAL_ADC_GetValue(&hadc);
  HAL_ADC_PollForConversion(&hadc, 100);
  vrefint = HAL_ADC_GetValue(&hadc);
  HAL_ADC_Stop(&hadc);

  *vbat_mV = (1200 / vrefint) * vbat_8b * 2;
  *flag = 1;
  // printf("ch1: %d, ch2: %d, vbat: %d\n", vbat_8b, vrefint, *vbat_mV);
  return;
  if(*vbat_mV <= 3200)
  {
    printf("low battery, shutting down...\n");

    start_animation(ANIMATION_TYPE_FASTBLINK);
    for (int i = 0; i < 8; i++)
    {
      // HAL_IWDG_Refresh(&hiwdg);
      HAL_Delay(500);
    }
    start_animation(ANIMATION_TYPE_CONST_OFF);

    // turn off external chips
    HAL_GPIO_WritePin(NRF_CE_GPIO_Port, NRF_CE_Pin, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(SPI1_CS_GPIO_Port, SPI1_CS_Pin, GPIO_PIN_SET);

    // disable all interrupts
    for (int i = 0; i <= 31; i++)
      HAL_NVIC_DisableIRQ(i);

    // turn off periphrials
    HAL_ADC_MspDeInit(&hadc);
    HAL_I2C_MspDeInit(&hi2c1);
    HAL_RTC_MspDeInit(&hrtc);
    HAL_SPI_MspDeInit(&hspi1);
    HAL_TIM_Base_MspDeInit(&htim2);
    HAL_TIM_Base_MspDeInit(&htim17);
    HAL_UART_MspDeInit(&huart2);

    HAL_PWR_EnterSTANDBYMode();
  }
}

void build_packet_trig(uint8_t* data, uint16_t base, uint16_t this)
{
  data[0] = *STM32_UUID;
  data[1] = DTPR_CMD_TRIG;
  data[2] = base >> 8;
  data[3] = base & 0xff;
  data[4] = this >> 8;
  data[5] = this & 0xff;
}

void build_packet_stat(uint8_t* data, uint32_t vbat_mV)
{
  data[0] = *STM32_UUID;
  data[1] = DTPR_CMD_STAT;
  data[2] = (vbat_mV >> 8) & 0xff;;
  data[3] = vbat_mV & 0xff;
  data[4] = (stat_packet_count >> 8) & 0xff;
  data[5] = stat_packet_count & 0xff;
  stat_packet_count++;
}

uint8_t send_packet(uint8_t* data)
{
  nrf24_send(data);
  while(nrf24_isSending());
  if(nrf24_lastMessageStatus() == NRF24_TRANSMISSON_OK)
  {
    printf("TX OK, retry: %d\n",nrf24_retransmissionCount());
    return 0;
  }
  else
  {
    printf("TX failed\n");
    return 1;
  }
}

void tx_test(void)
{
  uint8_t count = 0;
  test_data[0] = *STM32_UUID;
  test_data[1] = DTPR_CMD_TEST;

  while(1)
  {
    start_animation(ANIMATION_TYPE_CONST_ON);
    memset(test_data+2, count, 4);
    for (int i = 0; i < 6; ++i)
      printf("%d ", test_data[i]);
    printf("\n");
    count++;
    send_packet(test_data);
    HAL_Delay(150);
    start_animation(ANIMATION_TYPE_CONST_OFF);

    if(count > 5 && HAL_GPIO_ReadPin(USER_BUTTON_GPIO_Port, USER_BUTTON_Pin))
      return;

    HAL_Delay(850);
  }
}

