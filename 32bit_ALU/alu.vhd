library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity alu is
port(
	x, y : in std_logic_vector(31 downto 0);
	-- two input operands
	add_sub : in std_logic ;  -- 0 = add , 1 = sub
	logic_func : in std_logic_vector(1 downto 0 );
	-- 00 = AND, 01 = OR , 10 = XOR , 11 = NOR
	func : in std_logic_vector(1 downto 0 );
	-- 00 = lui, 01 = setless , 10 = arith , 11 = logic
	output : out std_logic_vector(31 downto 0);
	x_out,y_out: out std_logic_vector(31 downto 0);
	overf : out std_logic;
	zero : out std_logic
);
end alu ;
architecture arch_alu of alu is
component logic
port(
	x, y : in std_logic_vector(31 downto 0);
	sel : in std_logic_vector(1 downto 0);
	output : out std_logic_vector(31 downto 0)
);
end component;
component adder_sub
port(
	x, y : in std_logic_vector(31 downto 0); 
	sel : in std_logic;
	output : out std_logic_vector(31 downto 0)
);
end component;
component overflow 
port(
	x, y, r : in std_logic_vector(31 downto 0); 
	sel : in std_logic; 
	overflow : out std_logic
);
end component;
for U1 : adder_sub use entity WORK.adder_sub(arch_adder_sub);
for U2 : logic use entity WORK.logic(arch_logic);
for U3 : overflow use entity WORK.overflow(arch_overflow);
signal add_sub_result, logic_result: std_logic_vector(31 downto 0); -- result signals
signal slt:std_logic;	
constant Zero_Const: std_logic_vector(31 downto 0):= ( others=> '0'); -- 32bit vector to represent 0
constant Zero_Const2: std_logic_vector(31 downto 0):= ( others=> '0');

begin
-- Adder/Subtractor
U1: adder_sub port map(x => x, y => y, sel => add_sub, output => add_sub_result);


-- Logic
U2: logic port map(x => x, y => y, sel => logic_func, output => logic_result);



process(x,y)
begin	
-- SLT
if x < y then 
	slt <='1';
else 
	slt <='0';
end if;
end process;
-- ALU Multiplexer
with func select
	output <= (  x(15 downto 0) & Zero_Const2(31 downto 16)  ) when "00", -- lui
			  ( Zero_Const(31 downto 1) & slt ) when "01", -- verify slt
			  add_sub_result when "10", -- add/sub result
			  logic_result when others; -- logic result	

-- Zero
zero <= '1' when ( add_sub_result = Zero_Const ) else -- zero set
		'0'; -- zero not set
x_out <= x;
y_out <= y;		

-- Overflow
U3: overflow port map(x => x, y => y, r => add_sub_result, sel => add_sub, overflow => overf);

end arch_alu; -- arch_alu
