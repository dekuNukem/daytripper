#ifndef __shared_H
#define __shared_H

#include "ff.h"
#include "stm32f0xx_hal.h"
#include "minmea.h"
  
extern FRESULT sd_fresult;
extern FATFS sd_fs;
extern FIL sd_file;
extern uint32_t sd_bytes_written;
extern volatile char gps_byte_buf[1];

extern I2C_HandleTypeDef hi2c1;
#define acc_i2c_ptr (&hi2c1)

extern SPI_HandleTypeDef hspi1;
#define sd_spi_ptr (&hspi1)

extern ADC_HandleTypeDef hadc;
#define adc_ptr (&hadc)

extern UART_HandleTypeDef huart2;
#define gps_uart_ptr (&huart2)

extern struct minmea_sentence_rmc gps_rmc;

typedef enum
{
  USER_BUTTON,
  GPS_TIMEPULSE,
  ACC_WATERMARK,
  UNKOWN
} wakeup_reason_type;

#endif
