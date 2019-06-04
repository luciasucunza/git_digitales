LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase00_04_TB IS
END guiaDeClase00_04_TB;
 
ARCHITECTURE behavior OF guiaDeClase00_04_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT paridadPar4
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         p : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal p : std_logic;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: paridadPar4 PORT MAP (
          a => a,
          p => p
        );
		  
	-- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		a <= "0000";
		wait for 50 ns;
		
		a <= "0001";
		wait for 50 ns;
		
		a <= "0010";
		wait for 50 ns;
		
		a <= "0011";
		wait for 50 ns;
		
		a <= "0100";
		wait for 50 ns;
		
		a <= "0101";
		wait for 50 ns;
		
		a <= "0110";
		wait for 50 ns;
		
		a <= "0111";
		wait for 50 ns;
		
		a <= "1000";
		wait for 50 ns;
		
		a <= "1001";
		wait for 50 ns;
		
		a <= "1010";
		wait for 50 ns;
		
		a <= "1011";
		wait for 50 ns;
		
		a <= "1100";
		wait for 50 ns;
		
		a <= "1101";
		wait for 50 ns;
		
		a <= "1110";
		wait for 50 ns;
		
		a <= "1111";
		wait for 50 ns;
		
      wait;
   end process;
END;
