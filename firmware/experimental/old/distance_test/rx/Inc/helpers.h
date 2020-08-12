#ifndef __HELPERS_H
#define __HELPERS_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "stm32f0xx_hal.h"
#include "shared.h"

#define SLIDE_SW_POS_MINI 0
#define SLIDE_SW_POS_CUSTOM 1
#define SLIDE_SW_POS_LOCK 2

uint8_t get_slide_sw_pos(void);
void press_keys(uint8_t index);

#ifdef __cplusplus
}
#endif

#endif


