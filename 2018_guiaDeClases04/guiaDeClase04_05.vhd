library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myUart is
	Generic( baudRate 	: integer := 9600;
				sysClk	 	: integer := 100000000;
				dataSize		: integer := 8
			  );
    Port ( clk 	: in   STD_LOGIC;
           rst 	: in   STD_LOGIC;
           dataWr : in   STD_LOGIC;
           dataTx : in   STD_LOGIC_VECTOR (dataSize-1 downto 0);
           ready 	: out  STD_LOGIC;
           tx 		: out  STD_LOGIC;
           dataRd : out  STD_LOGIC;
           dataRx : out  STD_LOGIC_VECTOR (dataSize-1 downto 0);
           rx 		: in   STD_LOGIC);
end myUart;

architecture ARCH_myUart of myUart is

begin

	TX1 : entity WORK.myUartTx(ARCH_myUartTx)
	generic MAP( baudRate	=> baudRate,
					 sysClk		=> sysClk,
					 dataSize	=> dataSize
					 )	
	port MAP( 	clk 	 => clk,
					rst 	 => rst,
					dataWr => dataWr,
					dataTx => dataTx,
					ready  => Ready,
					tx 	 => tx
				);

	RX1 : entity WORK.myUartRx(ARCH_myUartRx)
	generic MAP( baudRate	=> baudRate,
					 sysClk		=> sysClk,
					 dataSize	=> dataSize
					 )	
	port MAP( 	clk 	 => clk,
					rst 	 => rst,
					dataRd => dataRd,				 
					dataRx => dataRx,				
					rx 	 => rx
				);

end ARCH_myUart;