/*
 * main.c
 *
 *  Created on: 26 Oct 2017
 *      Author: Jon Ayerdi
 */

#include <xgpio.h>
#include <xgpiops.h>
#include <xparameters.h>
#include <stdio.h>

#define GPIO_IN 0
#define GPIO_OUT 1

#define AXI_IN 1
#define AXI_OUT 0

//MIO pins
#define LED4_PIN 7
#define BTN4_PIN 50
#define BTN5_PIN 51
//EMIO pins
#define BTN0_PIN 54
#define LED0_PIN 55
//AXI pins
#define BTN3_PIN 0
#define LED3_PIN 1
//AXI channels
#define BTN3_CHANNEL 1
#define LED3_CHANNEL 1

//Util
#define XGpio_SetDataDirectionPin(axi, cha, pin, dir) \
	dir ? XGpio_SetDataDirection(axi, cha, XGpio_GetDataDirection(axi, cha) | 1<<pin) \
		: XGpio_SetDataDirection(axi, cha, XGpio_GetDataDirection(axi, cha) & ~(1<<pin))
#define XGpio_WritePin(axi, cha, pin, val) \
	val ? XGpio_DiscreteSet(axi, cha, 1<<pin) \
		: XGpio_DiscreteClear(axi, cha, 1<<pin)

int main(void)
{
	//init GPIO driver
	XGpioPs gpio;
	XGpioPs_Config *gpioConfig = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
	XGpioPs_CfgInitialize(&gpio, gpioConfig, gpioConfig->BaseAddr);
	//set pin directions
	XGpioPs_SetDirectionPin(&gpio, BTN0_PIN, GPIO_IN);
	XGpioPs_SetDirectionPin(&gpio, BTN4_PIN, GPIO_IN);
	XGpioPs_SetDirectionPin(&gpio, BTN5_PIN, GPIO_IN);
	XGpioPs_SetDirectionPin(&gpio, LED0_PIN, GPIO_OUT);
	XGpioPs_SetDirectionPin(&gpio, LED4_PIN, GPIO_OUT);
	//set output enable
	XGpioPs_SetOutputEnablePin(&gpio, LED0_PIN, 1);
	XGpioPs_SetOutputEnablePin(&gpio, LED4_PIN, 1);
	//init AXI driver
	XGpio axi;
	XGpio_Initialize(&axi, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirectionPin(&axi, BTN3_CHANNEL, BTN3_PIN, AXI_IN);
	XGpio_SetDataDirectionPin(&axi, LED3_CHANNEL, LED3_PIN, AXI_OUT);
	//program
	while(1)
	{
		//Read GPIO inputs
		u32 btn0 = XGpioPs_ReadPin(&gpio, BTN0_PIN);
		u32 btn4 = XGpioPs_ReadPin(&gpio, BTN4_PIN);
		u32 btn5 = XGpioPs_ReadPin(&gpio, BTN5_PIN);
		//Read AXI inputs
		u32 btn3 = !!(XGpio_DiscreteRead(&axi, BTN3_CHANNEL) & 1<<BTN3_PIN);
		//Write GPIO outputs
		XGpioPs_WritePin(&gpio, LED0_PIN, btn4 || btn5);
		XGpioPs_WritePin(&gpio, LED4_PIN, btn0);
		//Write AXI outputs
		XGpio_WritePin(&axi, LED3_CHANNEL, LED3_PIN, btn3);
		//Write UART output
		printf("BTN4=%lu   BTN5=%lu\n", btn4, btn5);
	}
	return 0;
}
