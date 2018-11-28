library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myUartTxText is
    Port ( clk : in   STD_LOGIC;
           rst : in   STD_LOGIC;
           sw  : in   STD_LOGIC_VECTOR (8-1 downto 0);
           tx  : out  STD_LOGIC
			  );
end myUartTxText;

architecture ARCH_myUartTxText of myUartTxText is

	signal sRegDataNext 	:	STD_LOGIC_VECTOR (8-1 downto 0);
	signal sRegDataNow 	:	STD_LOGIC_VECTOR (8-1 downto 0);
   signal sDataWr			: 	STD_LOGIC;
	signal sReady			:	STD_LOGIC;
	signal sNrst			:	STD_LOGIC;
	
begin
	
	sNrst	<= not(rst);
	
	SEC: PROCESS( clk )
	begin
		if rising_edge( clk ) then
			if sNrst = '1' then 
				sRegDataNow <= "00000000";
			else 
				sRegDataNow <= sRegDataNext;
			end if;
		end if;
	end PROCESS;

	LC: PROCESS( sRegDataNow, sw, sReady )
	begin
	
		sRegDataNext   <= sRegDataNow;
		sDataWr			<= '0';
		
		if sReady = '1' then
			if sRegDataNow = sw then
			else
				sRegDataNext <= sw ;
				sDataWr <= '1';
			end if;
		end if;
	end PROCESS;

	TX1 : entity WORK.myUartTx(ARCH_myUartTx)
	generic MAP( dataSize	=> 8 )	
	port MAP( 	clk 	 => clk,
					rst 	 => sNrst,
					dataWr => sDataWr,
					dataTx => sRegDataNow,
					ready  => sReady,
					tx 	 => tx
				);	
				
end ARCH_myUartTxText;