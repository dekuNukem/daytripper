#ifndef __SD_UTIL_H
#define __SD_UTIL_H

#include "stm32f0xx_hal.h"
#include "shared.h"

struct hwif {
  int initialized;
  int sectors;
  int erase_sectors;
  int capabilities;
};
typedef struct hwif hwif;

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;

int hwif_init(hwif* hw);
int sd_read(hwif* hw, u32 address, u8 *buf);
int sd_write(hwif* hw, u32 address,const u8 *buf);

void sd_util_test();

#endif

