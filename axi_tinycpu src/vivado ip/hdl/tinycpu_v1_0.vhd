library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tinycpu_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S_AXI_RF
		C_S_AXI_RF_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_RF_ADDR_WIDTH	: integer	:= 7;

		-- Parameters of Axi Slave Bus Interface InStream
		C_InStream_TDATA_WIDTH	: integer	:= 32
	);
	port (
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S_AXI_RF
		s_axi_rf_aclk	: in std_logic;
		s_axi_rf_aresetn	: in std_logic;
		s_axi_rf_awaddr	: in std_logic_vector(C_S_AXI_RF_ADDR_WIDTH-1 downto 0);
		s_axi_rf_awprot	: in std_logic_vector(2 downto 0);
		s_axi_rf_awvalid	: in std_logic;
		s_axi_rf_awready	: out std_logic;
		s_axi_rf_wdata	: in std_logic_vector(C_S_AXI_RF_DATA_WIDTH-1 downto 0);
		s_axi_rf_wstrb	: in std_logic_vector((C_S_AXI_RF_DATA_WIDTH/8)-1 downto 0);
		s_axi_rf_wvalid	: in std_logic;
		s_axi_rf_wready	: out std_logic;
		s_axi_rf_bresp	: out std_logic_vector(1 downto 0);
		s_axi_rf_bvalid	: out std_logic;
		s_axi_rf_bready	: in std_logic;
		s_axi_rf_araddr	: in std_logic_vector(C_S_AXI_RF_ADDR_WIDTH-1 downto 0);
		s_axi_rf_arprot	: in std_logic_vector(2 downto 0);
		s_axi_rf_arvalid	: in std_logic;
		s_axi_rf_arready	: out std_logic;
		s_axi_rf_rdata	: out std_logic_vector(C_S_AXI_RF_DATA_WIDTH-1 downto 0);
		s_axi_rf_rresp	: out std_logic_vector(1 downto 0);
		s_axi_rf_rvalid	: out std_logic;
		s_axi_rf_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface InStream
		instream_aclk	: in std_logic;
		instream_aresetn	: in std_logic;
		instream_tready	: out std_logic;
		instream_tdata	: in std_logic_vector(C_InStream_TDATA_WIDTH-1 downto 0);
		instream_tstrb	: in std_logic_vector((C_InStream_TDATA_WIDTH/8)-1 downto 0);
		instream_tlast	: in std_logic;
		instream_tvalid	: in std_logic
	);
end tinycpu_v1_0;

