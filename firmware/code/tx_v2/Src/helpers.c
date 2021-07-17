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

void kick_dog(void)
{
  // HAL_IWDG_Refresh(&hiwdg);
  return;
}
