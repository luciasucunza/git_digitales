library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity binarioGray is
    Generic(N:integer:=8);
	 Port ( binario : in   STD_LOGIC_VECTOR (N-1 downto 0);
           gray 	 : out  STD_LOGIC_VECTOR (N-1 downto 0));
end binarioGray;

architecture ARCH_binarioGray of binarioGray is

begin

	gray <= binario Xor '0'&binario(N-1 downto 1);
		
end ARCH_binarioGray;

