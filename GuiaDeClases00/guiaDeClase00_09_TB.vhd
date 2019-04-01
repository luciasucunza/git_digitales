LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY guiaDeClase00_09_TB IS
END guiaDeClase00_09_TB;
 
ARCHITECTURE behavior OF guiaDeClase00_09_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myDeco7Seg
    PORT(
         entrada : IN  std_logic_vector(3 downto 0);
         a : OUT  std_logic;
         b : OUT  std_logic;
         c : OUT  std_logic;
         d : OUT  std_logic;
         e : OUT  std_logic;
         f : OUT  std_logic;
         g : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal a : std_logic;
   signal b : std_logic;
   signal c : std_logic;
   signal d : std_logic;
   signal e : std_logic;
   signal f : std_logic;
   signal g : std_logic;
 
 BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myDeco7Seg PORT MAP (
          entrada => entrada,
          a => a,
          b => b,
          c => c,
          d => d,
          e => e,
          f => f,
          g => g
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