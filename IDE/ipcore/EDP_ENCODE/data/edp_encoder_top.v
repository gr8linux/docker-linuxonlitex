// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2024 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] edp_encoder_top.v
//   \ \  / /\ \  / /    [Description ] EDP_Encoder_Top
//    \ \/ /  \ \/ /     [Timestamp   ] Friday Aug 26 14:00:30 2022
//     \  /    \  /      [version     ] 2.2
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 10/26/23     | Initial version 
// ----------------------------------------------------------------------------------
// V2.0    | Caojie     | 02/19/24     | Modinfy IP name to encoder  
// ----------------------------------------------------------------------------------
// V2.1    | Caojie     | 02/19/24     | Add Mvid counter  
// ----------------------------------------------------------------------------------
// V2.2    | Xiaohui    | 11/15/24     | Add Tps3  
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

`include "top_define.v"
`include "static_macro_define.v"
`include "edp_encoder_defines.v"


module `module_name #
( 
    parameter BM          = `DEF_TX_BPP_COEF , //1,2
    parameter BPP         = `DEF_TX_BPP      , //24 //Bits per pixel
    parameter SYM_WIDTH   = `DEF_TX_SYM_WIDTH 
)
(
    input                    I_rst_n           ,
`ifdef TX_TPS1_ENABLE     
    input                    I_tx_tps1_en      ,
`endif 
`ifdef TX_TPS2_ENABLE 
    input                    I_tx_tps2_en      ,
`endif 
`ifdef TX_TPS3_ENABLE 
    input                    I_tx_tps3_en      ,
`endif 
    input                    I_tx_video_data_en,
    input                    I_frame_type      ,//0:normal_frame  1:enhanced_frame
    input                    I_scrm_value      ,//0:DP rst value 0xffff  1:eDP rst value 0xfffe
    input  [7:0]             I_vb_id           ,
    input  [23:0]            I_msa_mvid        ,//24'd32347 
    input  [23:0]            I_msa_nvid        ,//24'd32768  
    input  [7:0]             I_tu_size         ,//32~64 bytes, only select multiples of 2(X20)/4(X40)
    input  [7:0]             I_avs_per_tu      ,//<(tu-2) bytes, only select multiples of 2(X20)4(X40)
    input  [15:0]            I_lsck_htotal     ,//LS clock region hor total
    input  [15:0]            I_lsck_hblank     ,//LS clock region hor blank
    input  [15:0]            I_msa_htotal      ,
    input  [15:0]            I_msa_vtotal      ,
    input  [15:0]            I_msa_hstart      ,
    input  [15:0]            I_msa_vstart      ,
    input  [15:0]            I_msa_hwidth      ,
    input  [15:0]            I_msa_vheight     ,
    input  [15:0]            I_msa_hsphsw      ,
    input  [15:0]            I_msa_vspvsw      ,
    input  [7:0]             I_msa_misc0       ,
    input  [7:0]             I_msa_misc1       ,     
    input                    I_strm_clk        ,
    input                    I_pix_vs          ,//postive ,rising edge trigger
    input                    I_pix_hs          ,//postive ,falling edge trigger
    input                    I_pix_de          ,
    input                    I_ls_clk          , 
`ifdef TX_1_LANES 
    input  [BPP*BM-1:0]      I_pix_data0       ,//{b,g,r} or {b1,g1,r1,b0,g0,r0}
    output [SYM_WIDTH-1:0]   O_tx_data_0       ,    
    output [SYM_WIDTH/8-1:0] O_k_code_0        
`endif  
`ifdef TX_2_LANES  
    input  [BPP*BM-1:0]      I_pix_data0       ,//{b,g,r} or {b1,g1,r1,b0,g0,r0}
    input  [BPP*BM-1:0]      I_pix_data1       ,
    output [SYM_WIDTH-1:0]   O_tx_data_0       ,    
    output [SYM_WIDTH-1:0]   O_tx_data_1       ,    
    output [SYM_WIDTH/8-1:0] O_k_code_0        ,    
    output [SYM_WIDTH/8-1:0] O_k_code_1        
`endif      
`ifdef TX_4_LANES     
    input  [BPP*BM-1:0]      I_pix_data0       ,//{b,g,r} or {b1,g1,r1,b0,g0,r0}
    input  [BPP*BM-1:0]      I_pix_data1       ,
    input  [BPP*BM-1:0]      I_pix_data2       ,
    input  [BPP*BM-1:0]      I_pix_data3       ,
    output [SYM_WIDTH-1:0]   O_tx_data_0       ,    
    output [SYM_WIDTH-1:0]   O_tx_data_1       ,    
    output [SYM_WIDTH-1:0]   O_tx_data_2       ,    
    output [SYM_WIDTH-1:0]   O_tx_data_3       ,    
    output [SYM_WIDTH/8-1:0] O_k_code_0        ,    
    output [SYM_WIDTH/8-1:0] O_k_code_1        ,    
    output [SYM_WIDTH/8-1:0] O_k_code_2        ,    
    output [SYM_WIDTH/8-1:0] O_k_code_3 
`endif           
);

`getname(edp_encoder_wrapper,`module_name) #
( 
    .BM          (BM         ),
    .BPP         (BPP        ),
    .SYM_WIDTH   (SYM_WIDTH  ) 
)
edp_encoder_wrapper_inst
(
    .I_rst_n           (I_rst_n           ),
`ifdef TX_TPS1_ENABLE    
    .I_tx_tps1_en      (I_tx_tps1_en      ),
`endif
`ifdef TX_TPS2_ENABLE      
    .I_tx_tps2_en      (I_tx_tps2_en      ),
`endif    
`ifdef TX_TPS3_ENABLE      
    .I_tx_tps3_en      (I_tx_tps3_en      ),
`endif
    .I_tx_video_data_en(I_tx_video_data_en),
    .I_frame_type      (I_frame_type      ),
    .I_scrm_value      (I_scrm_value      ),
    .I_vb_id           (I_vb_id           ),
    .I_msa_mvid        (I_msa_mvid        ), 
    .I_msa_nvid        (I_msa_nvid        ),
    .I_tu_size         (I_tu_size         ),
    .I_avs_per_tu      (I_avs_per_tu      ),
    .I_lsck_htotal     (I_lsck_htotal     ),
    .I_lsck_hblank     (I_lsck_hblank     ),
    .I_msa_htotal      (I_msa_htotal      ),
    .I_msa_vtotal      (I_msa_vtotal      ),
    .I_msa_hstart      (I_msa_hstart      ),
    .I_msa_vstart      (I_msa_vstart      ),
    .I_msa_hwidth      (I_msa_hwidth      ),
    .I_msa_vheight     (I_msa_vheight     ),
    .I_msa_hsphsw      (I_msa_hsphsw      ),
    .I_msa_vspvsw      (I_msa_vspvsw      ),
    .I_msa_misc0       (I_msa_misc0       ),
    .I_msa_misc1       (I_msa_misc1       ), 
    .I_strm_clk        (I_strm_clk        ),  
    .I_pix_vs          (I_pix_vs          ),
    .I_pix_hs          (I_pix_hs          ),
    .I_pix_de          (I_pix_de          ),
    .I_ls_clk          (I_ls_clk          ), 
`ifdef TX_1_LANES    
    .I_pix_data0       (I_pix_data0       ),     
    .O_tx_data_0       (O_tx_data_0       ),   
    .O_k_code_0        (O_k_code_0        ) 
`endif   
`ifdef TX_2_LANES    
    .I_pix_data0       (I_pix_data0       ),
    .I_pix_data1       (I_pix_data1       ),     
    .O_tx_data_0       (O_tx_data_0       ),    
    .O_tx_data_1       (O_tx_data_1       ),    
    .O_k_code_0        (O_k_code_0        ),    
    .O_k_code_1        (O_k_code_1        ) 
`endif       
`ifdef TX_4_LANES    
    .I_pix_data0       (I_pix_data0       ),
    .I_pix_data1       (I_pix_data1       ),
    .I_pix_data2       (I_pix_data2       ),
    .I_pix_data3       (I_pix_data3       ),     
    .O_tx_data_0       (O_tx_data_0       ),    
    .O_tx_data_1       (O_tx_data_1       ),    
    .O_tx_data_2       (O_tx_data_2       ),    
    .O_tx_data_3       (O_tx_data_3       ),    
    .O_k_code_0        (O_k_code_0        ),    
    .O_k_code_1        (O_k_code_1        ),    
    .O_k_code_2        (O_k_code_2        ),    
    .O_k_code_3        (O_k_code_3        )  
`endif    
);

endmodule
