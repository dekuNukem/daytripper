#ifndef __HELPERS_H
#define __HELPERS_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "stm32l0xx_hal.h"
#include "shared.h"

#define DTPR_CMD_TEST 0xa1
#define DTPR_CMD_TRIG 0xb2
#define DTPR_CMD_STAT 0xc3

#define NRF_PAYLOAD_SIZE 6
#define NRF_CHANNEL 115

void build_packet_trig(uint8_t* data_array, uint16_t base, uint16_t this);
uint8_t send_packet(uint8_t* data);
void build_packet_stat(uint8_t* data, uint16_t vbat_mV, uint16_t pot);
void kick_dog(void);
uint32_t get_battery_adc_reading(void);

#ifdef __cplusplus
}
#endif

#endif


