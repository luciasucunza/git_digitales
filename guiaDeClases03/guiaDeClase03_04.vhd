library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parpadeo1S_8Bits is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR(8-1 downto 0)
			 );
end parpadeo1S_8Bits;

architecture ARCH_parpadeo1S_8Bits of parpadeo1S_8Bits is

	signal auxS:		STD_LOGIC;
	signal aux2S:		STD_LOGIC;

begin

	FFT: entity WORK.myCnt(ARCH_myCnt)
		generic MAP( M => 10 )						-- Para lograr 1s, se debe poner 10000000, pero no se ve en el TB sino
		port 	  MAP( 	clk 			=> clk,
							rst  			=> rst,
							ena 			=> '1',
							salidaM_2	=> auxS,
							salidaM		=> aux2S
						);
	
	CNT: entity WORK.myRingCntBi(ARCH_myRingCntBi)
		generic MAP( N => 8 )
		port MAP	( 		clk	=> clk,
							rst 	=> rst,
							ena 	=> auxS,
							dir	=> '0',
							q   	=> led
					);
end ARCH_parpadeo1S_8Bits;