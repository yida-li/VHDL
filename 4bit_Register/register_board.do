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
echo register 0-3
examine reg(0) reg(1) reg(2) reg(3) 
force reset 0
run 2
force clk 1 2 -r 4
force clk 0 4 -r 4
echo " "
echo " "
echo " "
echo " "
echo "write 0001 to register(3)"
force din_in 2#0001
force write 1
force write_address_in 11
run 8
echo mode = write write_address 
examine write write_address_in 
echo clock and reset
examine clk reset
echo register 0-3
examine reg(0) reg(1) reg(2) reg(3) 
echo " "
echo " "
echo " "
echo " write 0010 to register(2)"
force din_in 2#0010

force write 1
force write_address_in 10
run 8
echo mode = write write_address 
examine write write_address_in 
echo clock and reset
examine clk reset
echo register 0-3
examine reg(0) reg(1) reg(2) reg(3) 

echo " "
echo " "
echo "Reading content of register number 2 and number 3"
force write 0
force read_a_in 10
force read_b_in 11
run 2
echo mode = read  
examine write  
echo clock and reset
examine clk reset
echo reading register read_a and read_b 
examine read_a_in read_b_in 
echo reading content of register(2) and register (3)
examine out_a_out out_b_out
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
echo register 0-3
examine reg(0) reg(1) reg(2) reg(3) 
