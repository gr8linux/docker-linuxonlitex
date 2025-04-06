// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2024 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] edp_decoder_top.v
//   \ \  / /\ \  / /    [Description ] EDP_Decoder_Top
//    \ \/ /  \ \/ /     [Timestamp   ] Friday Aug 26 14:00:30 2022
//     \  /    \  /      [version     ] 2.2
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     |  8/26/22     | Initial version 
// ----------------------------------------------------------------------------------
// V2.0    | Caojie     |  2/19/24     | Modify name to decoder 
// ----------------------------------------------------------------------------------
// V2.1    | Caojie     |  4/08/24     | add tps done signals
// ----------------------------------------------------------------------------------
// V2.2    | Xiaohui    |  11/15/24    | add tps3  
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

`include "top_define.v"
`include "static_macro_define.v"
`include "edp_decoder_defines.v"

module `module_name #
(
    parameter BPP       = `DEF_RX_BPP      , //18,24,30,36,48 //Bits per pixel
    parameter SYM_WIDTH = `DEF_RX_SYM_WIDTH
)
( 
    input                         I_rst_n          ,//low active
    input                         I_ls_clk         ,
`ifdef RX_TPS1_ENABLE      
    input                         I_tps1_en        ,
`endif 
`ifdef RX_TPS2_ENABLE     
    input                         I_tps2_en        ,
`endif  
`ifdef RX_TPS3_ENABLE     
    input                         I_tps3_en        ,
`endif     
    input                         I_frame_type     ,//0:normal_frame  1:enhanced_frame
    input                         I_scrm_value     ,//0:DP rst value 0xffff  1:eDP rst value 0xfffe
    output [7:0]                  O_vb_id          ,
    output [7:0]                  O_mvid70         ,
    output [7:0]                  O_maud70         ,
    output [23:0]                 O_mvid           ,//
    output [23:0]                 O_nvid           ,//
    output [15:0]                 O_htotal         ,//
    output [15:0]                 O_vtotal         ,//
    output [15:0]                 O_hstart         ,//
    output [15:0]                 O_vstart         ,//
    output [15:0]                 O_hwidth         ,//
    output [15:0]                 O_vheight        ,//
    output [14:0]                 O_hsw            ,//
    output [14:0]                 O_vsw            ,//
    output                        O_hsp            ,//
    output                        O_vsp            ,//
    output [7:0]                  O_misc0          ,//
    output [7:0]                  O_misc1          ,//
    output                        O_ls_vs          ,
    output                        O_ls_hs          ,
`ifdef RX_1_LANES 
    input  [SYM_WIDTH/8-1:0]      I_kcode0         ,//
    input  [SYM_WIDTH-1:0]        I_data0          ,//low byte first
    `ifdef RX_TPS1_ENABLE 
    output                        O_rx0_tps1_done  ,
    output                        O_rx0_tps1_ok    ,
    `endif 
    `ifdef RX_TPS2_ENABLE 
    output                        O_rx0_tps2_done  ,
    output                        O_rx0_tps2_ok    ,
    `endif
    `ifdef RX_TPS3_ENABLE 
    output                        O_rx0_tps3_done  ,
    output                        O_rx0_tps3_ok    ,
    `endif
    output [BPP*SYM_WIDTH/16-1:0] O_unp0_data      ,// 
    output                        O_unp0_data_valid //low byte first
`endif
`ifdef RX_2_LANES 
    input  [SYM_WIDTH/8-1:0]      I_kcode0         ,//
    input  [SYM_WIDTH-1:0]        I_data0          ,//low byte first
    input  [SYM_WIDTH/8-1:0]      I_kcode1         ,//
    input  [SYM_WIDTH-1:0]        I_data1          ,//
    `ifdef RX_TPS1_ENABLE 
    output                        O_rx0_tps1_done  ,
    output                        O_rx0_tps1_ok    ,
    output                        O_rx1_tps1_done  ,
    output                        O_rx1_tps1_ok    ,
    `endif 
    `ifdef RX_TPS2_ENABLE 
    output                        O_rx0_tps2_done  ,
    output                        O_rx0_tps2_ok    ,
    output                        O_rx1_tps2_done  ,
    output                        O_rx1_tps2_ok    ,
    `endif
    `ifdef RX_TPS3_ENABLE 
    output                        O_rx0_tps3_done  ,
    output                        O_rx0_tps3_ok    ,
    output                        O_rx1_tps3_done  ,
    output                        O_rx1_tps3_ok    ,
    `endif
    output [BPP*SYM_WIDTH/16-1:0] O_unp0_data      ,// 
    output                        O_unp0_data_valid,//low byte first
    output [BPP*SYM_WIDTH/16-1:0] O_unp1_data      ,//
    output                        O_unp1_data_valid //
`endif
`ifdef RX_4_LANES 
    input  [SYM_WIDTH/8-1:0]      I_kcode0         ,//
    input  [SYM_WIDTH-1:0]        I_data0          ,//low byte first
    input  [SYM_WIDTH/8-1:0]      I_kcode1         ,//
    input  [SYM_WIDTH-1:0]        I_data1          ,//
    input  [SYM_WIDTH/8-1:0]      I_kcode2         ,//
    input  [SYM_WIDTH-1:0]        I_data2          ,//
    input  [SYM_WIDTH/8-1:0]      I_kcode3         ,//
    input  [SYM_WIDTH-1:0]        I_data3          ,//
    `ifdef RX_TPS1_ENABLE 
    output                        O_rx0_tps1_done  ,
    output                        O_rx0_tps1_ok    ,
    output                        O_rx1_tps1_done  ,
    output                        O_rx1_tps1_ok    ,
    output                        O_rx2_tps1_done  ,
    output                        O_rx2_tps1_ok    ,
    output                        O_rx3_tps1_done  ,
    output                        O_rx3_tps1_ok    ,
    `endif 
    `ifdef RX_TPS2_ENABLE 
    output                        O_rx0_tps2_done  ,
    output                        O_rx0_tps2_ok    ,
    output                        O_rx1_tps2_done  ,
    output                        O_rx1_tps2_ok    ,
    output                        O_rx2_tps2_done  ,
    output                        O_rx2_tps2_ok    ,
    output                        O_rx3_tps2_done  ,
    output                        O_rx3_tps2_ok    ,
    `endif
    `ifdef RX_TPS3_ENABLE 
    output                        O_rx0_tps3_done  ,
    output                        O_rx0_tps3_ok    ,
    output                        O_rx1_tps3_done  ,
    output                        O_rx1_tps3_ok    ,
    output                        O_rx2_tps3_done  ,
    output                        O_rx2_tps3_ok    ,
    output                        O_rx3_tps3_done  ,
    output                        O_rx3_tps3_ok    ,
    `endif
    output [BPP*SYM_WIDTH/16-1:0] O_unp0_data      ,// 
    output                        O_unp0_data_valid,//low byte first
    output [BPP*SYM_WIDTH/16-1:0] O_unp1_data      ,//
    output                        O_unp1_data_valid,//
    output [BPP*SYM_WIDTH/16-1:0] O_unp2_data      ,//
    output                        O_unp2_data_valid,//
    output [BPP*SYM_WIDTH/16-1:0] O_unp3_data      ,//
    output                        O_unp3_data_valid //
`endif
);

