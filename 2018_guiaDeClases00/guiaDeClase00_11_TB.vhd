LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase00_11_TB IS
END guiaDeClase00_11_TB;
 
ARCHITECTURE behavior OF guiaDeClase00_11_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myCoder4_2
    PORT(
         entrada : IN  std_logic_vector(3 downto 0);
         salida : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(1 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myCoder4_2 PORT MAP (
          entrada => entrada,
          salida => salida
        );
		  		  
	-- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		entrada <= "0000";
		wait for 50 ns;

		entrada <= "0001";
		wait for 50 ns;

		entrada <= "0010";
		wait for 50 ns;

		entrada <= "0011";
		wait for 50 ns;

		entrada <= "0100";
		wait for 50 ns;

		entrada <= "0101";
		wait for 50 ns;

		entrada <= "0110";
		wait for 50 ns;

		entrada <= "0111";
		wait for 50 ns;

		entrada <= "1000";
		wait for 50 ns;

		entrada <= "1001";
		wait for 50 ns;

		entrada <= "1010";
		wait for 50 ns;

		entrada <= "1011";
		wait for 50 ns;

		entrada <= "1100";
		wait for 50 ns;

		entrada <= "1101";
		wait for 50 ns;

		entrada <= "1110";
		wait for 50 ns;

		entrada <= "1111";
		wait for 50 ns;
		
      wait;
   end process;
	
END;