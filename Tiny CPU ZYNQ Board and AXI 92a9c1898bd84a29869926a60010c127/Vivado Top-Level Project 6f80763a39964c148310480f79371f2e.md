# Vivado Top-Level Project

![Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled.png](Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled.png)

If you closed the IP project, then you will see the Vivado top-level project window.

Create a block design.

We have to implement:

![Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled%201.png](Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled%201.png)

![Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled%202.png](Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled%202.png)

Add ZYNQ and apply the preset provided in the materials, ***vivado/axi_tinycpu.tcl***.

Run Block Automation.

![Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled%203.png](Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled%203.png)

Add DMA and customize it as the above image.

![Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled%204.png](Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled%204.png)

Run Connection Automation.

![Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled%205.png](Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled%205.png)

Add Tiny CPU IP.

Run Connection Automation.

Connect the highlighted ports manually.

Run Connection Automation again.

![Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled%201.png](Vivado%20Top-Level%20Project%206f80763a39964c148310480f79371f2e/Untitled%201.png)

Now, compare with your design.

Create a wrapper.

Generate Bitstream.

After a while, export hardware.