LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase03_05_tb IS
END guiaDeClase03_05_tb;
 
ARCHITECTURE behavior OF guiaDeClase03_05_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT parapedo1S_8Bits_B
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         btn : IN  std_logic;
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal btn : std_logic := '0';

 	--Outputs
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: parapedo1S_8Bits_B PORT MAP (
          clk => clk,
          rst => rst,
          btn => btn,
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
		wait for clk_period;
		rst <= '0';
		
		wait for clk_period*25;
		btn <= '1';
		
		wait for clk_period*50;
		btn <= '0';
		
      wait;
   end process;

END;