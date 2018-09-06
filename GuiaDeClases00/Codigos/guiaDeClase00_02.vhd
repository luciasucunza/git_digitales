library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myAnd4 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC
			  );
end myAnd4;

architecture ARCH_myAnd4 of myAnd4 is

begin

	c <= a(0) and a(1) and a(2) and a(3);

end ARCH_myAnd4;

