library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity myMagCmp8 is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           igual : out  STD_LOGIC;
           aMayorB : out  STD_LOGIC;
           bMayorA : out  STD_LOGIC
			  );
end myMagCmp8;

architecture ARCH_myMagCmp8 of myMagCmp8 is
	
	signal salida : STD_LOGIC_VECTOR (3-1 downto 0);
	
begin

	igual 	<= salida(0);
	aMayorB 	<= salida(1);
	bMayorA 	<= salida(2);
	
	salida <= 	"001" when unsigned(a) = unsigned(b) else
					"010" when unsigned(a) > unsigned(b) else
					"100"; 
					
end ARCH_myMagCmp8;