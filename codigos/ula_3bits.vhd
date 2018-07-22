library ieee;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;

entity ula_3bits is
	port(a_input, b_input, s_input : in std_logic_vector(2 downto 0);
		 cIn_input : in std_logic;
		 cOut : out std_logic;
		 f : out std_logic_vector(2 downto 0)
	);
end ula_3bits;

architecture ula_3bits_arch of ula_3bits is

	signal tmp1, tmp2 : std_logic;
	
	component ula_1bit is
		port(A : in STD_LOGIC;
			 B : in STD_LOGIC;
			 S : in STD_LOGIC_VECTOR(2 downto 0);
			 Cin : in STD_LOGIC;
			 F : out STD_LOGIC;
			 Cout : out STD_LOGIC
			 );
	end component;
	
	begin
		--process	
		--begin
		U1: ula_1bit port map(
							   A => a_input(2), 
							   B => b_input(2),
							   Cin => cIn_input,
							   S => s_input,
							   Cout => tmp1,
							   F =>f(2)
							   );
							   
		U2 : ula_1bit port map(A => a_input(1), 
							   B => b_input(1),
							   Cin => tmp1,
							   S => s_input,
							   Cout => tmp2,
							   F => f(1)
							   );
		
		U3 : ula_1bit port map(A => a_input(0), 
							   B => b_input(0),
							   Cin => tmp2,
							   S => s_input,
							   Cout => tmp1,
							   F => f(0)
							   );					   
	    --end process;
end ula_3bits_arch;