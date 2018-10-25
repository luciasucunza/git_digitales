library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myFFDC is
    Port ( clk : in   STD_LOGIC;
           clr : in   STD_LOGIC;
           d   : in   STD_LOGIC;
           q   : out  STD_LOGIC
			  );
end myFFDC;

architecture ARCH_myFFDC of myFFDC is

begin

	PROCESS( clk, clr )
	begin
		
		if clr = '1' then
			q <= '0';
		elsif rising_edge(clk) then
			q <=  d ;
		end if;
		
	end PROCESS;

end ARCH_myFFDC;