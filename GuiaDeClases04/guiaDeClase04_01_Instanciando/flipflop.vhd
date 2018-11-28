library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myFFDRE is
    Port ( clk : in   STD_LOGIC;
           rst : in   STD_LOGIC;
           ena : in   STD_LOGIC;
			  d   : in   STD_LOGIC;
           q   : out  STD_LOGIC
			);
end myFFDRE;

architecture ARCH_myFFDRE of myFFDRE is

begin

	PROCESS( clk )
	begin
		
		if rising_edge(clk) then
			if rst = '1' then
				q <= '0';
			elsif  ena = '1' then 
				q <=  d ;
			end if;
		end if;
		
	end PROCESS;

end ARCH_myFFDRE;