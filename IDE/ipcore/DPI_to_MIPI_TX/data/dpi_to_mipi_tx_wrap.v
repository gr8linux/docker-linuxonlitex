`timescale 1ns/1ps
`include "dpi_to_mipi_tx_define.v"
`include "static_macro_define.v"

module `module_name #
//module link_layer #
  (parameter VC             = 0              
   ,parameter WC            = `WORD_COUNT    
   ,parameter LANE_WIDTH    = `LW
   ,parameter RGB_DT        = `RGB_DATA_WIDTH
   )
  (input rst_n
    `ifdef DATA_LANE4
   ,output [7:0] byte_d3_out
   ,output [7:0] byte_d2_out
   ,output [7:0] byte_d1_out
   ,output [7:0] byte_d0_out
    `elsif DATA_LANE2
   ,output [7:0] byte_d1_out
   ,output [7:0] byte_d0_out
    `else
   ,output [7:0] byte_d0_out
    `endif
   ,output hs_clk_en
   ,output hs_data_en
   ,output [1:0] lp_clk
   ,output [1:0] lp_data
   ,input byte_clk
   ,input pix_clk_dpi
   ,input [RGB_DT -1:0] pix_data_dpi
   ,input de_dpi
`ifdef SYNC_EN
   ,input vsync_dpi
   ,input hsync_dpi 
`endif
  ); 

//  rgb_to_dsi_link_layer #
`getname(link_layer,`module_name) #
   (.VC(VC)
   ,.WC(WC)
   ,.LANE_WIDTH(LANE_WIDTH)
   ,.RGB_DT(RGB_DT)
   ) inst_link_layer
   (.rst_n       (rst_n),
    `ifdef DATA_LANE4
   .byte_d3_out (byte_d3_out),
   .byte_d2_out (byte_d2_out),
   .byte_d1_out (byte_d1_out),
   .byte_d0_out (byte_d0_out),
    `elsif DATA_LANE2
   .byte_d1_out (byte_d1_out),
   .byte_d0_out (byte_d0_out),
    `else
   .byte_d0_out (byte_d0_out),
    `endif
   .hs_clk_en   (hs_clk_en),
   .hs_data_en  (hs_data_en),
   .lp_clk      (lp_clk),
   .lp_data     (lp_data),
   .byte_clk    (byte_clk),
   .pix_clk     (pix_clk_dpi),
`ifdef SYNC_EN
   .vsync_dpi   (vsync_dpi),
   .hsync_dpi   (hsync_dpi),
`endif
   .pix_data    (pix_data_dpi),
   .de_dpi      (de_dpi)

  );


  endmodule