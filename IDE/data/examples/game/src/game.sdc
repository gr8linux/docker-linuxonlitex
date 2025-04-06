
create_clock -name clk_1ms -period 10 -waveform {0 5} [get_nets {clk_1ms}]
create_clock -name clk_10 -period 10 -waveform {0 5} [get_nets {clk_10ms}]
create_clock -name clk_game -period 20 -waveform {0 3} [get_nets {U2/clk_game}]
create_clock -name clk_100 -period 20 -waveform {0 3} [get_nets {clk_100ms}]
create_clock -name myclk2 -period 20 -waveform {0 2} [get_nets {U1/dclk}]
create_clock -name myclk -period 15 -waveform {0 5} [get_ports {clk}]
create_clock -name clk_01 -period 20 -waveform {0 2} [get_nets {clk_01ms}]
create_generated_clock -name genclk1 -source [get_ports {clk}] -master_clock myclk -divide_by 3 -invert -add [get_nets {clk_5ms}]
set_clock_latency -source -late 0.5 [get_clocks {myclk}] 
set_clock_groups -asynchronous -group [get_clocks {myclk}] -group [get_clocks {genclk1}]
set_false_path -from [get_clocks {myclk2}] -to [get_clocks {myclk}]  -hold
report_timing -setup -from_clock [get_clocks {myclk}] -to_clock [get_clocks {myclk}] -max_paths 50 -max_common_paths 1
