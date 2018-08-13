#include "sleep.h"
#include "shared.h"

void sleep(void)
{
  // printf("entering sleep mode at %d...\n", HAL_GetTick());
  HAL_SuspendTick();
  HAL_PWR_EnterSLEEPMode(PWR_MAINREGULATOR_ON, PWR_SLEEPENTRY_WFI);
  HAL_ResumeTick();
  // printf("exiting sleep mode at %d...\n", HAL_GetTick());
}

void deepsleep(void)
{
  // printf("entering stop mode at %d...\n", HAL_GetTick());
  HAL_SuspendTick();
  HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);
  HAL_InitTick(TICK_INT_PRIORITY);
  HAL_ResumeTick();
  // printf("exiting stop mode at %d...\n", HAL_GetTick());
}
