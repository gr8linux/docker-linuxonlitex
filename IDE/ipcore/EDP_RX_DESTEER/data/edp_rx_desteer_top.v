// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2024 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] edp_rx_desteer_top.v
//   \ \  / /\ \  / /    [Description ] EDP RX Desteer Top
//    \ \/ /  \ \/ /     [Timestamp   ] Friday Aug 26 14:00:30 2022
//     \  /    \  /      [version     ] 2.0
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     |  8/26/22     | Initial version 
// ----------------------------------------------------------------------------------
// V1.1    | Caojie     |  2/19/24     | Add double pixel per lane mode 
// ----------------------------------------------------------------------------------
// V2.0    | Caojie     |  3/19/24     | Add Synchronization Type option 
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

`include "top_define.v"
`include "static_macro_define.v"
`include "edp_rx_desteer_defines.v"

module `module_name #
(
    parameter FIFO_WDEPTH = `DEF_RX_DESTEER_FIFO_WDEPTH, //4096,8192,16384
    parameter VSGEN_DLY   = `DEF_RX_DESTEER_VSGEN_DLY  , //0~7 lines
    parameter BM          = `DEF_RX_DESTEER_BPP_COEF   , //1,2
    parameter BPP         = `DEF_RX_DESTEER_BPP        , //24 //Bits per pixel
    parameter SYM_WIDTH   = `DEF_RX_DESTEER_SYM_WIDTH    //16,32
)
( 
    input                         I_rst_n          ,//low active
    input                         I_ls_clk         ,
    input                         I_ls_vs          ,//postive
    input                         I_ls_hs          ,//postive
    input  [15:0]                 I_htotal         ,//
    input  [15:0]                 I_vtotal         ,//
    input  [15:0]                 I_hstart         ,//
    input  [15:0]                 I_vstart         ,//
    input  [15:0]                 I_hwidth         ,//
    input  [15:0]                 I_vheight        ,//
    input  [14:0]                 I_hsw            ,//
    input  [14:0]                 I_vsw            ,//
    output [15:0]                 O_vcnt_strmclk   ,
    output [15:0]                 O_hcnt_strmclk   ,
`ifdef RX_DESTEER_1_LANES 
    input  [BPP*SYM_WIDTH/16-1:0] I_unp0_data      ,// 
    input                         I_unp0_data_valid,//
    output [BPP*BM-1:0]           O_data0          ,//
`endif
`ifdef RX_DESTEER_2_LANES 
    input  [BPP*SYM_WIDTH/16-1:0] I_unp0_data      ,// 
    input                         I_unp0_data_valid,//
    input  [BPP*SYM_WIDTH/16-1:0] I_unp1_data      ,//
    input                         I_unp1_data_valid,//
    output [BPP*BM-1:0]           O_data0          ,//
    output [BPP*BM-1:0]           O_data1          ,//
`endif
`ifdef RX_DESTEER_4_LANES 
    input  [BPP*SYM_WIDTH/16-1:0] I_unp0_data      ,// 
    input                         I_unp0_data_valid,//
    input  [BPP*SYM_WIDTH/16-1:0] I_unp1_data      ,//
    input                         I_unp1_data_valid,//
    input  [BPP*SYM_WIDTH/16-1:0] I_unp2_data      ,//
    input                         I_unp2_data_valid,//
    input  [BPP*SYM_WIDTH/16-1:0] I_unp3_data      ,//
    input                         I_unp3_data_valid,//
    output [BPP*BM-1:0]           O_data0          ,//
    output [BPP*BM-1:0]           O_data1          ,//
    output [BPP*BM-1:0]           O_data2          ,//
    output [BPP*BM-1:0]           O_data3          ,//
`endif
    input                         I_strm_clk       ,//pixel clock
    output                        O_vs             ,//postive
    output                        O_hs             ,//postive
    output                        O_de              //
);

`getname(rx_desteer_wrapper,`module_name) #
(
    .FIFO_WDEPTH(FIFO_WDEPTH), //4096,8192,16384
    .VSGEN_DLY  (VSGEN_DLY  ), //0~7 lines
    .BM         (BM         ), //1,2
    .BPP        (BPP        ), //24 //Bits per pixel
    .SYM_WIDTH  (SYM_WIDTH  )  //16,32
)
rx_desteer_wrapper_inst
( 
    .I_rst_n          (I_rst_n          ),//low active
    .I_ls_clk         (I_ls_clk         ),
    .I_ls_vs          (I_ls_vs          ),//postive
    .I_ls_hs          (I_ls_hs          ),//postive
    .I_htotal         (I_htotal         ),//
    .I_vtotal         (I_vtotal         ),//
    .I_hstart         (I_hstart         ),//
    .I_vstart         (I_vstart         ),//
    .I_hwidth         (I_hwidth         ),//
    .I_vheight        (I_vheight        ),//
    .I_hsw            (I_hsw            ),//
    .I_vsw            (I_vsw            ),//
    .O_vcnt_strmclk   (O_vcnt_strmclk   ),
    .O_hcnt_strmclk   (O_hcnt_strmclk   ),
`ifdef RX_DESTEER_1_LANES     
    .I_unp0_data      (I_unp0_data      ),// 
    .I_unp0_data_valid(I_unp0_data_valid),//
    .O_data0          (O_data0          ),//
`endif
`ifdef RX_DESTEER_2_LANES     
    .I_unp0_data      (I_unp0_data      ),// 
    .I_unp0_data_valid(I_unp0_data_valid),//
    .I_unp1_data      (I_unp1_data      ),//
    .I_unp1_data_valid(I_unp1_data_valid),//
    .O_data0          (O_data0          ),//
    .O_data1          (O_data1          ),//
`endif
`ifdef RX_DESTEER_4_LANES     
    .I_unp0_data      (I_unp0_data      ),// 
    .I_unp0_data_valid(I_unp0_data_valid),//
    .I_unp1_data      (I_unp1_data      ),//
    .I_unp1_data_valid(I_unp1_data_valid),//
    .I_unp2_data      (I_unp2_data      ),//
    .I_unp2_data_valid(I_unp2_data_valid),//
    .I_unp3_data      (I_unp3_data      ),//
    .I_unp3_data_valid(I_unp3_data_valid),//
    .O_data0          (O_data0          ),//
    .O_data1          (O_data1          ),//
    .O_data2          (O_data2          ),//
    .O_data3          (O_data3          ),//
`endif
    .I_strm_clk       (I_strm_clk       ),//pixel clock
    .O_vs             (O_vs             ),//
    .O_hs             (O_hs             ),//
    .O_de             (O_de             ) //
);

endmodule

