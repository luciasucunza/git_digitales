library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mySerialALU is
    Port ( clk : in  STD_LOGIC;
           nrst : in  STD_LOGIC;
           tx  : out STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (7 downto 0);
           rx  : in  STD_LOGIC
			  );
end mySerialALU;

architecture ARCH_mySerialALU of mySerialALU is


-------------------------- Estados -------------------------- 
	type Tstate is ( RX_COMANDO, RX_D1, RX_D2, COMANDO_00, COMANDO_01, COMANDO_02, COMANDO_03, COMANDO_04, COMANDO_05, COMANDO_06, COMANDO_07, COMANDO_08, COMANDO_XX, TX_COMANDO, TX_D1, TX_D2 );
	signal sNext, sNow : Tstate;
-------------------------------------------------------------


------------------------- Registros ------------------------- 
--  Voy a elgir el estado y mandarlo despues
	signal sRegComanNow		: STD_LOGIC_VECTOR(7 downto 0);
	signal sRegComanNext		: STD_LOGIC_VECTOR(7 downto 0);
--  Voy a calcular despues	, no inmediatamente 
	signal sRegDato1Now		: STD_LOGIC_VECTOR(7 downto 0);
	signal sRegDato1Next		: STD_LOGIC_VECTOR(7 downto 0);
	signal sRegDato2Now		: STD_LOGIC_VECTOR(7 downto 0);
	signal sRegDato2Next		: STD_LOGIC_VECTOR(7 downto 0);	
--  Voy a mandarlas despues, no inmediatamente
	signal sRegResu1Now		: STD_LOGIC_VECTOR(7 downto 0);
	signal sRegResu1Next		: STD_LOGIC_VECTOR(7 downto 0);
	signal sRegResu2Now		: STD_LOGIC_VECTOR(7 downto 0);
	signal sRegResu2Next		: STD_LOGIC_VECTOR(7 downto 0);
--  Voy a guardar el registro del comando 07
	signal sRegCom07Now		: STD_LOGIC_VECTOR(15 downto 0);
	signal sRegCom07Next		: STD_LOGIC_VECTOR(15 downto 0);
-------------------------------------------------------------


--------------------------- AUX ---------------------------
	signal sAux_16				: STD_LOGIC_VECTOR(15 downto 0);
	signal sAux_1				: STD_LOGIC;
	signal sDataTxSW			: STD_LOGIC_VECTOR(7  downto 0);
-------------------------------------------------------------


--------------------------- UART ---------------------------
	signal sReady				: STD_LOGIC;
	signal sDataRd				: STD_LOGIC;
	signal sDataWr				: STD_LOGIC;
	signal sDataRx				: STD_LOGIC_VECTOR(7 downto 0);
	signal sDataTx				: STD_LOGIC_VECTOR(7 downto 0);
-------------------------------------------------------------
	
	signal rst : std_logic;
	
	
begin
--------------------- Logica Secuencial --------------------- 
	rst <= not(nrst);
	led <= sDataTxSW;

	SEC: PROCESS( clk )
	begin
		if rising_edge ( clk ) then
			if rst = '1' then
				sRegComanNow <= (others=>'0');
				sRegDato1Now <= (others=>'0');
				sRegDato2Now <= (others=>'0');
				sRegResu1Now <= (others=>'0');
				sRegResu2Now <= (others=>'0');
				sRegCom07Now <= (others=>'0');
				sNow			 <= RX_COMANDO	  ;
			else 
				sRegComanNow <= sRegComanNext;
				sRegDato1Now <= sRegDato1Next;
				sRegDato2Now <= sRegDato2Next;
				sRegResu1Now <= sRegResu1Next;
				sRegResu2Now <= sRegResu2Next;
				sRegCom07Now <= sRegCom07Next;
				sNow			 <= sNext		  ;
			end if;
		end if;
	end PROCESS;
-------------------------------------------------------------

