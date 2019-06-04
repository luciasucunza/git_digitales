library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myUartTx is
	Generic( baudRate 	: integer := 9600;
				sysClk	 	: integer := 100000000;
				dataSize		: integer := 8
			  );
    Port ( clk 	: in   STD_LOGIC;
           rst 	: in   STD_LOGIC;
           dataWr : in   STD_LOGIC;
           dataTx : in   STD_LOGIC_VECTOR (dataSize-1 downto 0);
           ready 	: out  STD_LOGIC;
           tx 		: out  STD_LOGIC
			 );
end myUartTx;

architecture ARCH_myUartTx of myUartTx is
	
	type Tstate is ( IDLE, TX0, TX1, TX2, TX3, TX4, TX5, TX6, TX7, STOP, START);
	
	constant BIT_IDLE  : STD_LOGIC := '1';
	constant BIT_START : STD_LOGIC := '0';
	constant BIT_STOP  : STD_LOGIC := '1';
	
	signal sNext, sNow : Tstate;
	signal sRegDataNow : STD_LOGIC_VECTOR( dataSize-1 downto 0);
	signal sRegDataNext: STD_LOGIC_VECTOR( dataSize-1 downto 0);
	signal sTx			 : STD_LOGIC;
	signal pulso104	 : STD_LOGIC;
	signal rstDivFrec  : STD_LOGIC;

begin

	SEC: PROCESS( clk )
	begin
		if rising_edge( clk ) then
			tx <= sTx;
			if rst = '1' then 
				sNow 			<= IDLE;
				tx 			<= BIT_IDLE;
			else 
				sNow			<= sNext;
				sRegDataNow <= sRegDataNext;
			end if;
		end if;
	end PROCESS;
	
	LC: PROCESS( sNow, dataWr, pulso104, sRegDataNow,dataTx )
	begin
		
		rstDivFrec 	 <= '0';
		ready			 <= '0';
		sTx			 <= BIT_IDLE;
		sRegDataNext <= sRegDataNow;
		sNext <= sNow;
		
		case sNow is
		
			when IDLE =>
				ready <= '1';
				if dataWr = '1' then
					sNext 		<= START;
					sRegDataNext<= dataTx;
					rstDivFrec 	<= '1';
					sTx 			<= BIT_START;
					
				end if;
				
			when START =>
				sTx <= BIT_START;
				if pulso104 = '1' then
					sNext <= TX0;
					sTx 	<= sRegDataNow(0);
				end if;
			
			when TX0 =>
				sTx <= sRegDataNow(0);
				if pulso104 = '1' then
					sNext <= TX1;
					sTx 	<= sRegDataNow(1);
				end if;
				
			when TX1 =>
				sTx <= sRegDataNow(1);
				if pulso104 = '1' then
					sNext <= TX2;
					sTx 	<= sRegDataNow(2);
				end if;
				
			when TX2 =>
				sTx <= sRegDataNow(2);
				if pulso104 = '1' then
					sNext <= TX3;
					sTx 	<= sRegDataNow(3);
				end if;
				
			when TX3 =>
				sTx <= sRegDataNow(3);
				if pulso104 = '1' then
					sNext <= TX4;
					sTx 	<= sRegDataNow(4);
				end if;
				
			when TX4 =>
				sTx <= sRegDataNow(4);
				if pulso104 = '1' then
					sNext <= TX5;
					sTx 	<= sRegDataNow(5);
				end if;
				
			when TX5 =>
				sTx <= sRegDataNow(5);
				if pulso104 = '1' then
					sNext <= TX6;
					sTx 	<= sRegDataNow(6);
				end if;
				
			when TX6 =>
				sTx <= sRegDataNow(6);
				if pulso104 = '1' then
					sNext <= TX7;
					sTx 	<= sRegDataNow(7);
				end if;
				
			when TX7 =>
				sTx <= sRegDataNow(7);
				if pulso104 = '1' then
					sNext <= STOP;
					sTx 	<= BIT_STOP;
				end if;
			
			when STOP =>
				sTx 	<= BIT_STOP;
				if pulso104 = '1' then
					sNext <= IDLE;
					sTx 	<= BIT_IDLE;
				end if;
			
			when others =>
					sNext <= IDLE;
					
		end case;
	end PROCESS;
	
	CONT: entity WORK.myCnt(ARCH_myCnt)
		generic MAP( M => sysClk/baudRate )								
		port 	  MAP( 	clk 			=> clk,
							rst  			=> rstDivFrec,
							ena 			=> '1',
							salidaM_2	=> OPEN,
							salidaM		=> pulso104
						);
end ARCH_myUartTx;
