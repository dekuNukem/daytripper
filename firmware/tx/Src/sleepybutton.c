#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "helpers.h"
#include "sleepbutton.h"

#define STATE_UNPRESSED 0
#define STATE_PRESSED 1

uint8_t curr_state = STATE_UNPRESSED;
uint32_t timestamp; 

uint8_t button_update(uint8_t reading, uint32_t ts)
{
	uint8_t result = BUTTON_NOTHING;
	// unpressed 0, pressed 1
	if(curr_state == STATE_UNPRESSED && reading == 1)
	{
		curr_state = STATE_PRESSED;
		timestamp = ts;
	}
	if(curr_state == STATE_PRESSED && reading == 0)
	{
		curr_state = STATE_UNPRESSED;
		result = BUTTON_SHORTPRESS;
		if(ts - timestamp > 1500)
			result = BUTTON_LONGPRESS;
	}
	return result;
}
