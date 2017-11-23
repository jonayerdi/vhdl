/*
 * main.c
 *
 *  Created on: 19 Oct 2017
 *      Author: Jon Ayerdi
 */

#include "xgpio.h"

#define LED_CHANNEL 1
#define SW_CHANNEL 1

#define LED_BITWIDTH 4
#define SW_BITWIDTH 4

#define delay(x) for (unsigned int _count = 0; _count < (x); _count++);

int main(void)
{
	XGpio leds, sw;

	XGpio_Initialize(&leds, XPAR_GPIO_0_DEVICE_ID); /* LEDs -> XGPIO_0 */
	XGpio_SetDataDirection(&leds, LED_CHANNEL, 0x0); /* 0 = output, 1 = input */

	XGpio_Initialize(&sw, XPAR_GPIO_1_DEVICE_ID); /* switches -> XGPIO_1 */
	XGpio_SetDataDirection(&sw, SW_CHANNEL, 0x1); /* 0 = output, 1 = input */

	while(1)
	{
		XGpio_DiscreteWrite(&leds, LED_CHANNEL, XGpio_DiscreteRead(&sw, SW_CHANNEL)); /* Turn on LEDs based on switch states */
	}
	return XST_SUCCESS;
}
