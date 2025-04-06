// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] Rffe_Top.v
//   \ \  / /\ \  / /    [Description ] RF front end bus 
//    \ \/ /  \ \/ /     [Timestamp   ] Monday Sept 06 11:15:00 2021
//     \  /    \  /      [version     ] 1.0
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | liaobin    | 09/06/21     | Initial version 
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========
`timescale 1ns / 1ps
`include "rffe_define.vh"
`include "static_macro_define.vh"
module `module_name
(
`ifdef Master
        input                   i_rst,
        input                   i_clk,    
            
        input                   i_cmd_start,
        input[2:0]              i_style,  
        input[3:0]              i_slave_addr, // Device ID
        input[15:0]             i_reg_addr,   // Device Register    

    `ifdef BURST        //burst  access 1~16byte
    
        input[3:0]              i_byte_count, // 0~15  
        
        //RFFE Device Wite User Logic Interface
        input                   i_reg_data_valid,    
        input[3:0]              i_reg_data_index,
        input[7:0]              i_reg_data,
        
        //RFFE Device Read User Logic Interface
        output                  o_reg_data_valid,
        output                  o_reg_data_last,
        output[3:0]             o_reg_data_index,
        output[7:0]             o_reg_data,
        output                  o_reg_data_error, // parity error 

    `else              //no burst  access only one byte
        input[7:0]              i_reg_data,
        
        output                  o_reg_data_valid,
        output[7:0]             o_reg_data,
        output                  o_reg_data_error, // parity error  
    `endif    

        // sclk & sdata
        output                  o_vio,
        output                  o_sclk,
        inout                   io_sdata,
    
        //status signal
        output                  o_busy
`endif

`ifdef Slave 
        input                   i_clk,  
        // sclk & sdata
        input                   i_vio,
        input                   i_sclk,
    `ifdef READ_ENABLE
        inout                   io_sdata,
    `else 
        input                   io_sdata,
    `endif
        // slave Device ID
        input[3:0]              i_slave_addr,
    
        // write operation 
        output                  o_wr_en,
        output[15:0]            o_wr_addr,
        output[7:0]             o_wr_data,
        output                  o_wr_data_err,
        output[1:0]             o_wr_addr_frame_err, // write addr frame parity error  
    
    // read operation
    `ifdef READ_ENABLE
        output                  o_rd_en,
        output[15:0]            o_rd_addr,
        input[7:0]              i_rd_data,
        output[1:0]             o_rd_addr_frame_err, // read addr frame parity error 
    `endif     
        output                  o_cmd_frame_err 
`endif
);

`include "rffe_param.vh"


`getname(rffe_wrapper,`module_name)#
(   .DIV(M_SCLK_DIV))
u_rffe_wrapper
(
`ifdef Master
        .i_rst                  ( i_rst                 ),
        .i_clk                  ( i_clk                 ),    
                
        .i_cmd_start            ( i_cmd_start           ),
        .i_style                ( i_style               ),  
        .i_slave_addr           ( i_slave_addr          ),  
        .i_reg_addr             ( i_reg_addr            ),       
    
    `ifdef BURST            
        
        .i_byte_count           ( i_byte_count          ),   
            
        //RFFE Device Wite User Logic Interface 
        .i_reg_data_valid       ( i_reg_data_valid      ),    
        .i_reg_data_index       ( i_reg_data_index      ),
        .i_reg_data             ( i_reg_data            ),
            
        //RFFE Device Read User Logic Interface 
        .o_reg_data_valid       ( o_reg_data_valid      ),
        .o_reg_data_last        ( o_reg_data_last       ),
        .o_reg_data_index       ( o_reg_data_index      ),
        .o_reg_data             ( o_reg_data            ),
        .o_reg_data_error       ( o_reg_data_error      ),  

    `else              //no burst  access only one byte
        .i_reg_data             ( i_reg_data            ),
        
        .o_reg_data_valid       ( o_reg_data_valid      ),
        .o_reg_data             ( o_reg_data            ),
        .o_reg_data_error       ( o_reg_data_error      ),   
    `endif    

        // sclk & sdata
        .o_vio                  ( o_vio                 ),
        .o_sclk                 ( o_sclk                ),
        .io_sdata               ( io_sdata              ),
        
        //status signal 
        .o_busy                 ( o_busy                )
`endif  
    
`ifdef Slave    
        .i_clk                  ( i_clk                 ),  
        // sclk & sdata 
        .i_vio                  ( i_vio                 ),
        .i_sclk                 ( i_sclk                ),
        .io_sdata               ( io_sdata              ),
        // slave Device ID  
        .i_slave_addr           ( i_slave_addr          ),
    
        // write operation 
        .o_wr_en                ( o_wr_en               ),
        .o_wr_addr              ( o_wr_addr             ),
        .o_wr_data              ( o_wr_data             ),
        .o_wr_data_err          ( o_wr_data_err         ),
        .o_wr_addr_frame_err    ( o_wr_addr_frame_err   ),    
    
    // read operation
    `ifdef READ_ENABLE
        .o_rd_en                ( o_rd_en               ),
        .o_rd_addr              ( o_rd_addr             ),
        .i_rd_data              ( i_rd_data             ),
        .o_rd_addr_frame_err    ( o_rd_addr_frame_err   ),  
    `endif
        .o_cmd_frame_err        ( o_cmd_frame_err       )
`endif
);







endmodule 