LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase01_01_tb IS
END guiaDeClase01_01_tb;
 
ARCHITECTURE behavior OF guiaDeClase01_01_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myMux4_1
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         c : IN  std_logic_vector(1 downto 0);
         s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal c : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic;
    
BEGIN	 
	-- Instantiate the Unit Under Test (UUT)
   uut: myMux4_1 PORT MAP (
          a => a,
          c => c,
          s => s
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		a <= "1110";
		c <= "00";
		wait for 100 ns;
		
		a <= "1101";
		c <= "01";
		wait for 100 ns;

		a <= "1011";
		c <= "10";
		wait for 100 ns;
		
		a <= "0111";
		c <= "11";
		wait for 100 ns;
		
		a <= "0001";
		c <= "00";
		wait for 100 ns;
		
		a <= "0010";
		c <= "01";
		wait for 100 ns;

		a <= "0100";
		c <= "10";
		wait for 100 ns;
		
		a <= "1000";
		c <= "11";
		wait for 100 ns;



      wait;
   end process;

END;
