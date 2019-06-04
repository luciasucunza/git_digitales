library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdderN is
    Generic(N:integer:=4);
	 Port ( a,b : in   STD_LOGIC_VECTOR (N-1 downto 0);
           ci  : in   STD_LOGIC;
           s   : out  STD_LOGIC_VECTOR (N-1 downto 0);
           co  : out  STD_LOGIC
			  );
end fullAdderN;

architecture ARCH_fullAdderN of fullAdderN is

	signal carry : STD_LOGIC_VECTOR(N+1-1 downto 0);
	
begin

	carry(0) <= ci;
	co 		<= carry(N);
	
	FA4: for i in 0 to N-1 generate
		COMP : entity WORK.fullAdder(ARCH_fullAdder)
		port MAP( a  => a(i),
					 b  => b(i),
					 ci => carry(i),
					 s  => s(i),
					 co => carry(i+1)
					);
	end generate;
	
end ARCH_fullAdderN;