-------------------- Maquina de Estados --------------------- 
	LC: PROCESS( sNow, sRegComanNow, sRegComanNext, sRegDato1Now, sRegDato2Now, sRegResu1Now, sRegResu2Now, sRegCom07Now, sReady, sDataRd, sDataRx, sAux_16, sAux_1 ) 
	begin
	
		--------- Evitar Latch --------
		sNext				<= sNow;
		sRegCom07Next  <= sRegCom07Now;
		sRegComanNext 	<= sRegComanNow;
		sRegDato1Next 	<= sRegDato1Now;
		sRegDato2Next 	<= sRegDato2Now;
		sRegResu1Next 	<= sRegResu1Now;
		sRegResu2Next	<= sRegResu2Now;
		sDataWr			<=	'0';
		sDataTx			<=	"00000000";
		sAux_16			<= "0000000000000000";
		sAux_1			<= '0';
		
		case sNow is
			----------------------------------------------------
			when RX_COMANDO	=>
				if sDataRd = '1' then
					sRegComanNext 	<= sDataRx;
					sNext 			<= RX_D1;
				end if;
			----------------------------------------------------
			when RX_D1 			=>
				if sDataRd = '1' then
					sRegDato1Next 	<= sDataRx;
					sNext 			<= RX_D2;
				end if;
			----------------------------------------------------
			when RX_D2 			=>
				if sDataRd = '1' then
					sRegDato2Next 	<= sDataRx;
					case sRegComanNext is
						when "00000000"	=>
							sNext	<= COMANDO_00;
						when "00000001"	=>
							sNext	<= COMANDO_01;
						when "00000010"	=>
							sNext	<= COMANDO_02;
						when "00000011"	=>
							sNext	<= COMANDO_03;
						when "00000100"	=>
							sNext	<= COMANDO_04;
						when "00000101"	=>
							sNext	<= COMANDO_05;
						when "00000110"	=>
							sNext	<= COMANDO_06;
						when "00000111"	=>
							sNext	<= COMANDO_07;
						when "00001000"	=>
							sNext	<= COMANDO_08;
						when others	=>
							sNext	<= COMANDO_xx;
					end case;
				end if;										
			----------------------------------------------------
			when COMANDO_00 	=>
				sRegResu1Next 	<= not(sRegDato1Now);
				sRegResu2Next 	<= not(sRegDato2Now);
				sNext				<= TX_COMANDO;
			----------------------------------------------------
			when COMANDO_01 	=>
				sAux_16( 15 downto 8) 	<= STD_LOGIC_VECTOR( signed(sRegDato1Now)+signed(sRegDato2Now) );
				sAux_1						<= (not(sRegDato1Now(7)) and not(sRegDato2Now(7)) and sAux_16(15)) or (sRegDato1Now(7) and sRegDato2Now(7) and not(sAux_16(15)));
				sAux_16(7  downto 0)		<= (others=>sAux_1);
				
				sRegResu1Next 	<= sAux_16( 15 downto 8);
				sRegResu2Next 	<= sAux_16( 7  downto 0);
				sNext				<= TX_COMANDO;
			----------------------------------------------------
			when COMANDO_02 	=>
				sAux_16( 15 downto 8) 	<= STD_LOGIC_VECTOR( signed(sRegDato1Now)-signed(sRegDato2Now) );
				sAux_1						<= (not(sRegDato1Now(7)) and sRegDato2Now(7) and sAux_16(15)) or (sRegDato1Now(7) and not(sRegDato2Now(7)) and not(sAux_16(15)));
				sAux_16(7  downto 0)		<= (others=>sAux_1);
				
				sRegResu1Next 	<= sAux_16( 15 downto 8);
				sRegResu2Next 	<= sAux_16( 7  downto 0);
				sNext				<= TX_COMANDO;
			----------------------------------------------------
			when COMANDO_03 	=>
				sRegResu1Next 	<= sRegDato1Now and sRegDato2Now;
				sRegResu2Next 	<= (others=>'0');
				sNext				<= TX_COMANDO;
			----------------------------------------------------
			when COMANDO_04	=>
				sRegResu1Next 	<= sRegDato1Now or sRegDato2Now;
				sRegResu2Next 	<= (others=>'0');
				sNext				<= TX_COMANDO;
			----------------------------------------------------
			when COMANDO_05	=>
				sAux_16			<= STD_LOGIC_VECTOR( signed(sRegDato1Now&sRegDato2Now) + to_signed(1, 15)  );
				sRegResu1Next 	<= sAux_16( 15 downto 8);
				sRegResu2Next 	<= sAux_16( 7  downto 0);
				sNext				<= TX_COMANDO;
			----------------------------------------------------
			when COMANDO_06	=>
				sAux_16			<= STD_LOGIC_VECTOR( signed(sRegDato1Now&sRegDato2Now) - to_signed(1, 15) );
				sRegResu1Next 	<= sAux_16( 15 downto 8);
				sRegResu2Next 	<= sAux_16( 7  downto 0);
				sNext				<= TX_COMANDO;
			----------------------------------------------------
			when COMANDO_07	=>
				sRegCom07Next	<= sRegDato1Now & sRegDato2Now;
				sNext				<= RX_COMANDO;
			----------------------------------------------------
			when COMANDO_08	=>
				sRegResu1Next 	<= sRegCom07Now(15 downto 8);	
				sRegResu2Next 	<= sRegCom07Now(7  downto 0);
				sNext				<= TX_COMANDO;
			----------------------------------------------------
			when COMANDO_XX	=>
					sRegResu1Next 	<= sRegDato1Now;
					sRegResu2Next 	<= sRegDato2Now;
					sNext				<= TX_COMANDO;
			----------------------------------------------------
			when TX_COMANDO	=>
				if sReady = '1' then
					sDataWr			<= '1';
					sDataTx			<= sRegComanNow;
					sNext 			<= TX_D1;	
				end if;				
			----------------------------------------------------
			when TX_D1 			=>
				if sReady = '1' then
					sDataWr			<= '1';
					sDataTx			<= sRegResu1Now;
					sNext 			<= TX_D2;
				end if;
			----------------------------------------------------
			when TX_D2 			=>
				if sReady = '1' then
					sDataWr			<= '1';
					sDataTx			<= sRegResu2Now;
					sNext 			<= RX_COMANDO;
				end if;
			----------------------------------------------------
			when others =>
					sNext <= RX_COMANDO;
			----------------------------------------------------				
		end case;		
		
	end PROCESS;
-------------------------------------------------------------

	SW: for i in 7 downto 0 generate
		sDataTxSW(i) <= sDataTx(7-i); 
	end generate;
--------------------- Instancio la UART --------------------- 
	UART: entity WORK.myUart(ARCH_myUart)
	port MAP( 	clk 	 => clk,
					rst 	 => rst,
					dataWr => sDataWr,
					dataTx => sDataTxSW,
					ready  => sReady,
					tx 	 => tx,
					dataRd => sDataRd,				 
					dataRx => sDataRx,				
					rx 	 => rx
				);
-------------------------------------------------------------

		
end ARCH_mySerialALU;