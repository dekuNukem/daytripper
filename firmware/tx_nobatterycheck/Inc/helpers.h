#ifndef __HELPERS_H
#define __HELPERS_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "stm32f0xx_hal.h"
#include "shared.h"

#define DTPR_CMD_TEST 0xa1
#define DTPR_CMD_TRIG 0xb2
#define DTPR_CMD_STAT 0xc3

#define NRF_PAYLOAD_SIZE 6
#define NRF_CHANNEL 115

#define WINDOW_SIZE 1
 	
#define NRF_ON() HAL_GPIO_WritePin(NRF_VCC_GPIO_Port, NRF_VCC_Pin, GPIO_PIN_RESET)
#define NRF_OFF() HAL_GPIO_WritePin(NRF_VCC_GPIO_Port, NRF_VCC_Pin, GPIO_PIN_SET)
#define MININUM_WAKEUP_DURATION_MS 50

extern uint8_t is_reading_valid;

uint16_t get_baseline(void);
void check_battery(uint32_t* vbat_mV);
void build_packet_trig(uint8_t* data_array, uint16_t base, uint16_t this);
void tof_calibrate(uint16_t* base, uint16_t* threshold);
void tx_test(void);
uint8_t send_packet(uint8_t* data);
void build_packet_stat(uint8_t* data, uint32_t vbat_mV, uint16_t pot);
void iwdg_wait(uint32_t msec, uint8_t ani_type);
uint16_t get_single_distance_reading(uint8_t* is_valid);

#ifdef __cplusplus
}
#endif

#endif


