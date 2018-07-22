library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ula_3bits_tb is
end ula_3bits_tb;

architecture tb_arch of ula_3bits_tb is
	signal test_A, test_B, test_S, test_F : std_logic_vector(2 downto 0);
	signal test_Cout, test_Cin : STD_LOGIC; 
	
begin
	-- instancia o circuito sob test (uut - unit under test)
	uut: entity work.ula_3bits(ula_3bits_arch) 
      	port map(a_input => test_A, 
      			 b_input => test_B, 
      			 s_input => test_S, 
      			 cIn_input => test_Cin, 
      			 f => test_F, 
      			 cOut => test_Cout
		);
	
	process 
	begin
	
	-- A = 000, B = 000, Cin = 0
		
	test_A <= "000";
	test_B <= "000";
	test_Cin <= '0';
	
	test_S <= "000"; -- Input A tranferido p/ saida
	wait for 200 ns;
	
	test_S <= "001"; -- Complemento de A
	wait for 200 ns;
	
	test_S <= "010"; -- XOR
	wait for 200 ns;
	
	test_S <= "011"; -- XNOR
	wait for 200 ns;
	
	test_S <= "100"; -- A + carryIn
	wait for 200 ns;
	
	test_S <= "101"; -- Complemento de A + carryIn
	wait for 200 ns;
	
	test_S <= "110"; -- Soma de A + B + carryIn
	wait for 200 ns;
	
	test_S <= "111"; -- Soma de B + (complemento de A) + carryIn
	wait for 200 ns;
	
	---------------------------------------------------------------
	-- A = 001, B = 000, Cin = 0
	
	test_A <= "001";
	test_B <= "000";
	test_Cin <= '0';
	
	test_S <= "000"; -- Input A tranferido p/ saida
	wait for 200 ns;
	
	test_S <= "001"; -- Complemento de A
	wait for 200 ns;
	
	test_S <= "010"; -- XOR
	wait for 200 ns;
	
	test_S <= "011"; -- XNOR
	wait for 200 ns;
	
	test_S <= "100"; -- A + carryIn
	wait for 200 ns;
	
	test_S <= "101"; -- Complemento de A + carryIn
	wait for 200 ns;
	
	test_S <= "110"; -- Soma de A + B + carryIn
	wait for 200 ns;
	
	test_S <= "111"; -- Soma de B + (complemento de A) + carryIn
	wait for 200 ns;
	
	------------------------------------------------------------
	-- A = 1, B = 0, Cin = 0
	
	test_A <= "001";
	test_B <= "001";
	test_Cin <= '0';
	
	test_S <= "000"; -- Input A tranferido p/ saida
	wait for 200 ns;
	
	test_S <= "001"; -- Complemento de A
	wait for 200 ns;
	
	test_S <= "010"; -- XOR
	wait for 200 ns;
	
	test_S <= "011"; -- XNOR
	wait for 200 ns;
	
	test_S <= "100"; -- A + carryIn
	wait for 200 ns;
	
	test_S <= "101"; -- Complemento de A + carryIn
	wait for 200 ns;
	
	test_S <= "110"; -- Soma de A + B + carryIn
	wait for 200 ns;
	
	test_S <= "111"; -- Soma de B + (complemento de A) + carryIn
	wait for 200 ns;
		
		
		
	wait;

	end process;
end tb_arch;