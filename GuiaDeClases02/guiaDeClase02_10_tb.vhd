LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase02_10_tb IS
END guiaDeClase02_10_tb;
 
ARCHITECTURE behavior OF guiaDeClase02_10_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myJohnsonCnt
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ena : IN  std_logic;
         q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ena : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myJohnsonCnt PORT MAP (
          clk => clk,
          rst => rst,
          ena => ena,
          q => q
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
		ena <= '1';
		
		wait for clk_period*2;
		rst <= '0';
		
		wait for clk_period*20;
		ena <= '0';
		wait for clk_period*5;
		ena <= '1';
		
		wait for clk_period*8;
		rst <= '1';
		wait for clk_period*2;
		rst <= '0';
		
      wait;
   end process;

END;
