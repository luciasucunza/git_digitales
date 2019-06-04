LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase00_13_TB IS
END guiaDeClase00_13_TB;
 
ARCHITECTURE behavior OF guiaDeClase00_13_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myDiv8
    PORT(
         entrada : IN  std_logic_vector(7 downto 0);
         div : IN  std_logic_vector(1 downto 0);
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(7 downto 0) := (others => '0');
   signal div : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myDiv8 PORT MAP (
          entrada => entrada,
          div => div,
          salida => salida
        );
		  
	-- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		entrada <= "01011010";
		div <= "00";
		wait for 100 ns;
		
		entrada <= "00011100";
		div <= "01";
		wait for 100 ns;
		
		entrada <= "01011000";
		div <= "10";
		wait for 100 ns;
		
		entrada <= "01100010";
		div <= "11";
		wait for 100 ns;
	
		entrada <= "11011010";
		div <= "00";
		wait for 100 ns;
		
		entrada <= "10011100";
		div <= "01";
		wait for 100 ns;
		
		entrada <= "11011000";
		div <= "10";
		wait for 100 ns;
		
		entrada <= "11100010";
		div <= "11";
		wait for 100 ns;
		
      wait;
   end process;
END;