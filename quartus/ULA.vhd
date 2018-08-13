library ieee;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;

entity ULA is
	port(
  SW : in STD_LOGIC_VECTOR(9 downto 0);
  LEDR: out STD_LOGIC_VECTOR(2 downto 0);
  HEX0, HEX1, HEX2, HEX3: out STD_LOGIC_VECTOR(6 downto 0));
end ULA;

architecture ula_3bits_arch of ULA is

	signal tmp1, tmp2, overflow: std_logic;
	signal hex: std_LOGIC_VECTOR(2 downto 0);

	component ula_1bit is
	 port(SW : in STD_LOGIC_VECTOR(5 downto 0);
			LEDR: out STD_LOGIC_VECTOR(1 downto 0));
	end component;
	
	begin
		U1: ula_1bit port map(
                SW(4) => SW(3),
                SW(3) => SW(6),
                SW(5) => SW(9),
                SW(2 downto 0) => SW(2 downto 0),
                LEDR(1) => tmp1,
                LEDR(0) => hex(0)
                );

		U2: ula_1bit port map(
						SW(4) => SW(4),
						SW(3) => SW(7),
						SW(5) => tmp1,
						SW(2 downto 0) => SW(2 downto 0),
						LEDR(1) => tmp2,
						LEDR(0) => hex(1)
					  );
		U3: ula_1bit port map(
                SW(4) => SW(5),
                SW(3) => SW(8),
                SW(5) => tmp2,
                SW(2 downto 0) => SW(2 downto 0),
                LEDR(1) => overflow,
                LEDR(0) => hex(2)
                );
					 
		LEDR <= hex;
		
		with hex select
      HEX0(6 downto 0) <=
         "1000000" when "000",
         "1111001" when "001",
         "0100100" when "010",
         "0110000" when "011",
         "0011001" when "100",
         "0110000" when "101",
         "0100100" when "110", 
         "1111001" when others;
		with hex(2) select
			HEX1(6 downto 0) <=
				"0111111" when '1',
				"1111111" when others;
		HEX2 <= "1111111";
		HEX3 <= "1111111";
end ula_3bits_arch;