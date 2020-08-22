#ifndef __SLEEPYBUTTON_H
#define __SLEEPYBUTTON_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "stm32f0xx_hal.h"
#include "shared.h"

#ifdef __cplusplus
}
#endif

#define BUTTON_NOTHING 0
#define BUTTON_SHORTPRESS 1
#define BUTTON_LONGPRESS 2

uint8_t button_update(uint8_t reading, uint32_t ts);

#endif


