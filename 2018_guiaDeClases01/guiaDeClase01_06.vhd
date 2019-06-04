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
	bin(N-1)<= gray(N-1);
	
	GB: for i in 0 to N-2 generate
		bin(i) <= gray(i) Xor bin(i+1);
	end generate;
		
end ARCH_grayBinario;