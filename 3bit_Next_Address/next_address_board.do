add wave *
echo " "
echo " "
echo " "
echo " "
echo "Jump to 111"
force rs_in 2#10 
force rt_in 2#10
force pc 2#10
force branch_type 00
force target_address 2#111
force pc_sel 01
run 4
echo pc_sel:
examine -radix bin pc_sel
echo target_address:
examine -radix bin target_address 
echo current pc
examine -radix bin pc
echo next program counter :
examine -radix bin next_pc


echo " "
echo " "
echo " "
echo " "
echo "Jump to register Rs_in containing 10"
force rs_in 2#10
force pc_sel 10
run 4
echo pc_sel:
examine -radix bin pc_sel
echo rs:
examine -radix bin rs_in
echo current pc
examine -radix bin pc
echo next program counter :
examine -radix bin next_pc


echo " "
echo " "
echo " "
echo " "
echo "PC = PC + 1"
force pc 2#10
force pc_sel 00
force branch_type 00
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo current pc
examine -radix bin pc
echo next program counter :
examine -radix bin next_pc


echo " "
echo " "
echo " "
echo " "
echo "BEQ test1"     
force rs_in 2#10 
force rt_in 2#10
force pc 2#10
force target_address 2#000
force branch_type 01
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo target address:
examine -radix bin target_address
echo Register rs_in 
examine -radix bin rs_in
echo Register rt 
examine -radix bin rt_in
echo current pc
examine -radix bin pc
echo next program counter :
examine -radix bin next_pc


echo " "
echo " "
echo " "
echo " "
echo "BEQ test 2"
force rs_in 2#10 
force rt_in 2#10
force pc 2#000
force target_address 2#010
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo target address:
examine -radix bin target_address
echo Register rs_in 
examine -radix bin rs_in
echo Register rt 
examine -radix bin rt_in
echo current pc
examine -radix bin pc
echo next program counter :
examine -radix bin next_pc


echo " "
echo " "
echo " "
echo " "
echo "BNE test1"
force rs_in 2#10 
force rt_in 2#10
force pc 2#000
force target_address 2#100
force branch_type 10
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo target address:
examine -radix bin target_address
echo Register rs_in 
examine -radix bin rs_in
echo Register rt 
examine -radix bin rt_in
echo current pc
examine -radix bin pc
echo next program counter :
examine -radix bin next_pc


echo " "
echo " "
echo " "
echo " "
echo "BNE test2"
force rs_in 2#10 
force rt_in 2#00
force pc 2#000
force target_address 2#010
force branch_type 10
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo target address:
examine -radix bin target_address
echo Register rs_in 
examine -radix bin rs_in
echo Register rt 
examine -radix bin rt_in
echo current pc
examine -radix bin pc
echo next program counter :
examine -radix bin next_pc






echo " "
echo " "
echo " "
echo " "
echo "Branch if rs_in less than zero"       
force rs_in 2#10 
force rt_in 2#10
force pc 2#000
force target_address 2#000
force branch_type 11
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo target address:
examine -radix bin target_address
echo Register rs_in 
examine -radix bin rs_in


echo current pc
examine -radix bin pc
echo next program counter :
examine -radix bin next_pc


echo " "
echo " "
echo " "
echo " "
echo "Branch if rs_in less than zero"
force rs_in 2#10 
force rt_in 2#10
force pc 2#000
force target_address 2#000
force branch_type 11
run 4
echo pc_sel:
examine -radix bin pc_sel
echo branch type: 
examine -radix bin branch_type
echo target address:
examine -radix bin target_address
echo Register rs_in 
examine -radix bin rs_in
echo current pc
examine -radix bin pc
echo next program counter :
examine -radix bin next_pc
