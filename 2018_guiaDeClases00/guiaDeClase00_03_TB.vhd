LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY guiaDeClase00_03_TB IS
END guiaDeClase00_03_TB;
 
ARCHITECTURE behavior OF guiaDeClase00_03_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fullAdder
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         ci : IN  std_logic;
         co : OUT  std_logic;
         s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal ci : std_logic := '0';

 	--Outputs
   signal co : std_logic;
   signal s : std_logic;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fullAdder PORT MAP (
          a => a,
          b => b,
          ci => ci,
          co => co,
          s => s
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		a <= '0';
		b <= '0';
		ci <= '0';
		wait for 100 ns;
		
		a <= '0';
		b <= '1';
		ci <= '0';
		wait for 100 ns;
		
		a <= '1';
		b <= '0';
		ci <= '0';
		wait for 100 ns;
		
		a <= '1';
		b <= '1';
		ci <= '0';
		wait for 100 ns;

		a <= '0';
		b <= '0';
		ci <= '1';
		wait for 100 ns;
		
		a <= '0';
		b <= '1';
		ci <= '1';
		wait for 100 ns;
		
		a <= '1';
		b <= '0';
		ci <= '1';
		wait for 100 ns;
		
		a <= '1';
		b <= '1';
		ci <= '1';
		wait for 100 ns;

      wait;
   end process;

END;