library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myFFDSE is
    Port ( clk : in   STD_LOGIC;
           set : in   STD_LOGIC;
           ena : in   STD_LOGIC;
			  d   : in   STD_LOGIC;
           q   : out  STD_LOGIC
			);
end myFFDSE;

architecture ARCH_myFFDSE of myFFDSE is

begin

	PROCESS( clk )
	begin
		
		if rising_edge(clk) then
			if set = '1' then
				q <= '1';
			elsif  ena = '1' then 
				q <=  d ;
			end if;
		end if;
		
	end PROCESS;

end ARCH_myFFDSE;