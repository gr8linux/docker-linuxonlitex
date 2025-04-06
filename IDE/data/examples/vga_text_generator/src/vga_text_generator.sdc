
create_clock -name myclk -period 20 -waveform {0 10} [get_ports {clk}]
set_clock_latency -source 2 [get_clocks {myclk}]
report_timing -setup -from_clock [get_clocks {myclk}] -to_clock [get_clocks {myclk}] -max_paths 30 -max_common_paths 1
