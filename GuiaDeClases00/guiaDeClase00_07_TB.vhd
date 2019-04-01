LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase00_07_TB IS
END guiaDeClase00_07_TB;
 
ARCHITECTURE behavior OF guiaDeClase00_07_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myTriState8
    PORT(
         entrada : IN  std_logic_vector(7 downto 0);
         control : IN  std_logic;
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(7 downto 0) := (others => '0');
   signal control : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myTriState8 PORT MAP (
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
		entrada <= "00100100";
		control <= '0';
		wait for 200 ns;

		entrada <= "00100100";
		control <= '1';
		wait for 200 ns;
		
		entrada <= "11110100";
		control <= '0';
		wait for 200 ns;

		entrada <= "11110100";
		control <= '1';
		wait for 200 ns;
		
		entrada <= "00000010";
		control <= '0';
		wait for 200 ns;

		entrada <= "00000010";
		control <= '1';
		wait for 200 ns;

      wait;
   end process;
	
END;
