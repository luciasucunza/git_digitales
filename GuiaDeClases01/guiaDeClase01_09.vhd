library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity incGray is
	 Generic(N:integer:=16);
    Port ( entrada : in   STD_LOGIC_VECTOR (N-1 downto 0);
           salida  : out  STD_LOGIC_VECTOR (N-1 downto 0)
			  );
end incGray;

architecture ARCH_incGray of incGray is

	signal binario 	: STD_LOGIC_VECTOR (N-1 downto 0);
	signal binarioSum : STD_LOGIC_VECTOR (N-1 downto 0);
	signal carry		: STD_LOGIC;
	
begin

	GB: entity WORK.grayBinario(ARCH_grayBinario)
		generic MAP( N		=>	N
						)
		port MAP( gray    => entrada,
					 binario => binario
					);

	FA : entity WORK.fullAdderN(ARCH_fullAdderN)
		generic MAP( N		=>	N
						)
		port MAP( a  => binario,
				 b  => STD_LOGIC_VECTOR(to_unsigned(0,N)),
				 ci => '1',
				 s  => binarioSum,
				 co => carry
				);
				
	BG: entity WORK.binarioGray(ARCH_binarioGray)
		generic MAP( N		=>	N
						)
		port MAP( binario => binarioSum,
					 gray    => salida
					);
	
	
end ARCH_incGray;