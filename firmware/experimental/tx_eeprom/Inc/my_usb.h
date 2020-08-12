#ifndef __MY_USB_H
#define __MY_USB_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "stm32f0xx_hal.h"
#include "helpers.h"

#define USB_BUF_SIZE 128

extern char* usb_data;
extern linear_buf usb_recv_buf;
extern volatile int32_t port_opened;

void my_usb_init(void);
void my_usb_putchar(uint8_t ch);
char* my_usb_readline(void);

#ifdef __cplusplus
}
#endif

#endif
