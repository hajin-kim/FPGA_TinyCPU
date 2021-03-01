# Vivado Custom IP Creation

**Note**: recommended project name is ***axi_tinycpu*** for the top-level project, ***tinycpu*** (automatically becomes edit_dogain) for IP project. If you edit this, you should edit some names. For convenience, the below content may contain different names. I hope you ignore those and use the recommended names.

# Top-Level Project Creation

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled.png)

Open Vivado and create a new project.
**Important**: uncheck "Do not specify sources at this time".

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%201.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%201.png)

At the next page, change the target language to VHDL. Click Next several times and select the ZYNQ part.

# IP Customization

### Creating a Custom IP

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%202.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%202.png)

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%203.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%203.png)

### Dealing with Interfaces

Press the "+" button and add 1 more interface. We will use 2 interfaces.

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%204.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%204.png)

- S_AXI_RF
    - AXI Slave Lite
    - 20 registers

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%205.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%205.png)

- InStream
    - AXI Slave Stream

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%206.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%206.png)

Check Edit IP. Click Finish. A new Vivado window will show up.

From now on, we will deal with the new window.

### Customizing and Composing the IP

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%207.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%207.png)

Click "Add Sources" of the left Flow Navigator.

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%208.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%208.png)

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%209.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%209.png)

***Add File***. Download materials and indicate all the files in ***vivado ip/src*** folder.

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%2010.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%2010.png)

Copy all codes in ***vivado ip/hdl*** folder to each ***tinycpu_v1_0.vhd***, ***tinycpu_v1_0_InStream.vhd***, ***tinycpu_v1_0_S_AXI_RF.vhd***. Then you will see the above hierarchy.

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%2011.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%2011.png)

Open Edit Packaged IP

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%2012.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%2012.png)

Enter the unchecked (having no green check sign) steps sequentially.

Click the merge wizard for each steps.

![Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%2013.png](Vivado%20Custom%20IP%20Creation%208d3bd67f7ad64637bac016c53ad53815/Untitled%2013.png)

Check if everything is clear. Enter Review and Package.

Click Re-Package IP.

Close the IP project.