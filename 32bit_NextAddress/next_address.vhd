library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity next_address is
port(
    rt, rs : in std_logic_vector(31 downto 0);
    -- two register inputs which coulda of been 5 bits
    pc : in std_logic_vector(31 downto 0);
    target_address : in std_logic_vector(25 downto 0);
    branch_type : in std_logic_vector(1 downto 0);
    pc_sel : in std_logic_vector(1 downto 0);
    next_pc : out std_logic_vector(31 downto 0)
);
end next_address;
architecture arch_next_address of next_address is
--signals
signal signed1_signal, signed2_signal,signed3_signal: signed(31 downto 0); 
signal offset_signal,target_address_extended: std_logic_vector(31 downto 0); 
signal branch_signal, beq_signal, bne_signal, bltz_signal: std_logic_vector(31 downto 0); 
signal no_conditional_jump, jmp_signal, jr_register, not_used: std_logic_vector(31 downto 0);
--constant variable
constant Everything0_then_a_one: std_logic_vector(31 downto 0):= (0 => '1', others=> '0'); 
constant Everthing1: std_logic_vector(15 downto 0):= (others=> '1'); 
constant Bit6_of_zero: std_logic_vector(5 downto 0):= (others=> '0'); 
constant Bit32_ofzero: std_logic_vector(31 downto 0):= (others=> '0'); 

begin					
target_address_extended <= (Everthing1 & target_address(15 downto 0)) when (target_address(15)='1') else (Bit32_ofzero(15 downto 0) & target_address(15 downto 0));
offset_signal <= std_logic_vector(signed(target_address_extended) + 1); --offset = target_extended +1bit
beq_signal <= offset_signal when (rs=rt) else Everything0_then_a_one; 
bne_signal <= offset_signal when (rs/=rt) else Everything0_then_a_one; 
signed1_signal <= signed(rs);
signed2_signal <= signed(Bit32_ofzero);
signed3_signal <= signed(rt);
bltz_signal <= offset_signal when (signed1_signal<signed2_signal) else Everything0_then_a_one; 

with branch_type select  
	branch_signal <= Everything0_then_a_one when "00", -- 1 as a 32 bit number
                  beq_signal when "01",   -- 1+ branch offset if rs=rt
                  bne_signal when "10",   -- 1+ branch offset if rs=rt
                  bltz_signal when others;-- 1+ branch offset if rs<0


no_conditional_jump <= std_logic_vector(signed(pc) + signed(branch_signal)); 
jmp_signal <= Bit6_of_zero & target_address;
jr_register <= rs;
not_used <= (others=>'0'); 

with pc_sel select
next_pc <= no_conditional_jump when "00", 
           jmp_signal when "01", 
           jr_register when "10", 
           not_used when others; 
                                
end arch_next_address ;