architecture arch_imp of tinycpu_v1_0 is

	-- component declaration
	component tinycpu_v1_0_S_AXI_RF is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 7
		);
		port (
        tinycpu_reg0    : in std_logic_vector(15 downto 0) ;
        tinycpu_reg1    : in std_logic_vector(15 downto 0) ;
        tinycpu_reg2    : in std_logic_vector(15 downto 0) ;
        tinycpu_reg3    : in std_logic_vector(15 downto 0) ;
        tinycpu_reg4    : in std_logic_vector(15 downto 0) ;
        tinycpu_reg5    : in std_logic_vector(15 downto 0) ;
        tinycpu_reg6    : in std_logic_vector(15 downto 0) ;
        tinycpu_reg7    : in std_logic_vector(15 downto 0) ;
        tinycpu_reg8    : in std_logic_vector(15 downto 0) ;
        tinycpu_reg9    : in std_logic_vector(15 downto 0) ;
        tinycpu_reg10   : in std_logic_vector(15 downto 0) ;
        tinycpu_reg11   : in std_logic_vector(15 downto 0) ;
        tinycpu_reg12   : in std_logic_vector(15 downto 0) ;
        tinycpu_reg13   : in std_logic_vector(15 downto 0) ;
        tinycpu_reg14   : in std_logic_vector(15 downto 0) ;
        tinycpu_reg15   : in std_logic_vector(15 downto 0) ;
        
        status   : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) ;
        IR_instr   : in std_logic_vector(15 downto 0) ;
        
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component tinycpu_v1_0_S_AXI_RF;

	component tinycpu_v1_0_InStream is
		generic (
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
        instream_tinycpu_enable:   out std_logic;
        instream_tinycpu_done: in std_logic;
        instream_tinycpu_instr: out std_logic_vector(15 downto 0);
        
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component tinycpu_v1_0_InStream;
    
    
    component tiny_CPU is
      port (
        clock: in std_logic;
        reset: in std_logic;
        instr: in std_logic_vector(15 downto 0);
        
        instream_tinycpu_enable:   in std_logic;
        instream_tinycpu_done: out std_logic;
    
    --### OUTPUTS FOR TINY CPU ###--
        output0: out std_logic_vector(15 downto 0) ;
        output1: out std_logic_vector(15 downto 0) ;
        output2: out std_logic_vector(15 downto 0) ;
        output3: out std_logic_vector(15 downto 0) ;
        output4: out std_logic_vector(15 downto 0) ;
        output5: out std_logic_vector(15 downto 0) ;
        output6: out std_logic_vector(15 downto 0) ;
        output7: out std_logic_vector(15 downto 0) ;
        output8: out std_logic_vector(15 downto 0) ;
        output9: out std_logic_vector(15 downto 0) ;
        output10: out std_logic_vector(15 downto 0) ;
        output11: out std_logic_vector(15 downto 0) ;
        output12: out std_logic_vector(15 downto 0) ;
        output13: out std_logic_vector(15 downto 0) ;
        output14: out std_logic_vector(15 downto 0) ;
        output15: out std_logic_vector(15 downto 0) ;
        --------------------------------
        
        status_CU_state: out std_logic_vector(3 downto 0) ;
        IR_instr_out: out std_logic_vector(15 downto 0)
      ) ;
    end component ; -- tiny_CPU
    
    signal s_axi_rf_aresetn_negation: std_logic ;
--    signal instream_tinycpu_ack: std_logic ;
    
    signal sig_instream_tinycpu_enable: std_logic ;
    signal sig_instream_tinycpu_done: std_logic ;
    signal instream_tinycpu_instr: std_logic_vector(15 downto 0) ;
    
    signal reg0: std_logic_vector(15 downto 0) ;
    signal reg1: std_logic_vector(15 downto 0) ;
    signal reg2: std_logic_vector(15 downto 0) ;
    signal reg3: std_logic_vector(15 downto 0) ;
    signal reg4: std_logic_vector(15 downto 0) ;
    signal reg5: std_logic_vector(15 downto 0) ;
    signal reg6: std_logic_vector(15 downto 0) ;
    signal reg7: std_logic_vector(15 downto 0) ;
    signal reg8: std_logic_vector(15 downto 0) ;
    signal reg9: std_logic_vector(15 downto 0) ;
    signal reg10: std_logic_vector(15 downto 0) ;
    signal reg11: std_logic_vector(15 downto 0) ;
    signal reg12: std_logic_vector(15 downto 0) ;
    signal reg13: std_logic_vector(15 downto 0) ;
    signal reg14: std_logic_vector(15 downto 0) ;
    signal reg15: std_logic_vector(15 downto 0) ;
    
    signal status: std_logic_vector(C_S_AXI_RF_DATA_WIDTH-1 downto 0) ;
    signal instr_out: std_logic_vector(15 downto 0) ;
    
begin

-- Instantiation of Axi Bus Interface S_AXI_RF
tinycpu_v1_0_S_AXI_RF_inst : tinycpu_v1_0_S_AXI_RF
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S_AXI_RF_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S_AXI_RF_ADDR_WIDTH
	)
	port map (
        tinycpu_reg0    => reg0,
        tinycpu_reg1    => reg1,
        tinycpu_reg2    => reg2,
        tinycpu_reg3    => reg3,
        tinycpu_reg4    => reg4,
        tinycpu_reg5    => reg5,
        tinycpu_reg6    => reg6,
        tinycpu_reg7    => reg7,
        tinycpu_reg8    => reg8,
        tinycpu_reg9    => reg9,
        tinycpu_reg10   => reg10,
        tinycpu_reg11   => reg11,
        tinycpu_reg12   => reg12,
        tinycpu_reg13   => reg13,
        tinycpu_reg14   => reg14,
        tinycpu_reg15   => reg15,
        
        status => status,
        IR_instr => instr_out,
        
		S_AXI_ACLK	=> s_axi_rf_aclk,
		S_AXI_ARESETN	=> s_axi_rf_aresetn,
		S_AXI_AWADDR	=> s_axi_rf_awaddr,
		S_AXI_AWPROT	=> s_axi_rf_awprot,
		S_AXI_AWVALID	=> s_axi_rf_awvalid,
		S_AXI_AWREADY	=> s_axi_rf_awready,
		S_AXI_WDATA	=> s_axi_rf_wdata,
		S_AXI_WSTRB	=> s_axi_rf_wstrb,
		S_AXI_WVALID	=> s_axi_rf_wvalid,
		S_AXI_WREADY	=> s_axi_rf_wready,
		S_AXI_BRESP	=> s_axi_rf_bresp,
		S_AXI_BVALID	=> s_axi_rf_bvalid,
		S_AXI_BREADY	=> s_axi_rf_bready,
		S_AXI_ARADDR	=> s_axi_rf_araddr,
		S_AXI_ARPROT	=> s_axi_rf_arprot,
		S_AXI_ARVALID	=> s_axi_rf_arvalid,
		S_AXI_ARREADY	=> s_axi_rf_arready,
		S_AXI_RDATA	=> s_axi_rf_rdata,
		S_AXI_RRESP	=> s_axi_rf_rresp,
		S_AXI_RVALID	=> s_axi_rf_rvalid,
		S_AXI_RREADY	=> s_axi_rf_rready
	);

