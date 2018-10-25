LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase_01_05_tb IS
END guiaDeClase_01_05_tb;
 
ARCHITECTURE behavior OF guiaDeClase_01_05_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fullAdderN
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         ci : IN  std_logic;
         s : OUT  std_logic_vector(3 downto 0);
         co : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal ci : std_logic := '0';

 	--Outputs
   signal s : std_logic_vector(3 downto 0);
   signal co : std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fullAdderN PORT MAP (
          a => a,
          b => b,
          ci => ci,
          s => s,
          co => co
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

	     -- hold reset state for 100 ns.
      wait for 100 ns;	

		a <= "0100";
		b <= "1000";
		ci<= '1';
		wait for 200 ns;
		
		a <= "1101";
		b <= "1101";
		ci<= '0';
		wait for 200 ns;
		
		a <= "1100";
		b <= "1010";
		ci<= '0';
		wait for 200 ns;
		
		a <= "0011";
		b <= "1000";
		ci<= '1';
		wait for 200 ns;

		a <= "0101";
		b <= "1010";
		ci<= '1';
		wait for 200 ns;
    wait;
   end process;

END;
