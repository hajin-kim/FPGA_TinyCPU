library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity mem is
  port (
	clock: in std_logic;
	areset_n: in std_logic;

	w_en: in std_logic;

	addr: in std_logic_vector(15 downto 0) ;
	w_data: in std_logic_vector(15 downto 0) ;
	r_data: out std_logic_vector(15 downto 0)
--	 ;
--    debug_r_data_0: out std_logic_vector(15 downto 0);
--    debug_r_data_1: out std_logic_vector(15 downto 0);
--    debug_r_data_2: out std_logic_vector(15 downto 0);
--    debug_r_data_3: out std_logic_vector(15 downto 0);
--    debug_r_data_4: out std_logic_vector(15 downto 0);
--    debug_r_data_5: out std_logic_vector(15 downto 0);
--    debug_r_data_6: out std_logic_vector(15 downto 0);
--    debug_r_data_7: out std_logic_vector(15 downto 0);
--    debug_r_data_8: out std_logic_vector(15 downto 0);
--    debug_r_data_9: out std_logic_vector(15 downto 0);
--    debug_r_data_10: out std_logic_vector(15 downto 0);
--    debug_r_data_11: out std_logic_vector(15 downto 0);
--    debug_r_data_12: out std_logic_vector(15 downto 0);
--    debug_r_data_13: out std_logic_vector(15 downto 0);
--    debug_r_data_14: out std_logic_vector(15 downto 0);
--    debug_r_data_15: out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- mem

architecture mem_arch of mem is

	component mem_16 is
	  port (
		clock: in std_logic;
		areset_n: in std_logic;

		w_en: in std_logic;

		addr: in std_logic_vector(3 downto 0) ;
		w_data: in std_logic_vector(15 downto 0) ;
		r_data: out std_logic_vector(15 downto 0)
--		 ;
--		debug_r_data_0: out std_logic_vector(15 downto 0);
--        debug_r_data_1: out std_logic_vector(15 downto 0);
--        debug_r_data_2: out std_logic_vector(15 downto 0);
--        debug_r_data_3: out std_logic_vector(15 downto 0);
--        debug_r_data_4: out std_logic_vector(15 downto 0);
--        debug_r_data_5: out std_logic_vector(15 downto 0);
--        debug_r_data_6: out std_logic_vector(15 downto 0);
--        debug_r_data_7: out std_logic_vector(15 downto 0);
--        debug_r_data_8: out std_logic_vector(15 downto 0);
--        debug_r_data_9: out std_logic_vector(15 downto 0);
--        debug_r_data_10: out std_logic_vector(15 downto 0);
--        debug_r_data_11: out std_logic_vector(15 downto 0);
--        debug_r_data_12: out std_logic_vector(15 downto 0);
--        debug_r_data_13: out std_logic_vector(15 downto 0);
--        debug_r_data_14: out std_logic_vector(15 downto 0);
--        debug_r_data_15: out std_logic_vector(15 downto 0)

	  ) ;
	end component ; -- mem_16

	signal w_en_0: std_logic;
	signal r_data_0: std_logic_vector(15 downto 0) ;
	signal w_en_1: std_logic;
	signal r_data_1: std_logic_vector(15 downto 0) ;
	signal w_en_2: std_logic;
	signal r_data_2: std_logic_vector(15 downto 0) ;
	signal w_en_3: std_logic;
	signal r_data_3: std_logic_vector(15 downto 0) ;
	signal w_en_4: std_logic;
	signal r_data_4: std_logic_vector(15 downto 0) ;
	signal w_en_5: std_logic;
	signal r_data_5: std_logic_vector(15 downto 0) ;
	signal w_en_6: std_logic;
	signal r_data_6: std_logic_vector(15 downto 0) ;
	signal w_en_7: std_logic;
	signal r_data_7: std_logic_vector(15 downto 0) ;
	signal w_en_8: std_logic;
	signal r_data_8: std_logic_vector(15 downto 0) ;
	signal w_en_9: std_logic;
	signal r_data_9: std_logic_vector(15 downto 0) ;
	signal w_en_10: std_logic;
	signal r_data_10: std_logic_vector(15 downto 0) ;
	signal w_en_11: std_logic;
	signal r_data_11: std_logic_vector(15 downto 0) ;
	signal w_en_12: std_logic;
	signal r_data_12: std_logic_vector(15 downto 0) ;
	signal w_en_13: std_logic;
	signal r_data_13: std_logic_vector(15 downto 0) ;
	signal w_en_14: std_logic;
	signal r_data_14: std_logic_vector(15 downto 0) ;
	signal w_en_15: std_logic;
	signal r_data_15: std_logic_vector(15 downto 0) ;

begin

-- requires selection

	w_en_0 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "0000")) else '0';
	w_en_1 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "0001")) else '0';
	w_en_2 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "0010")) else '0';
	w_en_3 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "0011")) else '0';
	w_en_4 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "0100")) else '0';
	w_en_5 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "0101")) else '0';
	w_en_6 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "0110")) else '0';
	w_en_7 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "0111")) else '0';
	w_en_8 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "1000")) else '0';
	w_en_9 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "1001")) else '0';
	w_en_10 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "1010")) else '0';
	w_en_11 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "1011")) else '0';
	w_en_12 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "1100")) else '0';
	w_en_13 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "1101")) else '0';
	w_en_14 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "1110")) else '0';
	w_en_15 <= '1' when ((w_en = '1') and (addr(7 downto 4) = "1111")) else '0';

	r_data <=
		r_data_0 when (addr(7 downto 4) = "0000") else
		r_data_1 when (addr(7 downto 4) = "0001") else
		r_data_2 when (addr(7 downto 4) = "0010") else
		r_data_3 when (addr(7 downto 4) = "0011") else
		r_data_4 when (addr(7 downto 4) = "0100") else
		r_data_5 when (addr(7 downto 4) = "0101") else
		r_data_6 when (addr(7 downto 4) = "0110") else
		r_data_7 when (addr(7 downto 4) = "0111") else
		r_data_8 when (addr(7 downto 4) = "1000") else
		r_data_9 when (addr(7 downto 4) = "1001") else
		r_data_10 when (addr(7 downto 4) = "1010") else
		r_data_11 when (addr(7 downto 4) = "1011") else
		r_data_12 when (addr(7 downto 4) = "1100") else
		r_data_13 when (addr(7 downto 4) = "1101") else
		r_data_14 when (addr(7 downto 4) = "1110") else
		r_data_15 when (addr(7 downto 4) = "1111") else
		std_logic_vector(to_unsigned(0, 16)) ;
	
	mem_16_0_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_0,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_0
		
