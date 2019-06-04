library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myFFDR is
    Port ( clk : in   STD_LOGIC;
           rst : in   STD_LOGIC;
           d   : in   STD_LOGIC;
           q   : out  STD_LOGIC
			  );
end myFFDR;

architecture ARCH_myFFDR of myFFDR is

begin

	PROCESS( clk )
	begin
		
		if rising_edge(clk) then
			if rst = '1' then
				q <= '0';
			else
				q <=  d ;
			end if;
		end if;
		
	end PROCESS;

end ARCH_myFFDR;