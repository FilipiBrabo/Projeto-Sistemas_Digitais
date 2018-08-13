library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


	port(
		 SW : in STD_LOGIC_VECTOR(5 downto 0);--[Cin, A, B, S2, s1, s0]
		 LEDR : out STD_LOGIC_Vector(1 downto 0)
	 );
 end ula_1bit;

<<<<<<< HEAD
 architecture Behavioral of ula_1bit is

 begin
	process(SW)
	begin
		LEDR(1) <= '0';
		case SW(2 downto 0) is
			when "000" => 	-- Transfere A p/ saida
				LEDR(0) <= SW(4);
			when "001" =>  	-- Transfere complemento de A p/ saida
				LEDR(0) <= (NOT SW(4));
			when "010" =>  	-- A XOR B
				LEDR(0) <= SW(4) XOR SW(3);
			when "011" => 	-- A XNOR B
				LEDR(0) <= SW(4) XNOR SW(3);
			when "100" =>	-- Soma A com carryIn
				LEDR(0) <= SW(4) XOR SW(5);
				LEDR(1) <= SW(4) AND SW(5);
			when "101" =>	-- Soma complemento de A com carryIn
				LEDR(0) <= (NOT SW(4)) XOR SW(5);
				LEDR(1) <= (NOT SW(4)) AND SW(5);
			when "110" => 	-- Soma de A + B + carryIn
				LEDR(0) <= (SW(4) XOR SW(3)) XOR SW(5);
				-- LEDR(1) <= (SW(4) AND SW(3)) OR ((SW(4) XOR SW(3)) AND SW(5));
				LEDR(1) <= (SW(4) AND SW(5)) OR (SW(4) AND SW(3)) OR (SW(5) AND SW(3));

			when "111" =>	-- Soma de B + (complemento de A) + carryIn
				LEDR(0) <= NOT SW(4) XOR SW(3) XOR SW(5);
				-- LEDR(1) <= NOT ((NOT SW(4)) AND SW(3)) OR (((NOT SW(4)) XOR SW(3)) AND SW(5));
				LEDR(1) <= ((NOT SW(4)) AND SW(5)) OR ((NOT SW(4)) AND SW(3)) OR (SW(5) AND SW(3));
			when others => null;
		end case;
	end process;
=======
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
>>>>>>> 29b8da0978d67d3765db5c1080624406b27fcd8f
end Behavioral;

