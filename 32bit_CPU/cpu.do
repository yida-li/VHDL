add wave *

echo " "
echo reset
echo "Register=0"
force reset 1
force clk 0
run 2
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 

# Unassert Reset signal
force reset 0
run 2

# Run Clock for 
force clk 1 2 -r 4
force clk 0 4 -r 4

echo " "
echo "instruction 1"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 

run 4
echo " "
echo " instruction 2"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 3"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 4"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 5"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 6"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 7"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 8"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 9"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 10"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 11"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 12"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 13"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 14"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 15"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 16"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 17"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 18"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 19"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 20"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 21"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 22"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 23"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 24"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 25"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 26"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 27"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 28"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 29"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
run 4
echo " "
echo " instruction 30"
examine s_icache_out
echo clk reset
examine -radix hex clk reset
echo overflow zero
examine -radix hex overflow zero
echo pc_out
examine -radix hex pc_out 
echo rs_out rt_out
examine -radix hex rs_out rt_out 
echo " "
echo "finish"