library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity PC is
  generic (
    NUM_OF_MAX_INSTRUCTION  : integer := 256
  ) ;
  port (
	clock: in std_logic;
	reset: in std_logic;

	PC_imem_addr_INC: in std_logic;

	--PC_imem_addr_WR: in std_logic;
	--PC_imem_addr_WR_addr: in std_logic_vector(15 downto 0) ;

	PC_imem_addr_out: out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- PC

architecture PC_arch of PC is
	---- function called clogb2 that returns an integer which has the
	---- value of the ceiling of the log base 2.
	--function clogb2 (bit_depth : integer) return integer is
	--variable depth  : integer := bit_depth;
	--  begin
	--    if (depth = 0) then
	--      return(0);
	--    else
	--      for clogb2 in 1 to bit_depth loop  -- Works for up to 32 bit integers
	--        if(depth <= 1) then
	--          return(clogb2);
	--        else
	--          depth := depth / 2;
	--        end if;
	--      end loop;
	--    end if;
	--end;

	---- Total number of input data.
	--constant NUMBER_OF_INPUT_WORDS  : integer := 8;

	---- bit_num gives the minimum number of bits needed to address 'NUMBER_OF_INPUT_WORDS' size of FIFO.
	--constant bit_num  : integer := clogb2(NUMBER_OF_INPUT_WORDS-1);

	--signal write_pointer : integer range 0 to bit_num-1;
	signal write_pointer : integer;

	signal imem_addr: std_logic_vector(15 downto 0) ;

begin

--output
	PC_imem_addr_out <= imem_addr;

--counter
	counter : process( clock, reset )
	begin
	  if( reset = '1' ) then
	    write_pointer <= 0;
	  elsif( rising_edge(clock) ) then
	  	if ( PC_imem_addr_INC = '1' ) then
	  	    if (write_pointer < NUM_OF_MAX_INSTRUCTION) then
    			write_pointer <= write_pointer + 1;
    		end if ;
	  	end if ;
	  end if ;
	end process ; -- counter

--pointer to signal
	PC_d_ff : process( write_pointer )
	begin
		imem_addr <= std_logic_vector(to_unsigned(write_pointer, 16));
	end process ; -- PC_d_ff

----D-FFs
--	PC_d_ff : process( clock, reset )
--	begin
--	  if( reset = '1' ) then
--	    imem_addr <= std_logic_vector(to_unsigned(0, 16));
--	  elsif( rising_edge(clock) ) then
--		imem_addr <= std_logic_vector(write_pointer, 16);
--	  end if ;
--	end process ; -- PC_d_ff

end architecture ; -- PC_arch