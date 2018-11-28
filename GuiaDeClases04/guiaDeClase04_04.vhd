library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myUartRxText is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (7 downto 0);
           rx  : in  STD_LOGIC);
end myUartRxText;

architecture ARCH_myUartRxText of myUartRxText is

	signal sNrst		: STD_LOGIC;
	signal sDataRd		: STD_LOGIC;
	signal sDataRx		: STD_LOGIC_VECTOR (7 downto 0);
	signal sLedNow 	: STD_LOGIC_VECTOR (7 downto 0);
	signal sLedNext	: STD_LOGIC_VECTOR (7 downto 0);
	
begin
	sNrst	<= not(rst);
	led 	<= sLedNow;

	SEC: PROCESS( clk )
	begin
		if rising_edge( clk ) then
			if sNrst = '1' then 
				sLedNow  <= (others => '0');
			else 
				sLedNow	<= sLedNext;
			end if;
		end if;
	end PROCESS;

	LC: PROCESS( sLedNow, sDataRx, sDataRd )
	begin
		sLedNext <= sLedNow;
		if sDataRd = '1' then
			sLedNext <= sDataRx;
		end if;
	end PROCESS;
 
	sRst <= not(rst);
	
	RX1 : entity WORK.myUartRx(ARCH_myUartRx)
	generic MAP( dataSize	=> 8 )	
	port MAP( 	clk 	 => clk,
					rst 	 => sNrst,
					dataRd => sDataRd,				 
					dataRx => sDataRx,				
					rx 	 => rx
				);

end ARCH_myUartRxText;