/*
 * main.c
 *
 *  Created on: 8 Dec 2017
 *      Author: Jon Ayerdi
 */

#include <xstatus.h>
#include <led_axi_ip.h>
#include <xgpio.h>
#include <xgpiops.h>
#include <xparameters.h>
#include <stdio.h>

#define GPIO_IN 0
#define GPIO_OUT 1

#define AXI_IN 1
#define AXI_OUT 0

//EMIO pins
#define SW0_PIN 54
#define SW1_PIN 55
#define SW2_PIN 56
#define SW3_PIN 57
//AXI pins
#define RESET_PIN 0
#define ENABLE_PIN 1
#define READY_PIN 0
#define PRESENCE_PIN 1
#define DATA_PIN 2
//AXI channels
#define WRITE_CHANNEL 1
#define READ_CHANNEL 2
//Base memory address of the led_axi_ip core
#define LED_AXI_IP_BASE XPAR_LED_AXI_IP_0_S00_AXI_BASEADDR
//led_axi_ip register bits
#define LED0_BIT (1<<0)
#define LED1_BIT (1<<1)
#define LED2_BIT (1<<2)
#define LED3_BIT (1<<3)

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
	XGpioPs_SetDirectionPin(&gpio, SW0_PIN, GPIO_IN);
	XGpioPs_SetDirectionPin(&gpio, SW1_PIN, GPIO_IN);
	XGpioPs_SetDirectionPin(&gpio, SW2_PIN, GPIO_IN);
	XGpioPs_SetDirectionPin(&gpio, SW3_PIN, GPIO_IN);
	//init AXI driver
	XGpio axi;
	XGpio_Initialize(&axi, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&axi, WRITE_CHANNEL, 0x00000000);
	XGpio_SetDataDirection(&axi, READ_CHANNEL, 0xFFFFFFFF);
	//Reset HC_SR04 via AXI
	XGpio_WritePin(&axi, WRITE_CHANNEL, RESET_PIN, 1);
	for(volatile int i = 0 ; i < 1000 ; i++) {};
	XGpio_WritePin(&axi, WRITE_CHANNEL, RESET_PIN, 0);
	while(1)
	{
		//Read EMIO inputs
		volatile u32 sw0 = XGpioPs_ReadPin(&gpio, SW0_PIN);
		volatile u32 sw1 = XGpioPs_ReadPin(&gpio, SW1_PIN);
		volatile u32 sw2 = XGpioPs_ReadPin(&gpio, SW2_PIN);
		volatile u32 sw3 = XGpioPs_ReadPin(&gpio, SW3_PIN);
		//Manage HC_SR04 via AXI
		XGpio_WritePin(&axi, WRITE_CHANNEL, ENABLE_PIN, 1);
		volatile u32 reg0 = XGpio_DiscreteRead(&axi, READ_CHANNEL);
		volatile u32 count = 0;
		volatile u32 reset = 0;
		while(!(reg0 & (1<<READY_PIN)))
		{
			reg0 = XGpio_DiscreteRead(&axi, READ_CHANNEL);
			if(count++ > 1000000)
			{
				//Reset HC_SR04 via AXI
				XGpio_WritePin(&axi, WRITE_CHANNEL, RESET_PIN, 1);
				for(volatile int i = 0 ; i < 1000 ; i++) {};
				XGpio_WritePin(&axi, WRITE_CHANNEL, RESET_PIN, 0);
				reset = 1;
				break;
			}
		}
		XGpio_WritePin(&axi, WRITE_CHANNEL, ENABLE_PIN, 0);
		volatile u32 data = ((reg0 >> DATA_PIN) & 0x7FFFFF);
		if(!reset && data > 1000)
		{
			//volatile u32 presence = data < 0x40000;
			volatile u32 presence = !!(reg0 & (1<<PRESENCE_PIN));
			//Write led_axi_ip outputs
			LED_AXI_IP_mWriteReg(LED_AXI_IP_BASE, LED_AXI_IP_S00_AXI_SLV_REG0_OFFSET
					, (presence<<0) | (sw1<<1) | (sw2<<2) | (sw3<<3));
			printf("%lu\n", data);
		}
	}
}