--		debug_r_data_0	=> debug_r_data_0
	);
	
	mem_16_1_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_1,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_1
		
--		debug_r_data_1	=> debug_r_data_1
	);
	
	mem_16_2_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_2,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_2
		
--		debug_r_data_2	=> debug_r_data_2
	);
	
	mem_16_3_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_3,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_3
		
--		debug_r_data_3	=> debug_r_data_3
	);
	
	mem_16_4_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_4,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_4
		
--		debug_r_data_4	=> debug_r_data_4
	);
	
	mem_16_5_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_5,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_5
		
--		debug_r_data_5	=> debug_r_data_5
	);
	
	mem_16_6_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_6,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_6
		
--		debug_r_data_6	=> debug_r_data_6
	);
	
	mem_16_7_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_7,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_7
		
--		debug_r_data_7	=> debug_r_data_7
	);
	
	mem_16_8_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_8,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_8
		
--		debug_r_data_8	=> debug_r_data_8
	);
	
	mem_16_9_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_9,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_9
		
--		debug_r_data_9	=> debug_r_data_9
	);
	
	mem_16_10_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_10,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_10
		
--		debug_r_data_10	=> debug_r_data_10
	);
	
	mem_16_11_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_11,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_11
		
--		debug_r_data_11	=> debug_r_data_11
	);
	
	mem_16_12_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_12,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_12
		
--		debug_r_data_12	=> debug_r_data_12
	);
	
	mem_16_13_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_13,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_13
		
--		debug_r_data_13	=> debug_r_data_13
	);
	
	mem_16_14_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_14,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_14
		
--		debug_r_data_14	=> debug_r_data_14
	);
	
	mem_16_15_inst: mem_16
	port map (
		clock	=> clock,
		areset_n	=> areset_n,

		w_en	=> w_en_15,

		addr	=> addr(3 downto 0),
		w_data	=> w_data,
		r_data	=> r_data_15
		
--		debug_r_data_15	=> debug_r_data_15
	);

end architecture ; -- mem_arch