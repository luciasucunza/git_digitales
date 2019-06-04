LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase00_01_TB IS
END guiaDeClase00_01_TB;
 
ARCHITECTURE behavior OF guiaDeClase00_01_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myAnd2
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';

 	--Outputs
   signal c : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myAnd2 PORT MAP (
          a => a,
          b => b,
          c => c
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		a <= '0';
		b <= '0';
		wait for 200 ns;
		
		a <= '0';
		b <= '1';
		wait for 200 ns;
		
		a <= '1';
		b <= '0';
		wait for 200 ns;
		
		a <= '1';
		b <= '1';
		wait for 200 ns;

      wait;
   end process;

END;
