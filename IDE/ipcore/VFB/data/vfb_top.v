// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2023 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] vfb_top.v
//   \ \  / /\ \  / /    [Description ] Video frame buffer 
//    \ \/ /  \ \/ /     [Timestamp   ] Friday October 30 14:00:30 2020
//     \  /    \  /      [version     ] 2.3
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 10/30/20     | Initial version 
// ----------------------------------------------------------------------------------
// V2.0    | Caojie     | 06/21/23     | Support DDR3 no burst number mode 
// ----------------------------------------------------------------------------------
// V2.3    | Caojie     | 01/05/24     | Support SDRAM memory type 
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

`timescale 1ns / 1ps

`include "top_define.v"
`include "static_macro_define.v"
`include "vfb_defines.v"
    
module `module_name #
(   
    parameter IMAGE_SIZE          = `DEF_IMAGE_SIZE        ,//2^23*16=128Mbit  //frame base address
    parameter BURST_WRITE_LENGTH  = `DEF_BURST_WRITE_LENGTH,  
    parameter BURST_READ_LENGTH   = `DEF_BURST_READ_LENGTH ,          
    parameter ADDR_WIDTH          = `DEF_ADDR_WIDTH        ,
    parameter DATA_WIDTH          = `DEF_SRAM_DATA_WIDTH   ,
    parameter WR_VIDEO_WIDTH      = `DEF_WR_VIDEO_WIDTH    ,
    parameter RD_VIDEO_WIDTH      = `DEF_RD_VIDEO_WIDTH
)
( 
    input                       I_rst_n       ,
    input                       I_dma_clk     ,
`ifdef USE_THREE_FRAME_BUFFER 
    input  [0:0]                I_wr_halt     , //1:halt,  0:no halt
    input  [0:0]                I_rd_halt     , //1:halt,  0:no halt
`endif    
    // video data input                          
    input                       I_vin0_clk    ,
    input                       I_vin0_vs_n   ,
    input                       I_vin0_de     ,
    input  [WR_VIDEO_WIDTH-1:0] I_vin0_data   ,  
    output                      O_vin0_fifo_full  ,	
    // video data output                    
    input                       I_vout0_clk   ,
    input                       I_vout0_vs_n  ,
    input                       I_vout0_de    ,
    output                      O_vout0_den   ,
    output [RD_VIDEO_WIDTH-1:0] O_vout0_data  ,
    output                      O_vout0_fifo_empty,
`ifdef MEM_DDR3     
    input                       I_cmd_ready          ,
    output [2:0]                O_cmd                ,//0:write;  1:read
    output                      O_cmd_en             ,
    `ifdef BURST_NUMBER_ENABLE 
    output [5:0]                O_app_burst_number   ,
    `endif 
    output [ADDR_WIDTH-1:0]     O_addr               ,//[ADDR_WIDTH-1:0]
    input                       I_wr_data_rdy        ,
    output                      O_wr_data_en         ,//
    output                      O_wr_data_end        ,//
    output [DATA_WIDTH-1:0]     O_wr_data            ,//[DATA_WIDTH-1:0]
    output [DATA_WIDTH/8-1:0]   O_wr_data_mask       ,
    input                       I_rd_data_valid      ,
    input                       I_rd_data_end        ,//unused 
    input  [DATA_WIDTH-1:0]     I_rd_data            ,//[DATA_WIDTH-1:0]
    input                       I_init_calib_complete  
`endif 
`ifdef MEM_PSRAM
    output                      O_cmd             ,
    output                      O_cmd_en          ,
    output [ADDR_WIDTH-1:0]     O_addr            ,//[ADDR_WIDTH-1:0]
    output [DATA_WIDTH-1:0]     O_wr_data         ,//[DATA_WIDTH-1:0]
    output [DATA_WIDTH/8-1:0]   O_data_mask       ,
    input                       I_rd_data_valid   ,
    input  [DATA_WIDTH-1:0]     I_rd_data         ,//[DATA_WIDTH-1:0]
    input                       I_init_calib       
`endif 
`ifdef MEM_HYPERRAM
    output                      O_cmd             ,
    output                      O_cmd_en          ,
    output [ADDR_WIDTH-1:0]     O_addr            ,//[ADDR_WIDTH-1:0]
    output [DATA_WIDTH-1:0]     O_wr_data         ,//[DATA_WIDTH-1:0]
    output [DATA_WIDTH/8-1:0]   O_data_mask       ,
    input                       I_rd_data_valid   ,
    input  [DATA_WIDTH-1:0]     I_rd_data         ,//[DATA_WIDTH-1:0]
    input                       I_init_calib       
`endif 
`ifdef MEM_SDRAM
    input                       I_sdrc_busy_n     ,//cmd_ready
    output                      O_sdrc_wr_n       ,
    output                      O_sdrc_rd_n       ,
    output [ADDR_WIDTH-1:0]     O_sdrc_addr       ,//[ADDR_WIDTH-1:0]
    output [7:0]                O_sdrc_data_len   ,//
    output [DATA_WIDTH-1:0]     O_sdrc_data       ,//[DATA_WIDTH-1:0]
    output [DATA_WIDTH/8-1:0]   O_sdrc_dqm        ,
    input                       I_sdrc_rd_valid   ,
    input  [DATA_WIDTH-1:0]     I_sdrc_data_out   ,//[DATA_WIDTH-1:0]
    input                       I_sdrc_init_done     
`endif 
);

