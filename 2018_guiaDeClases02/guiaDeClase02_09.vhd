library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myRingCnt is
	 Generic(N:integer:=4);
    Port ( clk	 	: in   STD_LOGIC;
           rst 	: in   STD_LOGIC;
			  ena 	: in   STD_LOGIC;
           q   	: out  STD_LOGIC_VECTOR(N-1 downto 0)
			);
end myRingCnt;

architecture ARCH_myRingCnt of myRingCnt is

	signal qdSignal: STD_LOGIC_VECTOR(N-1 downto 0);
	
begin
	
	q	<= qdSignal;
	
	FFD0: entity WORK.myFFDSE(ARCH_myFFDSE)
		port MAP( clk => clk,
					 set => rst,
					 ena => ena,
					 d   => qdSignal(N-1),
					 q   => qdSignal(0)
					);
	
	SR: for i in 1 to N-1 generate
		FFDN: entity WORK.myFFDRE(ARCH_myFFDRE)
		port MAP( clk => clk,
					 rst => rst,
					 ena => ena,
					 d   => qdSignal(i-1),
					 q   => qdSignal(i)
					);
	end generate;
		
		
end ARCH_myRingCnt;