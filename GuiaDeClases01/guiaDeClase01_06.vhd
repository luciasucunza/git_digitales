library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity grayBinario is
    Generic(N:integer:=8);
	 Port ( gray 	 : in   STD_LOGIC_VECTOR (N-1 downto 0);
           binario : out  STD_LOGIC_VECTOR (N-1 downto 0)
			  );
end grayBinario;

architecture ARCH_grayBinario of grayBinario is

	signal bin : STD_LOGIC_VECTOR (N-1 downto 0);

begin
	
	binario <= bin;
	bin(0)  <= gray(0);
	
	GB: for i in 1 to N-1 generate
		bin(i) <= gray(i) Xor bin(i-1);
	end generate;
		
end ARCH_grayBinario;