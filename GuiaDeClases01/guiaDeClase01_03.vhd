library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myTriStateN is
	 Generic(N:integer := 4);
    Port ( a : in   STD_LOGIC_VECTOR(N-1 downto 0);
           c : in   STD_LOGIC_VECTOR(N-1 downto 0);
           s : out  STD_LOGIC_VECTOR(N-1 downto 0)
			  );
end myTriStateN;

architecture ARCH_myTriStateN of myTriStateN is
	
begin

	TSN: for i in 0 to N-1 generate
		s(i) <= 	a(i) when c(i) = '1' else
					'Z';
	end generate;

end ARCH_myTriStateN;

