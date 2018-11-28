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
	
	
	signal sNext, sNow : Tstate;
	signal memoriaTx	 : STD_LOGIC_VECTOR( dataSize-1 downto 0);
	signal pulso104	 : STD_LOGIC;
	signal enaMemo		 : STD_LOGIC;
	signal rstDivFrec  : STD_LOGIC;

begin

	SEC: PROCESS( clk )
	begin
		if rising_edge( clk ) then
			if rst = '1' then 
				sNow <= IDLE;
			else 
				sNow <= sNext;
			end if;
		end if;
	end PROCESS;
	
	LC: PROCESS( sNow, dataWr, pulso104, memoriaTx )
	begin
		
		rstDivFrec 	<= '0';
		enaMemo		<= '0';
		ready			<= '0';
		
		case sNow is
		
			when IDLE =>
				if dataWr = '1' then
					sNext <= START;
					tx 	<= '0';
					rstDivFrec 	<= '1';
				else
					sNext <= IDLE;
					enaMemo		<= '1';
					tx 	<= '1';
					ready	<= '1';
				end if;
				
			when START =>
				if pulso104 = '1' then
					sNext <= TX0;
					tx 	<= '0';
				else 
					sNext <= START;
					tx 	<= memoriaTx(0);
				end if;
			
			when TX0 =>
				if pulso104 = '1' then
					sNext <= TX1;
					tx 	<= memoriaTx(1);
				else 
					sNext <= TX0;
					tx 	<= memoriaTx(0);
				end if;
									
			when TX1 =>
				if pulso104 = '1' then
					sNext <= TX2;
					tx 	<= memoriaTx(2);
				else 
					sNext <= TX1;
					tx 	<= memoriaTx(1);
				end if;	
				
			when TX2 =>
				if pulso104 = '1' then
					sNext <= TX3;
					tx 	<= memoriaTx(3);
				else 
					sNext <= TX2;
					tx 	<= memoriaTx(2);
				end if;
			
			when TX3 =>
				if pulso104 = '1' then
					sNext <= TX4;
					tx 	<= memoriaTx(4);
				else 
					sNext <= TX3;
					tx 	<= memoriaTx(3);
				end if;
						
			when TX4 =>
				if pulso104 = '1' then
					sNext <= TX5;
					tx 	<= memoriaTx(5);
				else 
					sNext <= TX4;
					tx 	<= memoriaTx(4);
				end if;
				
			when TX5 =>
				if pulso104 = '1' then
					sNext <= TX6;
					tx 	<= memoriaTx(6);
				else 
					sNext <= TX5;
					tx 	<= memoriaTx(5);
				end if;
			
			when TX6 =>
				if pulso104 = '1' then
					sNext <= TX7;
					tx 	<= memoriaTx(7);
				else 
					sNext <= TX6;
					tx 	<= memoriaTx(6);
				end if;
							
			when TX7 =>
				if pulso104 = '1' then
					sNext <= STOP;
					tx 	<= '1';
				else 
					sNext <= TX7;
					tx 	<= memoriaTx(7);
				end if;
			
			when STOP =>
				if pulso104 = '1' then
					sNext <= IDLE;
					tx 	<= '1';
					ready <= '1';
				else 
					sNext <= STOP;
					tx 	<= '1';
				end if;
			
			when others =>
					sNext <= IDLE;
					tx 	<= '1';
					ready <= '1';
					
		end case;
	end PROCESS;
	
	CONT: entity WORK.myCnt(ARCH_myCnt)
		generic MAP( M => sysClk/baudRate )								
		port 	  MAP( 	clk 			=> clk,
							rst  			=> rstDivFrec,
							ena 			=> '1',
							salidaM		=> pulso104
						);
						
	MEMO: for i in 0 to 8-1 generate
		FFD: entity WORK.myFFDRE(ARCH_myFFDRE)
		port MAP( clk => clk,
					 rst => rst,
					 ena => enaMemo,
					 d   => dataTx(i),
					 q   => memoriaTx(i)
					);
	end generate;

end ARCH_myUartTx;