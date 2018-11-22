library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myUartTxTest is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (3 downto 0);
           tx : out  STD_LOGIC);
end myUartTxTest;

architecture Arch_myUartTxTest of myUartTxTest is
	signal tx_aux, ena: std_logic;
	signal llave: std_logic_vector(8-1 downto 0);
begin
	Inst_myCntClock: entity work.myCnt (Arch_myCnt)
	generic map (M => 100000000) 
	PORT MAP(
		clk => clk,
		rst => rst,
		ena => '1', -- lo activo 
		salidaM_2 => open,
		salidaM => ena
	);
	--------------------------------------------------------------------------------
	---------------------- Flank detector CLK_BAUD ---------------------------------
	
	--------------------------------------------------------------------------------
	Inst_myUartTx: entity work.myUartTx (Arch_myUartTx)
	PORT MAP(
		clk => clk,
		rst => rst,
		dataWr => ena,
		dataTx => llave,
		ready => open,
		tx => tx_aux
	);
	tx <= tx_aux;
	llave <= sw & "0101";

end Arch_myUartTxTest;

