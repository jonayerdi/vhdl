/*
 * main.c
 *
 *  Created on: 26 Oct 2017
 *      Author: Jon Ayerdi
 */

#include <xgpiops.h>
#include <xparameters.h>

#define IN 0
#define OUT 1

#define BTN4_PIN 50 /* MIO */
#define BTN5_PIN 51 /* MIO */
#define LED0_PIN 54 /* EMIO */

XGpioPs gpio;

int main(void)
{
	//init GPIO driver
	XGpioPs_Config *gpioConfig = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
	XGpioPs_CfgInitialize(&gpio, gpioConfig, gpioConfig->BaseAddr);
	//set pin directions
	XGpioPs_SetDirectionPin(&gpio, BTN4_PIN, IN);
	XGpioPs_SetDirectionPin(&gpio, BTN5_PIN, IN);
	XGpioPs_SetDirectionPin(&gpio, LED0_PIN, OUT);
	//set output enable
	XGpioPs_SetOutputEnablePin(&gpio, LED0_PIN, 1);
	//program
	while(1)
	{
		u32 btn4 = XGpioPs_ReadPin(&gpio, BTN4_PIN);
		u32 btn5 = XGpioPs_ReadPin(&gpio, BTN5_PIN);
		XGpioPs_WritePin(&gpio, LED0_PIN, btn4 || btn5);
	}
	return 0;
}
