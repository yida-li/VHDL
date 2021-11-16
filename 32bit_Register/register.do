echo "din= data input"
echo "write=0 = read mode "
echo "write=1 = write mode"
echo "write_address= register number as source destination"
echo "read_a = register number that is going to be read"
echo "out_a = content of the register number that is read "
echo " "
echo " "
force reset 1
force clk 0
run 2
echo clock and reset
examine clk reset
echo register 0-7
examine -radix hex reg(0) reg(1) reg(2) reg(3) reg(4) reg(5) reg(6) reg(7)
echo register 8-15
examine -radix hex reg(8) reg(9) reg(10) reg(11) reg(12) reg(13) reg(14) reg(15)
echo register 16-23
examine -radix hex reg(16) reg(17) reg(18) reg(19) reg(20) reg(21) reg(22) reg(23)
echo register 24-31
examine -radix hex reg(24) reg(25) reg(26) reg(27) reg(28) reg(29) reg(30) reg(31)
force reset 0
run 2
force clk 1 2 -r 4
force clk 0 4 -r 4
echo " "
echo " "
echo " "
echo " "
echo "write 0xFAFA3B3B to register(3)"
force din 16#FAFA3B3B
force write 1
force write_address 00011
run 8
echo mode = write write_address 
examine write write_address 
echo clock and reset
examine clk reset
echo register 0-7
examine -radix hex reg(0) reg(1) reg(2) reg(3) reg(4) reg(5) reg(6) reg(7)
echo register 8-15
examine -radix hex reg(8) reg(9) reg(10) reg(11) reg(12) reg(13) reg(14) reg(15)
echo register 16-23
examine -radix hex reg(16) reg(17) reg(18) reg(19) reg(20) reg(21) reg(22) reg(23)
echo register 24-31
examine -radix hex reg(24) reg(25) reg(26) reg(27) reg(28) reg(29) reg(30) reg(31)
echo " "
echo " "
echo " "
echo " write 0xFAAAFAAA to register(2)"
force din 16#FAAAFAAA
force write 1
force write_address 00010
run 8
echo mode = write write_address 
examine write write_address 
echo clock and reset
examine clk reset
echo register 0-7
examine -radix hex reg(0) reg(1) reg(2) reg(3) reg(4) reg(5) reg(6) reg(7)
echo register 8-15
examine -radix hex reg(8) reg(9) reg(10) reg(11) reg(12) reg(13) reg(14) reg(15)
echo register 16-23
examine -radix hex reg(16) reg(17) reg(18) reg(19) reg(20) reg(21) reg(22) reg(23)
echo register 24-31
examine -radix hex reg(24) reg(25) reg(26) reg(27) reg(28) reg(29) reg(30) reg(31)
echo " "
echo " "
echo "Reading content of register number 2 and number 3"
force write 0
force read_a 00010
force read_b 00011
run 2
echo mode = read  
examine write  
echo clock and reset
examine clk reset
echo reading register read_a and read_b 
examine read_a read_b 
echo reading content of register(2) and register (3)
examine -radix hex out_a out_b
echo clock and reset
examine clk reset

run 14
echo " "
echo "reset everything to 0"
force reset 1
force clk 0
run 2
echo clock and reset
examine clk reset
echo register 0-7
examine -radix hex reg(0) reg(1) reg(2) reg(3) reg(4) reg(5) reg(6) reg(7)
echo register 8-15
examine -radix hex reg(8) reg(9) reg(10) reg(11) reg(12) reg(13) reg(14) reg(15)
echo register 16-23
examine -radix hex reg(16) reg(17) reg(18) reg(19) reg(20) reg(21) reg(22) reg(23)
echo register 24-31
examine -radix hex reg(24) reg(25) reg(26) reg(27) reg(28) reg(29) reg(30) reg(31)
