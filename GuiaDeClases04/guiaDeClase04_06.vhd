library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myUartTest is
    Port ( clk : in   STD_LOGIC;
           rst : in   STD_LOGIC;
           sw 	: in   STD_LOGIC_VECTOR (4-1 downto 0);
           tx 	: out  STD_LOGIC;
           led	: out  STD_LOGIC_VECTOR (8-1 downto 0);
           rx 	: in   STD_LOGIC
			  );
end myUartTest;

architecture ARCH_myUartTest of myUartTest is

	signal sDataRd   	: STD_LOGIC;
	signal sDataRx   	: STD_LOGIC_VECTOR (8-1 downto 0);
	signal sLedsNow  	: STD_LOGIC_VECTOR (8-1 downto 0);
	signal sLedsNext	: STD_LOGIC_VECTOR (8-1 downto 0);
	
	signal sReady		: STD_LOGIC;
	signal sDataWr		: STD_LOGIC;
	signal sDataTxNow	: STD_LOGIC_VECTOR (4-1 downto 0);
	signal sDataTxNext: STD_LOGIC_VECTOR (4-1 downto 0);
	signal sDataTxFULL: STD_LOGIC_VECTOR (8-1 downto 0);
	

begin

	SEC: PROCESS( clk )
	begin
		if rising_edge(clk) then
			if rst = '1' then
				sLedsNow 	<= (others => '0');
				sDataTxNow <= "0000";
			else
				sLedsNow 	<= sLedsNext;
				sDataTxNow  <= sDataTxNext;
			end if;
		end if;
	
	end PROCESS;
	
	
	LCRX: PROCESS( sDataRd, sDataRx, sLedsNow )
	begin
		if sDataRd = '1' then
			sLedsNext 	<= sDataRx;
		else
			sLedsNext 	<= sLedsNow;
		end if;
	end PROCESS;


	LC: PROCESS( sDataTxNow, sReady, sw )
	begin
		if sReady = '1' then
			if sDataTxNow = sw then
			else
				sDataTxNext <= sw ;
				sDataWr		<= '1';
			end if;
		else
				sDataTxNow	<= sDataTxNext;
				sDataWr		<= '0';
		end if;
	end PROCESS;
	
	
-- Si pongo el "0101" se infiere un latch 
--	sDataTxFULL <= sDataTxNow & "0101";
	sDataTxFULL <= sDataTxNow & sDataTxNow;
	led 			<= sLedsNow;


	UART: entity WORK.myUart(ARCH_myUart)
	generic MAP( dataSize => 8	 )	
	port MAP( 	clk 	 => clk,
					rst 	 => rst,
					dataWr => sDataWr,
					dataTx => sDataTxFULL,
					ready  => sReady,
					tx 	 => tx,		
					dataRd => sDataRd,		
					dataRx => sDataRx,		
					rx		 => rx
				);
				
end ARCH_myUartTest;