library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity next_address is
port(
    rt_in, rs_in : in std_logic_vector(1 downto 0);
    -- two register inputs
    pc : in std_logic_vector(2 downto 0);
    target_address : in std_logic_vector(2 downto 0);
    branch_type : in std_logic_vector(1 downto 0);
    pc_sel : in std_logic_vector(1 downto 0);
    next_pc : out std_logic_vector(2 downto 0)
);

end next_address;
architecture arch_next_address of next_address is

--signals
signal signed1_signal, signed2_signal: signed(1 downto 0); 
signal offset_signal,target_address_extended: std_logic_vector(2 downto 0); 
signal branch_signal, beq_signal, bne_signal, bltz_signal: std_logic_vector(2 downto 0); 
signal no_conditional_jump, jmp_signal,  not_used: std_logic_vector(2 downto 0);
signal jr_register: std_logic_vector(2 downto 0);
--constant variable
constant One_Const: std_logic_vector(2 downto 0):= (0 => '1', others=> '0'); 
constant Zero2Bit_Const: std_logic_vector(1 downto 0):= (others=> '0');
begin					

offset_signal <= std_logic_vector(signed(target_address) + 1); --pc +1 +offset
beq_signal <= offset_signal when (rs_in=rt_in) else One_Const; 
bne_signal <= offset_signal when (rs_in/=rt_in) else One_Const; 
signed1_signal <= signed(rs_in);
signed2_signal <= signed(Zero2bit_Const);
bltz_signal <= offset_signal when (signed1_signal(1)='0') else One_Const; 

with branch_type select
	branch_signal <= One_Const when "00", -- 1 as a 32 bit number
                  beq_signal when "01",   -- 1+ branch offset if rs=rt
                  bne_signal when "10",   -- 1+ branch offset if rs=rt
                  bltz_signal when others;-- 1+ branch offset if rs<0


no_conditional_jump <= std_logic_vector(signed(pc) + signed(branch_signal)); 
jmp_signal <= target_address;
jr_register <="0" & rs_in;
not_used <= (others=>'0'); 

with pc_sel select
next_pc <= no_conditional_jump when "00", 
           jmp_signal when "01", 
           jr_register when "10", 
           not_used when others; 
                                
end arch_next_address ;