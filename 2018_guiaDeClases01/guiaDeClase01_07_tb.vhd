LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase01_07_tb IS
END guiaDeClase01_07_tb;
 
ARCHITECTURE behavior OF guiaDeClase01_07_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT binarioGray
    PORT(
         binario : IN  std_logic_vector(7 downto 0);
         gray : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal binario : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal gray : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: binarioGray PORT MAP (
          binario => binario,
          gray => gray
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		binario <= "00000000";
		wait for 200 ns;
		
		binario <= "00000001";
		wait for 200 ns;
		
		binario <= "01111010";
		wait for 200 ns;
		
		binario <= "10010011";
		wait for 200 ns;
		
      wait;
   end process;

END;
