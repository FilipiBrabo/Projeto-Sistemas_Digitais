library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ULA_1bit is 
	port(A : in STD_LOGIC;
		 B : in STD_LOGIC;
		 S : in STD_LOGIC_VECTOR(2 downto 0);
		 Cin : in STD_LOGIC;
		 F : out STD_LOGIC;
		 Cout : out STD_LOGIC
	 );
 end ULA_1bit;
 
 architecture Behavioral of ULA_1bit is
 
 begin
	process(A, B, S, Cin)
	begin

		case S is	
			when "000" => 	-- Transfere A p/ saida
				F <= A;
			when "001" =>  	-- Transfere complemento de A p/ saida
				F <= (NOT A);
			when "010" =>  	-- A XOR B
				F <= A XOR B;
			when "011" => 	-- A XNOR B
				F <= A XNOR B;
			when "100" =>	-- Soma A com carryIn
				F <= A XOR Cin;
				Cout <= A AND Cin;
			when "101" =>	-- Soma complemento de A com carryIn 
				F <= (NOT A) XOR Cin;
				Cout <= (NOT A) AND Cin;
			when "110" => 	-- Soma de A + B + carryIn
				F <= (A XOR B) XOR Cin;
				Cout <= (A AND B) OR ((A XOR B) AND Cin);
			when "111" =>	-- Soma de B + (complemento de A) + carryIn 
				F <= ((NOT A) XOR B) XOR Cin;
				Cout <= ((NOT A) AND B) OR (((NOT A) XOR B) AND Cin);
			when others => null;
		end case;
	end process;
end Behavioral;