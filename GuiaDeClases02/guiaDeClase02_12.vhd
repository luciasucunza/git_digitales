library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myCntBi is
	 Generic(N:integer:=4);
    Port ( clk	 	: in   STD_LOGIC;
           rst 	: in   STD_LOGIC;
			  ena 	: in   STD_LOGIC;
			  dir		: in   STD_LOGIC;
           q   	: out  STD_LOGIC_VECTOR(N-1 downto 0)
			);
end myCntBi;

architecture ARCH_myCntBi of myCntBi is

	signal qSignal : STD_LOGIC_VECTOR(N-1 downto 0);
	
begin
	
	with dir select
			q	<= not(qSignal) when '1',
				   qSignal when others;
				

	CONT: entity WORK.myCnt(ARCH_myCnt)
		port MAP( clk => clk,
					 rst => rst,
					 ena => ena,
					 q   => qSignal
					);
				
end ARCH_myCntBi;