#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "helpers.h"
#include "VL53L0X.h"
#include "animation.h"

#define BASELINE_SAMPLE_SIZE 16

uint16_t baseline_data[BASELINE_SAMPLE_SIZE];

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

void check_battery(void)
{
  return;
  uint8_t result = 255;
  HAL_ADC_Start(&hadc);
  if(HAL_ADC_PollForConversion(&hadc, 100) == HAL_OK)
    result = HAL_ADC_GetValue(&hadc);
  HAL_ADC_Stop(&hadc);
  printf("vbat = %d\n", result);
  if(result <= 135) // 3.6V
  {
    printf("low battery, shutting down...\n"); 

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
