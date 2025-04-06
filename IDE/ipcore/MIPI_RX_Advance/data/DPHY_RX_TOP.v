
// ===========Oooo==========================================Oooo========
// =  Copyright (C) 2014-2018 Shandong Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// =====================================================================
//
//  __      __      __
//  \ \    /  \    / /   [File name   ] DPHY_RX_TOP.v
//   \ \  / /\ \  / /    [Description ] TOP Verilog file for the DPHY RX TOP design
//    \ \/ /  \ \/ /     [Timestamp   ] Tue Dec 04 15:30:00 2018
//     \  /    \  /      [version     ] 2.0
//      \/      \/
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Ver: | Author |Mod. Date |Changes Made:
// V2.0 | XXXXXX |04/12/18  |Initial version
// V3.0 | XXXXXX |20/07/20  |IO Type Seperate Config
// V3.2 | XXXXXX |04/23/21  |replace term_en with clk_term_en && data_term_en
// ===========Oooo==========================================Oooo========

`include "dphy_define.v"

module `module_name_rx(
          input        reset_n           ,   //Resets the Design
     `ifdef MIPI_COMB_CLK
          inout        MIPI_COMB_CLK_P        ,   //HS (High Speed) Clock
          inout        MIPI_COMB_CLK_N        ,   //HS (High Speed) Clock
          output [1:0] lp_clk_out        ,   //LP (Low Power) Data Receiving Signals for Clock Lane
     `elsif MIPI_CLK
          inout        MIPI_CLK_P        ,   //HS (High Speed) Clock
          inout        MIPI_CLK_N        ,   //HS (High Speed) Clock
          output [1:0] lp_clk_out        ,   //LP (Low Power) Data Receiving Signals for Clock Lane
          input  [1:0] lp_clk_in         ,   //LP (Low Power) Data Transmitting Signals for Clock Lane
          input        lp_clk_dir        ,   //LP (Low Power) Data Receive/Transmit Control for Clock Lane
     `elsif HS_CLK
		`ifdef  gw5at
			`ifdef  ELVDS_CLK
				inout        HS_CLK_P          ,   //HS (High Speed) Clock
				inout        HS_CLK_N          ,   //HS (High Speed) Clock					
			`else 
				input        HS_CLK_P          ,   //HS (High Speed) Clock
				input        HS_CLK_N          ,   //HS (High Speed) Clock						
			`endif 
		`else 
          input        HS_CLK_P          ,   //HS (High Speed) Clock
          input        HS_CLK_N          ,   //HS (High Speed) Clock
		`endif
     `endif

     `ifdef CROSS_FIFO
          input         clk_byte         ,   //Byte Clock Input
     `endif
          output        clk_byte_out     ,   //Byte Clock
     `ifdef MIPI_COMB_LANE3
          inout         MIPI_COMB_LANE3_P     ,   //HS (High Speed) Data Lane 3
          inout         MIPI_COMB_LANE3_N     ,   //HS (High Speed) Data Lane 3
          output [`HS_DW - 1'b1 : 0] data_out3,   //HS (High Speed) Byte Data, Lane 3
          output [1:0]  lp_data3_out     ,   //LP (Low Power) Data Receiving Signals for Data Lane 3
       `ifdef BEFORE_LANE_3
          output [`HS_DW - 1'b1 : 0] data_bf_lane3,
       `endif
     `elsif MIPI_LANE3
          inout         MIPI_LANE3_P     ,   //HS (High Speed) Data Lane 3
          inout         MIPI_LANE3_N     ,   //HS (High Speed) Data Lane 3
          output [`HS_DW - 1'b1 : 0] data_out3,   //HS (High Speed) Byte Data, Lane 3
          output [1:0]  lp_data3_out     ,   //LP (Low Power) Data Receiving Signals for Data Lane 3
          input  [1:0]  lp_data3_in      ,   //LP (Low Power) Data Transmitting Signals for Data Lane 3
          input         lp_data3_dir     ,   //LP (Low Power) Data Receive/Transmit Control for Data Lane 3
       `ifdef BEFORE_LANE_3
          output [`HS_DW - 1'b1 : 0] data_bf_lane3,
       `endif
     `endif
     `ifdef MIPI_COMB_LANE2
          inout         MIPI_COMB_LANE2_P     ,   //HS (High Speed) Data Lane 2
          inout         MIPI_COMB_LANE2_N     ,   //HS (High Speed) Data Lane 2
          output [`HS_DW - 1'b1:0] data_out2        ,   //HS (High Speed) Byte Data, Lane 
          output [1:0]  lp_data2_out     ,   //LP (Low Power) Data Receiving Signals for Data Lane 2
       `ifdef BEFORE_LANE_2
          output [`HS_DW - 1'b1:0] data_bf_lane2    ,
       `endif
     `elsif MIPI_LANE2
          inout         MIPI_LANE2_P     ,   //HS (High Speed) Data Lane 2
          inout         MIPI_LANE2_N     ,   //HS (High Speed) Data Lane 2
          output [`HS_DW - 1'b1:0] data_out2        ,   //HS (High Speed) Byte Data, Lane 
          output [1:0]  lp_data2_out     ,   //LP (Low Power) Data Receiving Signals for Data Lane 2
          input  [1:0]  lp_data2_in      ,   //LP (Low Power) Data Transmitting Signals for Data Lane 2
          input         lp_data2_dir     ,   //LP (Low Power) Data Receive/Transmit Control for Data Lane 2
       `ifdef BEFORE_LANE_2
          output [`HS_DW - 1'b1:0] data_bf_lane2    ,
       `endif
     `endif
     `ifdef MIPI_COMB_LANE1
          inout         MIPI_COMB_LANE1_P     ,   //HS (High Speed) Data Lane 1
          inout         MIPI_COMB_LANE1_N     ,   //HS (High Speed) Data Lane 1
          output [`HS_DW - 1'b1:0] data_out1        ,   //HS (High Speed) Byte Data, Lane 1
          output [1:0]  lp_data1_out     ,   //LP (Low Power) Data Receiving Signals for Data Lane 1
       `ifdef BEFORE_LANE_1
          output [`HS_DW - 1'b1:0] data_bf_lane1    ,
       `endif
     `elsif MIPI_LANE1
          inout         MIPI_LANE1_P     ,   //HS (High Speed) Data Lane 1
          inout         MIPI_LANE1_N     ,   //HS (High Speed) Data Lane 1	
          output [`HS_DW - 1'b1:0] data_out1        ,   //HS (High Speed) Byte Data, Lane 1
          output [1:0]  lp_data1_out     ,   //LP (Low Power) Data Receiving Signals for Data Lane 1
          input  [1:0]  lp_data1_in      ,   //LP (Low Power) Data Transmitting Signals for Data Lane 1
          input         lp_data1_dir     ,   //LP (Low Power) Data Receive/Transmit Control for Data Lane 1
       `ifdef BEFORE_LANE_1
          output [`HS_DW - 1'b1:0] data_bf_lane1    ,
       `endif
     `endif
     `ifdef MIPI_COMB_LANE0
          inout         MIPI_COMB_LANE0_P     ,   //HS (High Speed) Data Lane 0
          inout         MIPI_COMB_LANE0_N     ,   //HS (High Speed) Data Lane 0
          output [`HS_DW - 1'b1:0] data_out0        ,   //HS (High Speed) Byte Data, Lane 0
          output [1:0]  lp_data0_out     ,   //LP (Low Power) Data Receiving Signals for Data Lane 0
       `ifdef BEFORE_LANE_0
          output [`HS_DW - 1'b1:0] data_bf_lane0    ,
       `endif
     `elsif MIPI_LANE0
          inout         MIPI_LANE0_P     ,   //HS (High Speed) Data Lane 0
          inout         MIPI_LANE0_N     ,   //HS (High Speed) Data Lane 0	
          output [`HS_DW - 1'b1:0] data_out0        ,   //HS (High Speed) Byte Data, Lane 0
          output [1:0]  lp_data0_out     ,   //LP (Low Power) Data Receiving Signals for Data Lane 0
          input  [1:0]  lp_data0_in      ,   //LP (Low Power) Data Transmitting Signals for Data Lane 0
          input         lp_data0_dir     ,   //LP (Low Power) Data Receive/Transmit Control for Data Lane 0
       `ifdef BEFORE_LANE_0
          output [`HS_DW - 1'b1:0] data_bf_lane0    ,
       `endif
     `endif
     `ifdef HS_DATA3
		`ifdef  gw5at
			`ifdef  ELVDS_LANE3
				inout        HS_DATA3_P          ,   //HS (High Speed) Clock
				inout        HS_DATA3_N          ,   //HS (High Speed) Clock					
			`else 
				input        HS_DATA3_P          ,   //HS (High Speed) Clock
				input        HS_DATA3_N          ,   //HS (High Speed) Clock						
			`endif 
		`else 
          input        HS_DATA3_P          ,   //HS (High Speed) Clock
          input        HS_DATA3_N          ,   //HS (High Speed) Clock
		`endif
          output [`HS_DW - 1'b1:0] data_out3       ,   //HS (High Speed) Byte Data, Lane 3
      `ifdef BEFORE_LANE_3
          output [`HS_DW - 1'b1:0] data_bf_lane3    ,
       `endif
     `endif
     `ifdef HS_DATA2
		`ifdef  gw5at
			`ifdef  ELVDS_LANE2
				inout        HS_DATA2_P          ,   //HS (High Speed) Clock
				inout        HS_DATA2_N          ,   //HS (High Speed) Clock					
			`else 
				input        HS_DATA2_P          ,   //HS (High Speed) Clock
				input        HS_DATA2_N          ,   //HS (High Speed) Clock						
			`endif 
		`else 
          input        HS_DATA2_P          ,   //HS (High Speed) Clock
          input        HS_DATA2_N          ,   //HS (High Speed) Clock
		`endif
          output [`HS_DW - 1'b1:0] data_out2        ,   //HS (High Speed) Byte Data, Lane 2
       `ifdef BEFORE_LANE_2
          output [`HS_DW - 1'b1:0] data_bf_lane2    ,
       `endif
     `endif
     `ifdef HS_DATA1
		`ifdef  gw5at
			`ifdef  ELVDS_LANE1
				inout        HS_DATA1_P          ,   //HS (High Speed) Clock
				inout        HS_DATA1_N          ,   //HS (High Speed) Clock					
			`else 
				input        HS_DATA1_P          ,   //HS (High Speed) Clock
				input        HS_DATA1_N          ,   //HS (High Speed) Clock						
			`endif 
		`else 
          input        HS_DATA1_P          ,   //HS (High Speed) Clock
          input        HS_DATA1_N          ,   //HS (High Speed) Clock
		`endif
          output [`HS_DW - 1'b1:0] data_out1       ,   //HS (High Speed) Byte Data, Lane 1
       `ifdef BEFORE_LANE_1
          output [`HS_DW - 1'b1:0] data_bf_lane1   ,
       `endif
     `endif
     `ifdef HS_DATA0
		`ifdef  gw5at
			`ifdef  ELVDS_LANE0
				inout        HS_DATA0_P          ,   //HS (High Speed) Clock
				inout        HS_DATA0_N          ,   //HS (High Speed) Clock					
			`else 
				input        HS_DATA0_P          ,   //HS (High Speed) Clock
				input        HS_DATA0_N          ,   //HS (High Speed) Clock						
			`endif  
		`else 
          input        HS_DATA0_P          ,   //HS (High Speed) Clock
          input        HS_DATA0_N          ,   //HS (High Speed) Clock
		`endif
          output [`HS_DW - 1'b1:0] data_out0       ,   //HS (High Speed) Byte Data, Lane 0
       `ifdef BEFORE_LANE_0
          output [`HS_DW - 1'b1:0] data_bf_lane0   ,
       `endif
     `endif
     `ifdef LP_CLK
          inout  [1:0] LP_CLK           ,   //LP (Low Power) External Interface Signals for Clock Lane
          output [1:0] lp_clk_out       ,   //LP (Low Power) Data Receiving Signals for Clock Lane
          input  [1:0] lp_clk_in        ,   //LP (Low Power) Data Transmitting Signals for Clock Lane
          input        lp_clk_dir       ,   //LP (Low Power) Data Receive/Transmit Control for Clock Lane
     `endif
     `ifdef LP_DATA3
          inout  [1:0] LP_DATA3         ,   //LP (Low Power) External Interface Signals for Data Lane 3
          output [1:0] lp_data3_out     ,   //LP (Low Power) Data Receiving Signals for Data Lane 3
          input  [1:0] lp_data3_in      ,   //LP (Low Power) Data Transmitting Signals for Data Lane 3
          input        lp_data3_dir     ,   //LP (Low Power) Data Receive/Transmit Control for Data Lane 3
     `endif
     `ifdef LP_DATA2
          inout  [1:0] LP_DATA2         ,   //LP (Low Power) External Interface Signals for Data Lane 2
          output [1:0] lp_data2_out     ,   //LP (Low Power) Data Receiving Signals for Data Lane 2
          input  [1:0] lp_data2_in      ,   //LP (Low Power) Data Transmitting Signals for Data Lane 2
          input        lp_data2_dir     ,   //LP (Low Power) Data Receive/Transmit Control for Data Lane 2
     `endif
     `ifdef LP_DATA1
          inout  [1:0] LP_DATA1         ,   //LP (Low Power) External Interface Signals for Data Lane 1
          output [1:0] lp_data1_out     ,   //LP (Low Power) Data Receiving Signals for Data Lane 1
          input  [1:0] lp_data1_in      ,   //LP (Low Power) Data Transmitting Signals for Data Lane 1
          input        lp_data1_dir     ,   //LP (Low Power) Data Receive/Transmit Control for Data Lane 1
     `endif
     `ifdef LP_DATA0
          inout  [1:0] LP_DATA0         ,   //LP (Low Power) External Interface Signals for Data Lane 0
          output [1:0] lp_data0_out     ,   //LP (Low Power) Data Receiving Signals for Data Lane 0
          input  [1:0] lp_data0_in      ,   //LP (Low Power) Data Transmitting Signals for Data Lane 0
          input        lp_data0_dir     ,   //LP (Low Power) Data Receive/Transmit Control for Data Lane 0
     `endif
          input  hs_en                  ,   //HS (High Speed) Enable
          //input  term_en                ,   //Termination Enable
          input  clk_term_en            ,   //Termination Enable
          input  data_term_en           ,   //Termination Enable
          output ready                      //Alignment Synchronization Status


      );
	  
	  
`ifdef sim
DPHY_RX DPHY_RX_INST
`else 
`getname(DPHY_RX,`module_name_rx) DPHY_RX_INST
`endif 
(
          .reset_n        (reset_n)       ,
     `ifdef MIPI_COMB_CLK
          .MIPI_COMB_CLK_P(MIPI_COMB_CLK_P),
          .MIPI_COMB_CLK_N(MIPI_COMB_CLK_N),
          .lp_clk_out     (lp_clk_out)     ,
     `elsif MIPI_CLK
          .MIPI_CLK_P     (MIPI_CLK_P)    ,
          .MIPI_CLK_N     (MIPI_CLK_N)    ,
          .lp_clk_out     (lp_clk_out)    ,
          .lp_clk_in      (lp_clk_in)     ,
          .lp_clk_dir     (lp_clk_dir)    ,
     `elsif HS_CLK
          .HS_CLK_P       (HS_CLK_P)      ,
          .HS_CLK_N       (HS_CLK_N)      ,
     `endif

     `ifdef CROSS_FIFO
          .clk_byte       (clk_byte)      ,
     `endif
          .clk_byte_out   (clk_byte_out)  ,
     `ifdef MIPI_COMB_LANE3
          .MIPI_COMB_LANE3_P(MIPI_COMB_LANE3_P)  ,
          .MIPI_COMB_LANE3_N(MIPI_COMB_LANE3_N)  ,
          .data_out3      (data_out3)     ,
          .lp_data3_out   (lp_data3_out)  ,
        `ifdef BEFORE_LANE_3
          .data_bf_lane3  (data_bf_lane3) ,
        `endif
     `elsif MIPI_LANE3
          .MIPI_LANE3_P   (MIPI_LANE3_P)  ,
          .MIPI_LANE3_N   (MIPI_LANE3_N)  ,
          .data_out3      (data_out3)     ,
          .lp_data3_out   (lp_data3_out)  ,
          .lp_data3_in    (lp_data3_in)   ,
          .lp_data3_dir   (lp_data3_dir)  ,
        `ifdef BEFORE_LANE_3
          .data_bf_lane3  (data_bf_lane3) ,
        `endif
     `endif
     `ifdef MIPI_COMB_LANE2
           .MIPI_COMB_LANE2_P(MIPI_COMB_LANE2_P)  ,
           .MIPI_COMB_LANE2_N(MIPI_COMB_LANE2_N)  ,
           .data_out2      (data_out2)     ,
           .lp_data2_out   (lp_data2_out)  ,
        `ifdef BEFORE_LANE_2
           .data_bf_lane2  (data_bf_lane2) ,
        `endif
     `elsif MIPI_LANE2
           .MIPI_LANE2_P   (MIPI_LANE2_P)  ,
           .MIPI_LANE2_N   (MIPI_LANE2_N)  ,
           .data_out2      (data_out2)     ,
           .lp_data2_out   (lp_data2_out)  ,
           .lp_data2_in    (lp_data2_in)   ,
           .lp_data2_dir   (lp_data2_dir)  ,
        `ifdef BEFORE_LANE_2
           .data_bf_lane2  (data_bf_lane2) ,
        `endif
     `endif
     `ifdef MIPI_COMB_LANE1
           .MIPI_COMB_LANE1_P(MIPI_COMB_LANE1_P)  ,
           .MIPI_COMB_LANE1_N(MIPI_COMB_LANE1_N)  ,
           .data_out1      (data_out1)     ,
           .lp_data1_out   (lp_data1_out)  ,
        `ifdef BEFORE_LANE_1
           .data_bf_lane1     (data_bf_lane1) ,
        `endif
     `elsif MIPI_LANE1
           .MIPI_LANE1_P   (MIPI_LANE1_P)  ,
           .MIPI_LANE1_N   (MIPI_LANE1_N)  ,
           .data_out1      (data_out1)     ,
           .lp_data1_out   (lp_data1_out)  ,
           .lp_data1_in    (lp_data1_in)   ,
           .lp_data1_dir   (lp_data1_dir)  ,
        `ifdef BEFORE_LANE_1
           .data_bf_lane1     (data_bf_lane1) ,
        `endif
     `endif
     `ifdef MIPI_COMB_LANE0
           .MIPI_COMB_LANE0_P(MIPI_COMB_LANE0_P)  ,
           .MIPI_COMB_LANE0_N(MIPI_COMB_LANE0_N)  ,
           .data_out0      (data_out0)     ,
           .lp_data0_out   (lp_data0_out)  ,
        `ifdef BEFORE_LANE_0
           .data_bf_lane0      (data_bf_lane0) ,
        `endif
     `elsif MIPI_LANE0
           .MIPI_LANE0_P   (MIPI_LANE0_P)  ,
           .MIPI_LANE0_N   (MIPI_LANE0_N)  ,
           .data_out0      (data_out0)     ,
           .lp_data0_out   (lp_data0_out)  ,
           .lp_data0_in    (lp_data0_in)   ,
           .lp_data0_dir   (lp_data0_dir)  ,
        `ifdef BEFORE_LANE_0
           .data_bf_lane0      (data_bf_lane0) ,
        `endif
     `endif
     `ifdef HS_DATA3
           .HS_DATA3_P     (HS_DATA3_P)    ,
           .HS_DATA3_N     (HS_DATA3_N)    ,
           .data_out3      (data_out3)     ,
      `ifdef BEFORE_LANE_3
           .data_bf_lane3  (data_bf_lane3  ),
       `endif
     `endif
     `ifdef HS_DATA2
           .HS_DATA2_P     (HS_DATA2_P)    ,
           .HS_DATA2_N     (HS_DATA2_N)    ,
           .data_out2      (data_out2)     ,
       `ifdef BEFORE_LANE_2
           .data_bf_lane2  (data_bf_lane2  ),
       `endif
     `endif
     `ifdef HS_DATA1
           .HS_DATA1_P     (HS_DATA1_P)    ,
           .HS_DATA1_N     (HS_DATA1_N)    ,
           .data_out1      (data_out1)     ,
       `ifdef BEFORE_LANE_1
           .data_bf_lane1  (data_bf_lane1  ),
       `endif
     `endif
     `ifdef HS_DATA0
          .HS_DATA0_P     (HS_DATA0_P)    ,
          .HS_DATA0_N     (HS_DATA0_N)    ,
          .data_out0      (data_out0)     ,
       `ifdef BEFORE_LANE_0
          .data_bf_lane0  (data_bf_lane0  ),
       `endif
     `endif
     `ifdef LP_CLK
          .LP_CLK         (LP_CLK)        ,
          .lp_clk_out     (lp_clk_out)    ,
          .lp_clk_in      (lp_clk_in)     ,
          .lp_clk_dir     (lp_clk_dir)    ,
     `endif
     `ifdef LP_DATA3
          .LP_DATA3       (LP_DATA3)      ,
          .lp_data3_out   (lp_data3_out)  ,
          .lp_data3_in    (lp_data3_in)   ,
          .lp_data3_dir   (lp_data3_dir)  ,
     `endif
     `ifdef LP_DATA2
          .LP_DATA2       (LP_DATA2)      ,
          .lp_data2_out   (lp_data2_out)  ,
          .lp_data2_in    (lp_data2_in)   ,
          .lp_data2_dir   (lp_data2_dir)  ,
     `endif
     `ifdef LP_DATA1
          .LP_DATA1       (LP_DATA1)      ,
          .lp_data1_out   (lp_data1_out)  ,
          .lp_data1_in    (lp_data1_in)   ,
          .lp_data1_dir   (lp_data1_dir)  ,
     `endif
     `ifdef LP_DATA0
          .LP_DATA0       (LP_DATA0)      ,
          .lp_data0_out   (lp_data0_out)  ,
          .lp_data0_in    (lp_data0_in)   ,
          .lp_data0_dir   (lp_data0_dir)  ,
     `endif
          .hs_en          (hs_en)         ,
          //.term_en        (term_en)       ,
          .clk_term_en    (clk_term_en)   ,
          .data_term_en   (data_term_en)  ,
          .ready          (ready)
      );

endmodule
