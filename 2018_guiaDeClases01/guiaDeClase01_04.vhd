library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder4 is
    Port ( a,b : in   STD_LOGIC_VECTOR (4-1 downto 0);
           ci  : in   STD_LOGIC;
           s   : out  STD_LOGIC_VECTOR (4-1 downto 0);
           co  : out  STD_LOGIC
			  );
end fullAdder4;

architecture ARCH_fullAdder4 of fullAdder4 is

	signal carry : STD_LOGIC_VECTOR(5-1 downto 0);
	
begin

	carry(0) <= ci;
	co		   <= carry(4);
	
	FA4: for i in 0 to 4-1 generate
		COMP : entity WORK.fullAdder(ARCH_fullAdder)
		port MAP( a  => a(i),
					 b  => b(i),
					 ci => carry(i),
					 s  => s(i),
					 co => carry(i+1)
					);
	end generate;
					
end ARCH_fullAdder4;