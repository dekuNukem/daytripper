#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "helpers.h"
#include "keyboard.h"

uint8_t get_slide_sw_pos(void)
{
  uint8_t sw_b = HAL_GPIO_ReadPin(SW_B_GPIO_Port, SW_B_Pin);
  uint8_t sw_d = HAL_GPIO_ReadPin(SW_D_GPIO_Port, SW_D_Pin);

  if(sw_b == 1 && sw_d == 0)
    return SLIDE_SW_POS_CUSTOM;
  if (sw_b == 0 && sw_d == 1)
    return SLIDE_SW_POS_LOCK;
  return SLIDE_SW_POS_MINI;
}

void press_keys(uint8_t index)
{
  switch (index)
  {
    case SLIDE_SW_POS_MINI:
      keyboard_press(KEY_LEFT_GUI, 0);
      HAL_Delay(34);
      keyboard_press('d', 0);
      HAL_Delay(34);
      keyboard_release_all();
      HAL_Delay(34);
      break;
    case SLIDE_SW_POS_CUSTOM:
      keyboard_press(KEY_LEFT_ALT, 0);
      HAL_Delay(34);
      keyboard_press(KEY_PAUSE, 0);
      HAL_Delay(34);
      keyboard_release_all();
      HAL_Delay(34);
      break;
    case SLIDE_SW_POS_LOCK:
      keyboard_press(KEY_LEFT_GUI, 0);
      HAL_Delay(34);
      keyboard_press('l', 0);
      HAL_Delay(34);
      keyboard_release_all();
      HAL_Delay(34);
      break;
  }
}

