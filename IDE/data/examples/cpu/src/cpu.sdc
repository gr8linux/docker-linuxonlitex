
create_clock -name myclk -period 25 -waveform {0 5} [get_ports {clk}]
create_clock -name myclk1 -period 20 -waveform {0 3} [get_ports {tck_pad_i}]
set_false_path -to [get_regs {gw_gao_inst_0/u_la0_top/u_ao_match_0/trig_dly_in_0_s0}] 
report_timing -setup -from_clock [get_clocks {myclk}] -to_clock [get_clocks {myclk}] -max_paths 25 -max_common_paths 1
report_timing -hold -from_clock [get_clocks {myclk}] -to_clock [get_clocks {myclk}] -max_paths 25 -max_common_paths 1
report_timing -recovery -from_clock [get_clocks {myclk}] -to_clock [get_clocks {myclk}] -max_paths 25 -max_common_paths 1
report_timing -removal -from_clock [get_clocks {myclk}] -to_clock [get_clocks {myclk}] -max_paths 25 -max_common_paths 1
