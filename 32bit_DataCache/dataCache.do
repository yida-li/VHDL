echo " Testing register "
echo " Whats inside all 32 registers?"
run 2
force clk 1
run 2
force clk 0
echo register 0-7
examine -radix hex s_data(0) s_data(1) s_data(2) s_data(3) s_data(4) s_data(5) s_data(6) s_data(7)
echo register 8-15
examine -radix hex s_data(8) s_data(9) s_data(10) s_data(11) s_data(12) s_data(13) s_data(14) s_data(15)
echo register 16-23
examine -radix hex s_data(16) s_data(17) s_data(18) s_data(19) s_data(20) s_data(21) s_data(22) s_data(23)
echo register 24-31
examine -radix hex s_data(24) s_data(25) s_data(26) s_data(27) s_data(28) s_data(29) s_data(30) s_data(31)
echo " Empty "
echo " writing FFF to register number 25"
force din 16#FFF
force data_write 1
force addr 2#11001
run 2
force clk 1
run 2
force clk 0
examine -radix hex s_data(0) s_data(1) s_data(2) s_data(3) s_data(4) s_data(5) s_data(6) s_data(7)
echo register 8-15
examine -radix hex s_data(8) s_data(9) s_data(10) s_data(11) s_data(12) s_data(13) s_data(14) s_data(15)
echo register 16-23
examine -radix hex s_data(16) s_data(17) s_data(18) s_data(19) s_data(20) s_data(21) s_data(22) s_data(23)
echo register 24-31
examine -radix hex s_data(24) s_data(25) s_data(26) s_data(27) s_data(28) s_data(29) s_data(30) s_data(31)
echo " writing AAAAAFFF to register number 31"
force din 16#AAAAAFFF
force data_write 1
force addr 2#11111
run 2
force clk 1
run 2
force clk 0
examine -radix hex s_data(0) s_data(1) s_data(2) s_data(3) s_data(4) s_data(5) s_data(6) s_data(7)
echo register 8-15
examine -radix hex s_data(8) s_data(9) s_data(10) s_data(11) s_data(12) s_data(13) s_data(14) s_data(15)
echo register 16-23
examine -radix hex s_data(16) s_data(17) s_data(18) s_data(19) s_data(20) s_data(21) s_data(22) s_data(23)
echo register 24-31
examine -radix hex s_data(24) s_data(25) s_data(26) s_data(27) s_data(28) s_data(29) s_data(30) s_data(31)
echo " resetting Cache"
force reset 1
run 2
force clk 1
run 2
force clk 0
examine -radix hex s_data(0) s_data(1) s_data(2) s_data(3) s_data(4) s_data(5) s_data(6) s_data(7)
echo register 8-15
examine -radix hex s_data(8) s_data(9) s_data(10) s_data(11) s_data(12) s_data(13) s_data(14) s_data(15)
echo register 16-23
examine -radix hex s_data(16) s_data(17) s_data(18) s_data(19) s_data(20) s_data(21) s_data(22) s_data(23)
echo register 24-31
examine -radix hex s_data(24) s_data(25) s_data(26) s_data(27) s_data(28) s_data(29) s_data(30) s_data(31)