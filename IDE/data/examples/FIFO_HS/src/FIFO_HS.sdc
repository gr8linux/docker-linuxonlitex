create_clock -name clk -period 20 -waveform {0 10} [get_ports {clk}]
create_clock -name tck_pad_i -period 25 -waveform {0 20} [get_ports {tck_pad_i}]
set_clock_groups -asynchronous -group [get_clocks {clk}] -group [get_clocks {tck_pad_i}] 
report_timing -setup -from_clock [get_clocks {clk}] -to_clock [get_clocks {clk}] -max_paths 100 -max_common_paths 1
