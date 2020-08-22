#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "helpers.h"
#include "VL53L0X.h"
#include "animation.h"
#include "nrf24.h"

#define BASELINE_SAMPLE_SIZE 16
#define CHOP_SIZE 3

#define STM32F0_UUID0 ((uint32_t *)0x1FFFF7AC)
#define STM32F0_UUID1 ((uint32_t *)0x1FFFF7B0)
#define STM32F0_UUID2 ((uint32_t *)0x1FFFF7B4)

uint8_t is_reading_valid;
uint16_t baseline_data[BASELINE_SAMPLE_SIZE];
uint8_t test_data[NRF_PAYLOAD_SIZE];

uint8_t get_uuid(void)
{
	uint32_t sum = *STM32F0_UUID0 + *STM32F0_UUID1 + *STM32F0_UUID2;
    return ((sum >> 24) ^ (sum >> 16) ^ (sum >> 8) ^ sum) & 0xff;
}

void swap(uint16_t *xp, uint16_t *yp) 
{ 
    uint16_t temp = *xp; 
    *xp = *yp; 
    *yp = temp; 
} 

void bubbleSort(uint16_t arr[], uint16_t n) 
{ 
   uint16_t i, j; 
   for (i = 0; i < n-1; i++)       
       for (j = 0; j < n-i-1; j++)  
           if (arr[j] > arr[j+1]) 
              swap(&arr[j], &arr[j+1]); 
}

uint16_t get_single_distance_reading(uint8_t* is_valid)
{
  uint16_t result = readRangeSingleMillimeters();
  *is_valid = 1;
  if(result >= 1200)
    result = 1700;
  if(result < 20)
    *is_valid = 0;
  return result;
}

/*
get a baseline distance reading when powering up

first it takes BASELINE_SAMPLE_SIZE sample readings, 100ms apart
then the array containing the readings is sorted
then the first and last CHOP_SIZE samples are discarded from the sorted array
then the mean and variance is calculated 
if variance is too large, it means readings are unstable, try again
*/
uint16_t get_baseline(void)
{
  while(1)
  {
    uint32_t mean = 0;
    for (int i = 0; i < BASELINE_SAMPLE_SIZE; ++i)
    {
      baseline_data[i] = get_single_distance_reading(&is_reading_valid);
      HAL_IWDG_Refresh(&hiwdg);
      HAL_Delay(100);
    }

    bubbleSort(baseline_data, BASELINE_SAMPLE_SIZE);

    for (int i = CHOP_SIZE; i < BASELINE_SAMPLE_SIZE - CHOP_SIZE; ++i)
      mean += baseline_data[i];
    mean /= (BASELINE_SAMPLE_SIZE - CHOP_SIZE * 2);

    uint32_t variance = 0;
    for (int i = CHOP_SIZE; i < BASELINE_SAMPLE_SIZE - CHOP_SIZE; ++i)
      variance += (baseline_data[i] - mean) * (baseline_data[i] - mean);
    variance /= (BASELINE_SAMPLE_SIZE - CHOP_SIZE * 2);

    if(variance <= 300)
    {
      printf("baseline: %d\n", mean);
      return mean;
    }
    
    printf("\ncalibration failed - variance too large: %d, samples:\n", variance);
    for (int i = CHOP_SIZE; i < BASELINE_SAMPLE_SIZE - CHOP_SIZE; ++i)
      printf("%d ", baseline_data[i]);
    printf("\n");
  }
}

uint16_t get_trigger_threshold(uint16_t baseline)
{
  // smaller number narrower deadzone, more sensitive
  return 0.333*baseline;
}

void iwdg_wait(uint32_t msec, uint8_t ani_type)
{
  start_animation(ani_type);
  uint32_t start = HAL_GetTick();
  while(HAL_GetTick() - start <= msec)
    HAL_IWDG_Refresh(&hiwdg);
}

void tof_calibrate(uint16_t* base, uint16_t* threshold)
{
  printf("VL53L0X calibrating... ");
  *base = get_baseline();
  *threshold = get_trigger_threshold(*base);
}

// put this before IWDG_init so it can turn off after reset?
void check_battery(uint32_t* vbat_mV)
{
  *vbat_mV = 3800;
  return;
}

void build_packet_trig(uint8_t* data, uint16_t base, uint16_t this)
{
  data[0] = get_uuid();
  data[1] = DTPR_CMD_TRIG;
  data[2] = base >> 8;
  data[3] = base & 0xff;
  data[4] = this >> 8;
  data[5] = this & 0xff;
}

void build_packet_stat(uint8_t* data, uint32_t vbat_mV, uint16_t pot)
{
  data[0] = get_uuid();
  data[1] = DTPR_CMD_STAT;
  data[2] = (vbat_mV >> 8) & 0xff;;
  data[3] = vbat_mV & 0xff;
  data[4] = (pot >> 8) & 0xff;
  data[5] = pot & 0xff;
}

uint8_t send_packet(uint8_t* data)
{
  nrf24_send(data);
  while(nrf24_isSending())
    HAL_IWDG_Refresh(&hiwdg);
  if(nrf24_lastMessageStatus() == NRF24_TRANSMISSON_OK)
  {
    printf("TX OK, retry %d times\n", nrf24_retransmissionCount());
    return 0;
  }
  printf("TX failed\n");
  return 1;
}

// TX test mode, sends test packets every second
// can be used to test comm range
void tx_test(void)
{
  uint8_t count = 0;
  test_data[0] = get_uuid();
  test_data[1] = DTPR_CMD_TEST;

  while(1)
  {
    memset(test_data+2, count, 4);
    for (int i = 0; i < 6; ++i)
      printf("0x%x ", test_data[i]);
    printf("\n");
    count++;
    send_packet(test_data);
    iwdg_wait(150, ANIMATION_TYPE_CONST_ON);
    iwdg_wait(850, ANIMATION_TYPE_CONST_OFF);
  }
}

