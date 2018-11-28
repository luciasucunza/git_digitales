LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase03_01_tb IS
END guiaDeClase03_01_tb;
 
ARCHITECTURE behavior OF guiaDeClase03_01_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myCnt
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ena : IN  std_logic;
         salidaM_2 : OUT  std_logic;
         salidaM : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ena : std_logic := '0';

 	--Outputs
   signal salidaM_2 : std_logic;
   signal salidaM : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myCnt PORT MAP (
          clk => clk,
          rst => rst,
          ena => ena,
          salidaM_2 => salidaM_2,
          salidaM => salidaM
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <= '1';
		wait for clk_period*2;
		rst <= '0';
		ena <= '1';
      wait;
   end process;

END;
