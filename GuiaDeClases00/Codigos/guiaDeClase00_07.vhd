library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myTriState8 is
    Port ( entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           control : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end myTriState8;

architecture ARCH_myTriState8 of myTriState8 is

begin

	salida <= 	entrada when control = '1' else
					(others =>'Z');

end ARCH_myTriState8;

