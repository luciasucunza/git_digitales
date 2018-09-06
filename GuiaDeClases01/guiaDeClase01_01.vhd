library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myMux4_1 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           s : out  STD_LOGIC);
end myMux4_1;

architecture ARCH_myMux4_1 of myMux4_1 is

	signal M1 : STD_LOGIC;
	signal M2 : STD_LOGIC;
	
begin

	primer_Mux : entity WORK_MYMUX(ARCH_myMux)
	port MAP(
					a => a(1 downto 0),
					c => c(0),
					s => M1
				);
	segundo_Mux : entity WORK_MYMUX(ARCH_myMux)
	port MAP(
					a => a(3 downto 2),
					c => c(0),
					s => M2
				);
	tercer_Mux : entity WORK_MYMUX(ARCH_myMux)
	port MAP(	
					a => M2&M1,
					c => c(1),
					s => s
				);
	
	
end ARCH_myMux4_1;