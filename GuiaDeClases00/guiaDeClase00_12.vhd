library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myDivMag8 is
    Port ( entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           div : in  STD_LOGIC_VECTOR (1 downto 0);
           salida : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end myDivMag8;

architecture ARCH_myDivMag8 of myDivMag8 is

begin

	with div select
	
		salida <=	'0' & entrada(7 downto 1) 		when "01",
						"00" & entrada(7 downto 2) 	when "10",
						"000" & entrada(7 downto 3) 	when "11",
						entrada 								when others;
						
end ARCH_myDivMag8;

