library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adder_sub is
port(
	x, y : in std_logic_vector(3 downto 0); 
	sel : in std_logic;  
	output : out std_logic_vector(3 downto 0) 
	);
end adder_sub;

architecture arch_adder_sub of adder_sub is
	signal local_sum, local_diff: std_logic_vector(3 downto 0); 
begin
	local_sum <= std_logic_vector(signed(x) + signed(y)); 
	local_diff <= std_logic_vector(signed(x) - signed(y));
	output <= local_sum when sel = '0' else
			  local_diff;	
end arch_adder_sub; 