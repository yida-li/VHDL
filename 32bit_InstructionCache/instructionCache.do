echo " Fetching some instructions from the Cache"
echo " What's inside cache register 0?"
force low_addr 2#00000
run 2
examine instr_out
echo " What's inside cache register 1?"
force low_addr 2#00000
run 2
examine instr_out
echo " What's inside cache register 2?"
force low_addr 2#00000
run 2
examine instr_out
echo " What's inside cache register 3?"
force low_addr 2#00000
run 2
examine instr_out
echo " What's inside all the cache registers? "
run 2
echo cache 0-7
examine -radix hex s_cache(0) s_cache(1) s_cache(2) s_cache(3) s_cache(4) s_cache(5) s_cache(6) s_cache(7)
echo cache 8-15
examine -radix hex s_cache(8) s_cache(9) s_cache(10) s_cache(11) s_cache(12) s_cache(13) s_cache(14) s_cache(15)
echo cache 16-23
examine -radix hex s_cache(16) s_cache(17) s_cache(18) s_cache(19) s_cache(20) s_cache(21) s_cache(22) s_cache(23)
echo cache 24-31
examine -radix hex s_cache(24) s_cache(25) s_cache(26) s_cache(27) s_cache(28) s_cache(29) s_cache(30) s_cache(31)