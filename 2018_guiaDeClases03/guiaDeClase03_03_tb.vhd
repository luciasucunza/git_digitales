LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY guiaDeClase03_03_tb IS
END guiaDeClase03_03_tb;
 
ARCHITECTURE behavior OF guiaDeClase03_03_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT parpaedo1S
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         led : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal led : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: parpaedo1S PORT MAP (
          clk => clk,
          rst => rst,
          led => led
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
      wait;
   end process;

END;