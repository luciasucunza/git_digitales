LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase01_06_tb IS
END guiaDeClase01_06_tb;
 
ARCHITECTURE behavior OF guiaDeClase01_06_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT grayBinario
    PORT(
         gray : IN  std_logic_vector(7 downto 0);
         binario : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal gray : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal binario : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: grayBinario PORT MAP (
          gray => gray,
          binario => binario
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		gray <= "00110101";
		wait for 200 ns;
		
		gray <= "00000000";
		wait for 200 ns;
		
		gray <= "11110000";
		wait for 200 ns;
		
		gray <= "11011010";
		wait for 200 ns;
		
      wait;
   end process;

END;
