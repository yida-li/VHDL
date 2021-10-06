library IEEE;
use IEEE.std_logic_1164.all;

entity overflow is
port(
	x, y, r : in std_logic_vector(3 downto 0);  
	sel : in std_logic;       -- 1 for sub , 0 for add
	overflow : out std_logic  -- 1 for overflow , 0 for no overflow
	);
end overflow;

architecture arch_overflow of overflow is
	signal adding, substracting : std_logic;
begin
	adding <= ( x(3) and y(3) ) xor r(3);
	substracting <= ( r(3) and y(3) ) xor x(3);
	overflow <= adding when sel = '0' else
			  substracting;
end arch_overflow;