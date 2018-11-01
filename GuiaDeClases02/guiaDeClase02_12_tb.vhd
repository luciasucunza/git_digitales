LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY guiaDeClase02_12_tb IS
END guiaDeClase02_12_tb;
 
ARCHITECTURE behavior OF guiaDeClase02_12_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myCntBi
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ena : IN  std_logic;
         dir : IN  std_logic;
         q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ena : std_logic := '0';
   signal dir : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myCntBi PORT MAP (
          clk => clk,
          rst => rst,
          ena => ena,
          dir => dir,
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
		dir <= '0';
		
		wait for clk_period*2;
		rst <= '0';
		
		wait for clk_period*20;
		ena <= '0';
		wait for clk_period*2;
		ena <= '1';
		
		wait for clk_period*2;
		rst <= '1';
		wait for clk_period*2;
		rst <= '0';
		dir <= '1';

      wait;
   end process;

END;