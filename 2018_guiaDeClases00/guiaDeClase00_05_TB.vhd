LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase00_05_TB IS
END guiaDeClase00_05_TB;
 
ARCHITECTURE behavior OF guiaDeClase00_05_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myMux
    PORT(
         a : IN  std_logic_vector(1 downto 0);
         c : IN  std_logic;
         s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(1 downto 0) := (others => '0');
   signal c : std_logic := '0';

 	--Outputs
   signal s : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myMux PORT MAP (
          a => a,
          c => c,
          s => s
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 200 ns;	

      -- insert stimulus here 
		a <= "00";
		c <= '0';
		wait for 100 ns;
		
		a <= "00";
		c <= '1';
		wait for 100 ns;

		a <= "01";
		c <= '0';
		wait for 100 ns;

		a <= "01";
		c <= '1';
		wait for 100 ns;

		a <= "10";
		c <= '0';
		wait for 100 ns;
		
		a <= "10";
		c <= '1';
		wait for 100 ns;

		a <= "11";
		c <= '0';
		wait for 100 ns;
		
		a <= "11";
		c <= '1';
		wait for 100 ns;

      wait;
   end process;

END;
