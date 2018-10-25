library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myMux is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC;
           s : out  STD_LOGIC
			  );
end myMux;

architecture ARCH_myMux of myMux is

begin

	s <= 	a(1) when c = '1' else
			a(0);

end ARCH_myMux;