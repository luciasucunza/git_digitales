LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY guiaDeClase00_02_TB IS
END guiaDeClase00_02_TB;
 
ARCHITECTURE behavior OF guiaDeClase00_02_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myAnd4
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal c : std_logic;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myAnd4 PORT MAP (
          a => a,
          c => c
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