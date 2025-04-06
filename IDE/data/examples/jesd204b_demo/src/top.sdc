
create_clock -name w_sys_clk -period 10 -waveform {0 5} [get_nets {w_sys_clk}]
create_clock -name tck_pad_i -period 50 -waveform {0 25} [get_ports {tck_pad_i}]
create_clock -name i_clk -period 20 -waveform {0 10} [get_ports {i_clk}]
create_generated_clock -name w_clk10m -source [get_ports {i_clk}] -master_clock i_clk -divide_by 80 -multiply_by 16 [get_nets {w_clk10m}]
set_clock_groups -asynchronous -group [get_clocks {tck_pad_i}] -group [get_clocks {w_sys_clk}] -group [get_clocks {i_clk}] -group [get_clocks {w_clk10m}]
