library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myTriState4 is
    Port ( a : in  STD_LOGIC_VECTOR(4-1 downto 0);
           c : in  STD_LOGIC_VECTOR(4-1 downto 0);
           s : out STD_LOGIC_VECTOR(4-1 downto 0)
			  );
end myTriState4;

architecture ARCH_myTriState4 of myTriState4 is

begin
	
	TS4: for i in 0 to 4-1 generate
		s(i) <= 	a(i) when c(i) = '1' else
					'Z';
	end generate;

end ARCH_myTriState4;