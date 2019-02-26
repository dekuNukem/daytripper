#ifndef __HELPERS_H
#define __HELPERS_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "stm32f0xx_hal.h"
#include "shared.h"

#define DTPR_CMD_TEST 0x27
#define DTPR_CMD_TRIG 0xbb
#define DTPR_CMD_RET 0xcf
#define NRF_PAYLOAD_SIZE 6

uint16_t get_baseline(void);
uint16_t get_trigger_threshold(uint16_t baseline);
void check_battery(void);
void build_packet(uint8_t* data_array, uint16_t base, uint16_t this);
void tof_calibrate(uint16_t* base, uint16_t* threshold);
void tx_test(void);
uint8_t send_packet(uint8_t* data);

#ifdef __cplusplus
}
#endif

#endif


