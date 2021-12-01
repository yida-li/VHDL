----https://github.com/gabrielkarras/CPU-MIPS/blob/main/src/CPU.vhd
library IEEE;
use IEEE.std_logic_1164.all;

entity cpu is 
port(
    clk : in std_logic;
    reset : in std_logic;
    rs_out, rt_out, pc_out : out std_logic_vector(31 downto 0);
    overflow : out std_logic;
	zero : out std_logic
);
end cpu;


architecture arch_cpu of cpu is

component pc_reg
port(
    pc_in: in std_logic_vector(31 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    pc_out : out std_logic_vector(31 downto 0)
);
end component;

component i_cache
port(
    addr : in std_logic_vector(4 downto 0);
    immediate_instruction : out std_logic_vector(31 downto 0)
);
end component;

component next_address
port(
    rt, rs : in std_logic_vector(31 downto 0);
    pc : in std_logic_vector(31 downto 0);
    ta_in : in std_logic_vector(25 downto 0);
    branch_type : in std_logic_vector(1 downto 0);
    pc_sel : in std_logic_vector(1 downto 0);
    next_pc : out std_logic_vector(31 downto 0)    
);
end component;

component regfile
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
end component;

component sign_extend
port(
    ta_in : in std_logic_vector(15 downto 0);
    func : in std_logic_vector(1 downto 0);
    ext_out : out std_logic_vector(31 downto 0)
);
end component;

component alu 
port(
    x, y : in std_logic_vector(31 downto 0);
	add_sub : in std_logic ;
	logic_func : in std_logic_vector(1 downto 0 );
	func : in std_logic_vector(1 downto 0 );
	output : out std_logic_vector(31 downto 0);
	overf : out std_logic;
    zero : out std_logic
);
end component;

component d_cache
port( 
    din : in std_logic_vector(31 downto 0);
    addr : in std_logic_vector(4 downto 0);
    data_write : in std_logic;
    reset : in std_logic;
    clk : in std_logic;
    d_out : out std_logic_vector(31 downto 0)
);
end component;


component control_unit
port(
    opcode : in std_logic_vector(5 downto 0);
    func_in : in std_logic_vector(5 downto 0);
    reg_write : out std_logic;
    reg_dest : out std_logic;
    reg_in_src : out std_logic;
    alu_src: out std_logic;
    add_sub : out std_logic;
    data_write : out std_logic;
    logic_func : out std_logic_vector(1 downto 0);
    func_out : out std_logic_vector(1 downto 0);
    branch_type : out std_logic_vector(1 downto 0);
    pc_sel : out std_logic_vector(1 downto 0)
);
end component;



for U1 : pc_reg use entity WORK.pc_reg(arch_pc_reg);
for U2 : i_cache use entity WORK.i_cache(arch_i_cache);
for U3 : next_address use entity WORK.next_address(arch_next_address);
for U4 : regfile use entity WORK.regfile(arch_regfile);
for U5 : alu use entity WORK.alu(arch_alu);
for U6 : d_cache use entity WORK.d_cache(arch_d_cache);
for U7 : sign_extend use entity WORK.sign_extend(arch_sign_extend);
for U8 : control_unit use entity WORK.control_unit(arch_control_unit);

                                                                            -- Signals --
signal next_program_counter, current_program_counter_output, instruction_output, registerfile_rs, registerfile_rt, registerfile_input: std_logic_vector(31 downto 0);
signal alu_output, datacache_output, alu_inputy, sign_extend: std_logic_vector(31 downto 0);
signal target_addressed_input : std_logic_vector(15 downto 0);
signal next_address_input : std_logic_vector(25 downto 0);
signal the_opcode, s_func_in : std_logic_vector(5 downto 0);
signal program_counter_output, instructionCache3, instructionCache2, InstructionCache4: std_logic_vector(4 downto 0);
signal data_cache_input, registerfile_address: std_logic_vector(4 downto 0);
signal pc_sel_mode, branch_type_mode, logic_func_mode, func_mode : std_logic_vector(1 downto 0);
signal reigster_write_mode, register_destination_mode, register_input_mode, alu_source_mode, add_sub_mode, data_write_mode : std_logic;
   
begin
                                                                             -- Start --

U1: pc_reg port map(pc_in => next_program_counter, clk => clk, reset => reset, pc_out => current_program_counter_output );
program_counter_output <= current_program_counter_output(4 downto 0);
U2: i_cache port map(addr => program_counter_output, immediate_instruction => instruction_output);
next_address_input <= instruction_output(25 downto 0);
U3: next_address port map(rt => registerfile_rt, rs => registerfile_rs, pc => current_program_counter_output, ta_in => next_address_input, branch_type => branch_type_mode, pc_sel => pc_sel_mode, next_pc => next_program_counter);
instructionCache3 <= instruction_output(25 downto 21); 
instructionCache2 <= instruction_output(20 downto 16); 
InstructionCache4 <= instruction_output(15 downto 11); 
registerfile_address <= InstructionCache4 when (s_reg_dest = '1') else instructionCache2; 
registerfile_input <= datacache_output when (s_reg_in_src = '0') else alu_output; 
U4: regfile port map(din => registerfile_input, reset => reset, clk => clk, write => reigster_write_mode, register_destination_mode => register_input_mode, alu_source_mode => add_sub_mode, data_write_mode => registerfile_address, out_a => registerfile_rs, out_b => registerfile_rt);
alu_inputy <= registerfile_rt when (s_alu_src = '0') else sign_extend; 
U5: alu port map(x => registerfile_rs, y => alu_inputy, add_sub => s_add_sub, logic_func => logic_func_mode func =>, func_mode, output => alu_output, overf => overflow, zero => zero);
data_cache_input <= alu_output(4 downto 0);
U6: d_cache port map(din => registerfile_rt, addr => data_cache_input, data_write => s_data_write, reset => reset, clk => clk, d_out => datacache_output);
target_addressed_input <= instruction_output(15 downto 0); -- instruction output[15-0]-> target address for conditional/unconditional branching instructions
U7: sign_extend port map(ta_in => target_addressed_input, func =>, func_mode, ext_out => sign_extend);
the_opcode <= instruction_output(31 downto 26); 
s_func_in <= instruction_output(5 downto 0); 
U8: control_unit port map(opcode => the_opcode, func_in => s_func_in, reg_write => reigster_write_mode, register_destination_mode => register_input_mode, 
alu_source_mode => add_sub_mode, data_write_mode => s_alu_src, add_sub => s_add_sub, data_write => s_data_write, 
logic_func => logic_func_mode func_out =>, func_mode, branch_type => branch_type_mode, pc_sel => pc_sel_mode);

rs_out <= registerfile_rs; -- to be changed to 4 bit for NEXYS BOARD                                    LED 
rt_out <= registerfile_rt; -- to be changed to 4 bit for NEXYS BOARD                                    Size
pc_out <= current_program_counter_output; -- to be changed to 4 bit for NEXYS BOARD                     Limit

end arch_cpu; 