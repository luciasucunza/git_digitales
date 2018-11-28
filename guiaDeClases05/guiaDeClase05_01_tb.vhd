LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase05_01_tb IS
END guiaDeClase05_01_tb;
 
ARCHITECTURE behavior OF guiaDeClase05_01_tb IS 
  
    COMPONENT mySerialALU
	 GENERIC ( baudRate : integer;
              sysClk : integer;
              dataSize : integer );
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         tx : OUT  std_logic;
         rx : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal rx : std_logic := '0';

 	--Outputs
   signal tx : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mySerialALU
	GENERIC MAP ( baudRate => 1250000,  -- tiempo bit = 40*Tclk
                 sysClk => 50000000,   -- Tclk = 20ns
                 dataSize => 8 )
   
	PORT MAP (
          clk => clk,
          rst => rst,
          tx => tx,
          rx => rx
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		wait for clk_period*5;
		rst <= '0';						-- enable module
		rst <= '1';						-- enable module
----------------------------------------------------------------------------------------
		-- 4) Prueba modulo correctamente con trama 00000000

		rx <= '1';					   -- rx en IDLE
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit start
		wait for 40*clk_period;    -- tiempo bit 
		rx <= '0';					   -- bit 0
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 1
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 2
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 3
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 4
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 5
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 6
		wait for 40*clk_period;    -- tiempo bit
		rx <= '1';					   -- bit 7
		wait for 40*clk_period;    -- tiempo bit
		rx <= '1';					   -- bit stop
		wait for 2*202*clk_period;      
		----------------------------------------------------------------------------------------
		-- 4) Prueba modulo correctamente con trama 11010100 
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit start
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 0
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 1
		wait for 40*clk_period;    -- tiempo bit
		rx <= '1';					   -- bit 2
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 3
		wait for 40*clk_period;    -- tiempo bit
		rx <= '1';					   -- bit 4
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 5
		wait for 40*clk_period;    -- tiempo bit
		rx <= '1';					   -- bit 6
		wait for 40*clk_period;    -- tiempo bit
		rx <= '1';					   -- bit 7
		wait for 40*clk_period;    -- tiempo bit
		rx <= '1';					   -- bit stop
		wait for 2*200*clk_period;
				----------------------------------------------------------------------------------------
		-- 4) Prueba modulo correctamente con trama 11001100
		rx <= '1';					   -- rx en IDLE
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit start
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 0
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 1
		wait for 40*clk_period;    -- tiempo bit
		rx <= '1';					   -- bit 2
		wait for 40*clk_period;    -- tiempo bit
		rx <= '1';					   -- bit 3
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 4
		wait for 40*clk_period;    -- tiempo bit
		rx <= '0';					   -- bit 5
		wait for 40*clk_period;    -- tiempo bit
		rx <= '1';					   -- bit 6
		wait for 40*clk_period;    -- tiempo bit
		rx <= '1';					   -- bit 7
		wait for 40*clk_period;    -- tiempo bit
		rx <= '1';					   -- bit stop
		wait for 240*clk_period;


      wait;
   end process;

END;
