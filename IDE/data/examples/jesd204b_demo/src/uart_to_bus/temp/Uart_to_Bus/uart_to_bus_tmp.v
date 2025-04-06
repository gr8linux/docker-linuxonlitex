//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.10.01
//Part Number: GW5AST-LV138FPG676AES
//Device: GW5AST-138
//Device Version: B
//Created Time: Wed Aug  7 09:53:23 2024

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	Uart_to_Bus_Top your_instance_name(
		.rst_n_i(rst_n_i), //input rst_n_i
		.clk_i(clk_i), //input clk_i
		.apb0_addr_o(apb0_addr_o), //output [17:0] apb0_addr_o
		.apb0_sel_o(apb0_sel_o), //output apb0_sel_o
		.apb0_ena_o(apb0_ena_o), //output apb0_ena_o
		.apb0_wr_o(apb0_wr_o), //output apb0_wr_o
		.apb0_rdata_i(apb0_rdata_i), //input [31:0] apb0_rdata_i
		.apb0_wdata_o(apb0_wdata_o), //output [31:0] apb0_wdata_o
		.apb0_rdy_i(apb0_rdy_i), //input apb0_rdy_i
		.apb0_strb_o(apb0_strb_o), //output [3:0] apb0_strb_o
		.apb1_addr_o(apb1_addr_o), //output [17:0] apb1_addr_o
		.apb1_sel_o(apb1_sel_o), //output apb1_sel_o
		.apb1_ena_o(apb1_ena_o), //output apb1_ena_o
		.apb1_wr_o(apb1_wr_o), //output apb1_wr_o
		.apb1_rdata_i(apb1_rdata_i), //input [31:0] apb1_rdata_i
		.apb1_wdata_o(apb1_wdata_o), //output [31:0] apb1_wdata_o
		.apb1_rdy_i(apb1_rdy_i), //input apb1_rdy_i
		.apb1_strb_o(apb1_strb_o), //output [3:0] apb1_strb_o
		.apb2_addr_o(apb2_addr_o), //output [17:0] apb2_addr_o
		.apb2_sel_o(apb2_sel_o), //output apb2_sel_o
		.apb2_ena_o(apb2_ena_o), //output apb2_ena_o
		.apb2_wr_o(apb2_wr_o), //output apb2_wr_o
		.apb2_rdata_i(apb2_rdata_i), //input [31:0] apb2_rdata_i
		.apb2_wdata_o(apb2_wdata_o), //output [31:0] apb2_wdata_o
		.apb2_rdy_i(apb2_rdy_i), //input apb2_rdy_i
		.apb2_strb_o(apb2_strb_o), //output [3:0] apb2_strb_o
		.uart_rx_led_o(uart_rx_led_o), //output uart_rx_led_o
		.uart_tx_led_o(uart_tx_led_o), //output uart_tx_led_o
		.uart_rx_i(uart_rx_i), //input uart_rx_i
		.uart_tx_o(uart_tx_o) //output uart_tx_o
	);

//--------Copy end-------------------
