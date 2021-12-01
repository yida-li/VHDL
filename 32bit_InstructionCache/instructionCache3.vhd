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
        s_cache(0) <= "00100000000000110000000000000000";
        s_cache(1) <= "00100000000000010000000000000000";
        s_cache(2) <= "00100000000000100000000000000101";
        s_cache(3) <= "00000000001000100000100000100000";
        s_cache(4) <= "00100000010000101111111111111111";
        s_cache(5) <= "00010000010000110000000000000001";
        s_cache(6) <= "00001000000000000000000000000011";
        s_cache(7) <= "10101100000000010000000000000000";
        s_cache(8) <= "10001100000001000000000000000000";
        s_cache(9) <= "00110000100001000000000000001010";
        s_cache(10) <= "00110100100001000000000000000001";
        s_cache(11) <= "00111000100001000000000000001011";
        s_cache(12) <= "00111000100001000000000000000000";
        -- The rest will be filled for lab test unless it is the lab test itself from the Rick's source
		-- opcode from 31 to 26
        for i in 13 to 31 loop 
            s_cache(i) <= (others => '0');
        end loop;
        
    end process;
  
  
    instr_out <= s_cache(to_integer(unsigned(low_addr)));
end arch_i_cache; 
