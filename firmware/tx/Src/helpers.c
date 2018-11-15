#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "helpers.h"
#include "VL53L0X.h"

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
      HAL_Delay(100);
    }
    mean /= BASELINE_SAMPLE_SIZE;

    uint32_t variance = 0;
    for (int i = 0; i < BASELINE_SAMPLE_SIZE; ++i)
      variance += (baseline_data[i] - mean) * (baseline_data[i] - mean);
    variance /= BASELINE_SAMPLE_SIZE;

    if(variance <= 300)
      return mean;

    printf("\ncalibration failed - variance too large: %d, retrying...\n", variance);
  }
}

uint16_t get_trigger_threshold(uint16_t baseline)
{
  // smaller number narrower deadzone, more sensitive
  // larger number wider deadzone, less sensitive
  return 0.333*baseline;
}

uint8_t get_adc_reading(void)
{
  uint8_t result = 0;
  HAL_ADC_Start(&hadc);
  if(HAL_ADC_PollForConversion(&hadc, 100) == HAL_OK)
    result = HAL_ADC_GetValue(&hadc);
  HAL_ADC_Stop(&hadc);
  return result;
}
