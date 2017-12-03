/*
 * main.c
 *
 *  Created on: 3 Dec 2017
 *      Author: Jon Ayerdi
 */

#include <xstatus.h>
#include <HC_SR04_AXI.h>
#include <xgpio.h>
#include <xgpiops.h>
#include <xparameters.h>
#include <stdio.h>

#define GPIO_IN 0
#define GPIO_OUT 1

#define AXI_IN 1
#define AXI_OUT 0

//EMIO pins
#define LED0_PIN 54
#define LED1_PIN 55
#define LED2_PIN 56
#define LED3_PIN 57
//AXI pins
#define SW0_PIN 0
#define SW1_PIN 1
#define SW2_PIN 2
#define SW3_PIN 3
//AXI channels
#define SW_CHANNEL 1
//Base memory address of the HC_SR04_AXI IP core
#define HC_SR04_AXI_BASE XPAR_HC_SR04_AXI_0_S00_AXI_BASEADDR
//HC_SR04_AXI IP register bits
#define HC_SR04_AXI_ENABLE (1<<0)
#define HC_SR04_AXI_READY (1<<1)
#define HC_SR04_AXI_DATA (0x3FFFFF8)
#define HC_SR04_AXI_PRESENCE (1<<25)

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
	XGpioPs_SetDirectionPin(&gpio, LED0_PIN, GPIO_OUT);
	XGpioPs_SetDirectionPin(&gpio, LED1_PIN, GPIO_OUT);
	XGpioPs_SetDirectionPin(&gpio, LED2_PIN, GPIO_OUT);
	XGpioPs_SetDirectionPin(&gpio, LED3_PIN, GPIO_OUT);
	//set output enable
	XGpioPs_SetOutputEnablePin(&gpio, LED0_PIN, 1);
	XGpioPs_SetOutputEnablePin(&gpio, LED1_PIN, 1);
	XGpioPs_SetOutputEnablePin(&gpio, LED2_PIN, 1);
	XGpioPs_SetOutputEnablePin(&gpio, LED3_PIN, 1);
	//init AXI driver
	XGpio axi;
	XGpio_Initialize(&axi, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirectionPin(&axi, SW_CHANNEL, SW0_PIN, AXI_IN);
	XGpio_SetDataDirectionPin(&axi, SW_CHANNEL, SW1_PIN, AXI_IN);
	XGpio_SetDataDirectionPin(&axi, SW_CHANNEL, SW2_PIN, AXI_IN);
	XGpio_SetDataDirectionPin(&axi, SW_CHANNEL, SW3_PIN, AXI_IN);
	//program
	while(1)
	{
		//Read AXI inputs
		u32 sw0 = !!(XGpio_DiscreteRead(&axi, SW_CHANNEL) & 1<<SW0_PIN);
		u32 sw1 = !!(XGpio_DiscreteRead(&axi, SW_CHANNEL) & 1<<SW1_PIN);
		u32 sw2 = !!(XGpio_DiscreteRead(&axi, SW_CHANNEL) & 1<<SW2_PIN);
		u32 sw3 = !!(XGpio_DiscreteRead(&axi, SW_CHANNEL) & 1<<SW3_PIN);
		//Manage HC_SR04_AXI IP
		HC_SR04_AXI_mWriteReg(HC_SR04_AXI_BASE, HC_SR04_AXI_S00_AXI_SLV_REG0_OFFSET, HC_SR04_AXI_ENABLE);
		while(!(HC_SR04_AXI_mReadReg(HC_SR04_AXI_BASE, HC_SR04_AXI_S00_AXI_SLV_REG0_OFFSET) & HC_SR04_AXI_READY));
		u32 data = (HC_SR04_AXI_mReadReg(HC_SR04_AXI_BASE, HC_SR04_AXI_S00_AXI_SLV_REG0_OFFSET) & HC_SR04_AXI_DATA) >> 2;
		u32 presence = (HC_SR04_AXI_mReadReg(HC_SR04_AXI_BASE, HC_SR04_AXI_S00_AXI_SLV_REG0_OFFSET) & HC_SR04_AXI_PRESENCE);
		HC_SR04_AXI_mWriteReg(HC_SR04_AXI_BASE, HC_SR04_AXI_S00_AXI_SLV_REG0_OFFSET, 0);
		//Write GPIO outputs
		XGpioPs_WritePin(&gpio, LED0_PIN, sw0);
		XGpioPs_WritePin(&gpio, LED1_PIN, sw1);
		XGpioPs_WritePin(&gpio, LED2_PIN, sw2);
		XGpioPs_WritePin(&gpio, presence, sw3);
		//Write UART output
		printf("%lu\n", data);
	}
}
