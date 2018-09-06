library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myAnd2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC
			  );
end myAnd2;

architecture ARCH_myAnd2 of myAnd2 is

begin
	
	c <= a and b;

end ARCH_myAnd2;

