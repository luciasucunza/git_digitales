LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase00_06_TB IS
END guiaDeClase00_06_TB;
 
ARCHITECTURE behavior OF guiaDeClase00_06_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myTriState
    PORT(
         entrada : IN  std_logic;
         control : IN  std_logic;
         salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic := '0';
   signal control : std_logic := '0';

 	--Outputs
   signal salida : std_logic;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myTriState PORT MAP (
          entrada => entrada,
          control => control,
          salida => salida
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		entrada <= '0';
		control <= '0';
		wait for 200 ns;
		
		entrada <= '0';
		control <= '1';
		wait for 200 ns;
		
		entrada <= '1';
		control <= '0';
		wait for 200 ns;
		
		entrada <= '1';
		control <= '1';
		wait for 200 ns;

      wait;
   end process;

END;