-- Instantiation of Axi Bus Interface InStream
tinycpu_v1_0_InStream_inst : tinycpu_v1_0_InStream
	generic map (
		C_S_AXIS_TDATA_WIDTH	=> C_InStream_TDATA_WIDTH
	)
	port map (
        instream_tinycpu_enable => sig_instream_tinycpu_enable,
        instream_tinycpu_done   => sig_instream_tinycpu_done,
        instream_tinycpu_instr  => instream_tinycpu_instr,
        
		S_AXIS_ACLK	=> instream_aclk,
		S_AXIS_ARESETN	=> instream_aresetn,
		S_AXIS_TREADY	=> instream_tready,
		S_AXIS_TDATA	=> instream_tdata,
		S_AXIS_TSTRB	=> instream_tstrb,
		S_AXIS_TLAST	=> instream_tlast,
		S_AXIS_TVALID	=> instream_tvalid
	);


    s_axi_rf_aresetn_negation <= not s_axi_rf_aresetn;
tiny_CPU_inst : tiny_CPU
  port map (
    clock   => s_axi_rf_aclk,
    reset   => s_axi_rf_aresetn_negation,
    instr   => instream_tinycpu_instr,
	
    instream_tinycpu_enable => sig_instream_tinycpu_enable,
    instream_tinycpu_done   => sig_instream_tinycpu_done,

--### OUTPUTS FOR TINY CPU ###--
    output0 => reg0,
    output1 => reg1,
    output2 => reg2,
    output3 => reg3,
    output4 => reg4,
    output5 => reg5,
    output6 => reg6,
    output7 => reg7,
    output8 => reg8,
    output9 => reg9,
    output10        => reg10,
    output11        => reg11,
    output12        => reg12,
    output13        => reg13,
    output14        => reg14,
    output15        => reg15,
--------------------------------

    status_CU_state => status(3 downto 0),
	IR_instr_out  => instr_out
  ) ; -- tiny_CPU
    
    status(C_S_AXI_RF_DATA_WIDTH-1 downto 6) <= std_logic_vector(to_unsigned(0, C_S_AXI_RF_DATA_WIDTH-6));
    status(5) <= sig_instream_tinycpu_enable;
    status(4) <= sig_instream_tinycpu_done;
    
end arch_imp;
