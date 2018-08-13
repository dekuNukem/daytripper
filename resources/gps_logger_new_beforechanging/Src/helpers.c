#include "stm32f0xx_hal.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "helpers.h"
#include "shared.h"
#include "minmea.h"
#include "sleep.h"

#define FILE_NAME_BUF_SIZE (12+1)
#define RMC_BUF_SIZE 128
#define SD_WRITE_BUF_SIZE 2048
#define CLEAR_SD_WRITE_BUF() memset(sd_write_buf, 0, SD_WRITE_BUF_SIZE + 1)
#define ADC_DMA_BUF_SIZE 4
#define clear_dma_buf() memset(adc_dma_buf, 0, ADC_DMA_BUF_SIZE * sizeof(uint32_t))


char rmc_buf[RMC_BUF_SIZE];
char sd_write_buf[SD_WRITE_BUF_SIZE + 1];
char curr_filename[FILE_NAME_BUF_SIZE];
char temp_filename[FILE_NAME_BUF_SIZE];
uint32_t adc_dma_buf[ADC_DMA_BUF_SIZE];
volatile int8_t dac_available = 0;

int8_t linear_buf_init(linear_buf *lb)
{
  if(lb == NULL)
    return 1;
  linear_buf_reset(lb);
  lb->last_recv = 0;
  return 0;
}

int8_t linear_buf_reset(linear_buf *lb)
{
  if(lb == NULL)
    return 1;
  lb->curr_index = 0;
  memset(lb->buf, 0, LB_SIZE);
  return 0;
}

int8_t linear_buf_add(linear_buf *lb, char c)
{
  if(lb == NULL)
    return 1;
  lb->buf[lb->curr_index] = c;
  if(lb->curr_index < LB_SIZE)
    lb->curr_index++;
  lb->last_recv = HAL_GetTick();
  return 0;
}

int8_t match_rmc(char* buf, char* nmea_str, int32_t nmea_str_len)
{
  char* nmea_start = strstr(buf, "RMC");
  char* nmea_end = strstr(nmea_start, "\n");

  if(nmea_start == NULL || nmea_end == NULL || nmea_start > nmea_end)
    return 1;
  nmea_end += 1;
  nmea_start -= 3;
  memset(nmea_str, 0, nmea_str_len);
  strncpy(nmea_str, nmea_start, nmea_end - nmea_start);
  return 0;
}

int8_t sd_add(char* nmea_buf)
{
  if(gps_rmc.valid == 0)
    return 1;

  memset(temp_filename, 0, FILE_NAME_BUF_SIZE);
  sprintf(temp_filename, "20%d%02d%02d.txt", gps_rmc.date.year, gps_rmc.date.month, gps_rmc.date.day);
  if(strcmp(temp_filename, curr_filename) != 0) // a new day passed
  {
    memcpy(curr_filename, temp_filename, FILE_NAME_BUF_SIZE);
    f_close(&sd_file);
    sd_fresult = f_open(&sd_file, curr_filename, FA_WRITE | FA_OPEN_ALWAYS);
    printf("creating new file %s... result: %d\n", curr_filename, sd_fresult);
    sd_fresult = f_lseek(&sd_file, f_size(&sd_file));
    printf("moving to end of file... result: %d\n", sd_fresult);
  }

  // now the correct file is open and write pointer at end
  sd_write_buf[SD_WRITE_BUF_SIZE] = 0;
  int16_t write_buf_len = strlen(sd_write_buf);
  int16_t nmea_len = strlen(nmea_buf);
  printf("write_buf: %d/%d\n", write_buf_len, SD_WRITE_BUF_SIZE);
  if(write_buf_len + nmea_len <= SD_WRITE_BUF_SIZE)
    strcpy(sd_write_buf + write_buf_len, nmea_buf);
  else
  {
    HAL_GPIO_WritePin(SD_LED_GPIO_Port, SD_LED_Pin, HIGH);
    int16_t remaining = SD_WRITE_BUF_SIZE - write_buf_len;
    strncpy(sd_write_buf + write_buf_len, nmea_buf, remaining);
    // massive error handling to be implemented here, out of space, etc
    sd_fresult = f_write(&sd_file, sd_write_buf, SD_WRITE_BUF_SIZE, &sd_bytes_written);
    sd_fresult = f_sync(&sd_file);
    if(sd_bytes_written != SD_WRITE_BUF_SIZE)
      sd_error(sd_fresult);
    printf("commiting to SD... result: %d\n", sd_fresult);
    CLEAR_SD_WRITE_BUF();
    strncpy(sd_write_buf, nmea_buf + remaining, nmea_len - remaining);
    HAL_GPIO_WritePin(SD_LED_GPIO_Port, SD_LED_Pin, LOW);
  }
  return 0;
}

