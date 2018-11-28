library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parapedo1S_8Bits_B is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           btn : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (8-1 downto 0)
			 );
end parapedo1S_8Bits_B;

architecture ARCH_parapedo1S_8Bits_B of parapedo1S_8Bits_B is

	signal auxS:					STD_LOGIC;
	signal aux2S:					STD_LOGIC;
	signal auxLED_sin_btn:		STD_LOGIC_VECTOR(8-1 downto 0);
	signal auxLED_con_btn:		STD_LOGIC_VECTOR(8-1 downto 0);

begin

	FFT: entity WORK.myCnt(ARCH_myCnt)
		generic MAP( M => 10 )						-- Para lograr 1s, se debe poner 10000000, pero no se ve en el TB sino
		port 	  MAP( 	clk 			=> clk,
							rst  			=> rst,
							ena 			=> '1',
							salidaM_2	=> auxS,
							salidaM		=> aux2S
						);

	CNT1: entity WORK.myRingCntBi(ARCH_myRingCntBi)
		generic MAP( N => 8 )
		port MAP	( 		clk	=> clk,
							rst 	=> rst,
							ena 	=> auxS,
							dir   => btn,
							q   	=> led
					);
	
end ARCH_parapedo1S_8Bits_B;