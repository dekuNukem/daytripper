#ifndef ANIMATION_H
#define ANIMATION_H

#include "stm32f0xx_hal.h"

#define ANIMATION_TYPE_CONST_OFF 0
#define ANIMATION_TYPE_CONST_ON 1
#define ANIMATION_TYPE_BREATHING 2
#define ANIMATION_TYPE_FASTBLINK 3

void animation_init(TIM_HandleTypeDef* frame_tim, TIM_HandleTypeDef* pwm_tim);
void animation_update(void);
void start_animation(uint8_t ani_type);

#endif