//==================================================================  
`ifdef MEM_DDR3 
    `getname(vfb_ddr3_wrapper,`module_name) #
    (
        .IMAGE_SIZE        (IMAGE_SIZE        ),     
        .BURST_WRITE_LENGTH(BURST_WRITE_LENGTH),
        .BURST_READ_LENGTH (BURST_READ_LENGTH ),
        .ADDR_WIDTH        (ADDR_WIDTH        ),
        .DATA_WIDTH        (DATA_WIDTH        ),
        .WR_VIDEO_WIDTH    (WR_VIDEO_WIDTH    ),
        .RD_VIDEO_WIDTH    (RD_VIDEO_WIDTH    )
    )
    vfb_ddr3_wrapper_inst
    ( 
        .I_rst_n              (I_rst_n              ),//rst_n            ),
        .I_dma_clk            (I_dma_clk            ),   //sram_clk         ),
    `ifdef USE_THREE_FRAME_BUFFER 
        .I_wr_halt            (I_wr_halt            ), //1:halt,  0:no halt
        .I_rd_halt            (I_rd_halt            ), //1:halt,  0:no halt
    `endif
        // video data input                       
        .I_vin0_clk           (I_vin0_clk           ),
        .I_vin0_vs_n          (I_vin0_vs_n          ),
        .I_vin0_de            (I_vin0_de            ),
        .I_vin0_data          (I_vin0_data          ),
        .O_vin0_fifo_full     (O_vin0_fifo_full     ),
        // video data output                        
        .I_vout0_clk          (I_vout0_clk          ),
        .I_vout0_vs_n         (I_vout0_vs_n         ),
        .I_vout0_de           (I_vout0_de           ),
        .O_vout0_den          (O_vout0_den          ),
        .O_vout0_data         (O_vout0_data         ),
        .O_vout0_fifo_empty   (O_vout0_fifo_empty   ),
        // ddr write request
        .I_cmd_ready          (I_cmd_ready          ),
        .O_cmd                (O_cmd                ),//0:write;  1:read
        .O_cmd_en             (O_cmd_en             ),
    `ifdef BURST_NUMBER_ENABLE 
        .O_app_burst_number   (O_app_burst_number   ),
    `endif
        .O_addr               (O_addr               ),//[ADDR_WIDTH-1:0]
        .I_wr_data_rdy        (I_wr_data_rdy        ),
        .O_wr_data_en         (O_wr_data_en         ),//
        .O_wr_data_end        (O_wr_data_end        ),//
        .O_wr_data            (O_wr_data            ),//[DATA_WIDTH-1:0]
        .O_wr_data_mask       (O_wr_data_mask       ),
        .I_rd_data_valid      (I_rd_data_valid      ),
        .I_rd_data_end        (I_rd_data_end        ),//unused 
        .I_rd_data            (I_rd_data            ),//[DATA_WIDTH-1:0]
        .I_init_calib_complete(I_init_calib_complete)
    ); 
`endif 

`ifdef MEM_PSRAM
    `getname(vfb_psram_wrapper,`module_name) #
    (
        .IMAGE_SIZE        (IMAGE_SIZE        ),     
        .BURST_WRITE_LENGTH(BURST_WRITE_LENGTH),
        .BURST_READ_LENGTH (BURST_READ_LENGTH ),
        .ADDR_WIDTH        (ADDR_WIDTH        ),
        .DATA_WIDTH        (DATA_WIDTH        ),
        .WR_VIDEO_WIDTH    (WR_VIDEO_WIDTH    ),
        .RD_VIDEO_WIDTH    (RD_VIDEO_WIDTH    )
    )
    vfb_top_inst
    ( 
        .I_rst_n            (I_rst_n           ),//rst_n            ),
        .I_dma_clk          (I_dma_clk         ), //sram_clk         ),
    `ifdef USE_THREE_FRAME_BUFFER 
        .I_wr_halt          (I_wr_halt         ), //1:halt,  0:no halt
        .I_rd_halt          (I_rd_halt         ), //1:halt,  0:no halt
    `endif
        // video data input           
        .I_vin0_clk         (I_vin0_clk        ),
        .I_vin0_vs_n        (I_vin0_vs_n       ),
        .I_vin0_de          (I_vin0_de         ),
        .I_vin0_data        (I_vin0_data       ),
        .O_vin0_fifo_full   (O_vin0_fifo_full  ),
        // video data output          
        .I_vout0_clk        (I_vout0_clk       ),
        .I_vout0_vs_n       (I_vout0_vs_n      ),
        .I_vout0_de         (I_vout0_de        ),
        .O_vout0_den        (O_vout0_den       ),
        .O_vout0_data       (O_vout0_data      ),
        .O_vout0_fifo_empty (O_vout0_fifo_empty),
        // ddr write request
        .O_cmd              (O_cmd             ),
        .O_cmd_en           (O_cmd_en          ),
        .O_addr             (O_addr            ),//[ADDR_WIDTH-1:0]
        .O_wr_data          (O_wr_data         ),//[DATA_WIDTH-1:0]
        .O_data_mask        (O_data_mask       ),
        .I_rd_data_valid    (I_rd_data_valid   ),
        .I_rd_data          (I_rd_data         ),//[DATA_WIDTH-1:0]
        .I_init_calib       (I_init_calib      )
    );  
`endif  

`ifdef MEM_HYPERRAM
    `getname(vfb_hyperram_wrapper,`module_name) #
    (
        .IMAGE_SIZE        (IMAGE_SIZE        ),     
        .BURST_WRITE_LENGTH(BURST_WRITE_LENGTH),
        .BURST_READ_LENGTH (BURST_READ_LENGTH ),
        .ADDR_WIDTH        (ADDR_WIDTH        ),
        .DATA_WIDTH        (DATA_WIDTH        ),
        .WR_VIDEO_WIDTH    (WR_VIDEO_WIDTH    ),
        .RD_VIDEO_WIDTH    (RD_VIDEO_WIDTH    )
    )
    vfb_hyperram_wrapper_inst
    (
        .I_rst_n            (I_rst_n          ),//rst_n            ),
        .I_dma_clk          (I_dma_clk        ),   //sram_clk         ),
    `ifdef USE_THREE_FRAME_BUFFER     
        .I_wr_halt          (I_wr_halt        ), //1:halt,  0:no halt
        .I_rd_halt          (I_rd_halt        ), //1:halt,  0:no halt
    `endif    
        // video data input                   
        .I_vin0_clk         (I_vin0_clk       ),
        .I_vin0_vs_n        (I_vin0_vs_n      ),
        .I_vin0_de          (I_vin0_de        ),
        .I_vin0_data        (I_vin0_data      ),
        .O_vin0_fifo_full   (O_vin0_fifo_full ),
        // video data output                  
        .I_vout0_clk        (I_vout0_clk      ),
        .I_vout0_vs_n       (I_vout0_vs_n     ),
        .I_vout0_de         (I_vout0_de       ),
        .O_vout0_den        (O_vout0_den      ),
        .O_vout0_data       (O_vout0_data     ),
        .O_vout0_fifo_empty (O_vout0_fifo_empty),
        // ddr write request
        .O_cmd              (O_cmd            ),
        .O_cmd_en           (O_cmd_en         ),
        .O_addr             (O_addr           ),//[ADDR_WIDTH-1:0]
        .O_wr_data          (O_wr_data        ),//[DATA_WIDTH-1:0]
        .O_data_mask        (O_data_mask      ),
        .I_rd_data_valid    (I_rd_data_valid  ),
        .I_rd_data          (I_rd_data        ),//[DATA_WIDTH-1:0]
        .I_init_calib       (I_init_calib     )
    ); 
`endif

`ifdef MEM_SDRAM
    `getname(vfb_sdram_wrapper,`module_name) # 
    (
        .IMAGE_SIZE         (IMAGE_SIZE         ),  //frame base address
        .BURST_WRITE_LENGTH (BURST_WRITE_LENGTH ),  
        .BURST_READ_LENGTH  (BURST_READ_LENGTH  ),   
        .DATA_WIDTH         (DATA_WIDTH         ),    
        .ADDR_WIDTH         (ADDR_WIDTH         ),  
        .WR_VIDEO_WIDTH     (WR_VIDEO_WIDTH     ),
        .RD_VIDEO_WIDTH     (RD_VIDEO_WIDTH     )
    )
    vfb_sdram_wrapper_inst
    ( 
        .I_rst_n            (I_rst_n          ),//rst_n            ),
        .I_dma_clk          (I_dma_clk        ),   //sram_clk         ),
    `ifdef USE_THREE_FRAME_BUFFER 
        .I_wr_halt          (I_wr_halt        ), //1:halt,  0:no halt
        .I_rd_halt          (I_rd_halt        ), //1:halt,  0:no halt
    `endif
        // video data input           
        .I_vin0_clk         (I_vin0_clk        ),
        .I_vin0_vs_n        (I_vin0_vs_n       ),
        .I_vin0_de          (I_vin0_de         ),
        .I_vin0_data        (I_vin0_data       ),
        .O_vin0_fifo_full   (O_vin0_fifo_full  ),
        // video data output          
        .I_vout0_clk        (I_vout0_clk       ),
        .I_vout0_vs_n       (I_vout0_vs_n      ),
        .I_vout0_de         (I_vout0_de        ),
        .O_vout0_den        (O_vout0_den       ),
        .O_vout0_data       (O_vout0_data      ),
        .O_vout0_fifo_empty (O_vout0_fifo_empty),
        // ddr write request
        .I_sdrc_busy_n      (I_sdrc_busy_n     ),
        .O_sdrc_wr_n        (O_sdrc_wr_n       ),
        .O_sdrc_rd_n        (O_sdrc_rd_n       ),
        .O_sdrc_addr        (O_sdrc_addr       ),//[ADDR_WIDTH-1:0]
        .O_sdrc_data_len    (O_sdrc_data_len   ),
        .O_sdrc_data        (O_sdrc_data       ),//[DATA_WIDTH-1:0]
        .O_sdrc_dqm         (O_sdrc_dqm        ),
        .I_sdrc_rd_valid    (I_sdrc_rd_valid   ),
        .I_sdrc_data_out    (I_sdrc_data_out   ),//[DATA_WIDTH-1:0]
        .I_sdrc_init_done   (I_sdrc_init_done  )
    );  
`endif  

endmodule   
  