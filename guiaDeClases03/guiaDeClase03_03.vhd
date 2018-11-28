library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parpaedo1S is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           led : out  STD_LOGIC);
end parpaedo1S;

architecture ARCH_parpaedo1S of parpaedo1S is

	signal aux1S, aux2S : STD_LOGIC;
	
begin

	CONT: entity WORK.myCnt(ARCH_myCnt)
		generic MAP( M => 10000000 )								-- No se ve en el TB
		port 	  MAP( 	clk 			=> clk,
							rst  			=> rst,
							ena 			=> '1',
							salidaM_2	=> aux1S,
							salidaM		=> aux2S
						);
						
	FFT: entity WORK.myFFT(ARCH_myFFT)
		port    MAP( 	clk 			=> clk,
							rst  			=> rst,
							t	 			=> aux1S,
							q				=> led
						);	

end ARCH_parpaedo1S;