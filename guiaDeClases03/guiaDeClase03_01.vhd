library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.all;


entity myCnt is
	Generic(M:integer:=25 );
	Port (  clk 		: in   STD_LOGIC;
           rst 		: in   STD_LOGIC;
           ena 		: in   STD_LOGIC;
           salidaM_2 : out  STD_LOGIC;
           salidaM 	: out  STD_LOGIC
			  );
end myCnt;

architecture ARCH_myCnt of myCnt is
	
	constant N : integer := integer(ceil(log2(real (M))));
	signal 	qNext	: unsigned (N-1 downto 0);
	signal 	qNow	: unsigned (N-1 downto 0);
	
begin
	
	PROCESS( clk )
	begin
		
		if rising_edge(clk) then
			if rst = '1' then
				qNow <= to_unsigned(0,N);
			else
				qNow  <=  qNext ;
			end if;
		end if;
		
	end PROCESS;
	
	qNext 	 <= 	to_unsigned(0,N)  when qNow = to_unsigned(M-1,N) else
						qNow 					when ena  = '0' 					 else
						qNow+1;

	salidaM_2 <=	'1' when qNow =  (to_unsigned(M,N))/2-1 else
						'1' when qNow =  to_unsigned(M,N)-1   else
						'0';
	
	salidaM   <= 	'1' when qNow =  to_unsigned(M,N)-1   else
						'0';
					 
end ARCH_myCnt;