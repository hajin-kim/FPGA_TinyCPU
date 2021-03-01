# Purpose and Analysis of Changes

## Purpose of this Project

The goal of this project is to program the FPGA board with Tiny CPU and run it. Yet, this CPU wasn't designed to follow the AXI protocol and even be programmable via Vivado. The changes to Tiny CPU should be minimized, not to lose its original performance.

## Problems on Programming FPGA

This CPU has some problems that disturb to programming the FPGA board.

1. This CPU is asynchronous for the reset and some internal clocks. Especially, this has an asynchronous positive reset. The AXI protocol asserts the synchronous negative reset. We can solve this problem simply by negating the input reset signal.
2. This CPU isn't proper to receive input data via AXI Slave Stream protocol. This protocol is based on Master-Slave Valid-Ready handshaking. However, this CPU assumes that the input data is well-given through the signals without validation. We have to implement the handshaking so that this CPU performs the receiving-execution loop properly.

## Changes to Tiny CPU

New ports: **instream_tinycpu_enable** and **instream_tinycpu_done**. Tiny CPU waits for **instream_tinycpu_enable ON** on its fetch state. If InStream(AXI Slave Stream) is READY and then is holding an instruction on its register, it sends **instream_tinycpu_enable ON** to Tiny CPU. Then Tiny CPU transit to decode state, storing the data to IR. Simultaneously, Tiny CPU sends **instream_tinycpu_done ON** to InStream. Then instream clears enable signal and get READY, in order to fetch the next instruction.

Some status signals are added.

### 1. tiny_CPU.vhd

- Note: <<<<< latest | original >>>>>

![Purpose%20and%20Analysis%20of%20Changes%201f6ddcd7de0241648aaf04ed8747da9b/Untitled.png](Purpose%20and%20Analysis%20of%20Changes%201f6ddcd7de0241648aaf04ed8747da9b/Untitled.png)

![Purpose%20and%20Analysis%20of%20Changes%201f6ddcd7de0241648aaf04ed8747da9b/Untitled%201.png](Purpose%20and%20Analysis%20of%20Changes%201f6ddcd7de0241648aaf04ed8747da9b/Untitled%201.png)

![Purpose%20and%20Analysis%20of%20Changes%201f6ddcd7de0241648aaf04ed8747da9b/Untitled%202.png](Purpose%20and%20Analysis%20of%20Changes%201f6ddcd7de0241648aaf04ed8747da9b/Untitled%202.png)

![Purpose%20and%20Analysis%20of%20Changes%201f6ddcd7de0241648aaf04ed8747da9b/Untitled%203.png](Purpose%20and%20Analysis%20of%20Changes%201f6ddcd7de0241648aaf04ed8747da9b/Untitled%203.png)

### 2. CU.vhd

![Purpose%20and%20Analysis%20of%20Changes%201f6ddcd7de0241648aaf04ed8747da9b/Untitled%204.png](Purpose%20and%20Analysis%20of%20Changes%201f6ddcd7de0241648aaf04ed8747da9b/Untitled%204.png)

![Purpose%20and%20Analysis%20of%20Changes%201f6ddcd7de0241648aaf04ed8747da9b/Untitled%205.png](Purpose%20and%20Analysis%20of%20Changes%201f6ddcd7de0241648aaf04ed8747da9b/Untitled%205.png)