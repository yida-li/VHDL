add wave *
echo " Testing PC "
run 2
force clk 1
run 2
force clk 0
echo clock
examine clk
echo set pc to 010
force pc_in 2#010
run 2
force clk 1
echo clock
examine clk
run 2
force clk 0
echo clock
examine clk
examine pc_out
run 2
echo set pc to 11111
force pc_in 2#11111
force clk 1
echo clock
examine clk
examine pc_out
run 2
force clk 0
echo clock
examine clk
examine pc_out
echo resetting  pc 
force reset 1
run 2
force clk 1
echo clock
examine clk
examine pc_out
run 2
force clk 0
echo clock
examine clk
examine pc_out
run 2
echo set pc to 10000
force reset 0
force pc_in 2#10000
force clk 1
echo clock
examine clk
examine pc_out
run 2
force clk 0
echo clock
examine clk
examine pc_out