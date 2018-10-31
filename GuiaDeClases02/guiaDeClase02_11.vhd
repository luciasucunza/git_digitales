library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myCnt is
	 Generic(N:integer:=4);
    Port ( clk	 	: in   STD_LOGIC;
           rst 	: in   STD_LOGIC;
			  ena 	: in   STD_LOGIC;
           q   	: out  STD_LOGIC_VECTOR(N-1 downto 0)
			);
end myCnt;

architecture ARCH_myCnt of myCnt is

	signal qdSignal : STD_LOGIC_VECTOR(N-1 downto 0);
	signal andSignal: STD_LOGIC_VECTOR(N-2 downto 0);

begin

	q	<= qdSignal;
	
	FFD0: entity WORK.myFFDSE(ARCH_myFFDSE)
		port MAP( clk => clk,
					 set => rst,
					 ena => ena,
					 d   => ena Xor qdSignal(0),
					 q   => qdSignal(0)
					);
																			
	SR: for i in 1 to N-1 generate
		FFDN: entity WORK.myFFDRE(ARCH_myFFDRE)
		port MAP( clk => clk,
					 rst => rst,
					 ena => ena,
					 d   => andSignal(i-1) xor qdSignal(i),
					 q   => qdSignal(i)
					);
	end generate;
	
	andSignal(0) <= qdSignal(0) and ena; 
	ANDS: for i in 1 to N-2 generate
		andSignal(i) <= qdSignal(i) and andSignal(i-1);
	end generate;
	
end ARCH_myCnt;