library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myShiftReg is
	 Generic(N:integer:=4);
    Port ( clk : in   STD_LOGIC;
           rst : in   STD_LOGIC;
			  d   : in   STD_LOGIC;
           q   : out  STD_LOGIC
			);
end myShiftReg;

architecture ARCH_myShiftReg of myShiftReg is


begin


end ARCH_myShiftReg;