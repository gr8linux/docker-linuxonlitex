// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] SPI_Nor_Flash_Interface_Top.v
//   \ \  / /\ \  / /    [Description ] SPI_Nor_Flash_Interface_Top
//    \ \/ /  \ \/ /     [Timestamp   ] Tuesday August 4 14:00:30 2020
//     \  /    \  /      [version     ] 1.1
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 08/04/20     | Initial version 
// ----------------------------------------------------------------------------------
// V1.1    | Caojie     | 10/20/20     | 1.FIFO replace; 2.IO_flash_di inout change to output
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

`include "top_define.v"
`include "static_macro_define.v"
`include "spinorflash_defines.v"
`include "spinorflash_const_defines.v"

module `module_name  
(
		input         I_hclk,
		input         I_hresetn,
		input  [31:0] I_haddr_reg,
		output [31:0] O_hrdata_reg,
		input         I_hreadyin_reg,
		output        O_hreadyout_reg,
		output  [1:0] O_hresp_reg,
		input         I_hsel_reg,
		input   [1:0] I_htrans_reg,
		input  [31:0] I_hwdata_reg,
		input         I_hwrite_reg,
`ifdef STANDARD_MODE	
	`ifdef AHB_MEM_SUPPORT
		input  [31:0] I_haddr_mem,
		output [31:0] O_hrdata_mem,
		input         I_hreadyin_mem,
		output        O_hreadyout_mem,
		output  [1:0] O_hresp_mem,
		input         I_hsel_mem,
		input   [1:0] I_htrans_mem,
		input         I_hwrite_mem,
	`endif
		input         I_spi_clock,
		input         I_spi_rstn,
`endif
		output        O_flash_ck  ,
		output        O_flash_cs_n,
		inout         IO_flash_do ,
		output        IO_flash_di 
);

//===================================================
wire        spi_clk_out;
wire        spi_cs_n_out;
wire        spi_miso_in;
wire        spi_miso_oe;
wire        spi_miso_out;
wire        spi_mosi_in;
wire        spi_mosi_oe;
wire        spi_mosi_out;

//===================================================
//SPI Nor Flash Controller
`getname(spinorflash,`module_name) spinorflash_inst
(
	.hclk         (I_hclk), 
	.hresetn      (I_hresetn),
	.haddr_reg    (I_haddr_reg),
	.hrdata_reg   (O_hrdata_reg),
	.hreadyin_reg (I_hreadyin_reg),
	.hreadyout_reg(O_hreadyout_reg),
	.hresp_reg    (O_hresp_reg),
	.hsel_reg     (I_hsel_reg),
	.htrans_reg   (I_htrans_reg),
	.hwdata_reg   (I_hwdata_reg),
	.hwrite_reg   (I_hwrite_reg),
	
`ifdef STANDARD_MODE	
	`ifdef AHB_MEM_SUPPORT	
		.haddr_mem    (I_haddr_mem),
		.hrdata_mem   (O_hrdata_mem),
		.hreadyin_mem (I_hreadyin_mem),
		.hreadyout_mem(O_hreadyout_mem),
		.hresp_mem    (O_hresp_mem),
		.hsel_mem     (I_hsel_mem),
		.htrans_mem   (I_htrans_mem),
		.hwrite_mem   (I_hwrite_mem),
	`endif
		.spi_default_mode3(1'b0), //0:sclk low in idle; 1:sclk high in idle
		.spi_clock    (I_spi_clock),
		.spi_rstn     (I_spi_rstn),
`endif

	.spi_clk_out  (spi_clk_out),
	.spi_cs_n_out (spi_cs_n_out),
	.spi_miso_in  (spi_miso_in),
	.spi_miso_oe  (spi_miso_oe),
	.spi_miso_out (spi_miso_out),
	.spi_mosi_in  (spi_mosi_in),
	.spi_mosi_oe  (spi_mosi_oe),
	.spi_mosi_out (spi_mosi_out)
);

//-----------------------------------------------------------
assign  O_flash_ck	 = spi_clk_out;
assign  O_flash_cs_n = spi_cs_n_out;


assign  IO_flash_do = spi_miso_oe  ? spi_miso_out  : 1'bz; //1'b0
assign  spi_miso_in = IO_flash_do; //

assign  IO_flash_di = spi_mosi_out;
// assign  IO_flash_di = spi_mosi_oe  ? spi_mosi_out  : 1'bz; //1'b1
// assign  spi_mosi_in = IO_flash_di;

endmodule

