library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myJohnsonCnt is
	 Generic(N:integer:=4);
    Port ( clk	 	: in   STD_LOGIC;
           rst 	: in   STD_LOGIC;
			  ena 	: in   STD_LOGIC;
           q   	: out  STD_LOGIC_VECTOR(N-1 downto 0)
			);
end myJohnsonCnt;

architecture ARCH_myJohnsonCnt of myJohnsonCnt is

	signal qdSignal: STD_LOGIC_VECTOR(N-1 downto 0);
	signal aux: STD_LOGIC;
	
begin
	
	q	 <= qdSignal;
	aux <= not(qdSignal(N-1));
	FFD0: entity WORK.myFFDSE(ARCH_myFFDSE)
		port MAP( clk => clk,
					 set => rst,
					 ena => ena,
					 d   => aux,
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
		
end ARCH_myJohnsonCnt;