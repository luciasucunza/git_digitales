library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myFFDREN is
	 Generic(N:integer:=4);
    Port ( clk : in   STD_LOGIC;
           rst : in   STD_LOGIC;
           ena : in   STD_LOGIC;
			  d   : in   STD_LOGIC_VECTOR(N-1 downto 0);
           q   : out  STD_LOGIC_VECTOR(N-1 downto 0)
			);
end myFFDREN;

architecture ARCH_myFFDREN of myFFDREN is

begin

	PROCESS( clk )
	begin
		
		if rising_edge(clk) then
			if rst = '1' then
				q <= (others=>'0');
			elsif  ena = '1' then 
				q <=  d ;
			end if;
		end if;
		
	end PROCESS;

end ARCH_myFFDREN;