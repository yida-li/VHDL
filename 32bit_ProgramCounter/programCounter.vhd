library IEEE;
use IEEE.std_logic_1164.all;

entity pc_reg is 
port(
    pc_in: in std_logic_vector(31 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    pc_out : out std_logic_vector(31 downto 0)
);
end pc_reg;

architecture arch_pc_reg of pc_reg is

-- Signal declaration
signal reg_pc : std_logic_vector(31 downto 0); -- 32-bit wide PC register

begin
    
    -- For reset and update PC Register
    pc_update: process(clk, reset)
    begin
		-- async reset
		if(reset='1') then
		    -- reset PC register to 0
            reg_pc <= (others => '0');
		-- on rising edge of clock update PC with next address
		elsif rising_edge(clk) then
			reg_pc <= pc_in;
		end if;
    end process;
    
    -- PC Register output
    pc_out <= reg_pc;

end arch_pc_reg ; -- arch_pc_reg
