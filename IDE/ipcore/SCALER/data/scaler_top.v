// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2023 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] Scaler_Top.v
//   \ \  / /\ \  / /    [Description ] Video scaler
//    \ \/ /  \ \/ /     [Timestamp   ] Friday May 23 14:00:30 2019
//     \  /    \  /      [version     ] 3.3
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 05/23/19     | Initial version 
// ----------------------------------------------------------------------------------
// V1.1    | Caojie     | 11/07/19     | Updated for core version 1.1
// ----------------------------------------------------------------------------------
// V1.2    | Caojie     | 20/12/19     | Updated for core version 1.2
// ----------------------------------------------------------------------------------
// V2.0    | Caojie     | 04/22/20     | Updated for core version 2.0
// ----------------------------------------------------------------------------------
// V3.0    | Caojie     | 10/22/21     | Updated for core version 3.0
// ----------------------------------------------------------------------------------
// V3.1    | Caojie     | 11/18/22     | Updated for core version 3.1
// ----------------------------------------------------------------------------------
// V3.2    | Caojie     | 04/21/23     | Support 5A serial device
// ----------------------------------------------------------------------------------
// V3.3    | Caojie     | 09/26/23     | Update DSP in 5A serial device 
// ==============0ooo===================================================0ooo===========

`include "top_define.v"
`include "static_macro_define.v"
`include "scaler_defines.v"

module `module_name
( 
	I_reset			,//high active
	I_sysclk		,
`ifdef PARAM_DYNAMIC_CTRL
	I_param_update	,//parameters update enable, high active
	I_vin_hsize		,//input horizontal resolution 
	I_vin_vsize		,//input vertical resolution
	I_vout_hsize	,//output horizontal resolution
	I_vout_vsize	,//output vertical resolution
	I_hor_skfactor	,//shrink factor, unsigned fixed 8bit integer, 16bit fraction, (vin_hor/vout_hor)*(2^16)
	I_ver_skfactor	,//shrink factor, unsigned fixed 8bit integer, 16bit fraction, (vin_ver/vout_ver)*(2^16)
`endif
	I_vin_clk		,
`ifdef MEMORY
	I_vin_ref_vs	,//positive polarity +
	I_vin_ref_de	,
	O_vin_vs_req	,//vs for getting data from buffer //positive polarity +
	O_vin_de_req	,//de for getting data from buffer
	I_buff_ready    ,//buffer ready
	`ifdef PARAM_DYNAMIC_CTRL
	I_up_down_sel	,//0:scaler up, 1:scaler down
	`endif
`endif
`ifdef LIVE
	I_vin_vs_cpl	,//positive polarity +
`endif
	I_vin_de_cpl	,
`ifdef YC444
	I_vin_data0_cpl	,//r  y
	I_vin_data1_cpl	,//g  cb
	I_vin_data2_cpl	,//b  cr
	O_vout0_data	,//r  y
	O_vout1_data	,//g  cb
	O_vout2_data	,//b  cr
`endif
`ifdef YC422
	I_vin_data0_cpl	,//y
	I_vin_data1_cpl	,//c
	O_vout0_data	,//y
	O_vout1_data	,//c
`endif
`ifdef SINGLE
	I_vin_data0_cpl	,//y
	O_vout0_data	,//y
`endif
`ifdef VER_VALUE_EN
        O_vval_de       , 
    `ifdef YC444   
        O_vval_data0    , 
        O_vval_data1    , 
        O_vval_data2    , 
    `endif                          
    `ifdef YC422     
        O_vval_data0    , 
        O_vval_data1    , 
    `endif                          
    `ifdef SINGLE     
        O_vval_data0    ,
    `endif  
`endif 
	O_vout_vs		,//positive polarity +
	O_vout_de	
);

//==============================================================================
parameter COEF_WIDTH          = `DEF_COEF_WIDTH       ;//coefficient width, 9~16, for bicubic
parameter DATA_WIDTH          = `DEF_DATA_WIDTH       ;//picture data width, 8/10/12
parameter FILTER_TAPS         = `DEF_TAPS 		      ;//Filter taps, 4/6
parameter FILTER_PHASES       = `DEF_PHASES 	      ;//Filter phases, 8,16,32,64
    
//==============================================================================
	input			            I_reset			;
	input			            I_sysclk		;
`ifdef PARAM_DYNAMIC_CTRL
	input			            I_param_update	;
	input	[12:0] 	        	I_vin_hsize		;
	input	[12:0] 	        	I_vin_vsize		;
	input	[12:0] 	        	I_vout_hsize	;
	input	[12:0] 	        	I_vout_vsize	;
	input	[23:0] 	        	I_hor_skfactor	;
	input	[23:0] 	        	I_ver_skfactor	;
`endif
	input			            I_vin_clk		;
`ifdef MEMORY
	input			            I_vin_ref_vs	;
	input			            I_vin_ref_de	;
	output			            O_vin_vs_req	;
	output			            O_vin_de_req	;
	input                       I_buff_ready    ;
	`ifdef PARAM_DYNAMIC_CTRL
	input			            I_up_down_sel	;
	`endif
`endif
`ifdef LIVE
	input			            I_vin_vs_cpl	;
`endif
	input			            I_vin_de_cpl	;
