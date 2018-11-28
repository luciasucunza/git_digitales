library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myRingCntBi is
	 Generic(N:integer:=4);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena : in  STD_LOGIC;
           dir : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end myRingCntBi;

architecture ARCH_myRingCntBi of myRingCntBi is
	
	signal qNext: 	STD_LOGIC_VECTOR(N-1 downto 0);
	signal qNow: 	STD_LOGIC_VECTOR(N-1 downto 0);


begin

	q	<= qNow;
		
	FFD0: entity WORK.myFFDSE(ARCH_myFFDSE)
	port MAP( clk => clk,
				 set => rst,
				 ena => ena,
				 d   => qNext(0),
				 q   => qNow(0)
				);

	SR: for i in 1 to N-1 generate
		FFDN: entity WORK.myFFDRE(ARCH_myFFDRE)
		port MAP( clk => clk,
					 rst => rst,
					 ena => ena,
					 d   => qNext(i),
					 q   => qNow(i)
					);
	end generate;


	QN: for i in 1 to N-2 generate
			qNext(i) <= qNow(i-1) when dir  = '0' else
							qNow(i+1);	
	end generate;

	qNext(0)   <= 	qNow(N-1) when dir = '0' else
						qNow(1);
					
	qNext(N-1) <= 	qNow(N-2) when dir = '0' else
						qNow(0);
	
end ARCH_myRingCntBi;

