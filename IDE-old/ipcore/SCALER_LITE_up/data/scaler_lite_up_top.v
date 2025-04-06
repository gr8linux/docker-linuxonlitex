// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2023 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] scaler_lite_up_top.v
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
`include "scaler_lite_up_defines.v"

module `module_name
( 
    input             I_reset            ,//high active
    input             I_sysclk           ,
    input             I_vin_ref_vs       ,//positive
    input             I_vin_ref_de       ,//must continuous each line
    output            O_vin_vs_req       , //to buff get data vs //positive
    output            O_vin_de_req       , //to buff get data de
    input             I_buf_fstline_rdy  , //buff first line ready
`ifdef VESA_RGB_24BIT
    input   [7:0]     I_vin_data0_cpl    , //vin_data must delay 2 clocks after O_vin_de_req !!
    input   [7:0]     I_vin_data1_cpl    , //vin_data must delay 2 clocks after O_vin_de_req !!
    input   [7:0]     I_vin_data2_cpl    , //vin_data must delay 2 clocks after O_vin_de_req !!
`endif
`ifdef MIPI4LANES_RGB_32BIT  
    input   [7:0]     I_vin_data0_cpl    , //vin_data must delay 2 clocks after O_vin_de_req !!
    input   [7:0]     I_vin_data1_cpl    , //vin_data must delay 2 clocks after O_vin_de_req !!
    input   [7:0]     I_vin_data2_cpl    , //vin_data must delay 2 clocks after O_vin_de_req !!
    input   [7:0]     I_vin_data3_cpl    , //vin_data must delay 2 clocks after O_vin_de_req !!
`endif
`ifdef MIPI4LANES_RGB_64BIT  
    input   [15:0]    I_vin_data0_cpl    , //vin_data must delay 2 clocks after O_vin_de_req !!
    input   [15:0]    I_vin_data1_cpl    , //vin_data must delay 2 clocks after O_vin_de_req !!
    input   [15:0]    I_vin_data2_cpl    , //vin_data must delay 2 clocks after O_vin_de_req !!
    input   [15:0]    I_vin_data3_cpl    , //vin_data must delay 2 clocks after O_vin_de_req !!
`endif
`ifdef VESA_RGB_24BIT
    output  [7:0]     O_vout0_data       ,
    output  [7:0]     O_vout1_data       ,
    output  [7:0]     O_vout2_data       ,
`endif
`ifdef MIPI4LANES_RGB_32BIT 
    output  [7:0]     O_vout0_data       ,
    output  [7:0]     O_vout1_data       ,
    output  [7:0]     O_vout2_data       ,
    output  [7:0]     O_vout3_data       ,
`endif
`ifdef MIPI4LANES_RGB_64BIT 
    output  [15:0]    O_vout0_data       ,
    output  [15:0]    O_vout1_data       ,
    output  [15:0]    O_vout2_data       ,
    output  [15:0]    O_vout3_data       ,
`endif
    output            O_vout_vs          ,//positive
    output            O_vout_de        
);
        
//=========================================================================================
`getname(scaler_core_up,`module_name) scaler_core_up_inst
( 
    .I_reset          (I_reset          ),
    .I_sysclk         (I_sysclk         ),
    .I_buf_fstline_rdy(I_buf_fstline_rdy),
    .I_vin_ref_vs     (I_vin_ref_vs     ),
    .I_vin_ref_de     (I_vin_ref_de     ),
    .O_vin_vs_req     (O_vin_vs_req     ),
    .O_vin_de_req     (O_vin_de_req     ),
`ifdef VESA_RGB_24BIT
    .I_vin_data0      (I_vin_data0_cpl  ), //vin_data must delay 2 clocks after O_vin_de_req !!
    .I_vin_data1      (I_vin_data1_cpl  ), //vin_data must delay 2 clocks after O_vin_de_req !!
    .I_vin_data2      (I_vin_data2_cpl  ), //vin_data must delay 2 clocks after O_vin_de_req !!
`endif
`ifdef MIPI4LANES_RGB_32BIT
    .I_vin_data0      (I_vin_data0_cpl  ), //vin_data must delay 2 clocks after O_vin_de_req !!
    .I_vin_data1      (I_vin_data1_cpl  ), //vin_data must delay 2 clocks after O_vin_de_req !!
    .I_vin_data2      (I_vin_data2_cpl  ), //vin_data must delay 2 clocks after O_vin_de_req !!
    .I_vin_data3      (I_vin_data3_cpl  ), //vin_data must delay 2 clocks after O_vin_de_req !!
`endif
`ifdef MIPI4LANES_RGB_64BIT
    .I_vin_data0      (I_vin_data0_cpl  ), //vin_data must delay 2 clocks after O_vin_de_req !!
    .I_vin_data1      (I_vin_data1_cpl  ), //vin_data must delay 2 clocks after O_vin_de_req !!
    .I_vin_data2      (I_vin_data2_cpl  ), //vin_data must delay 2 clocks after O_vin_de_req !!
    .I_vin_data3      (I_vin_data3_cpl  ), //vin_data must delay 2 clocks after O_vin_de_req !!
`endif
`ifdef VESA_RGB_24BIT
    .O_vout_data0     (O_vout0_data     ),
    .O_vout_data1     (O_vout1_data     ),
    .O_vout_data2     (O_vout2_data     ),
`endif
`ifdef MIPI4LANES_RGB_32BIT 
    .O_vout_data0     (O_vout0_data     ),
    .O_vout_data1     (O_vout1_data     ),
    .O_vout_data2     (O_vout2_data     ),
    .O_vout_data3     (O_vout3_data     ),
`endif
`ifdef MIPI4LANES_RGB_64BIT 
    .O_vout_data0     (O_vout0_data     ),
    .O_vout_data1     (O_vout1_data     ),
    .O_vout_data2     (O_vout2_data     ),
    .O_vout_data3     (O_vout3_data     ),
`endif                
    .O_vout_vs        (O_vout_vs        ),
    .O_vout_de        (O_vout_de        )
);

    
endmodule

