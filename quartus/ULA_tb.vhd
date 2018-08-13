library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ULA_tb is
end ULA_tb;

architecture tb_arch of ULA_tb is
	signal test_A, test_B, test_S, test_F : std_logic_vector(2 downto 0);
	signal test_Cin : STD_LOGIC; 
	
begin
	-- instancia o circuito sob test (uut - unit under test)
	uut: entity work.ULA(ula_3bits_arch) 
      	port map(SW(5 downto 3) => test_A, 
      			 SW(8 downto 6) => test_B, 
      			 SW(2 downto 0) => test_S, 
      			 SW(9) => test_Cin, 
      			 LEDR(2 downto 0) => test_F
		);
	
	process 
	begin
		
    test_A <= "001";
	test_B <= "001";
	test_Cin <= '0';

	test_S <= "110";
	wait for 200 ns;

    test_Cin <= '1';

	test_S <= "111";
	wait for 200 ns;


	test_A <= "111";
	test_B <= "010";
	test_Cin <= '1';
		
	wait;

	end process;
end tb_arch;