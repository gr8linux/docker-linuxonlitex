// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2023 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] SPI_Flash_Interface_Lite_Top.v
//   \ \  / /\ \  / /    [Description ] SPI_Flash_Interface_Lite_Top
//    \ \/ /  \ \/ /     [Timestamp   ] Friday November 11 14:00:30 2022
//     \  /    \  /      [version     ] 1.0
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 11/11/22     | Initial version 
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

`include "top_define.v"
`include "static_macro_define.v"
`include "spiflash_const_defines.v"

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
    
    output        O_flash_ck     ,
    output        O_flash_cs_n   ,
    inout         IO_flash_hold_n,//IO3
    inout         IO_flash_wp_n  ,//IO2
    inout         IO_flash_do    ,//IO1
    inout         IO_flash_di     //IO0
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

wire        spi_hold_n_in ;
wire        spi_wp_n_in   ;
//===================================================
//SPI Nor Flash Controller
`getname(spiflash,`module_name) spiflash_inst
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


assign  IO_flash_do = spi_miso_oe  ? spi_miso_out  : 1'bz;
assign  spi_miso_in = IO_flash_do; //

assign  IO_flash_di = spi_mosi_out;
assign  spi_mosi_in = IO_flash_di;

assign  IO_flash_hold_n = 1'b1  ? 1'b1  : 1'bz;
assign  spi_hold_n_in   = IO_flash_hold_n;

assign  IO_flash_wp_n   = 1'b1  ? 1'b1  : 1'bz;
assign  spi_wp_n_in     = IO_flash_wp_n;

endmodule

