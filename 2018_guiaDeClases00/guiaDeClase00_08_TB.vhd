LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY guiaDeClase00_08_TB IS
END guiaDeClase00_08_TB;
 
ARCHITECTURE behavior OF guiaDeClase00_08_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myMagCmp8
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         igual : OUT  std_logic;
         aMayorB : OUT  std_logic;
         bMayorA : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal igual : std_logic;
   signal aMayorB : std_logic;
   signal bMayorA : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myMagCmp8 PORT MAP (
          a => a,
          b => b,
          igual => igual,
          aMayorB => aMayorB,
          bMayorA => bMayorA
        );
		  
		  
  	-- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		a <= "00100100";		--36
		b <= "00100100";		--36
		wait for 100 ns;

		a <= "00100100";		--36
		b <= "00000100";		--4
		wait for 100 ns;

		a <= "00100000";		--32
		b <= "00100100";		--36
		wait for 100 ns;

		a <= "00000000";		--0
		b <= "00000000";		--0
		wait for 100 ns;

		a <= "11100100";		--228
		b <= "10110100";		--180
		wait for 100 ns;

		a <= "00000001";		--1
		b <= "00000110";		--6
		wait for 100 ns;

      wait;
   end process;

END;
