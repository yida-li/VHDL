library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity overflow is
port(
	x, y, r : in std_logic_vector(31 downto 0);  
	sel : in std_logic;       -- 1 for sub , 0 for add
	overflow : out std_logic  -- 1 for overflow , 0 for no overflow
	);
end overflow;

architecture arch_overflow of overflow is
	signal adding, substracting : std_logic;
	signal complement: std_logic_vector(31 downto 0);
	
begin
	complement<=std_logic_vector(signed(not(y)) + 1);
	adding <= ( x(31) and y(31) ) xor r(31);	
	substracting <= ( x(31) and complement(31) ) xor r(31);
	overflow <= adding when sel = '0' else
			  substracting;
end arch_overflow;