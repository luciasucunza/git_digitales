library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myShiftRegBi is
	 Generic(N:integer:=4);
    Port ( clk	 	: in   STD_LOGIC;
           rst 	: in   STD_LOGIC;
			  ena 	: in   STD_LOGIC;
			  dir 	: in   STD_LOGIC;
           dr, dl : in   STD_LOGIC;
			  d   	: in   STD_LOGIC_VECTOR(N-1 downto 0);
           q   	: out  STD_LOGIC_VECTOR(N-1 downto 0)
			);
end myShiftRegBi;

architecture Behavioral of myShiftRegBi is
	
begin



end Behavioral;

