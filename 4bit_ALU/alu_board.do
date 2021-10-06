force x_in 2#0010                
force y_in 2#0100


echo " "
echo " "
echo " "
echo " "				
force add_sub 0
force func 10
run 2
examine x_out
echo Add
examine y_out
examine output_out



echo " "
echo " "
echo " "
echo " "
force add_sub 1
run 2
examine x_out
echo Substract
examine y_out
examine output_out



echo " "
echo " "
echo " "
echo " "
force logic_func 00
force func 11
run 2
examine x_out
echo AND
examine y_out
examine output_out



echo " "
echo " "
echo " "
echo " "
force logic_func 01
run 2
examine x_out
echo OR
examine y_out
examine output_out



echo " "
echo " "
echo " "
echo " "
force logic_func 10
run 2
examine x_out
echo XOR
examine y_out
examine output_out



echo " "
echo " "
echo " "
echo " "
force logic_func 11
run 2
examine x_out
echo NOR
examine y_out
examine output_out




echo " "
echo " "
echo " "
echo " "
force add_sub 0
force func 01
force x_in 2#0010                
force y_in 2#0100
run 2
examine x_out
echo slt
examine y_out
examine output_out

echo " "
echo " "
echo " "
echo " "
force add_sub 0
force func 01
force x_in 2#0010                
force y_in 2#0001
run 2
examine x_out
echo slt
examine y_out
examine output_out


# lui (y should be loaded)
echo " "


force func 00
force x_in 2#1111                
run 2
examine x_out
echo lui
examine output_out

# zero flag (A-A = 0)
echo " "
echo zero
force add_sub 1
force func 10
force x_in 2#0000                
force y_in 2#0000
run 2
examine zero output_out


# overflow flag
echo " "
echo Overflow for Adder
force add_sub 0
force func 10
force x_in 2#0010                
force y_in 2#0100
run 2
examine x_in
echo add
examine y_in
echo equals
examine output_out
echo overflow flag
examine overf
echo " "


force x_in 2#1110                
force y_in 2#0100
run 2
examine x_in
echo add
examine y_in
echo equals
examine output_out
echo overflow flag
examine overf
echo " "

force x_in 2#1010                
force y_in 2#1100
run 2
examine x_in
echo add
examine y_in
echo equals
examine output_out
echo overflow flag
examine overf
echo " "


force x_in 2#1111                
force y_in 2#1111
run 2
examine x_in
echo add
examine y_in
echo equals
examine output_out
echo overflow flag
examine overf
echo " "
echo Overflow for Subtractor
force add_sub 1
force func 10
force x_in 2#0010                
force y_in 2#0100
run 2
examine overf output_out
force x_in 2#1111                
force y_in 2#1111
run 2
examine overf output_out

