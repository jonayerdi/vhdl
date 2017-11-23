/*
 * main.c
 *
 *  Created on: 16 Nov 2017
 *      Author: Jon Ayerdi
 */

#include "xil_io.h"
#include "punto_control_axi_ip.h"
#include <xgpio.h>
#include <xgpiops.h>
#include <xparameters.h>

#define GPIO_IN 0
#define GPIO_OUT 1

#define AXI_IN 1
#define AXI_OUT 0

//Custom AXI IP
#define AXI_BASE XPAR_PUNTO_CONTROL_AXI_IP_0_S00_AXI_BASEADDR
#define AXI_REG0 PUNTO_CONTROL_AXI_IP_S00_AXI_SLV_REG0_OFFSET
#define AXI_REG1 PUNTO_CONTROL_AXI_IP_S00_AXI_SLV_REG1_OFFSET
#define AXI_REG2 PUNTO_CONTROL_AXI_IP_S00_AXI_SLV_REG2_OFFSET
#define AXI_REG3 PUNTO_CONTROL_AXI_IP_S00_AXI_SLV_REG3_OFFSET

//MIO pins
#define BTN4_PIN 50
#define BTN5_PIN 51

//AXI pins
#define BTN0_PIN 0
#define BTN1_PIN 1
#define SW2_PIN 2
#define SW3_PIN 3

//AXI channels
#define AXI_CHANNEL 1

//Util
#define XGpio_SetDataDirectionPin(axi, cha, pin, dir) \
	dir ? XGpio_SetDataDirection(axi, cha, XGpio_GetDataDirection(axi, cha) | 1<<pin) \
		: XGpio_SetDataDirection(axi, cha, XGpio_GetDataDirection(axi, cha) & ~(1<<pin))

int main(void)
{
	//init GPIO driver
	XGpioPs gpio;
	XGpioPs_Config *gpioConfig = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
	XGpioPs_CfgInitialize(&gpio, gpioConfig, gpioConfig->BaseAddr);
	//set pin directions
	XGpioPs_SetDirectionPin(&gpio, BTN4_PIN, GPIO_IN);
	XGpioPs_SetDirectionPin(&gpio, BTN5_PIN, GPIO_IN);
	//init AXI driver
	XGpio axi;
	XGpio_Initialize(&axi, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirectionPin(&axi, AXI_CHANNEL, BTN0_PIN, AXI_IN);
	XGpio_SetDataDirectionPin(&axi, AXI_CHANNEL, BTN1_PIN, AXI_IN);
	XGpio_SetDataDirectionPin(&axi, AXI_CHANNEL, SW2_PIN, AXI_IN);
	XGpio_SetDataDirectionPin(&axi, AXI_CHANNEL, SW3_PIN, AXI_IN);
	//loop
	while(1)
	{
		//GPIO inputs
		u32 btn4 = XGpioPs_ReadPin(&gpio, BTN4_PIN);
		u32 btn5 = XGpioPs_ReadPin(&gpio, BTN5_PIN);
		//AXI inputs
		u32 btn0 = !!(XGpio_DiscreteRead(&axi, AXI_CHANNEL) & 1<<BTN0_PIN);
		u32 btn1 = !!(XGpio_DiscreteRead(&axi, AXI_CHANNEL) & 1<<BTN1_PIN);
		u32 sw2 = !!(XGpio_DiscreteRead(&axi, AXI_CHANNEL) & 1<<SW2_PIN);
		u32 sw3 = !!(XGpio_DiscreteRead(&axi, AXI_CHANNEL) & 1<<SW3_PIN);
		//Write to AXI IP registers
		PUNTO_CONTROL_AXI_IP_mWriteReg(AXI_BASE, AXI_REG0, (btn5<<1) | (btn4));
		PUNTO_CONTROL_AXI_IP_mWriteReg(AXI_BASE, AXI_REG1, (sw3<<1) | (sw2));
		PUNTO_CONTROL_AXI_IP_mWriteReg(AXI_BASE, AXI_REG2, (btn1<<1) | (btn0));
		PUNTO_CONTROL_AXI_IP_mWriteReg(AXI_BASE, AXI_REG3, (1<<1) | (1));
	}
}
