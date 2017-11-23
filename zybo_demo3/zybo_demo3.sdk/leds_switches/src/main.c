/*
 * main.c
 *
 *  Created on: 24 Oct 2017
 *      Author: user
 */

#include "xparameters.h"
#include "xgpiops.h"
#include "xstatus.h"
#include "xplatform_info.h"

#define switch_pin 4
#define led_pin 0
#define pins 4

int main(void)
{
	XGpioPs gpio; /* The driver instance for GPIO Device. */
	XGpioPs_Config *ConfigPtr;
	s32 Status;
	u32 Input_Pin; /* Switch */
	u32 Output_Pin; /* LED */

	/* Initialize the GPIO driver. */
	ConfigPtr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_DEVICE_ID);
	Status = XGpioPs_CfgInitialize(&gpio, ConfigPtr,
					ConfigPtr->BaseAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	for(int i = 0 ; i < pins ; i++)
	{
		XGpioPs_SetDirectionPin(&gpio, switch_pin + i, 0);
		XGpioPs_SetDirectionPin(&gpio, led_pin + i, 1);
	}

	while(1)
		for(int i = 0 ; i < pins ; i++)
			XGpioPs_WritePin(&gpio, led_pin + i, XGpioPs_ReadPin(&gpio, switch_pin + i));
}
