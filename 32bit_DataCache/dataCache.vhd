library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity d_cache is
generic (
	g_WIDTH : natural := 32
);
port( 
	din : in std_logic_vector(31 downto 0);
	addr : in std_logic_vector(4 downto 0);
	data_write : in std_logic;
	reset : in std_logic;
	clk : in std_logic;
	d_out : out std_logic_vector(31 downto 0)
);
end d_cache;

architecture arch_d_cache of d_cache is
type r_file is array(0 to g_WIDTH-1) of std_logic_vector(g_WIDTH-1 downto 0); 
signal s_data : r_file; 

begin
								-- Start --
	write_reset_cache: process(clk, reset)
	begin
		if(reset='1') then
			
			for i in s_data'range loop 
				s_data(i) <= (others => '0');
			end loop;
		elsif rising_edge(clk) then
			if(data_write = '1') then
				s_data(to_integer(unsigned(addr))) <= din;
			end if;
		end if;
	end process;
	d_out <= s_data(to_integer(unsigned(addr)));
	
end arch_d_cache;