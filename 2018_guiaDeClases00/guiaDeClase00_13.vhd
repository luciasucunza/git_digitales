library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myDiv8 is
    Port ( entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           div : in  STD_LOGIC_VECTOR (1 downto 0);
           salida : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end myDiv8;

architecture ARCH_myDiv8 of myDiv8 is

begin

	with div select
	
		salida <=	entrada(7)&entrada(7 downto 1) 								when "01",
						entrada(7)&entrada(7)&entrada(7 downto 2) 				when "10",
						entrada(7)&entrada(7)&entrada(7)& entrada(7 downto 3) when "11",
						entrada 																when others;
	

end ARCH_myDiv8;

