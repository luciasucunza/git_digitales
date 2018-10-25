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

	signal qdSignal: STD_LOGIC_VECTOR(N-1 downto 0);

begin

	q	<= qSignal;
	
	FFD0: entity WORK.myFFDR(ARCH_myFFDR)
		port MAP( clk => clk,
					 set => rst,
					 d   => ena,
					 q   => qSignal(0)
					);
					
	FFD1: entity WORK.myFFDR(ARCH_myFFDR)
		port MAP( clk => clk,
					 set => rst,
					 d   => qSignal(0),
					 q   => qSignal(1)
					);
	SR: for i in 2 to N-1 generate
		FFDN: entity WORK.myFFDR(ARCH_myFFDR)
		port MAP( clk => clk,
					 rst => rst,
					 d   => qSignal(i-1) and qSignal(i-2),
					 q   => qSignal(i)
					);
	end generate;
	
end ARCH_myCnt;