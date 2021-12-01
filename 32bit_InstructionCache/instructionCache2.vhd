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
        s_cache(1) <= "00100000000000100000000000000011"; -- addi r2, r0, 3	   
		s_cache(2) <= "00000000010000010001100000100000"; -- add r3, r2, r1
		s_cache(3) <= "00000000010000010001000000100010"; -- sub r2,r2,r1		
		s_cache(4) <= "00010000010000010000000000000001"; -- beq r2,r1 jump to address +1 offset
		s_cache(5) <= "00001000000000000000000000000010"; -- jump to 00010 
		s_cache(6) <= "00100000011010010000000000000001"; -- addi r9, r3, 1 
		s_cache(7) <= "00100000011010010000000000000010"; -- addi r9, r3, 2
		s_cache(8) <= "00100000011010010000000000000011"; -- addi r9, r3, 3
		s_cache(9) <= "00100000011010010000000000000100"; -- addi r9, r3, 4
		s_cache(10) <= "00100000011010010000000000000101"; -- addi r9, r3, 5
		s_cache(11) <= "00100000011010010000000000000110"; -- addi r9, r3, 6
		s_cache(12) <= "00100000011010010000000000000111"; -- addi r9, r3, 7
        -- The rest will be filled for nd lab test
		-- opcode from 31 to 26
        for i in 13 to 31 loop 
            s_cache(i) <= (others => '0');
        end loop;
        
    end process;
  
  
    instr_out <= s_cache(to_integer(unsigned(low_addr)));
end arch_i_cache; 

