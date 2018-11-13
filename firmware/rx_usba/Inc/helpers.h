#ifndef __HELPERS_H
#define __HELPERS_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "stm32f0xx_hal.h"
#include "shared.h"

#define SLIDE_SW_POS_MINI 0
#define SLIDE_SW_POS_LOCK 1
#define SLIDE_SW_POS_CUSTOM 2

uint8_t get_slide_sw_pos(void);

#ifdef __cplusplus
}
#endif

#endif


