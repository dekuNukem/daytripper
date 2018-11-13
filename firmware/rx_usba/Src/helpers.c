#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "helpers.h"

uint8_t get_slide_sw_pos(void)
{
  uint8_t sw_b = HAL_GPIO_ReadPin(SW_B_GPIO_Port, SW_B_Pin);
  uint8_t sw_d = HAL_GPIO_ReadPin(SW_D_GPIO_Port, SW_D_Pin);

  if(sw_b == 1 && sw_d == 0)
    return SLIDE_SW_POS_LOCK;
  if (sw_b == 0 && sw_d == 1)
    return SLIDE_SW_POS_CUSTOM;
  return SLIDE_SW_POS_MINI;
}
