library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity i_cache is
generic ( g_WIDTH : natural := 32
); 
port(low_addr : in std_logic_vector(4 downto 0);
    instr_out : out std_logic_vector(31 downto 0));
end i_cache;

architecture arch_i_cache of i_cache is
-- 32 x32 array simple
type r_file is array(0 to g_WIDTH-1) of std_logic_vector(g_WIDTH-1 downto 0); 
signal s_cache : r_file; 

begin
															-- Start --
		instruction_fetch: process(s_cache)
    begin
        s_cache(0) <= "00100000000000010000000000000001"; -- addi r1, r0, 1
        s_cache(1) <= "00100000000000100000000000000010"; -- addi r2, r0, 1
		s_cache(2) <= "00100000000000010000000000000001"; -- addi r1, r0, 1
		s_cache(3) <= "00100000000000100000000000000010"; -- addi r2, r0, 1
        s_cache(4) <= "00000000010000010001000000100000"; -- add r2, r2, r1

        -- The rest will be filled for lab 5 and lab test
		-- opcode from 31 to 26
        for i in 5 to 31 loop 
            s_cache(i) <= (others => '0');
        end loop;
        
    end process;
  
  
    instr_out <= s_cache(to_integer(unsigned(low_addr)));
end arch_i_cache; 