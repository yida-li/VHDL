add wave *
echo "Jump to 0x0000BB"
force rs 16#00000000
force rt 16#00000000
force pc 16#00000000
force branch_type 00
force target_address 16#BB
force pc_sel 01
run 4
echo pc_sel:
examine -radix bin pc_sel
echo target_address:
examine -radix hex target_address 
echo current pc
examine -radix hex pc
echo next program counter :
examine -radix hex next_pc
echo "Jump to register Rs containing 0x000CC"
force rs 16#CC
force pc_sel 10
run 4
echo pc_sel:
examine -radix bin pc_sel
echo rs:
examine -radix hex rs
echo current pc
examine -radix hex pc
echo next program counter :
examine -radix hex next_pc
echo "PC = PC + 1"
force pc 16#00000000
force pc_sel 00
force branch_type 00
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo current pc
examine -radix hex pc
echo next program counter :
examine -radix hex next_pc
echo "BEQ test1"            -need fix
force pc 16#00000000
force rs 16#0000AAAA
force rt 16#0000AAAA
force target_address 16#00C0
force branch_type 01
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo target address:
examine -radix hex target_address
echo Register rs 
examine -radix hex rs
echo Register rt 
examine -radix hex rt
echo current pc
examine -radix hex pc
echo next program counter :
examine -radix hex next_pc
echo "BEQ test 2"
force pc 16#00000000
force rs 16#0000AAAA
force rt 16#0000AAAB
force target_address 16#0000A
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo target address:
examine -radix hex target_address
echo Register rs 
examine -radix hex rs
echo Register rt 
examine -radix hex rt
echo current pc
examine -radix hex pc
echo next program counter :
examine -radix hex next_pc
echo "BNE test1"
force pc 16#00000000
force rs 16#0000AAAA
force rt 16#0000AAAA
force target_address 16#0FA0
force branch_type 10
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo target address:
examine -radix hex target_address
echo Register rs 
examine -radix hex rs
echo Register rt 
examine -radix hex rt
echo current pc
examine -radix hex pc
echo next program counter :
examine -radix hex next_pc
echo "BNE test2"
force pc 16#00000000
force rs 16#0000F02
force rt 16#0000F01
force target_address 16#0FA0
force branch_type 10
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo target address:
examine -radix hex target_address
echo Register rs 
examine -radix hex rs
echo Register rt 
examine -radix hex rt
echo current pc
examine -radix hex pc
echo next program counter :
examine -radix hex next_pc
echo "Branch if rs less than zero" 
force pc 16#0000DD0
force rs 16#0000AA0
force target_address 16#0C1
force branch_type 11
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo target address:
examine -radix hex target_address
echo Register rs 
examine -radix hex rs
echo current pc
examine -radix hex pc
echo next program counter :
examine -radix hex next_pc
echo "Branch if rs less than zero"
force pc 16#00000000
force rs 16#FFFFFAA0
force target_address 16#0C2
force branch_type 11
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo target address:
examine -radix hex target_address
echo Register rs 
examine -radix hex rs
echo current pc
examine -radix hex pc
echo next program counter :
examine -radix hex next_pc
