// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2023 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] scaler_lite_down_top.v
//   \ \  / /\ \  / /    [Description ] Video scaler lite
//    \ \/ /  \ \/ /     [Timestamp   ] Friday January 8 14:00:30 2021
//     \  /    \  /      [version     ] 2.2
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 01/08/21     | Initial version 
// ----------------------------------------------------------------------------------
// V2.0    | Caojie     | 08/02/21     | 1.add zoom direction option 
// ----------------------------------------------------------------------------------
// V2.1    | Caojie     | 01/07/22     | 1.add DSP Mode 
// ----------------------------------------------------------------------------------
// V2.2    | Caojie     | 05/16/23     | 1.support 5AT device 
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

`include "top_define.v"
`include "static_macro_define.v"
`include "scaler_lite_down_defines.v"

module `module_name  
( 
    input          I_reset         ,//hign active
    input          I_vin_clk       ,
    input          I_vin_vs_cpl    ,//positive
    input          I_vin_de_cpl    ,//must continuous each line
`ifdef VESA_RGB_24BIT 
    input   [7:0]  I_vin_data0_cpl ,//r0
    input   [7:0]  I_vin_data1_cpl ,//g0
    input   [7:0]  I_vin_data2_cpl ,//b0
`endif
`ifdef MIPI4LANES_RGB_32BIT
    input   [7:0]  I_vin_data0_cpl ,//r0
    input   [7:0]  I_vin_data1_cpl ,//g0
    input   [7:0]  I_vin_data2_cpl ,//b0
    input   [7:0]  I_vin_data3_cpl ,//r1
`endif
`ifdef MIPI4LANES_RGB_64BIT
    input   [15:0] I_vin_data0_cpl ,//g1r0
    input   [15:0] I_vin_data1_cpl ,//b1g0
    input   [15:0] I_vin_data2_cpl ,//r2b0
    input   [15:0] I_vin_data3_cpl ,//g2r1
`endif
`ifdef ZOOM_BOTH
    `ifdef VER_VALUE_EN
        output        O_vval_de      , 
        `ifdef VESA_RGB_24BIT   
            output [7:0]  O_vval_data0    , 
            output [7:0]  O_vval_data1    , 
            output [7:0]  O_vval_data2    , 
        `endif                          
        `ifdef MIPI4LANES_RGB_32BIT     
            output [7:0]  O_vval_data0    , 
            output [7:0]  O_vval_data1    , 
            output [7:0]  O_vval_data2    , 
            output [7:0]  O_vval_data3    ,
        `endif                          
        `ifdef MIPI4LANES_RGB_64BIT     
            output [15:0] O_vval_data0    , 
            output [15:0] O_vval_data1    , 
            output [15:0] O_vval_data2    , 
            output [15:0] O_vval_data3    ,
        `endif  
    `endif 
`endif
`ifdef VESA_RGB_24BIT 
    output  [7:0]  O_vout0_data    ,//r0
    output  [7:0]  O_vout1_data    ,//g0
    output  [7:0]  O_vout2_data    ,//b0
`endif
`ifdef MIPI4LANES_RGB_32BIT 
    output  [7:0]  O_vout0_data    ,//r0
    output  [7:0]  O_vout1_data    ,//g0
    output  [7:0]  O_vout2_data    ,//b0
    output  [7:0]  O_vout3_data    ,//r1
`endif  
`ifdef MIPI4LANES_RGB_64BIT 
    output  [15:0] O_vout0_data    ,//g1r0
    output  [15:0] O_vout1_data    ,//b1g0
    output  [15:0] O_vout2_data    ,//r2b0
    output  [15:0] O_vout3_data    ,//g2r1
`endif 
    output         O_vout_vs       ,//positive
    output         O_vout_de        
);

//=========================================================================================
`getname(scaler_core_down,`module_name) scaler_core_down_inst
( 
    .I_reset        (I_reset        ),
    .I_vin_clk      (I_vin_clk      ),
    .I_vin_vs       (I_vin_vs_cpl   ),
    .I_vin_de       (I_vin_de_cpl   ),
`ifdef VESA_RGB_24BIT 
    .I_vin_data0    (I_vin_data0_cpl),
    .I_vin_data1    (I_vin_data1_cpl),
    .I_vin_data2    (I_vin_data2_cpl),
`endif 
`ifdef MIPI4LANES_RGB_32BIT 
    .I_vin_data0    (I_vin_data0_cpl),
    .I_vin_data1    (I_vin_data1_cpl),
    .I_vin_data2    (I_vin_data2_cpl),
    .I_vin_data3    (I_vin_data3_cpl),
`endif 
`ifdef MIPI4LANES_RGB_64BIT 
    .I_vin_data0    (I_vin_data0_cpl),
    .I_vin_data1    (I_vin_data1_cpl),
    .I_vin_data2    (I_vin_data2_cpl),
    .I_vin_data3    (I_vin_data3_cpl),
`endif  
`ifdef ZOOM_BOTH
    `ifdef VER_VALUE_EN
        .O_vval_de      (O_vval_de), 
        `ifdef VESA_RGB_24BIT   
            .O_vval_data0    (O_vval_data0  ), 
            .O_vval_data1    (O_vval_data1  ), 
            .O_vval_data2    (O_vval_data2  ), 
        `endif                           
        `ifdef MIPI4LANES_RGB_32BIT      
            .O_vval_data0    (O_vval_data0  ), 
            .O_vval_data1    (O_vval_data1  ), 
            .O_vval_data2    (O_vval_data2  ), 
            .O_vval_data3    (O_vval_data3  ),
        `endif                           
        `ifdef MIPI4LANES_RGB_64BIT      
            .O_vval_data0    (O_vval_data0  ), 
            .O_vval_data1    (O_vval_data1  ), 
            .O_vval_data2    (O_vval_data2  ), 
            .O_vval_data3    (O_vval_data3  ),
        `endif  
    `endif 
`endif
`ifdef VESA_RGB_24BIT  
    .O_vout_data0   (O_vout0_data   ),
    .O_vout_data1   (O_vout1_data   ),
    .O_vout_data2   (O_vout2_data   ),
`endif  
`ifdef MIPI4LANES_RGB_32BIT 
    .O_vout_data0   (O_vout0_data   ),
    .O_vout_data1   (O_vout1_data   ),
    .O_vout_data2   (O_vout2_data   ),
    .O_vout_data3   (O_vout3_data   ),
`endif 
`ifdef MIPI4LANES_RGB_64BIT 
    .O_vout_data0   (O_vout0_data   ),
    .O_vout_data1   (O_vout1_data   ),
    .O_vout_data2   (O_vout2_data   ),
    .O_vout_data3   (O_vout3_data   ),
`endif
    .O_vout_vs      (O_vout_vs      ),
    .O_vout_de      (O_vout_de      )
);

    
endmodule

