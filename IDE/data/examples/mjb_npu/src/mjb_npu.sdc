
create_clock -name pri_fclk -period 12.5 -waveform {0 6.25} [get_nets {pri_fclk90}]
create_clock -name prifclk80 -period 12.5 -waveform {0 6.25} [get_nets {pri_fclk}]
create_clock -name dviclk -period 13.441 -waveform {0 6.721} [get_pins {u_DVI_out/u_serializer10bit/u_CLKDIV/CLKOUT}]
create_clock -name q_reset_n -period 10 -waveform {0 5} [get_nets {q_reset_n}]
create_clock -name PIXCLK -period 10 -waveform {0 5} [get_ports {PIXCLK}]
create_clock -name mcu_clk -period 25 -waveform {0 12.5} [get_pins {u_CLKDIV/CLKOUT}]
set_clock_groups -exclusive -group [get_clocks {PIXCLK}] -group [get_clocks {q_reset_n}] -group [get_clocks {mcu_clk}] -group [get_clocks {dviclk}] -group [get_clocks {pri_fclk}] -group [get_clocks {prifclk80}]
