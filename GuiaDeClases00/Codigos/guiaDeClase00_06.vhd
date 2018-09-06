library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myTriState is
    Port ( entrada : in  STD_LOGIC;
           control : in  STD_LOGIC;
           salida : out  STD_LOGIC
			  );
end myTriState;

architecture ARCH_myTriState of myTriState is

begin

	salida <= 	entrada when control = '1' else
					'Z';

end ARCH_myTriState;

