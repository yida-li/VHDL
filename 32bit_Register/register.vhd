library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity registration is
generic (
	g_WIDTH : natural := 32
);
port( 
	din : in std_logic_vector(31 downto 0);
	reset : in std_logic;
	clk : in std_logic;
	write : in std_logic;
	read_a : in std_logic_vector(4 downto 0);
	read_b : in std_logic_vector(4 downto 0);
	write_address : in std_logic_vector(4 downto 0);
	out_a : out std_logic_vector(31 downto 0);
	out_b : out std_logic_vector(31 downto 0)
);
end registration;

architecture arch_regfile of registration is

type r_file is array(0 to g_WIDTH-1) of std_logic_vector(g_WIDTH-1 downto 0); -- Creating an array of 32x32 for register file
signal reg : r_file;

begin
	write_process: process(clk, reset)
	begin
		if(reset='1') 
		then
			for i in reg'range loop
				reg(i) <= (others => '0');
			end loop;
		elsif rising_edge(clk) 
		then
			if(write = '1') 
			then
				reg(to_integer(unsigned(write_address))) <= din;
			end if;
		end if;
	end process;

	out_a <= reg(to_integer(unsigned(read_a)));
	out_b <= reg(to_integer(unsigned(read_b)));
	
end arch_regfile;