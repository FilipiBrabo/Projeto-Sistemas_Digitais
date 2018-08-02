library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ula_1bit is
	port(
		 SW : in STD_LOGIC_VECTOR(5 downto 0);--[Cin, A, B, S2, s1, s0]
		 LEDR : out STD_LOGIC_Vector(1 downto 0)
	 );
 end ula_1bit;

architecture Behavioral of ula_1bit is
	signal Cin, A, B, S;
begin
process(SW)
    Cin <= SW(5);
    A   <= SW(4);
    B   <= SW(3);
    S   <= SW(2 downto 0);

begin
	LEDR(1) <= '0';
	case S is
		when "000" => 	-- Transfere A p/ saida
			LEDR(0) <= A;

		when "001" =>  	-- Transfere complemento de A p/ saida
			LEDR(0) <= (NOT A);

		when "010" =>  	-- A XOR B
			LEDR(0) <= A XOR B;

		when "011" => 	-- A XNOR B
			LEDR(0) <= A XNOR B;

		when "100" =>	-- Soma A com carryIn
			LEDR(0) <= A XOR Cin;
			LEDR(1) <= A AND Cin;

		when "101" =>	-- Soma complemento de A com carryIn
			LEDR(0) <= (NOT A) XOR Cin;
			LEDR(1) <= (NOT A) AND Cin;

		when "110" => 	-- Soma de A + B + carryIn
			LEDR(0) <=  A XOR B) XOR Cin;
			-- LEDR(1) <=  A AND B) OR ( A XOR B) AND Cin);
			LEDR(1) <=  A && Cin) ||  A && B) || (Cin && B)

		when "111" =>	-- Soma de B + (complemento de A) + carryIn
			LEDR(0) <= ((NOT A) XOR B) XOR Cin;
			-- LEDR(1) <= NOT ((NOT A) AND B) OR (((NOT A) XOR B) AND Cin);
			LEDR(1) <= ((NOT A) && Cin) || ((NOT A) && B) || (Cin && B)

		when others => null;
		
	end case;
end process;
end Behavioral;

