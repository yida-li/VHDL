echo " Testing Sign Extend Unit"
echo target address is 1111111111111111
echo pad with 16 0s at least significant postions
force func 00
force ta_in 2#1111111111111111
run 2
echo output:
examine ext_out
echo " "
force func 01
echo target address is 1111111111111111
echo "arithmetic sign extend ... immediate sign bit i15"
force ta_in 2#1111111111111111
run 2
echo output:
examine ext_out
echo " "
force func 10
echo target address is 0111111111111111
echo "arithmetic sign extend ... immediate sign bit i15"
force ta_in 2#0111111111111111
run 2
echo output:
examine ext_out
echo " "
force func 11
echo target address is 001111
echo "high order 16 bits padded with 0s"
force ta_in 2#001111
run 2
echo output:
examine ext_out