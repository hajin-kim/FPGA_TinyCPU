# Purpose and Analysis of Changes

## Purpose of this Project

The goal of this project is to reform the previous Tiny CPU project. The goal is to implement an instruction memory and a new instruction: HALT.

## Instruction Memory

Previous Tiny CPU fetches instructions from InStream directly. In order to implement a more CPU-like CPU, memory is necessary. The memory can save up to 256 instructions.

InStream controls the memory and stores instructions to it sequentially. After every instruction is stored, InStream denotes **DONE** to Tiny CPU. Then Tiny CPU can enter the fetch cycle and handle the memory. An additional program counter should be implemented.

## HALT Instruction

After implementing instruction memory, HALT instruction that asserts the end of instruction flow is also needful.

It's opcode is 0000xxxxxxxxxxxx. If Tiny CPU encounters the HALT instruction at the decode cycle, then it stops the cycle and keep itself from entering the execution cycle.