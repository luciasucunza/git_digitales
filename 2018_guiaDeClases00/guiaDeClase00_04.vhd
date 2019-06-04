library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity paridadPar4 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           p : out  STD_LOGIC
			  );
end paridadPar4;

architecture ARCH_paridadPar4 of paridadPar4 is

begin

	p <= ((a(0) Xor a(1)) Xor a(2)) Xor a(3);

end ARCH_paridadPar4;