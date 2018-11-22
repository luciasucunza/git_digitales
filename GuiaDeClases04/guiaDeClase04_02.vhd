library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myUartTxTest is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (3 downto 0);
           tx : out  STD_LOGIC);
end myUartTxTest;

architecture Arch_myUartTxTest of myUartTxTest is

	signal ena		: std_logic;
	signal sTx  	: std_logic;
	signal sw_8		: std_logic_vector(8-1 downto 0);

begin

	CONT: entity WORK.myCnt(ARCH_myCnt)
		generic MAP( M => 100000000 )								
		port 	  MAP( 	clk 			=> clk,
							rst  			=> rst,
							ena 			=> '1',
							salidaM_2	=> OPEN,
							salidaM		=> ena
						);

	UART: entity WORK.myUartTx(ARCH_myUartTx)							
		port 	  MAP( 	clk 			=> clk,
							rst 			=> rst,
							dataWr 		=> ena,
							dataTx 		=> sw_8,
							ready 		=> open,
							tx 			=> sTx
						);

	tx		<= sTx;
	sw_8	<= sw & sw;

end Arch_myUartTxTest;

