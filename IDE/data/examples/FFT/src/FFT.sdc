
create_clock -name clk_in -period 20 -waveform {0 10} [get_ports {clk}]
report_timing -setup -from_clock [get_clocks {clk_in}] -to_clock [get_clocks {clk_in}]
report_timing -hold -from_clock [get_clocks {clk_in}] -to_clock [get_clocks {clk_in}]
report_timing -recovery -from_clock [get_clocks {clk_in}] -to_clock [get_clocks {clk_in}]
report_timing -removal -from_clock [get_clocks {clk_in}] -to_clock [get_clocks {clk_in}]
