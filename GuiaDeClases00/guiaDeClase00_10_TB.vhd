LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase00_10_TB IS
END guiaDeClase00_10_TB;
 
ARCHITECTURE behavior OF guiaDeClase00_10_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myDeco3_8
    PORT(
         entrada : IN  std_logic_vector(2 downto 0);
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myDeco3_8 PORT MAP (
          entrada => entrada,
          salida => salida
        );
			  
	-- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		entrada <= "000";
		wait for 50 ns;
		
		entrada <= "001";
		wait for 50 ns;

		entrada <= "010";
		wait for 50 ns;

		entrada <= "011";
		wait for 50 ns;

		entrada <= "100";
		wait for 50 ns;

		entrada <= "101";
		wait for 50 ns;

		entrada <= "110";
		wait for 50 ns;

		entrada <= "111";
		wait for 50 ns;
		
      wait;
   end process;
	
END;