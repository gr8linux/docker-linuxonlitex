// ===========Oooo==========================================Oooo========
// =  Copyright (C) 2014-2018 Shandong Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// =====================================================================
//
//  __      __      __
//  \ \    /  \    / /   [File name   ] usb_fs_phy_top.v
//   \ \  / /\ \  / /    [Description ] TOP Verilog file for the soft phy design
//    \ \/ /  \ \/ /     [Timestamp   ] Fri Nov 27 14:30:00 2020
//     \  /    \  /      [version     ] 1.0
//      \/      \/
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Ver: | Author | |Changes Made:
// V1.0 | XXXXXX |27/11/20  |Initial version
// ===========Oooo==========================================Oooo========

`include "static_macro_define.v"
`include "usb_softphy_define.v"

module `module_name
(
     input           clk_i
    ,input           rst_i
    ,input  [  7:0]  utmi_data_out_i
    ,input           utmi_txvalid_i
    ,input  [  1:0]  utmi_op_mode_i
    ,input  [  1:0]  utmi_xcvrselect_i
    ,input           utmi_termselect_i
    ,output [  7:0]  utmi_data_in_o
    ,output          utmi_txready_o
    ,output          utmi_rxvalid_o
    ,output          utmi_rxactive_o
    ,output          utmi_rxerror_o
    ,output [  1:0]  utmi_linestate_o
    // USB D+ / D-
    ,inout           usb_dp_io
    ,inout           usb_dn_io
);

`getname(usb_phy,`module_name) u_usb_phy
(
     .clk_i            (clk_i            )
    ,.rst_i            (rst_i            )
    ,.utmi_data_out_i  (utmi_data_out_i  )
    ,.utmi_txvalid_i   (utmi_txvalid_i   )
    ,.utmi_op_mode_i   (utmi_op_mode_i   )
    ,.utmi_xcvrselect_i(utmi_xcvrselect_i)
    ,.utmi_termselect_i(utmi_termselect_i)
    ,.utmi_data_in_o   (utmi_data_in_o   )
    ,.utmi_txready_o   (utmi_txready_o   )
    ,.utmi_rxvalid_o   (utmi_rxvalid_o   )
    ,.utmi_rxactive_o  (utmi_rxactive_o  )
    ,.utmi_rxerror_o   (utmi_rxerror_o   )
    ,.utmi_linestate_o (utmi_linestate_o )
    ,.usb_dp_io        (usb_dp_io        )
    ,.usb_dn_io        (usb_dn_io        )
);

endmodule
