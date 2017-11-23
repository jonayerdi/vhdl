/*
 * main.c
 *
 *  Created on: 7 Nov 2017
 *      Author: Jon Ayerdi
 */

#include "xil_io.h"
#include "jon_ip.h"
#include "xparameters.h"

// Define maximum LED value (2^4)-1 = 15
#define LED_LIMIT 15
// Define delay length
#define DELAY 10000000

/* 	Define the base memory address of the led_controller IP core */
#define LED_BASE XPAR_JON_IP_0_S00_AXI_BASEADDR

/* main function */
int main(void){
	/* unsigned 32-bit variables for storing current LED value */
	u32 led_val = 0;
	int i=0;

	xil_printf("jon_ip IP test begin.\r\n");
	xil_printf("--------------------------------------------\r\n\n");

	/* Loop forever */
	while(1){
			while(led_val<=LED_LIMIT){
				/* Print value to terminal */
				xil_printf("LED value: %d\r\n", led_val);
				/* Write value to led_controller IP core using generated driver function */
				JON_IP_mWriteReg(LED_BASE, 0, led_val);
				/* increment LED value */
				led_val++;
				/* run a simple delay to allow changes on LEDs to be visible */
				for(i=0;i<DELAY;i++);
			}
			/* Reset LED value to zero */
			led_val = 0;
		}
	return 1;
}
