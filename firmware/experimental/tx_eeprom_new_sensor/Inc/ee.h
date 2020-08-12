#ifndef __EEPROM_H
#define __EEPROM_H

/*
  Author:     Nima Askari
  WebSite:    http://www.github.com/NimaLTD
  Instagram:  http://instagram.com/github.NimaLTD
  Youtube:    https://www.youtube.com/channel/UCUhY7qY1klJm1d2kulr9ckw
  
  Version:    2.0.1
  
  (2.0.1)
  Change function name to ee_commit().
  
  Reversion History:
  (2.0.0)
  Rewrite again.

*/

#ifdef __cplusplus
 extern "C" {
#endif

// #include <stdbool.h>
#include <stdint.h>
//#include "gpio.h"

//################################################################################################################
uint8_t      ee_format(void);
uint8_t      ee_read(uint32_t startVirtualAddress, uint32_t len, uint8_t* data);
uint8_t      ee_write(uint32_t startVirtualAddress, uint32_t len, uint8_t* data);
uint32_t  ee_maxVirtualAddress(void);

//################################################################################################################

#ifdef __cplusplus
}
#endif

#endif
