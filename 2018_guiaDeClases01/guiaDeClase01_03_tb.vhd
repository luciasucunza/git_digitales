LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase01_03_tb IS
END guiaDeClase01_03_tb;
 
ARCHITECTURE behavior OF guiaDeClase01_03_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myTriStateN
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         c : IN  std_logic_vector(3 downto 0);
         s : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal c : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myTriStateN PORT MAP (
          a => a,
          c => c,
          s => s
        );

    -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		a <= "0000";
		c <= "0000";
		wait for 200 ns;

		a <= "1111";
		c <= "0000";
		wait for 200 ns;	
		
		a <= "0000";
		c <= "1111";
		wait for 200 ns;

		a <= "1111";
		c <= "1111";
		wait for 200 ns;

      wait;
   end process;

END;
