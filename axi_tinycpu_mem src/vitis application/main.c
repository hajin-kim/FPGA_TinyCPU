/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

#include "xbasic_types.h"
#include "xparameters.h"

#include "xaxidma.h"
#include "tinycpu_mem.h"

#define MEM_BASE_ADDR 0x01000000
#define TX_BUFFER_BASE (MEM_BASE_ADDR + 0x00100000)

#define BASEADDR_P XPAR_TINYCPU_MEM_0_S_AXI_RF_BASEADDR

#define NUM_REG 16

XAxiDma axiDMA;
XAxiDma_Config *axiDMA_cfg;

Xuint32 *regaddr_p = (Xuint32 *)BASEADDR_P;

void binaryPrint(int num_dec)
{
	int i;
	for ( i=15 ; i >= 0 ; --i) { printf("%d", ( num_dec >> i ) & 1 ); }
}

int TinyCPU_IsHalted(void)
{
	return regaddr_p[19] == 0x1;
}

int main()
{
	int idx;

	xil_printf("TinyCPU Test\r\n");

	// Pointers to DMA TX addresses
	int *m_dma_buffer_TX = (int*) TX_BUFFER_BASE;

	//	Initialize DMA
	printf("Initializing AxiDMA\r\n");
	axiDMA_cfg = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
	if (axiDMA_cfg)
	{
		int status = XAxiDma_CfgInitialize(&axiDMA, axiDMA_cfg);
		if (status != XST_SUCCESS)
		{
			printf("Error initializing AxiDMA core\r\n");
		}
	}

	// Disable interrupts
	XAxiDma_IntrDisable(&axiDMA, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&axiDMA, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

///************** FIXME: GIVE YOUR OPCODE ***************/
//#define SIZE_ARR 15
//	m_dma_buffer_TX[0] = 0b0100000001010110;	// LD reg0 <01010110>
//	m_dma_buffer_TX[1] = 0b0100000101010101;	// LD reg1 <01010101>
//	m_dma_buffer_TX[2] = 0b1111001000000001;	// ADD reg2 reg0 reg1
//	m_dma_buffer_TX[3] = 0b1101001100000001;	// SUB reg3 reg0 reg1
//	m_dma_buffer_TX[4] = 0b1011010000000001;	// AND reg4 reg0 reg1
//	m_dma_buffer_TX[5] = 0b1001010100000001;	// OR reg5 reg0 reg1
//	m_dma_buffer_TX[6] = 0b1101011000010000;	// SUB reg6 reg1 reg0
//	m_dma_buffer_TX[7] = 0b1110001000000001;	// ADD reg2 reg0 <0001>
//	m_dma_buffer_TX[8] = 0b1100001100000001;	// SUB reg3 reg0 <0001>
//	m_dma_buffer_TX[9] = 0b1010010000000001;	// AND reg4 reg0 <0001>
//	m_dma_buffer_TX[10] = 0b1000010100000001;	// OR reg5 reg0 <0001>
//	m_dma_buffer_TX[11] = 0b0100000000000000;	// LD reg0 <00000000>
//	m_dma_buffer_TX[12] = 0b0101000100000000;	// LD reg1 reg0
//	m_dma_buffer_TX[13] = 0b1111001000100010;	// ADD reg2 reg2 reg2
//	m_dma_buffer_TX[SIZE_ARR-1] = 0b0000000000000000;	// HALT
///******************************************************/
/************** FIXME: GIVE YOUR OPCODE ***************/
#define SIZE_ARR 256
	for (idx = 0; idx < 16; ++idx) {
		for (int j = 0; j < 16; ++j) {
			m_dma_buffer_TX[idx*16 + j] =
					0b1110000000000000 +
					0b0000000100000000 * idx +
					0b0000000000010000 * idx +
					0b0000000000000001 * idx;	// ADD reg[idx] reg[idx] idx
		}
	}
	m_dma_buffer_TX[SIZE_ARR-1] = 0b0000000000000000;	// HALT
/******************************************************/

	init_platform();

	// Flush the cache of the buffers
	Xil_DCacheFlushRange((u32)m_dma_buffer_TX, SIZE_ARR * sizeof(int));

	printf("Sending data to IP core slave\r\n");
	XAxiDma_SimpleTransfer(&axiDMA, (u32)m_dma_buffer_TX, SIZE_ARR*sizeof(int), XAXIDMA_DMA_TO_DEVICE);
	while(XAxiDma_Busy(&axiDMA, XAXIDMA_DMA_TO_DEVICE));

	while (!TinyCPU_IsHalted());
	printf("Calculation complete\r\n");

//	while(1){
	// Display data
	for (idx = 0 ; idx < NUM_REG; ++idx)
	{
		printf("Reg[%02d]: ", idx);
		binaryPrint(regaddr_p[idx]);
		printf("\n");
	}

	printf("SR: ");
	binaryPrint(regaddr_p[16]);
	printf("\n");
	printf("IR: ");
	binaryPrint(regaddr_p[17]);
	printf("\n");
	printf("PC: ");
	binaryPrint(regaddr_p[18]);
	printf("\n");
//}

	xil_printf("End of test\r\n");

	return 0;
}

