library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           ci : in  STD_LOGIC;
           co : out  STD_LOGIC;
           s : out  STD_LOGIC
			  );
end fullAdder;

architecture ARCH_fullAdder of fullAdder is

	signal ent : STD_LOGIC_VECTOR(3-1 downto 0);
	signal sal : STD_LOGIC_VECTOR(2-1 downto 0);
	
begin

	ent <= a&b&ci;
	
	with ent select
	
		sal <=	"00" when "000",
					"01" when "001",
					"01" when "010",
					"10" when "011",
					"01" when "100",
					"10" when "101",
					"10" when "110",
					"11" when "111",
					"00" when others;
				
		s  <= sal(0);
		co <= sal(1);
		
end ARCH_fullAdder;