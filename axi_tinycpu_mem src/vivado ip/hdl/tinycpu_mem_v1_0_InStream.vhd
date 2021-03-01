library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tinycpu_mem_v1_0_InStream is
	generic (
		-- Users to add parameters here;
		-- Total number of input data.
		NUM_OF_MAX_INSTRUCTION    : integer := 256;
		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- AXI4Stream sink: Data Width
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
	);
	port (
		-- Users to add ports here
--        instream_tinycpu_enable:   out std_logic;
        instream_imem_enable: out std_logic;
        instream_imem_done: out std_logic;
        instream_imem_addr: out std_logic_vector(15 downto 0);
        instream_imem_instr: out std_logic_vector(15 downto 0);
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- AXI4Stream sink: Clock
		S_AXIS_ACLK	: in std_logic;
		-- AXI4Stream sink: Reset
		S_AXIS_ARESETN	: in std_logic;
		-- Ready to accept data in
		S_AXIS_TREADY	: out std_logic;
		-- Data in
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		-- Byte qualifier
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- Indicates boundary of last packet
		S_AXIS_TLAST	: in std_logic;
		-- Data is in valid
		S_AXIS_TVALID	: in std_logic
	);
end tinycpu_mem_v1_0_InStream;

architecture arch_imp of tinycpu_mem_v1_0_InStream is

	-- Define the states of state machine
	-- The control state machine oversees the writing of input streaming data to the FIFO,
	-- and outputs the streaming data from the FIFO
	type state is ( IDLE,        -- This is the initial/idle state 
	                WRITE_FIFO); -- In this state FIFO is written with the
	                             -- input stream data S_AXIS_TDATA 
	signal axis_tready	: std_logic;
	-- State variable
	signal  mst_exec_state : state;  
	-- FIFO implementation signals
	signal  byte_index : integer;    
	-- FIFO write enable
	signal fifo_wren : std_logic;
	-- FIFO full flag
	signal fifo_full_flag : std_logic;
	-- FIFO write pointer
	signal write_pointer : integer range 0 to NUM_OF_MAX_INSTRUCTION-1 ;
	-- sink has accepted all the streaming data and stored in FIFO
	signal writes_done : std_logic;
	
    signal instream_imem_done_delay: std_logic;

begin
	-- I/O Connections assignments

	S_AXIS_TREADY	<= axis_tready;
	-- Control state machine implementation
	process(S_AXIS_ACLK)
	begin
	  if (rising_edge (S_AXIS_ACLK)) then
	    if(S_AXIS_ARESETN = '0') then
	      -- Synchronous reset (active low)
	      mst_exec_state      <= IDLE;
	    else
	      case (mst_exec_state) is
	        when IDLE     => 
	          -- The sink starts accepting tdata when 
	          -- there tvalid is asserted to mark the
	          -- presence of valid streaming data 
	          if (S_AXIS_TVALID = '1')then
	            mst_exec_state <= WRITE_FIFO;
	          else
	            mst_exec_state <= IDLE;
	          end if;
	      
	        when WRITE_FIFO => 
	          -- When the sink has accepted all the streaming input data,
	          -- the interface swiches functionality to a streaming master
	          if (writes_done = '1') then
	            mst_exec_state <= IDLE;
	          else
	            -- The sink accepts and stores tdata 
	            -- into FIFO
	            mst_exec_state <= WRITE_FIFO;
	          end if;
	        
	        when others    => 
	          mst_exec_state <= IDLE;
	        
	      end case;
	    end if;  
	  end if;
	end process;
	-- AXI Streaming Sink 
	-- 
	-- The example design sink is always ready to accept the S_AXIS_TDATA  until
	-- the FIFO is not filled with NUM_OF_MAX_INSTRUCTION number of input words.
	axis_tready <= '1' when ((mst_exec_state = WRITE_FIFO) and (write_pointer <= NUM_OF_MAX_INSTRUCTION-1)) else '0';

	process(S_AXIS_ACLK)
	begin
	  if (rising_edge (S_AXIS_ACLK)) then
	    if(S_AXIS_ARESETN = '0') then
	      write_pointer <= 0;
	      writes_done <= '0';
          instream_imem_done_delay <= '0';
	    else
	      if (write_pointer <= NUM_OF_MAX_INSTRUCTION-1) then
	        if (fifo_wren = '1') then
	          -- write pointer is incremented after every write to the FIFO
	          -- when FIFO write signal is enabled.
	          write_pointer <= write_pointer + 1;
	          writes_done <= '0';
	        end if;
	        if ((write_pointer = NUM_OF_MAX_INSTRUCTION-1) or S_AXIS_TLAST = '1') then
	          -- reads_done is asserted when NUM_OF_MAX_INSTRUCTION numbers of streaming data 
	          -- has been written to the FIFO which is also marked by S_AXIS_TLAST(kept for optional usage).
	          writes_done <= '1';
	          instream_imem_done_delay <= '1';
	        end if;
	      end  if;
	    end if;
	  end if;
	end process;
	
    process(S_AXIS_ACLK)
    begin
        if (rising_edge (S_AXIS_ACLK)) then
          if (S_AXIS_ARESETN = '0') then
            instream_imem_done <= '0';
          else
            instream_imem_done <= instream_imem_done_delay;
          end if;  
        end  if;
    end process;
    
	-- FIFO write enable generation
	fifo_wren <= S_AXIS_TVALID and axis_tready;
	
    -- Streaming input data is stored in FIFO
    process(S_AXIS_ACLK)
    begin
        if (rising_edge (S_AXIS_ACLK)) then
          if (S_AXIS_ARESETN = '0') then
            instream_imem_enable <= '0';
            instream_imem_instr <= std_logic_vector(to_unsigned(0, 16));
            instream_imem_addr <= std_logic_vector(to_unsigned(0, 16));
          elsif (fifo_wren = '1') then
            instream_imem_enable <= '1';
            instream_imem_instr <= S_AXIS_TDATA(15 downto 0);
--            instream_imem_instr <= std_logic_vector(to_unsigned(write_pointer, 16));    --debug
            instream_imem_addr <= std_logic_vector(to_unsigned(write_pointer, 16));
          else
            instream_imem_enable <= '0';
          end if;  
        end  if;
    end process;

end arch_imp;
