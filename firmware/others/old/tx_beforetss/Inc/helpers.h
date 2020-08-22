#ifndef __HELPERS_H
#define __HELPERS_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "stm32f0xx_hal.h"
#include "shared.h"

#define DTPR_CMD_TEST 0xa1
#define DTPR_CMD_TRIG 0xb2
#define DTPR_CMD_RET 0xc3
#define DTPR_CMD_STAT 0xd4

#define NRF_PAYLOAD_SIZE 6
#define NRF_CHANNEL 115

uint16_t get_baseline(void);
void check_battery(uint32_t* bat_reading, uint8_t* flag);
void build_packet_trig(uint8_t* data_array, uint16_t base, uint16_t this);
void tof_calibrate(uint16_t* base, uint16_t* threshold);
void tx_test(void);
uint8_t send_packet(uint8_t* data);
void build_packet_stat(uint8_t* data, uint32_t vbat);

#ifdef __cplusplus
}
#endif

#endif


