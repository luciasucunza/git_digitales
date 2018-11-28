library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myFFT is
    Port ( clk : in   STD_LOGIC;
           rst : in   STD_LOGIC;
           t 	: in   STD_LOGIC;
           q 	: out  STD_LOGIC
			  );
end myFFT;

architecture ARCH_myFFT of myFFT is

	signal qAux : STD_LOGIC;
	
begin
	
	PROCESS( clk )
	begin
		
		if rising_edge(clk) then
			if rst = '1'  then
				qAux <= '0';
			elsif t = '1' then  
				qAux <= not(qAux);
			else			
				qAux <= qAux;
			end if;
		end if;
		
	end PROCESS;
	
	q <= qAux;

end ARCH_myFFT;