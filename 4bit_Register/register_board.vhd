library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity registration is
generic (
	g_WIDTH : natural := 4
);
port( 
	din_in : in std_logic_vector(3 downto 0);
	reset : in std_logic;
	clk : in std_logic;
	write : in std_logic;
	read_a_in : in std_logic_vector(1 downto 0);
	read_b_in : in std_logic_vector(1 downto 0);
	write_address_in : in std_logic_vector(1 downto 0);
	out_a_out : out std_logic_vector(3 downto 0);
	out_b_out : out std_logic_vector(3 downto 0)
);
end registration;
architecture arch_regfile of registration is
type r_file is array(0 to g_WIDTH-1) of std_logic_vector(g_WIDTH-1 downto 0); -- Creating an array of 4x4 for register file
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
				reg(to_integer(unsigned(write_address_in))) <= din_in;
			end if;
		end if;
	end process;
	out_a_out <= reg(to_integer(unsigned(read_a_in)));
	out_b_out <= reg(to_integer(unsigned(read_b_in)));
	
end arch_regfile;