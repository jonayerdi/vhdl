/*
 * main.c
 *
 *  Created on: 9 Nov 2017
 *      Author: Jon Ayerdi
 */

#include "xil_io.h"
#include "axi01_ip.h"
#include "xparameters.h"

// Define delay length
#define DELAY 10000000

/* 	Define the base memory address of the led_controller IP core */
#define AXI_BASE XPAR_AXI01_IP_0_S00_AXI_BASEADDR

/* main function */
int main(void){
	/* Loop forever */
	while(1)
	{
		u32 axi0_val = 1;
		u32 axi1_val = 1<<3;
		for(int i = 0 ; i < 4 ; i++){
			/* Write value to IP core using generated driver function */
			AXI01_IP_mWriteReg(AXI_BASE, AXI01_IP_S00_AXI_SLV_REG0_OFFSET, axi0_val);
			AXI01_IP_mWriteReg(AXI_BASE, AXI01_IP_S00_AXI_SLV_REG1_OFFSET, axi1_val);
			/* Move leds */
			axi0_val <<= 1;
			axi1_val >>= 1;
			/* run a simple delay to allow changes on LEDs to be visible */
			for(int j=0;j<DELAY;j++);
		}
	}
	return 1;
}
