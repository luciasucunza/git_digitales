library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myCoder4_2 is
    Port ( entrada : in  STD_LOGIC_VECTOR (3 downto 0);
           salida : out  STD_LOGIC_VECTOR (1 downto 0)
			  );
end myCoder4_2;

architecture ARCH_myCoder4_2 of myCoder4_2 is

begin
	Process (entrada) 
	begin
		case entrada is
		when "0000" =>
			salida <= "00";
		when "0001" =>
			salida <= "00";
		when "0010" =>
			salida <= "01";
		when "0011" =>
			salida <= "01";
		when "0100" =>
			salida <= "10";
		when "0101" =>
			salida <= "10";
		when "0110" =>
			salida <= "10";
		when "0111" =>
			salida <= "10";
		when others =>
			salida <= "11";
		end case;
	end process;
end ARCH_myCoder4_2;