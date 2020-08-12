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
 	
#define NRF_ON() HAL_GPIO_WritePin(NRF_VCC_GPIO_Port, NRF_VCC_Pin, GPIO_PIN_RESET)
#define NRF_OFF() HAL_GPIO_WritePin(NRF_VCC_GPIO_Port, NRF_VCC_Pin, GPIO_PIN_SET)

typedef struct
{
  int32_t last_recv;
  int32_t curr_index;
  int32_t buf_size;
  uint8_t* buf;
} linear_buf;

typedef struct
{
  // 0
  uint8_t refresh_rate_Hz; // from 1Hz to around 30Hz, over 30 just go as fast as possible
  // 1
  uint8_t nr_sensitivity; // NR window size, 0 no window, 1 default, 2 max
  // 2
  uint8_t tof_timing_budget_ms; // timing budget in ms
  // 3
  uint8_t tof_range_max_cm; // value * 2 = true range
  // 4
  uint8_t tof_range_min_cm; // value * 2 = true range
  // 5
  uint8_t use_led;  // 1 turn on LED when triggered, 0 not
  // 6
  uint8_t op_mode; // 0 normal, 1 continuous
  // 7
  uint8_t print_debug_info;
  // 8
  uint8_t tx_wireless_channel; // last byte of wireless channel number
  
  uint8_t hardware_id;
  int16_t rtc_sleep_duration_ms;
  uint8_t tof_model_id;
} dt_conf;

uint16_t get_baseline(void);
void check_battery(uint16_t* vbat_mV);
void build_packet_trig(uint8_t* data_array, uint16_t base, uint16_t this);
void tof_calibrate(uint16_t* base, uint16_t* threshold);
void tx_test(void);
uint8_t send_packet(uint8_t* data);
void build_packet_stat(uint8_t* data, uint32_t vbat_mV, uint16_t pot);
void iwdg_wait(uint32_t msec, uint8_t ani_type);
uint16_t get_single_distance_reading(uint8_t* is_valid, uint16_t sleep_ms);
void rtc_sleep(RTC_HandleTypeDef *hrtc, uint32_t duration_ms);

int32_t linear_buf_init(linear_buf *lb, int32_t size);
void linear_buf_reset(linear_buf *lb);
int32_t linear_buf_add(linear_buf *lb, uint8_t c);
int32_t linear_buf_add_str(linear_buf *lb, uint8_t *s, uint32_t len);
void dt_conf_load(dt_conf *dtc);
void dt_conf_print(dt_conf *dtc);
void run_time_update(uint32_t duration_ms);
void parse_cmd(char* cmd);
void dt_conf_load_default(dt_conf *dtc);

extern uint8_t is_reading_valid;
extern dt_conf daytripper_config;
extern uint32_t rtc_sleep_count_ms;
extern uint16_t rtc_counter;

#ifdef __cplusplus
}
#endif

#endif


