#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "main.h"
#include "helpers.h"
#include "VL53L1X.h"
#include "nrf24.h"

#define STM32L0_UUID0 ((uint32_t *)0x1FF80050)
#define STM32L0_UUID1 ((uint32_t *)0x1FF80054)
#define STM32L0_UUID2 ((uint32_t *)0x1FF80058)

#define EEPROM_BASE_ADDR  0x08080000

uint8_t get_uuid(void)
{
  uint32_t sum = *STM32L0_UUID0 + *STM32L0_UUID1 + *STM32L0_UUID2;
  return ((sum >> 24) ^ (sum >> 16) ^ (sum >> 8) ^ sum) & 0xff;
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

void build_packet_stat(uint8_t* data, uint16_t vbat_mV, uint16_t power_on_time)
{
  data[0] = get_uuid();
  data[1] = DTPR_CMD_STAT;
  data[2] = (vbat_mV >> 8) & 0xff;;
  data[3] = vbat_mV & 0xff;
  data[4] = (power_on_time >> 8) & 0xff;
  data[5] = power_on_time & 0xff;
}

uint8_t send_packet(uint8_t* data)
{
  nrf24_send(data);
  while(nrf24_isSending());
    kick_dog();
  if(nrf24_lastMessageStatus() == NRF24_TRANSMISSON_OK)
  {
    // printf("TX OK, retry %d times\n", nrf24_retransmissionCount());
    printf("TX OK\n");
    return 0;
  }
  printf("TX failed\n");
  return 1;
}

/*
With Aglient E3610A on the battery input
3.5V input
vref: 101
vbat: 132
mV: 3199

3.6V input
vref: 98
vbat: 132
mV: 3297

4.2V input
vref: 98
vbat: 155
mV: 3871

5V USB
mV: 4771

*/

uint32_t get_battery_adc_reading(void)
{
  HAL_ADC_Start(&hadc);
  HAL_ADC_PollForConversion(&hadc, 100);
  uint8_t vbat_8b = HAL_ADC_GetValue(&hadc);
  HAL_ADC_PollForConversion(&hadc, 100);
  uint8_t vrefint = HAL_ADC_GetValue(&hadc);
  HAL_ADC_Stop(&hadc);
  // printf("vref: %d\nvbat: %d\nmV: %d\n\n", vrefint, vbat_8b, vbat_mV);
	return (uint32_t)((1224 / (double)vrefint) * (double)vbat_8b * 2);
}

void kick_dog(void)
{
  // HAL_IWDG_Refresh(&hiwdg);
  return;
}

uint8_t EEPROM_ReadByte(uint16_t addr)
{
  return *((uint8_t *)(EEPROM_BASE_ADDR+addr));
}

