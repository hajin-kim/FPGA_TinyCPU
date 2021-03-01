# Vitis Project and Run

**Note**: all processes are the same as [Tiny CPU: ZYNQ Board and AXI](../Tiny%20CPU%20ZYNQ%20Board%20and%20AXI.md).

Create a Hello World application project. Refer to [Alternative: Direct Creation of Vitis Application Project from Vivado Hardware](https://github.com/hajin-kim/FPGA_Tutorial_with_HLS/blob/main/Lab05%20Hello%20World%20with%20Vitis%20and%20Vivado%20d3897032db324f5d9531e5ab0a9af6df/Alternative%20Direct%20Creation%20of%20Vitis%20Application%20P%20c3733968f81641d19b17885f5466a621.md)

Makefile problem again. You may have to fix some Makefiles of the generated platform project. Refer to [Makefile Problem](https://github.com/hajin-kim/FPGA_Tutorial_with_HLS/blob/main/Troubleshootings%20f43673650b7c4eb5b83fa2b7a80452e2/Makefile%20Problem%20b266174a19ec426eba6e8e8b3119c7d0.md) 

You have to edit helloworld.c source file.

- **main.c** at materials.
- If you changed project name or component name, then you may have to fix some codes.

All done. Build and then Run.

# Run and Result

![Vitis%20Project%20and%20Run%207a9df7721e1348589fc866d98517ba1d/Untitled.png](Vitis%20Project%20and%20Run%207a9df7721e1348589fc866d98517ba1d/Untitled.png)

![Vitis%20Project%20and%20Run%207a9df7721e1348589fc866d98517ba1d/Untitled%201.png](Vitis%20Project%20and%20Run%207a9df7721e1348589fc866d98517ba1d/Untitled%201.png)

Compare with the original Tiny CPU analysis. The result is identical. It worked well.

![Vitis%20Project%20and%20Run%207a9df7721e1348589fc866d98517ba1d/Untitled%202.png](Vitis%20Project%20and%20Run%207a9df7721e1348589fc866d98517ba1d/Untitled%202.png)

![Vitis%20Project%20and%20Run%207a9df7721e1348589fc866d98517ba1d/Untitled%203.png](Vitis%20Project%20and%20Run%207a9df7721e1348589fc866d98517ba1d/Untitled%203.png)

Performs reg[idx] := idx * 16. Note that the last instruction is overridden to HALT. The result is correct.

![Vitis%20Project%20and%20Run%207a9df7721e1348589fc866d98517ba1d/Untitled%204.png](Vitis%20Project%20and%20Run%207a9df7721e1348589fc866d98517ba1d/Untitled%204.png)

![Vitis%20Project%20and%20Run%207a9df7721e1348589fc866d98517ba1d/Untitled%205.png](Vitis%20Project%20and%20Run%207a9df7721e1348589fc866d98517ba1d/Untitled%205.png)

Performs reg[idx] := sigma(0, 15). Note that the last instruction is overridden to HALT. The result is correct.