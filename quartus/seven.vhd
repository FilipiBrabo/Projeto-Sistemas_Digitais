library ieee;
use ieee.std_logic_1164.all;

entity SevenSegment is
   port(
      SW: in std_logic_vector(2 downto 0);
      HEX0: out std_logic_vector(6 downto 0);
		HEX1: out std_logic_vector(6 downto 0);
		HEX2: out std_logic_vector(6 downto 0);
		HEX3: out std_logic_vector(6 downto 0);
   );
end SevenSegment;

architecture arch of SevenSegment is
begin
   with SW select
      HEX0(6 downto 0) <=
         "1000000" when "000",
         "1111001" when "001",
         "0100100" when "010",
         "0110000" when "011",
         "0011001" when "100",
         "0010010" when "101",
         "0000010" when "110",       	
         "0001111" when "111",       	
         "0000000" when "000",       	
         "0010000" when "001",       	
         "0001000" when "010",
         "0000011" when "011",
         "1000110" when "100",
         "0100001" when "101",
         "0000110" when "110",
         "0001110" when others;
		with SW(0) select
      HEX1(6 downto 0) <=
         "1111110" when "1",
         "1111111" when others;
		HEX2 <= "1111111";
		HEX3 <= "1111111";
         
   --sseg(7) <= dp;
end arch;