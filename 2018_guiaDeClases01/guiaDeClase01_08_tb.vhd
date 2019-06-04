LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase01_08_tb IS
END guiaDeClase01_08_tb;
 
ARCHITECTURE behavior OF guiaDeClase01_08_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT conversiorBinarioGray
    PORT(
         entrada : IN  std_logic_vector(7 downto 0);
         salida : OUT  std_logic_vector(7 downto 0);
         sel : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: conversiorBinarioGray PORT MAP (
          entrada => entrada,
          salida => salida,
          sel => sel
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		entrada <= "00011000";
		sel	  <= '0';
		wait for 200 ns;
		
		entrada <= "11100001";
		sel	  <= '0';
		wait for 200 ns;
		
		entrada <= "01111010";
		sel	  <= '1';
		wait for 200 ns;
		
		entrada <= "10010011";
		sel	  <= '1';
		wait for 200 ns;
		
       wait;
   end process;

END;
