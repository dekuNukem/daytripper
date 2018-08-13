#ifndef __HELPERS_H
#define __HELPERS_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "stm32f0xx_hal.h"
#define LB_SIZE 512

typedef struct
{
	int32_t last_recv;
	int32_t curr_index;
	char buf[LB_SIZE];
}linear_buf;

int8_t linear_buf_init(linear_buf *lb);
int8_t linear_buf_reset(linear_buf *lb);
int8_t linear_buf_add(linear_buf *lb, char c);
int8_t match_rmc(char* buf, char* nmea_str, int32_t nmea_str_len);
int8_t mnea_handler(linear_buf *lb);
int8_t log_gps(linear_buf *lb);
float check_battery();
void gps_on();
void gps_off();
void sd_error(int32_t err_code);
void low_bat_shutoff();
int8_t gps_status();
void battery_crtl(int32_t show_led);

#ifdef __cplusplus
}
#endif

#endif


