library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity conversiorBinarioGray is
    Generic(N:integer:=8);
	 Port ( entrada : in   STD_LOGIC_VECTOR (N-1 downto 0);
           salida	 : out  STD_LOGIC_VECTOR (N-1 downto 0);
           sel 	 : in   STD_LOGIC
			  );
end conversiorBinarioGray;

architecture ARCH_conversiorBinarioGray of conversiorBinarioGray is

	signal binGray : STD_LOGIC_VECTOR (N-1 downto 0);
	signal GrayBin : STD_LOGIC_VECTOR (N-1 downto 0);

begin

	BG: entity WORK.binarioGray(ARCH_binarioGray)
		port MAP( binario => entrada,
					 gray    => binGray
					);
	
	GB: entity WORK.grayBinario(ARCH_grayBinario)
		port MAP( gray    => entrada,
					 binario => GrayBin
					);
										
	salida <= binGray when sel = '1' else
				 GrayBin;

end ARCH_conversiorBinarioGray;