int8_t mnea_handler(linear_buf *lb)
{
  if(lb == NULL)
    return 1;
  char* buf_start = lb->buf;
  char* buf_end = buf_start + LB_SIZE - 1;
  while(*buf_start != '$')
  {
    buf_start++;
    if(buf_start >= buf_end)
      return 2;
  }
  if(strstr(buf_start, "TXT") != NULL)
  {
    linear_buf_reset(lb);
    return 3;
  }
  if(buf_start[strlen(buf_start) - 1] != '\n')
    return 4;
  if(match_rmc(buf_start, rmc_buf, RMC_BUF_SIZE) == 0)
    parse_gps(rmc_buf, &gps_rmc);
  sd_add(buf_start);
  linear_buf_reset(lb);
  return 0;
}

int8_t log_gps(linear_buf *lb)
{
  if(lb == NULL)
    return 1;
  int32_t start = HAL_GetTick();
  while(1)
  {
    HAL_UART_Receive_IT(gps_uart_ptr, gps_byte_buf, 1);
    if(HAL_GetTick() - start > 1000) // timeout
      return 2;
    if(HAL_GetTick() - start > 150 && HAL_GetTick() - lb->last_recv > 10 && lb->buf[0])
    {
      if(mnea_handler(lb) != 0)
        continue;
      else
        return 0;
    }
  }
}

float calc_vbat(uint32_t adc_vref, uint32_t adc_vbat_div2)
{
  adc_vref == 0 ? adc_vref = 1 : adc_vref;
  return (1.2 / (float)adc_vref) * adc_vbat_div2 * 2;
}

/*
100-67  3LED  > 3.9
66-33   2LED  > 3.75
33-10    1LED   > 3.6
below 10  1LED flashing then shutdown

3.6V cutoff
*/

void battery_crtl(int32_t show_led)
{
  float vbat = check_battery();
  printf("battery: %fV\n", vbat);
  if(show_led)
  {
    HAL_GPIO_WritePin(BAT_LED_GPIO_Port, BAT_LED_Pin, LOW);
    HAL_GPIO_WritePin(GPS_LED_GPIO_Port, GPS_LED_Pin, LOW);
    HAL_GPIO_WritePin(SD_LED_GPIO_Port, SD_LED_Pin, LOW);
    HAL_Delay(100);
    HAL_GPIO_WritePin(BAT_LED_GPIO_Port, BAT_LED_Pin, vbat >= 3.6);
    HAL_GPIO_WritePin(GPS_LED_GPIO_Port, GPS_LED_Pin, vbat >= 3.75);
    HAL_GPIO_WritePin(SD_LED_GPIO_Port, SD_LED_Pin, vbat >= 3.9);
    HAL_Delay(1500);
    HAL_GPIO_WritePin(BAT_LED_GPIO_Port, BAT_LED_Pin, LOW);
    HAL_GPIO_WritePin(GPS_LED_GPIO_Port, GPS_LED_Pin, LOW);
    HAL_GPIO_WritePin(SD_LED_GPIO_Port, SD_LED_Pin, LOW);
  }
  if(vbat < 3.6)
    low_bat_shutoff();
  while(1);
}

float check_battery()
{
  int32_t enter_time = HAL_GetTick();
  clear_dma_buf();
  while(1)
  {
    HAL_ADC_Start_DMA(adc_ptr, adc_dma_buf, ADC_DMA_BUF_SIZE);
    if(dac_available)
    {
      dac_available = 0;
      HAL_ADC_Stop_DMA(adc_ptr);
      return calc_vbat(adc_dma_buf[3], adc_dma_buf[2]);
    }
    if(HAL_GetTick() - enter_time > 500) // timeout
      return -1;
  }
  return -1;
}

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
  dac_available = 1;
}

int8_t gps_status()
{
  return HAL_GPIO_ReadPin(GPS_INT_GPIO_Port, GPS_INT_Pin);
}

void gps_on()
{
  if(gps_status() == HIGH) // already on
    return;
  printf("turning GPS on...\n");
  HAL_GPIO_WritePin(GPS_INT_GPIO_Port, GPS_INT_Pin, HIGH);
}

void gps_off()
{
  if(gps_status() == LOW) // already off
    return;
  printf("turning GPS off...\n");
  HAL_GPIO_WritePin(GPS_INT_GPIO_Port, GPS_INT_Pin, LOW);
}

void sd_error(int32_t err_code)
{
  gps_off();
  // press user button to software reset here?
  while(1)
  {
    printf("SD ERROR: %d\n", err_code);
    HAL_GPIO_TogglePin(SD_LED_GPIO_Port, SD_LED_Pin);
    HAL_Delay(100);
  }
}

void low_bat_shutoff()
{
  return;
  // TODO: turn off acc
  while(1)
  {
    gps_off();
    for (int i = 0; i < 32; i++)
    {
      printf("LOW BATTERY\n");
      HAL_GPIO_TogglePin(BAT_LED_GPIO_Port, BAT_LED_Pin);
      HAL_NVIC_DisableIRQ(i);
      HAL_Delay(100);
    }
    deepsleep();
  }
}