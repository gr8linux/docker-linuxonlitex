// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2023 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] SPI_Flash_Interface_Top.v
//   \ \  / /\ \  / /    [Description ] SPI_Flash_Interface_Top
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
`include "spiflash_defines.v"
`include "spiflash_const_defines.v"

module `module_name 
(
`ifdef REG_AHB
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
`endif

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

`ifdef REG_APB
    input         I_pclk,
    input         I_presetn,
    input  [31:0] I_paddr,
    input         I_penable,
    output [31:0] O_prdata,
    output        O_pready,
    input         I_psel,
    input  [31:0] I_pwdata,
    input         I_pwrite,
`endif

    input         I_spi_clock    ,
    input         I_spi_rstn     ,

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

`ifdef QUADSPI_SUPPORT
wire        spi_hold_n_in ;
wire        spi_hold_n_oe ;
wire        spi_hold_n_out;
wire        spi_wp_n_in   ;
wire        spi_wp_n_oe   ;
wire        spi_wp_n_out  ;
`else
wire        spi_hold_n_in ;
wire        spi_wp_n_in   ;
`endif

//===================================================
//SPI Nor Flash Controller
`getname(spiflash,`module_name) spiflash_inst
(
`ifdef REG_AHB
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
`endif

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

`ifdef REG_APB
    .pclk         (I_pclk      ),
    .presetn      (I_presetn   ),
    .paddr        (I_paddr     ),
    .penable      (I_penable   ),
    .prdata       (O_prdata    ),
    .pready       (O_pready    ),
    .psel         (I_psel      ),
    .pwdata       (I_pwdata    ),
    .pwrite       (I_pwrite    ),
`endif

    .spi_default_mode3(1'b0), //0:sclk low in idle; 1:sclk high in idle

`ifdef QUADSPI_SUPPORT
    .spi_hold_n_in (spi_hold_n_in ),
    .spi_hold_n_oe (spi_hold_n_oe ),
    .spi_hold_n_out(spi_hold_n_out),
    .spi_wp_n_in   (spi_wp_n_in   ),
    .spi_wp_n_oe   (spi_wp_n_oe   ),
    .spi_wp_n_out  (spi_wp_n_out  ),
`endif
    
    .spi_clock    (I_spi_clock),
    .spi_rstn     (I_spi_rstn),
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

`ifdef QUADSPI_SUPPORT
    assign  IO_flash_do = spi_miso_oe  ? spi_miso_out  : 1'bz; //1'b0
    assign  spi_miso_in = IO_flash_do; //
    
    assign  IO_flash_di = spi_mosi_oe  ? spi_mosi_out  : 1'bz; //1'b1
    assign  spi_mosi_in = IO_flash_di;
    
    assign  IO_flash_hold_n = spi_hold_n_oe  ? spi_hold_n_out  : 1'bz;
    assign  spi_hold_n_in   = IO_flash_hold_n;
    
    assign  IO_flash_wp_n   = spi_wp_n_oe  ? spi_wp_n_out  : 1'bz;
    assign  spi_wp_n_in     = IO_flash_wp_n;
`elsif DUALSPI_SUPPORT
    assign  IO_flash_do = spi_miso_oe  ? spi_miso_out  : 1'bz; //1'b0
    assign  spi_miso_in = IO_flash_do; //
    
    assign  IO_flash_di = spi_mosi_oe  ? spi_mosi_out  : 1'bz; //1'b1
    assign  spi_mosi_in = IO_flash_di;
    
    assign  IO_flash_hold_n = 1'b1  ? 1'b1  : 1'bz;
    assign  spi_hold_n_in   = IO_flash_hold_n;
    
    assign  IO_flash_wp_n   = 1'b1  ? 1'b1  : 1'bz;
    assign  spi_wp_n_in     = IO_flash_wp_n;
`else
    assign  IO_flash_do = spi_miso_oe  ? spi_miso_out  : 1'bz; 
    assign  spi_miso_in = IO_flash_do; //
    
    assign  IO_flash_di = spi_mosi_out; 
    assign  spi_mosi_in = IO_flash_di;
    
    assign  IO_flash_hold_n = 1'b1  ? 1'b1  : 1'bz;
    assign  spi_hold_n_in   = IO_flash_hold_n;
    
    assign  IO_flash_wp_n   = 1'b1  ? 1'b1  : 1'bz;
    assign  spi_wp_n_in     = IO_flash_wp_n;
`endif

endmodule

