library ieee;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;

entity ULA is
	port(
  SW : in STD_LOGIC_VECTOR(9 downto 0);
  LEDR: out STD_LOGIC_VECTOR(3 downto 0));
end ULA;

architecture ula_3bits_arch of ULA is

	signal tmp1, tmp2 : std_logic;

	component ula_1bit is
		port(SW : in STD_LOGIC_VECTOR(5 downto 0);
    LEDR: out STD_LOGIC_VECTOR(1 downto 0));
	end component;

	begin
		--process
		--begin
		U1: ula_1bit port map(
                SW(4) => SW(3),
                SW(3) => SW(6),
                SW(5) => SW(9),
                SW(2 downto 0) => SW(2 downto 0),
                LEDR(1) => tmp1,
                LEDR(0) => LEDR(0)
                );

		U2 : ula_1bit port map(
								SW(4) => SW(4),
								SW(3) => SW(7),
								SW(5) => tmp1,
								SW(2 downto 0) => SW(2 downto 0),
								LEDR(1) => tmp2,
								LEDR(0) => LEDR(1)
							  );
    U3: ula_1bit port map(
                SW(4) => SW(5),
                SW(3) => SW(8),
                SW(5) => tmp2,
                SW(2 downto 0) => SW(2 downto 0),
                LEDR(1) => LEDR(3),
                LEDR(0) => LEDR(2)
                );
end ula_3bits_arch;
