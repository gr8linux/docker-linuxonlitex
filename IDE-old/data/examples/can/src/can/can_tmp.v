//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: V1.9.9 Beta-1
//Part Number: GW2A-LV18PG256C8/I7
//Device: GW2A-18
//Created Time: Sat May  6 11:06:47 2023

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	can_top your_instance_name(
		.sysclk(sysclk_i), //input sysclk
		.canclk(canclk_i), //input canclk
		.ponrst_n(ponrst_n_i), //input ponrst_n
		.cfgstrp_clkdiv(cfgstrp_clkdiv_i), //input [7:0] cfgstrp_clkdiv
		.cbus_rxd(cbus_rxd_i), //input cbus_rxd
		.cbus_txd(cbus_txd_o), //output cbus_txd
		.cpu_cs(cpu_cs_i), //input cpu_cs
		.cpu_read(cpu_read_i), //input cpu_read
		.cpu_write(cpu_write_i), //input cpu_write
		.cpu_addr(cpu_addr_i), //input [31:0] cpu_addr
		.cpu_wdat(cpu_wdat_i), //input [31:0] cpu_wdat
		.cpu_rdat(cpu_rdat_o), //output [31:0] cpu_rdat
		.cpu_ack(cpu_ack_o), //output cpu_ack
		.cpu_err(cpu_err_o), //output cpu_err
		.int_o(int_o_o) //output int_o
	);

//--------Copy end-------------------
