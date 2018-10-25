LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY guiaDeClase01_09_tb IS
END guiaDeClase01_09_tb;
 
ARCHITECTURE behavior OF guiaDeClase01_09_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT incGray
    PORT(
         entrada : IN  std_logic_vector(15 downto 0);
         salida : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(15 downto 0);
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: incGray PORT MAP (
          entrada => entrada,
          salida => salida
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		entrada <= "1110000111100001";
		wait for 200 ns;
		entrada <= "0001101010101010";
		wait for 200 ns;
		entrada <= "1010101010101010";
		wait for 200 ns;
		entrada <= "0000010000000001";
		wait for 200 ns;
      wait;
   end process;

END;