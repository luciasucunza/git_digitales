library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myUartTest is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sw  : in  STD_LOGIC_VECTOR (8-1 downto 0);
           tx  : out  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (8-1 downto 0);
           rx  : in  STD_LOGIC);
end myUartTest;

architecture Arch_myUartTest of myUartTest is

	signal sRx 		: STD_LOGIC;
	signal ena		: STD_LOGIC;
	signal ena_led	: STD_LOGIC;
	signal sTx		: STD_LOGIC;
	signal sLed 	: STD_LOGIC_VECTOR (8-1 downto 0);

begin
	sRx <= rx;
	tx 	<= sTx;
	led <= sLed when ena_led = '1' else (others => '0');
	
	CONT: entity work.myCnt (Arch_myCnt)
	generic map (M => 100000000) 
	PORT MAP(
		clk 		=> clk,
		rst 		=> rst,
		ena 		=> '1', 
		salidaM_2 	=> open,
		salidaM 	=> ena
	);

	UART: entity work.myUart (Arch_myUart)
	PORT MAP(
		clk 	=> clk,
		rst 	=> rst,
		dataWr 	=> ena,
		dataTx 	=> sw,
		ready 	=> open,
		tx 		=> sTx,
		dataRd 	=> ena_led,
		dataRx 	=> sLed,
		rx 		=> sRx
	);

				
end ARCH_myUartTest;
