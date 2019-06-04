LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY guiaDeClase02_14_tb IS
END guiaDeClase02_14_tb;
 
ARCHITECTURE behavior OF guiaDeClase02_14_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myEdgeCnt
    PORT( 
			clk : IN   STD_LOGIC;
         rst : IN   STD_LOGIC;
			d 	 : IN   STD_LOGIC;
         q   : OUT  STD_LOGIC_VECTOR(3 downto 0)
			);
    END COMPONENT;	
 
	 --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal d	  : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
   uut: myEdgeCnt PORT MAP (
          clk => clk,
          rst => rst,
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
		rst <= '1';		
		wait for clk_period*1;
		rst <= '0';
		
		wait for clk_period*2;
		d <= '1';
		wait for clk_period*3;
		d <= '0';
		wait for clk_period*2;
		d <= '1';
		wait for clk_period*5;
		d <= '0';
		wait for clk_period*2;
		d <= '1';
		wait for clk_period*3;
		d <= '0';
		wait for clk_period*2;
		d <= '1';
		wait for clk_period*5;
		d <= '0';
		wait for clk_period*5;
		d <= '0';
		wait for clk_period*2;
		d <= '1';		
		wait for clk_period*5;
		d <= '0';
		wait for clk_period*2;
		d <= '1';
		wait for clk_period*3;
		d <= '0';
		wait for clk_period*2;
		d <= '1';
		wait for clk_period*5;
		d <= '0';	
		wait for clk_period*2;
		d <= '1';
		wait for clk_period*3;
		d <= '0';
		wait for clk_period*2;
		d <= '1';
		
		wait for clk_period*5;
		rst <= '1';		
		wait for clk_period*1;
		rst <= '0';
		d <= '0';
	
		wait for clk_period*2;
		d <= '1';
		wait for clk_period*3;
		d <= '0';
		wait for clk_period*2;
		d <= '1';
		wait;
   end process;

END;