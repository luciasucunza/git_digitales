library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myMux4_1 is
    Port ( a : in  STD_LOGIC_VECTOR(4-1 downto 0);
           c : in  STD_LOGIC_VECTOR(2-1 downto 0);
           s : out STD_LOGIC
			  );
end myMux4_1;

architecture ARCH_myMux4_1 of myMux4_1 is

	signal aux : STD_LOGIC_VECTOR(2-1 downto 0);

begin

	Mux1 : entity WORK.myMux(ARCH_myMux)
	port MAP( a => a(1 downto 0),
				 c => c(0),
				 s => aux(0)
				);

	Mux2 : entity WORK.myMux(ARCH_myMux)
	port MAP( a => a(3 downto 2),
				 c => c(0),
				 s => aux(1)
				);

	Mux3 : entity WORK.myMux(ARCH_myMux)
	port MAP( a => aux,
				 c => c(1),
				 s => s
				);

end ARCH_myMux4_1;

