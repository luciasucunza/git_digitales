library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myEdgeCnt is	
	 Generic(N:integer:=4);
    Port ( clk	 	: in   STD_LOGIC;
           rst 	: in   STD_LOGIC;
			  d 		: in   STD_LOGIC;
           q   	: out  STD_LOGIC_VECTOR(N-1 downto 0)
			);
end myEdgeCnt;

architecture ARCH_myEdgeCnt of myEdgeCnt is
	
	signal flanco	: STD_LOGIC;
	signal aux		: STD_LOGIC;

begin

	DETECTOR: entity WORK.myEdgeDetector(ARCH_myEdgeDetector) 
	 generic MAP( N			=> N
			       )
    port MAP( clk 			=> clk,
				  rst 			=> rst,
				  d   			=> d,
				  ascendente   => flanco,
				  descendente  => aux
				);
				
	CONTADOR: entity WORK.myCnt(ARCH_myCnt)
	 generic MAP( N			=> N
			       )
    port MAP( clk 			=> clk,
				  rst 			=> rst,
				  ena 			=> flanco,
				  q 				=> q
				);

end ARCH_myEdgeCnt;