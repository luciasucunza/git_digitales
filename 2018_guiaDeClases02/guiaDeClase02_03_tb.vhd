LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY guiaDeClase02_03_tb IS
END guiaDeClase02_03_tb;
 
ARCHITECTURE behavior OF guiaDeClase02_03_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myFFDRE
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ena : IN  std_logic;
         d : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ena : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myFFDRE PORT MAP (
          clk => clk,
          rst => rst,
          ena => ena,
          d => d,
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
 
		wait until falling_edge(clk);
		ena <='1';
		d <= '1';
      
		wait until falling_edge(clk);
		d <= '0';

		wait for clk_period*3;
		
		wait until falling_edge(clk);
		d <= '1';
      
		wait for clk_period*0.5;
		ena <='0';

		wait until falling_edge(clk);
		d <= '0';
      
		wait until falling_edge(clk);
		d <= '1';

		wait for clk_period*3;
		d <= '0';

		wait until falling_edge(clk);
		ena <='1';
		d <= '1';
      
		wait until falling_edge(clk);
		d <= '0';

      wait;
   end process;

END;
