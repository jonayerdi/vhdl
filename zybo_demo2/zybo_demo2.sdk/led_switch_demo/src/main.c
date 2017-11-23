/*
 * main.c
 *
 *  Created on: 24 Oct 2017
 *      Author: Jon Ayerdi
 */

#include "xgpio.h"

#define LED_CHANNEL 1
#define SW_CHANNEL 2

#define LED_BITWIDTH 4
#define SW_BITWIDTH 4

#define delay(x) for (unsigned int _count = 0; _count < (x); _count++);

int main(void)
{
	XGpio axi;

	XGpio_Initialize(&axi, XPAR_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&axi, LED_CHANNEL, 0x0); /* 0 = output, 1 = input */
	XGpio_SetDataDirection(&axi, SW_CHANNEL, 0x1); /* 0 = output, 1 = input */

	while(1)
	{
		XGpio_DiscreteWrite(&axi, LED_CHANNEL, XGpio_DiscreteRead(&axi, SW_CHANNEL)); /* Turn on LEDs based on switch states */
	}
	return XST_SUCCESS;
}
