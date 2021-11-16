library IEEE;
use IEEE.std_logic_1164.all;

entity sign_extend is 
port(
    ta_in : in std_logic_vector(15 downto 0);
    func : in std_logic_vector(1 downto 0);
    ext_out : out std_logic_vector(31 downto 0)
);
end sign_extend;

architecture arch_sign_extend of sign_extend is

signal target_address_extended : std_logic_vector(31 downto 0); 
constant SignExtendOne_Const : std_logic_vector(15 downto 0):= (others=> '1'); 
constant SignExtendZero_Const : std_logic_vector(15 downto 0):= (others=> '0');

begin
													-- Start --
target_address_extended <= (SignExtendOne_Const & ta_in) when (ta_in(15)='1') else 
                           (SignExtendZero_Const & ta_in); 
with func select
    ext_out <= (ta_in & SignExtendZero_Const) when "00", 
               (target_address_extended) when "01", 
               (target_address_extended) when "10", 
               (SignExtendZero_Const & ta_in) when others; 

end arch_sign_extend ;