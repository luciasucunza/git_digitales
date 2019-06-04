library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myShiftRegBi is
	 Generic(N:integer:=4);
    Port ( clk	 	: in   STD_LOGIC;
           rst 	: in   STD_LOGIC;
			  ena 	: in   STD_LOGIC;
			  dir 	: in   STD_LOGIC_VECTOR(2-1 downto 0);
           dr, dl : in   STD_LOGIC;
			  d   	: in   STD_LOGIC_VECTOR(N-1 downto 0);
           q   	: out  STD_LOGIC_VECTOR(N-1 downto 0)
			);
end myShiftRegBi;

architecture Behavioral of myShiftRegBi is
		
	signal qSignal   : STD_LOGIC_VECTOR(N-1 downto 0);
	signal dSignal   : STD_LOGIC_VECTOR(N-1 downto 0);
	signal dsSignal  : STD_LOGIC_VECTOR(N-1 downto 0);
	signal langiSq   : STD_LOGIC_VECTOR(N-1 downto 0);
	
	
begin

	SR: for i in 0 to N-1 generate
		
		langiSq(i) <= qSignal(N-1-i);
	
		FFD: entity WORK.myFFDRE(ARCH_myFFDRE)
		port MAP( clk => clk,
					 rst => rst,
					 ena => ena,
					 d   => dSignal(i),
					 q   => qSignal(i)
					);
					
		I1: if i = 0 generate		
		begin
			dsSignal(0) <= (dir(0) and dl) or (not(dir(0)) and dr);
		end generate;
	
		
		I3: if i > 0 generate
		begin
			dsSignal(i) <= qSignal(i-1);
			end generate;
										
	end generate;

	with dir(1) select
		dSignal <=  dsSignal when '0',				-- Serie
						d when others;						-- Paralelo
		with dir select
		q		 <=  langiSq  when "01",				-- Serie Izquierda
					  qSignal  when others;				-- Paralelo O Serie derecha						
												

end Behavioral;	