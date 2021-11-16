force x 2#0010_0010_0010_0010_0010_0010_0010_0010               
force y 2#0000_0000_0000_0000_0011_0010_0010_0010 


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
echo Equals
examine output
echo Zero flag
examine zero



echo " "
echo " "
echo " "
echo " "
force add_sub 1
run 2
examine x_out
echo Substract
examine y_out
echo Equals
examine output
force x 2#0010_0010_0010_0010_0010_0010_0010_0010               
force y 2#0010_0010_0010_0010_0010_0010_0010_0010 
echo " "
echo " "
echo " "
echo " "
force add_sub 1
run 2
examine x_out
echo Substract
examine y_out
echo Equals
examine output
echo Zero flag
examine zero
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
echo Equals
examine output



echo " "
echo " "
echo " "
echo " "
force logic_func 01
run 2
examine x_out
echo OR
examine y_out
echo Equals
examine output



echo " "
echo " "
echo " "
echo " "
force logic_func 10
run 2
examine x_out
echo XOR
examine y_out
echo Equals
examine output



echo " "
echo " "
echo " "
echo " "
force logic_func 11
run 2
examine x_out
echo NOR
examine y_out
echo Equals
examine output




echo " "
echo " "
echo " "
echo " "
force add_sub 0
force func 01
force x 16#FFFFFFFF
force y 16#00000000
run 2
examine x_out
echo slt
examine y_out
echo Equals
examine output

echo " "
echo " "
echo " "
echo " "
force add_sub 0
force func 01
force x 16#00000000
force y 16#00000F00
run 2
examine x_out
echo slt
examine y_out
echo Equals
examine output


# lui (y should be loaded)
echo " "

force add_sub 0
force func 00
force x 16#FFFFFFFF
force y 16#00000000
run 2
examine x
echo lui
examine output


# zero flag (A-A = 0)
echo " "
echo " "
echo " "
echo " "
echo zero
force add_sub 1
force func 10
force x 16#0000000A
force y 16#0000000A
run 2
examine x_out
echo subtract
examine y_out
echo Equals
examine output
echo Zero flag
examine zero

# overflow flag
echo " "
echo " "
echo " "
echo " "
echo Overflow for Adder
force add_sub 0
force func 10
force x 16#7FFFFFFF
force y 16#7FFFFFFC
run 2
examine x_out
echo add
examine y_out
echo Equals
examine output
echo overflow flag
examine overf

echo " "
echo " "
echo " "
echo " "
echo Overflow for Adder
force add_sub 0
force func 10
force x 16#7FFFFFFF
force y 16#00000003
run 2
examine x_out
echo add
examine y_out
echo Equals
examine output
echo overflow flag
examine overf
echo " "
echo " "
echo " "
echo " "
echo Overflow for Adder
force add_sub 0
force func 10
force x 16#00000003
force y 16#7FFFFFFC
run 2
examine x_out
echo add
examine y_out
echo Equals
examine output
echo overflow flag
examine overf
echo " "
echo " "
echo " "
echo " "
force x 16#00000000
force y 16#00000003
run 2
examine x_out
echo add
examine y_out
echo Equals
examine output
echo overflow flag
examine overf
echo " "
echo " "
echo " "
echo " "




echo Overflow for Subtractor
echo " "
echo " "
echo " "
echo " "
force add_sub 1
force func 10
force x 16#80000000
force y 16#000000BB
run 2
examine x_out
echo sub
examine y_out
echo Equals
examine output
echo overflow flag
examine overf
echo " "
echo " "
echo " "
echo " "
force add_sub 1
force func 10
force x 16#000000BB
force y 16#80000000
run 2
examine x_out
echo sub
examine y_out
echo Equals
examine output
echo overflow flag
examine overf
echo " "
echo " "
echo " "
echo " "
force x 16#7FFFFFFF
force y 16#00000003
run 2
examine x_out
echo sub
examine y_out
echo Equals
examine output
echo overflow flag
examine overf
echo " "
echo " "
echo " "
echo " "
force x 16#80000003
force y 16#7FFFFFFF
run 2
examine x_out
echo sub
examine y_out
echo Equals
examine output
echo overflow flag
examine overf