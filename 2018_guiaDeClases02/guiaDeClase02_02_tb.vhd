LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY guiaDeClase02_02_tb IS
END guiaDeClase02_02_tb;
 
ARCHITECTURE behavior OF guiaDeClase02_02_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myFFDC
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         d : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myFFDC PORT MAP (
          clk => clk,
          clr => clr,
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
		d <= '1';
      
		wait until falling_edge(clk);
		d <= '0';

		wait for clk_period*3;
		
		wait until falling_edge(clk);
		d <= '1';
      
		wait for clk_period*2;
		clr <='1';
		
		wait for clk_period*0.5;
		clr <='0';
		
		wait;
   end process;

END;