`ifdef YC444
	input	[DATA_WIDTH-1:0] 	I_vin_data0_cpl	;
	input	[DATA_WIDTH-1:0] 	I_vin_data1_cpl	;
	input	[DATA_WIDTH-1:0] 	I_vin_data2_cpl	;
	output  [DATA_WIDTH-1:0] 	O_vout0_data	;
	output  [DATA_WIDTH-1:0] 	O_vout1_data	;
	output  [DATA_WIDTH-1:0] 	O_vout2_data	;
`endif
`ifdef YC422
	input	[DATA_WIDTH-1:0] 	I_vin_data0_cpl	;
	input	[DATA_WIDTH-1:0] 	I_vin_data1_cpl	;
	output  [DATA_WIDTH-1:0] 	O_vout0_data	;
	output  [DATA_WIDTH-1:0] 	O_vout1_data	;
`endif
`ifdef SINGLE
	input	[DATA_WIDTH-1:0] 	I_vin_data0_cpl	;
	output  [DATA_WIDTH-1:0] 	O_vout0_data	;
`endif
`ifdef VER_VALUE_EN
        output                      O_vval_de       ; 
    `ifdef YC444                                    
        output [DATA_WIDTH-1:0]	    O_vval_data0    ; 
        output [DATA_WIDTH-1:0]	    O_vval_data1    ; 
        output [DATA_WIDTH-1:0]	    O_vval_data2    ; 
    `endif                                          
    `ifdef YC422                                    
        output [DATA_WIDTH-1:0]	    O_vval_data0    ; 
        output [DATA_WIDTH-1:0]	    O_vval_data1    ; 
    `endif                                          
    `ifdef SINGLE                                   
        output [DATA_WIDTH-1:0]	    O_vval_data0    ;
    `endif  
`endif 
	output			            O_vout_vs		;
	output			            O_vout_de		;
		
//=========================================================================================
`getname(scaler_wrapper,`module_name) #
(	
	.COEF_WIDTH          (COEF_WIDTH        ), 
	.DATA_WIDTH          (DATA_WIDTH        ), 
    .FILTER_TAPS         (FILTER_TAPS       ), 
    .FILTER_PHASES       (FILTER_PHASES     )  
)
scaler_wrapper_inst
( 
	.I_reset			(I_reset		),
	.I_sysclk			(I_sysclk		),
`ifdef PARAM_DYNAMIC_CTRL
	.I_param_update		(I_param_update	),
	.I_vin_hsize		(I_vin_hsize	),
	.I_vin_vsize		(I_vin_vsize	),
	.I_vout_hsize		(I_vout_hsize	),
	.I_vout_vsize		(I_vout_vsize	),
	.I_hor_skfactor		(I_hor_skfactor	),
	.I_ver_skfactor		(I_ver_skfactor	),
`endif
	.I_vin_clk			(I_vin_clk		),
`ifdef MEMORY
	.I_vin_ref_vs		(I_vin_ref_vs	),
	.I_vin_ref_de		(I_vin_ref_de	),
	.O_vin_vs_req		(O_vin_vs_req	),
	.O_vin_de_req		(O_vin_de_req	),
	.I_buff_ready   	(I_buff_ready   ),
	`ifdef PARAM_DYNAMIC_CTRL
	.I_up_down_sel		(I_up_down_sel	),
	`endif
`endif
`ifdef LIVE
	.I_vin_vs_cpl		(I_vin_vs_cpl   ),
`endif
	.I_vin_de_cpl		(I_vin_de_cpl	),
`ifdef YC444
	.I_vin_data0_cpl	(I_vin_data0_cpl),
	.I_vin_data1_cpl	(I_vin_data1_cpl),
	.I_vin_data2_cpl	(I_vin_data2_cpl),
	.O_vout0_data		(O_vout0_data	),
	.O_vout1_data		(O_vout1_data	),
	.O_vout2_data		(O_vout2_data	),
`endif
`ifdef YC422
	.I_vin_data0_cpl	(I_vin_data0_cpl),
	.I_vin_data1_cpl	(I_vin_data1_cpl),
	.O_vout0_data		(O_vout0_data	),
	.O_vout1_data		(O_vout1_data	),
`endif
`ifdef SINGLE
	.I_vin_data0_cpl	(I_vin_data0_cpl),
	.O_vout0_data		(O_vout0_data	),
`endif
`ifdef VER_VALUE_EN
        .O_vval_de       (O_vval_de     ), 
    `ifdef YC444   
        .O_vval_data0    (O_vval_data0  ), 
        .O_vval_data1    (O_vval_data1  ), 
        .O_vval_data2    (O_vval_data2  ), 
    `endif                           
    `ifdef YC422      
        .O_vval_data0    (O_vval_data0  ), 
        .O_vval_data1    (O_vval_data1  ), 
    `endif                           
    `ifdef SINGLE      
        .O_vval_data0    (O_vval_data0  ), 
    `endif  
`endif
	.O_vout_vs			(O_vout_vs		),
	.O_vout_de			(O_vout_de		)
);

	
endmodule

