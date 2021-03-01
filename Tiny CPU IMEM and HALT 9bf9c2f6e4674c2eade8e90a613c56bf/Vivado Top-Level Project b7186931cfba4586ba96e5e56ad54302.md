# Vivado Top-Level Project

**Note**: all processes are the same as [Tiny CPU: ZYNQ Board and AXI](../Tiny%20CPU%20ZYNQ%20Board%20and%20AXI.md).

![Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled.png](Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled.png)

If you closed the IP project, then you will see the Vivado top-level project window.

Create a block design.

We have to implement:

![Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled%201.png](Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled%201.png)

![Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled%202.png](Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled%202.png)

Add ZYNQ and apply the preset provided in the materials, ***vivado/axi_tinycpu.tcl***.

Run Block Automation.

![Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled%203.png](Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled%203.png)

Add DMA and customize it as the above image.

![Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled%204.png](Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled%204.png)

Run Connection Automation.

![Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled%205.png](Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled%205.png)

Add Tiny CPU (with memory) IP.

Run Connection Automation.

Connect the highlighted ports manually.

Run Connection Automation again.

![Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled%201.png](Vivado%20Top-Level%20Project%20b7186931cfba4586ba96e5e56ad54302/Untitled%201.png)

Now, compare with your design.

Create a wrapper.

Generate Bitstream.

After a while, export hardware.