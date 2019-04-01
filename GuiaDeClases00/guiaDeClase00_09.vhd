library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myDeco7Seg is
    Port ( entrada : in  STD_LOGIC_VECTOR (3 downto 0);
           a, b, c, d, e, f, g : out  STD_LOGIC
			  );
end myDeco7Seg;

architecture ARCH_myDeco7Seg of myDeco7Seg is

	signal salida : STD_LOGIC_VECTOR( 7-1 downto 0);

begin

	with entrada select
	
		salida <=	"1111110" when "0000",
						"0110000" when "0001",
						"1101101" when "0010",
						"1111001" when "0011",
						"0110011" when "0100",
						"1011011" when "0101",
						"1011111" when "0110",
						"1110000" when "0111",
						"1111111" when "1000",
						"1111011" when "1001",
						"1110111" when "1010",
						"0011111" when "1011",
						"1001110" when "1100",
						"0111101" when "1101",
						"1001111" when "1110",
						"1000111" when "1111",
						"0000000" when others;
						
		a <= salida(6);
		b <= salida(5);
		c <= salida(4);
		d <= salida(3);
		e <= salida(2);
		f <= salida(1);
		g <= salida(0);

end ARCH_myDeco7Seg;