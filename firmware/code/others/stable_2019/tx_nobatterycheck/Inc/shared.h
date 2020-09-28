#ifndef __shared_H
#define __shared_H

#include "stm32f0xx_hal.h"
#include "main.h"

extern SPI_HandleTypeDef hspi1;
extern I2C_HandleTypeDef hi2c1;
extern UART_HandleTypeDef huart2;
extern ADC_HandleTypeDef hadc;
extern TIM_HandleTypeDef htim2;
extern TIM_HandleTypeDef htim17;
extern IWDG_HandleTypeDef hiwdg;

#endif
