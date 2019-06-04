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

	signal qSignal : STD_LOGIC_VECTOR(N-1 downto 0);
	signal dSignal: STD_LOGIC_VECTOR(N-1 downto 0);
	signal andSignal: STD_LOGIC_VECTOR(N-1 downto 0);
	
begin

	q	<= qSignal;
												
	SR: for i in 0 to N-1 generate
		FFDN: entity WORK.myFFDRE(ARCH_myFFDRE)
		port MAP( clk => clk,
					 rst => rst,
					 ena => ena,
					 d   => dSignal(i),
					 q   => qSignal(i)
					);
	end generate;
	
	andSignal(0) <= ena; 
	dSignal(0)   <= andSignal(0) xor qSignal(0); 
	
	ANDS: for i in 1 to N-1 generate
		andSignal(i) <= qSignal(i-1) and andSignal(i-1);
		dSignal(i)   <= andSignal(i) xor qSignal(i);
	end generate;
	
end ARCH_myCnt;