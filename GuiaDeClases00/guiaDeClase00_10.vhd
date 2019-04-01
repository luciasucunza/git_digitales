library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myDeco3_8 is
    Port ( entrada : in  STD_LOGIC_VECTOR (2 downto 0);
           salida : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end myDeco3_8;

architecture ARCH_myDeco3_8 of myDeco3_8 is

begin
	Process (entrada) 
	begin
		case entrada is
			when "000" =>
				salida <= "00000001";
			when "001" =>
				salida <= "00000010";
			when "010" =>
				salida <= "00000100";
			when "011" =>
				salida <= "00001000";
			when "100" =>
				salida <= "00010000";
			when "101" =>
				salida <= "00100000";
			when "110" =>
				salida <= "01000000";
			when others =>
				salida <= "10000000";
		end case;
	end process;
end ARCH_myDeco3_8;