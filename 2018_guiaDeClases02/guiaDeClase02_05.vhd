library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myEdgeDetector is
	 Generic(N:integer:=4);
    Port ( clk 			: in   STD_LOGIC;
           rst 			: in   STD_LOGIC;
			  d   			: in   STD_LOGIC;
           ascendente   : out  STD_LOGIC;
           descendente  : out  STD_LOGIC
			);
end myEdgeDetector;

architecture ARCH_myEdgeDetector of myEdgeDetector is

	signal qdSignal : STD_LOGIC_VECTOR(2-1 downto 0);

begin
	
	FFD: entity WORK.myFFDR(ARCH_myFFDR)
	port MAP( clk => clk,
				 rst => rst,
				 d   => d,
				 q   => qdSignal(1)
				);
	
	qdSignal(0) <= d;
	
	ascendente  <= '1' when qdSignal = "01" else
						'0';
	descendente <= '1' when qdSignal = "10" else
						'0';

end ARCH_myEdgeDetector;