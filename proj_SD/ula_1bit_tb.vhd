library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ULA_1bit_tb is
end ULA_1bit_tb;

architecture tb_arch of ULA_1bit_tb is
	signal test_A, test_B, test_Cin: STD_LOGIC;
	signal test_S: STD_LOGIC_VECTOR(2 downto 0);
	signal test_F, test_Cout: STD_LOGIC; 
	
begin
	-- instancia o circuito sob test (uut - unit under test)
	uut: entity work.ULA_1bit(Behavioral) 
      	port map(A => test_A, 
      			 B => test_B, 
      			 S => test_S, 
      			 Cin => test_Cin, 
      			 F => test_F, 
      			 Cout => test_Cout
		);
	
	-- gerador dos vetores de teste
	process
	begin	
		-- A = 0, B = 0, Cin = 0
		
		test_A <= '0';
		test_B <= '0';
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
		-- A = 0, B = 1, Cin = 0
		
		test_A <= '0';
		test_B <= '1';
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
		
		test_A <= '1';
		test_B <= '0';
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
		
		-------------------------------------------------------------------
		-- A = 1, B = 1, Cin = 0
		
		test_A <= '1';
		test_B <= '1';
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
		
		--------------------------------------------------------------------
		-- A = 0, B = 0, Cin = 1
		
		test_A <= '0';
		test_B <= '0';
		test_Cin <= '1';
		
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
		
		--------------------------------------
		-- A = 0, B = 1, Cin = 1
		
		test_A <= '0';
		test_B <= '1';
		test_Cin <= '1';
		
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
		
		-----------------------------------------------------------------
		-- A = 1, B = 0, Cin = 1
		
		test_A <= '1';
		test_B <= '0';
		test_Cin <= '1';
		
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
		
		--------------------------------------
		-- A = 1, B = 1, Cin = 1
		
		test_A <= '1';
		test_B <= '1';
		test_Cin <= '1';
		
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