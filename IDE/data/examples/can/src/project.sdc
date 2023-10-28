//Copyright (C)2014-2023 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//GOWIN Version: 1.9.9 Beta-1
//Created Time: 2023-05-06 13:48:55
create_clock -name myclk -period 20 -waveform {2 6} [get_ports {sysclk}]
create_clock -name myclk1 -period 20 -waveform {0 10} [get_pins {uut_GW_PLL/pll_inst/CLKOUT}]
set_clock_latency -source -early -rise 2 [get_clocks {myclk}] 
set_clock_uncertainty 0.5 -setup -from [get_clocks {myclk}] -to [get_clocks {myclk}] 
report_timing -setup -from_clock [get_clocks {myclk}] -to_clock [get_clocks {myclk}] -max_paths 20 -max_common_paths 5 -max_logic_level 5 -min_logic_level 2
report_timing -removal -max_paths 20 -max_common_paths 1 -max_logic_level 5 -min_logic_level 2