`getname(edp_decoder_wrapper,`module_name) #
(
    .BPP       (BPP      ), //18,24,30,36,48 //Bits per pixel
    .SYM_WIDTH (SYM_WIDTH)
)
edp_decoder_wrapper_inst
( 
    .I_rst_n          (I_rst_n          ),//low active
    .I_ls_clk         (I_ls_clk         ),
`ifdef RX_TPS1_ENABLE     
    .I_tps1_en        (I_tps1_en        ),
`endif
`ifdef RX_TPS2_ENABLE        
    .I_tps2_en        (I_tps2_en        ),
`endif  
`ifdef RX_TPS3_ENABLE        
    .I_tps3_en        (I_tps3_en        ),
`endif  
    .I_frame_type     (I_frame_type     ),//0:normal_frame  1:enhanced_frame
    .I_scrm_value     (I_scrm_value     ),//0:DP rst value 0xffff  1:eDP rst value 0xfffe
    .O_vb_id          (O_vb_id          ),
    .O_mvid70         (O_mvid70         ),
    .O_maud70         (O_maud70         ),
    .O_mvid           (O_mvid           ),//
    .O_nvid           (O_nvid           ),//
    .O_htotal         (O_htotal         ),//
    .O_vtotal         (O_vtotal         ),//
    .O_hstart         (O_hstart         ),//
    .O_vstart         (O_vstart         ),//
    .O_hwidth         (O_hwidth         ),//
    .O_vheight        (O_vheight        ),//
    .O_hsw            (O_hsw            ),//
    .O_vsw            (O_vsw            ),//
    .O_hsp            (O_hsp            ),//
    .O_vsp            (O_vsp            ),//
    .O_misc0          (O_misc0          ),//
    .O_misc1          (O_misc1          ),//
    .O_ls_vs          (O_ls_vs          ),
    .O_ls_hs          (O_ls_hs          ),
`ifdef RX_1_LANES
    .I_kcode0         (I_kcode0         ),//
    .I_data0          (I_data0          ),//
    `ifdef RX_TPS1_ENABLE 
    .O_rx0_tps1_done  (O_rx0_tps1_done  ),
    .O_rx0_tps1_ok    (O_rx0_tps1_ok    ),
    `endif
    `ifdef RX_TPS2_ENABLE  
    .O_rx0_tps2_done  (O_rx0_tps2_done  ),
    .O_rx0_tps2_ok    (O_rx0_tps2_ok    ),
    `endif
    `ifdef RX_TPS3_ENABLE  
    .O_rx0_tps3_done  (O_rx0_tps3_done  ),
    .O_rx0_tps3_ok    (O_rx0_tps3_ok    ),
    `endif
    .O_unp0_data      (O_unp0_data      ),// 
    .O_unp0_data_valid(O_unp0_data_valid) //
`endif
`ifdef RX_2_LANES
    .I_kcode0         (I_kcode0         ),//
    .I_data0          (I_data0          ),//
    .I_kcode1         (I_kcode1         ),//
    .I_data1          (I_data1          ),//
    `ifdef RX_TPS1_ENABLE 
    .O_rx0_tps1_done  (O_rx0_tps1_done  ),
    .O_rx0_tps1_ok    (O_rx0_tps1_ok    ),
    .O_rx1_tps1_done  (O_rx1_tps1_done  ),
    .O_rx1_tps1_ok    (O_rx1_tps1_ok    ),
    `endif
    `ifdef RX_TPS2_ENABLE  
    .O_rx0_tps2_done  (O_rx0_tps2_done  ),
    .O_rx0_tps2_ok    (O_rx0_tps2_ok    ),
    .O_rx1_tps2_done  (O_rx1_tps2_done  ),
    .O_rx1_tps2_ok    (O_rx1_tps2_ok    ),
    `endif
    `ifdef RX_TPS3_ENABLE  
    .O_rx0_tps3_done  (O_rx0_tps3_done  ),
    .O_rx0_tps3_ok    (O_rx0_tps3_ok    ),
    .O_rx1_tps3_done  (O_rx1_tps3_done  ),
    .O_rx1_tps3_ok    (O_rx1_tps3_ok    ),
    `endif
    .O_unp0_data      (O_unp0_data      ),// 
    .O_unp0_data_valid(O_unp0_data_valid),//
    .O_unp1_data      (O_unp1_data      ),//
    .O_unp1_data_valid(O_unp1_data_valid) //
`endif
`ifdef RX_4_LANES
    .I_kcode0         (I_kcode0         ),//
    .I_data0          (I_data0          ),//
    .I_kcode1         (I_kcode1         ),//
    .I_data1          (I_data1          ),//
    .I_kcode2         (I_kcode2         ),//
    .I_data2          (I_data2          ),//
    .I_kcode3         (I_kcode3         ),//
    .I_data3          (I_data3          ),//
    `ifdef RX_TPS1_ENABLE 
    .O_rx0_tps1_done  (O_rx0_tps1_done  ),
    .O_rx0_tps1_ok    (O_rx0_tps1_ok    ),
    .O_rx1_tps1_done  (O_rx1_tps1_done  ),
    .O_rx1_tps1_ok    (O_rx1_tps1_ok    ),
    .O_rx2_tps1_done  (O_rx2_tps1_done  ),
    .O_rx2_tps1_ok    (O_rx2_tps1_ok    ),
    .O_rx3_tps1_done  (O_rx3_tps1_done  ),
    .O_rx3_tps1_ok    (O_rx3_tps1_ok    ),
    `endif
    `ifdef RX_TPS2_ENABLE  
    .O_rx0_tps2_done  (O_rx0_tps2_done  ),
    .O_rx0_tps2_ok    (O_rx0_tps2_ok    ),
    .O_rx1_tps2_done  (O_rx1_tps2_done  ),
    .O_rx1_tps2_ok    (O_rx1_tps2_ok    ),
    .O_rx2_tps2_done  (O_rx2_tps2_done  ),
    .O_rx2_tps2_ok    (O_rx2_tps2_ok    ),
    .O_rx3_tps2_done  (O_rx3_tps2_done  ),
    .O_rx3_tps2_ok    (O_rx3_tps2_ok    ),
    `endif
    `ifdef RX_TPS3_ENABLE  
    .O_rx0_tps3_done  (O_rx0_tps3_done  ),
    .O_rx0_tps3_ok    (O_rx0_tps3_ok    ),
    .O_rx1_tps3_done  (O_rx1_tps3_done  ),
    .O_rx1_tps3_ok    (O_rx1_tps3_ok    ),
    .O_rx2_tps3_done  (O_rx2_tps3_done  ),
    .O_rx2_tps3_ok    (O_rx2_tps3_ok    ),
    .O_rx3_tps3_done  (O_rx3_tps3_done  ),
    .O_rx3_tps3_ok    (O_rx3_tps3_ok    ),
    `endif
    .O_unp0_data      (O_unp0_data      ),// 
    .O_unp0_data_valid(O_unp0_data_valid),//
    .O_unp1_data      (O_unp1_data      ),//
    .O_unp1_data_valid(O_unp1_data_valid),//
    .O_unp2_data      (O_unp2_data      ),//
    .O_unp2_data_valid(O_unp2_data_valid),//
    .O_unp3_data      (O_unp3_data      ),//
    .O_unp3_data_valid(O_unp3_data_valid) //
`endif
);

endmodule

