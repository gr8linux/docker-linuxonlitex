`include"top_define.vh"
`include"static_macro_define.vh"
`include"uart_to_bus_top_defines.vh"


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:18 05/03/2018 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////







module `module_name #(
    parameter ADDR_WID = `ADDR_WIDTH,
    parameter DATA_WID = `DATA_WIDTH,
    parameter ADDR_EXTRA = $clog2(DATA_WID/8)

)(
	input                rst_n_i       ,                        
	input                clk_i         ,                
	

`ifdef APB_BUS

`ifdef IF0
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb0_addr_o   ,  
	output                          apb0_sel_o    ,
	output                          apb0_ena_o    ,
	output                          apb0_wr_o     ,
	input   [DATA_WID-1:0]          apb0_rdata_i  ,
	output  [DATA_WID-1:0]          apb0_wdata_o  ,
	input                           apb0_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb0_strb_o   ,
`endif
`ifdef IF1
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb1_addr_o   ,
	output                          apb1_sel_o    ,
	output                          apb1_ena_o    ,
	output                          apb1_wr_o     ,
	input   [DATA_WID-1:0]          apb1_rdata_i  ,
	output  [DATA_WID-1:0]          apb1_wdata_o  ,
	input                           apb1_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb1_strb_o   ,
`endif
`ifdef IF2
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb2_addr_o   ,
	output                          apb2_sel_o    ,
	output                          apb2_ena_o    ,
	output                          apb2_wr_o     ,
	input   [DATA_WID-1:0]          apb2_rdata_i  ,
	output  [DATA_WID-1:0]          apb2_wdata_o  ,
	input                           apb2_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb2_strb_o   ,
`endif
`ifdef IF3
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb3_addr_o   ,
	output                          apb3_sel_o    ,
	output                          apb3_ena_o    ,
	output                          apb3_wr_o     ,
	input   [DATA_WID-1:0]          apb3_rdata_i  ,
	output  [DATA_WID-1:0]          apb3_wdata_o  ,
	input                           apb3_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb3_strb_o   , 
`endif
`ifdef IF4
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb4_addr_o   ,
	output                          apb4_sel_o    ,
	output                          apb4_ena_o    ,
	output                          apb4_wr_o     ,
	input   [DATA_WID-1:0]          apb4_rdata_i  ,
	output  [DATA_WID-1:0]          apb4_wdata_o  ,
	input                           apb4_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb4_strb_o   , 
`endif
`ifdef IF5
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb5_addr_o   ,
	output                          apb5_sel_o    ,
	output                          apb5_ena_o    ,
	output                          apb5_wr_o     ,
	input   [DATA_WID-1:0]          apb5_rdata_i  ,
	output  [DATA_WID-1:0]          apb5_wdata_o  ,
	input                           apb5_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb5_strb_o   ,
`endif
`ifdef IF6
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb6_addr_o   ,
	output                          apb6_sel_o    ,
	output                          apb6_ena_o    ,
	output                          apb6_wr_o     ,
	input   [DATA_WID-1:0]          apb6_rdata_i  ,
	output  [DATA_WID-1:0]          apb6_wdata_o  ,
	input                           apb6_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb6_strb_o   ,	
`endif
`ifdef IF7
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb7_addr_o   ,
	output                          apb7_sel_o    ,
	output                          apb7_ena_o    ,
	output                          apb7_wr_o     ,
	input   [DATA_WID-1:0]          apb7_rdata_i  ,
	output  [DATA_WID-1:0]          apb7_wdata_o  ,
	input                           apb7_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb7_strb_o   ,	
`endif
`ifdef IF8
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb8_addr_o   ,
	output                          apb8_sel_o    ,
	output                          apb8_ena_o    ,
	output                          apb8_wr_o     ,
	input   [DATA_WID-1:0]          apb8_rdata_i  ,
	output  [DATA_WID-1:0]          apb8_wdata_o  ,
	input                           apb8_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb8_strb_o   ,
`endif
`ifdef IF9
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb9_addr_o   ,
	output                          apb9_sel_o    ,
	output                          apb9_ena_o    ,
	output                          apb9_wr_o     ,
	input   [DATA_WID-1:0]          apb9_rdata_i  ,
	output  [DATA_WID-1:0]          apb9_wdata_o  ,
	input                           apb9_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb9_strb_o   ,	
`endif
`ifdef IF10
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb10_addr_o   ,
	output                          apb10_sel_o    ,
	output                          apb10_ena_o    ,
	output                          apb10_wr_o     ,
	input   [DATA_WID-1:0]          apb10_rdata_i  ,
	output  [DATA_WID-1:0]          apb10_wdata_o  ,
	input                           apb10_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb10_strb_o   ,	
`endif
`ifdef IF11
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb11_addr_o   ,
	output                          apb11_sel_o    ,
	output                          apb11_ena_o    ,
	output                          apb11_wr_o     ,
	input   [DATA_WID-1:0]          apb11_rdata_i  ,
	output  [DATA_WID-1:0]          apb11_wdata_o  ,
	input                           apb11_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb11_strb_o   ,	
`endif
`ifdef IF12
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb12_addr_o   ,
	output                          apb12_sel_o    ,
	output                          apb12_ena_o    ,
	output                          apb12_wr_o     ,
	input   [DATA_WID-1:0]          apb12_rdata_i  ,
	output  [DATA_WID-1:0]          apb12_wdata_o  ,
	input                           apb12_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb12_strb_o   ,	
`endif
`ifdef IF13
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb13_addr_o   ,
	output                          apb13_sel_o    ,
	output                          apb13_ena_o    ,
	output                          apb13_wr_o     ,
	input   [DATA_WID-1:0]          apb13_rdata_i  ,
	output  [DATA_WID-1:0]          apb13_wdata_o  ,
	input                           apb13_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb13_strb_o   ,	 
`endif
`ifdef IF14
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb14_addr_o   ,
	output                          apb14_sel_o    ,
	output                          apb14_ena_o    ,
	output                          apb14_wr_o     ,
	input   [DATA_WID-1:0]          apb14_rdata_i  ,
	output  [DATA_WID-1:0]          apb14_wdata_o  ,
	input                           apb14_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb14_strb_o   ,	
`endif
`ifdef IF15
	output  [ADDR_WID+ADDR_EXTRA-1:0]        apb15_addr_o   ,
	output                          apb15_sel_o    ,
	output                          apb15_ena_o    ,
	output                          apb15_wr_o     ,
	input   [DATA_WID-1:0]          apb15_rdata_i  ,
	output  [DATA_WID-1:0]          apb15_wdata_o  ,
	input                           apb15_rdy_i    ,
	output  [DATA_WID/8-1:0]        apb15_strb_o   ,
`endif
`endif

`ifdef LOCAL_BUS
`ifdef IF0
	output                  local0_wren_o,
	output [ADDR_WID-1:0]   local0_addr_o,
	output                  local0_rden_o,
	output [DATA_WID-1:0]   local0_wdat_o,
	input  [DATA_WID-1:0]   local0_rdat_i,
	input                   local0_rdat_vld_i,
    input                   local0_wdat_rdy_i,
`endif
`ifdef IF1
	output                  local1_wren_o,
	output [ADDR_WID-1:0]   local1_addr_o,
	output                  local1_rden_o,
	output [DATA_WID-1:0]   local1_wdat_o,
	input  [DATA_WID-1:0]   local1_rdat_i,
	input                   local1_rdat_vld_i,
    input                   local1_wdat_rdy_i,
`endif
`ifdef IF2
	output                  local2_wren_o,
	output [ADDR_WID-1:0]   local2_addr_o,
	output                  local2_rden_o,
	output [DATA_WID-1:0]   local2_wdat_o,
	input  [DATA_WID-1:0]   local2_rdat_i,
	input                   local2_rdat_vld_i,
    input                   local2_wdat_rdy_i,
`endif
`ifdef IF3
	output                  local3_wren_o,
	output [ADDR_WID-1:0]   local3_addr_o,
	output                  local3_rden_o,
	output [DATA_WID-1:0]   local3_wdat_o,
	input  [DATA_WID-1:0]   local3_rdat_i,
	input                   local3_rdat_vld_i,
    input                   local3_wdat_rdy_i,	
`endif
`ifdef IF4
	output                  local4_wren_o,
	output [ADDR_WID-1:0]   local4_addr_o,
	output                  local4_rden_o,
	output [DATA_WID-1:0]   local4_wdat_o,
	input  [DATA_WID-1:0]   local4_rdat_i,
	input                   local4_rdat_vld_i,
    input                   local4_wdat_rdy_i,
`endif
`ifdef IF5
	output                  local5_wren_o,
	output [ADDR_WID-1:0]   local5_addr_o,
	output                  local5_rden_o,
	output [DATA_WID-1:0]   local5_wdat_o,
	input  [DATA_WID-1:0]   local5_rdat_i,
	input                   local5_rdat_vld_i,
    input                   local5_wdat_rdy_i,
`endif
`ifdef IF6	
	output                  local6_wren_o,
	output [ADDR_WID-1:0]   local6_addr_o,
	output                  local6_rden_o,
	output [DATA_WID-1:0]   local6_wdat_o,
	input  [DATA_WID-1:0]   local6_rdat_i,
	input                   local6_rdat_vld_i,
    input                   local6_wdat_rdy_i,
`endif
`ifdef IF7	
	output                  local7_wren_o,
	output [ADDR_WID-1:0]   local7_addr_o,
	output                  local7_rden_o,
	output [DATA_WID-1:0]   local7_wdat_o,
	input  [DATA_WID-1:0]   local7_rdat_i,
	input                   local7_rdat_vld_i,
    input                   local7_wdat_rdy_i,		
`endif
`ifdef IF8	
	output                  local8_wren_o,
	output [ADDR_WID-1:0]   local8_addr_o,
	output                  local8_rden_o,
	output [DATA_WID-1:0]   local8_wdat_o,
	input  [DATA_WID-1:0]   local8_rdat_i,
	input                   local8_rdat_vld_i,
    input                   local8_wdat_rdy_i,
`endif
`ifdef IF9	
	output                  local9_wren_o,
	output [ADDR_WID-1:0]   local9_addr_o,
	output                  local9_rden_o,
	output [DATA_WID-1:0]   local9_wdat_o,
	input  [DATA_WID-1:0]   local9_rdat_i,
	input                   local9_rdat_vld_i,
    input                   local9_wdat_rdy_i,
`endif
`ifdef IF10	
	output                  local10_wren_o,
	output [ADDR_WID-1:0]   local10_addr_o,
	output                  local10_rden_o,
	output [DATA_WID-1:0]   local10_wdat_o,
	input  [DATA_WID-1:0]   local10_rdat_i,
	input                   local10_rdat_vld_i,
    input                   local10_wdat_rdy_i,
`endif
`ifdef IF11	
	output                  local11_wren_o,
	output [ADDR_WID-1:0]   local11_addr_o,
	output                  local11_rden_o,
	output [DATA_WID-1:0]   local11_wdat_o,
	input  [DATA_WID-1:0]   local11_rdat_i,
	input                   local11_rdat_vld_i,
    input                   local11_wdat_rdy_i,	
`endif
`ifdef IF12	
	output                  local12_wren_o,
	output [ADDR_WID-1:0]   local12_addr_o,
	output                  local12_rden_o,
	output [DATA_WID-1:0]   local12_wdat_o,
	input  [DATA_WID-1:0]   local12_rdat_i,
	input                   local12_rdat_vld_i,
    input                   local12_wdat_rdy_i,
`endif
`ifdef IF13	
	output                  local13_wren_o,
	output [ADDR_WID-1:0]   local13_addr_o,
	output                  local13_rden_o,
	output [DATA_WID-1:0]   local13_wdat_o,
	input  [DATA_WID-1:0]   local13_rdat_i,
	input                   local13_rdat_vld_i,
    input                   local13_wdat_rdy_i,
`endif
`ifdef IF14	
	output                  local14_wren_o,
	output [ADDR_WID-1:0]   local14_addr_o,
	output                  local14_rden_o,
	output [DATA_WID-1:0]   local14_wdat_o,
	input  [DATA_WID-1:0]   local14_rdat_i,
	input                   local14_rdat_vld_i,
    input                   local14_wdat_rdy_i,
`endif
`ifdef IF15	
	output                  local15_wren_o,
	output [ADDR_WID-1:0]   local15_addr_o,
	output                  local15_rden_o,
	output [DATA_WID-1:0]   local15_wdat_o,
	input  [DATA_WID-1:0]   local15_rdat_i,
	input                   local15_rdat_vld_i,
    input                   local15_wdat_rdy_i	
`endif
`endif

	output               uart_rx_led_o ,
	output               uart_tx_led_o ,
	
	input                uart_rx_i     ,
	output               uart_tx_o     
	
);

`ifdef    APB_BUS 
parameter                               BUS_MODE = 0;
`elsif    LOCAL_BUS 
parameter                               BUS_MODE = 1;
`endif





`ifdef    IF0 
parameter                               IF0_EN = 1;
`else 
parameter                               IF0_EN = 0;
`endif

`ifdef    IF1 
parameter                               IF1_EN = 1;
`else 
parameter                               IF1_EN = 0;
`endif

`ifdef    IF2 
parameter                               IF2_EN = 1;
`else 
parameter                               IF2_EN = 0;
`endif
  
`ifdef    IF3 
parameter                               IF3_EN = 1;
`else 
parameter                               IF3_EN = 0;
`endif
  
  
`ifdef    IF4 
parameter                               IF4_EN = 1;
`else 
parameter                               IF4_EN = 0;
`endif

`ifdef    IF5 
parameter                               IF5_EN = 1;
`else 
parameter                               IF5_EN = 0;
`endif

`ifdef    IF6 
parameter                               IF6_EN = 1;
`else 
parameter                               IF6_EN = 0;
`endif
  
`ifdef    IF7 
parameter                               IF7_EN = 1;
`else 
parameter                               IF7_EN = 0;
`endif
  
`ifdef    IF8 
parameter                               IF8_EN = 1;
`else 
parameter                               IF8_EN = 0;
`endif
  
`ifdef    IF9 
parameter                               IF9_EN = 1;
`else 
parameter                               IF9_EN = 0;
`endif
  
`ifdef    IF10 
parameter                               IF10_EN = 1;
`else 
parameter                               IF10_EN = 0;
`endif
  
`ifdef    IF11 
parameter                               IF11_EN = 1;
`else 
parameter                               IF11_EN = 0;
`endif
  
`ifdef    IF12 
parameter                               IF12_EN = 1;
`else 
parameter                               IF12_EN = 0;
`endif 
  
`ifdef    IF13 
parameter                               IF13_EN = 1;
`else 
parameter                               IF13_EN = 0;
`endif 
  
`ifdef    IF14 
parameter                               IF14_EN = 1;
`else 
parameter                               IF14_EN = 0;
`endif
  
`ifdef    IF15 
parameter                               IF15_EN = 1;
`else 
parameter                               IF15_EN = 0;
`endif
  
  
  
  
  

`getname(uart_bus_core,`module_name)  #(
    .BPS   (`BPS),
    .TIMEOUT(`TIMEOUT),
    .BUS_MODE(BUS_MODE),
	.ADDR_WID(ADDR_WID),
	.DATA_WID(DATA_WID),
    .IF0_EN(IF0_EN), .IF0_ADDR_START (`IF0_ADDR_START ),.IF0_ADDR_END  (`IF0_ADDR_END ),
	.IF1_EN(IF1_EN), .IF1_ADDR_START (`IF1_ADDR_START ),.IF1_ADDR_END  (`IF1_ADDR_END ),
	.IF2_EN(IF2_EN), .IF2_ADDR_START (`IF2_ADDR_START ),.IF2_ADDR_END  (`IF2_ADDR_END ),
	.IF3_EN(IF3_EN), .IF3_ADDR_START (`IF3_ADDR_START ),.IF3_ADDR_END  (`IF3_ADDR_END ),
	.IF4_EN(IF4_EN), .IF4_ADDR_START (`IF4_ADDR_START ),.IF4_ADDR_END  (`IF4_ADDR_END ),
	.IF5_EN(IF5_EN), .IF5_ADDR_START (`IF5_ADDR_START ),.IF5_ADDR_END  (`IF5_ADDR_END ),
	.IF6_EN(IF6_EN), .IF6_ADDR_START (`IF6_ADDR_START ),.IF6_ADDR_END  (`IF6_ADDR_END ),
	.IF7_EN(IF7_EN), .IF7_ADDR_START (`IF7_ADDR_START ),.IF7_ADDR_END  (`IF7_ADDR_END ),
	.IF8_EN(IF8_EN), .IF8_ADDR_START (`IF8_ADDR_START ),.IF8_ADDR_END  (`IF8_ADDR_END ),
	.IF9_EN(IF9_EN), .IF9_ADDR_START (`IF9_ADDR_START ),.IF9_ADDR_END  (`IF9_ADDR_END ),
	.IF10_EN(IF10_EN),.IF10_ADDR_START(`IF10_ADDR_START),.IF10_ADDR_END (`IF10_ADDR_END),
	.IF11_EN(IF11_EN),.IF11_ADDR_START(`IF11_ADDR_START),.IF11_ADDR_END (`IF11_ADDR_END),
	.IF12_EN(IF12_EN),.IF12_ADDR_START(`IF12_ADDR_START),.IF12_ADDR_END (`IF12_ADDR_END),
	.IF13_EN(IF13_EN),.IF13_ADDR_START(`IF13_ADDR_START),.IF13_ADDR_END (`IF13_ADDR_END),
	.IF14_EN(IF14_EN),.IF14_ADDR_START(`IF14_ADDR_START),.IF14_ADDR_END (`IF14_ADDR_END),
	.IF15_EN(IF15_EN),.IF15_ADDR_START(`IF15_ADDR_START),.IF15_ADDR_END (`IF15_ADDR_END)
) uart_bus_core(
	.rst_n_i                  (rst_n_i      ),                        
	.clk_i                    (clk_i        ),                
	.uart_rx_led_o            (uart_rx_led_o),
	.uart_tx_led_o            (uart_tx_led_o),
	.uart_rx_i                (uart_rx_i    ),
	.uart_tx_o                (uart_tx_o    ),
    .apb0_addr_o              (apb0_addr_o  ),
    .apb0_sel_o               (apb0_sel_o   ),
    .apb0_ena_o               (apb0_ena_o   ),
    .apb0_wr_o                (apb0_wr_o    ),
    .apb0_rdata_i             (apb0_rdata_i ),
    .apb0_wdata_o             (apb0_wdata_o ),
    .apb0_rdy_i               (apb0_rdy_i   ),
    .apb0_strb_o              (apb0_strb_o  ),  
    .apb1_addr_o              (apb1_addr_o  ),
    .apb1_sel_o               (apb1_sel_o   ),
    .apb1_ena_o               (apb1_ena_o   ),
    .apb1_wr_o                (apb1_wr_o    ),
    .apb1_rdata_i             (apb1_rdata_i ),
    .apb1_wdata_o             (apb1_wdata_o ),
    .apb1_rdy_i               (apb1_rdy_i   ),
    .apb1_strb_o              (apb1_strb_o  ),  
    .apb2_addr_o              (apb2_addr_o  ),
    .apb2_sel_o               (apb2_sel_o   ),
    .apb2_ena_o               (apb2_ena_o   ),
    .apb2_wr_o                (apb2_wr_o    ),
    .apb2_rdata_i             (apb2_rdata_i ),
    .apb2_wdata_o             (apb2_wdata_o ),
    .apb2_rdy_i               (apb2_rdy_i   ),
    .apb2_strb_o              (apb2_strb_o  ),	
    .apb3_addr_o              (apb3_addr_o  ),
    .apb3_sel_o               (apb3_sel_o   ),
    .apb3_ena_o               (apb3_ena_o   ),
    .apb3_wr_o                (apb3_wr_o    ),
    .apb3_rdata_i             (apb3_rdata_i ),
    .apb3_wdata_o             (apb3_wdata_o ),
    .apb3_rdy_i               (apb3_rdy_i   ),
    .apb3_strb_o              (apb3_strb_o  ),		
	
    .apb4_addr_o              (apb4_addr_o  ),
    .apb4_sel_o               (apb4_sel_o   ),
    .apb4_ena_o               (apb4_ena_o   ),
    .apb4_wr_o                (apb4_wr_o    ),
    .apb4_rdata_i             (apb4_rdata_i ),
    .apb4_wdata_o             (apb4_wdata_o ),
    .apb4_rdy_i               (apb4_rdy_i   ),
    .apb4_strb_o              (apb4_strb_o  ),  
    .apb5_addr_o              (apb5_addr_o  ),
    .apb5_sel_o               (apb5_sel_o   ),
    .apb5_ena_o               (apb5_ena_o   ),
    .apb5_wr_o                (apb5_wr_o    ),
    .apb5_rdata_i             (apb5_rdata_i ),
    .apb5_wdata_o             (apb5_wdata_o ),
    .apb5_rdy_i               (apb5_rdy_i   ),
    .apb5_strb_o              (apb5_strb_o  ),  
    .apb6_addr_o              (apb6_addr_o  ),
    .apb6_sel_o               (apb6_sel_o   ),
    .apb6_ena_o               (apb6_ena_o   ),
    .apb6_wr_o                (apb6_wr_o    ),
    .apb6_rdata_i             (apb6_rdata_i ),
    .apb6_wdata_o             (apb6_wdata_o ),
    .apb6_rdy_i               (apb6_rdy_i   ),
    .apb6_strb_o              (apb6_strb_o  ),	
    .apb7_addr_o              (apb7_addr_o  ),
    .apb7_sel_o               (apb7_sel_o   ),
    .apb7_ena_o               (apb7_ena_o   ),
    .apb7_wr_o                (apb7_wr_o    ),
    .apb7_rdata_i             (apb7_rdata_i ),
    .apb7_wdata_o             (apb7_wdata_o ),
    .apb7_rdy_i               (apb7_rdy_i   ),
    .apb7_strb_o              (apb7_strb_o  ),		

    .apb8_addr_o              (apb8_addr_o  ),
    .apb8_sel_o               (apb8_sel_o   ),
    .apb8_ena_o               (apb8_ena_o   ),
    .apb8_wr_o                (apb8_wr_o    ),
    .apb8_rdata_i             (apb8_rdata_i ),
    .apb8_wdata_o             (apb8_wdata_o ),
    .apb8_rdy_i               (apb8_rdy_i   ),
    .apb8_strb_o              (apb8_strb_o  ),  
    .apb9_addr_o              (apb9_addr_o  ),
    .apb9_sel_o               (apb9_sel_o   ),
    .apb9_ena_o               (apb9_ena_o   ),
    .apb9_wr_o                (apb9_wr_o    ),
    .apb9_rdata_i             (apb9_rdata_i ),
    .apb9_wdata_o             (apb9_wdata_o ),
    .apb9_rdy_i               (apb9_rdy_i   ),
    .apb9_strb_o              (apb9_strb_o  ),  
    .apb10_addr_o             (apb10_addr_o ),
    .apb10_sel_o              (apb10_sel_o  ),
    .apb10_ena_o              (apb10_ena_o  ),
    .apb10_wr_o               (apb10_wr_o   ),
    .apb10_rdata_i            (apb10_rdata_i),
    .apb10_wdata_o            (apb10_wdata_o),
    .apb10_rdy_i              (apb10_rdy_i  ),
    .apb10_strb_o             (apb10_strb_o ),	
    .apb11_addr_o             (apb11_addr_o ),
    .apb11_sel_o              (apb11_sel_o  ),
    .apb11_ena_o              (apb11_ena_o  ),
    .apb11_wr_o               (apb11_wr_o   ),
    .apb11_rdata_i            (apb11_rdata_i),
    .apb11_wdata_o            (apb11_wdata_o),
    .apb11_rdy_i              (apb11_rdy_i  ),
    .apb11_strb_o             (apb11_strb_o ),	
	
    .apb12_addr_o             (apb12_addr_o ),
    .apb12_sel_o              (apb12_sel_o  ),
    .apb12_ena_o              (apb12_ena_o  ),
    .apb12_wr_o               (apb12_wr_o   ),
    .apb12_rdata_i            (apb12_rdata_i),
    .apb12_wdata_o            (apb12_wdata_o),
    .apb12_rdy_i              (apb12_rdy_i  ),
    .apb12_strb_o             (apb12_strb_o ),	
    .apb13_addr_o             (apb13_addr_o ),
    .apb13_sel_o              (apb13_sel_o  ),
    .apb13_ena_o              (apb13_ena_o  ),
    .apb13_wr_o               (apb13_wr_o   ),
    .apb13_rdata_i            (apb13_rdata_i),
    .apb13_wdata_o            (apb13_wdata_o),
    .apb13_rdy_i              (apb13_rdy_i  ),
    .apb13_strb_o             (apb13_strb_o ),	
    .apb14_addr_o             (apb14_addr_o ),
    .apb14_sel_o              (apb14_sel_o  ),
    .apb14_ena_o              (apb14_ena_o  ),
    .apb14_wr_o               (apb14_wr_o   ),
    .apb14_rdata_i            (apb14_rdata_i),
    .apb14_wdata_o            (apb14_wdata_o),
    .apb14_rdy_i              (apb14_rdy_i  ),
    .apb14_strb_o             (apb14_strb_o ),	
    .apb15_addr_o             (apb15_addr_o ),
    .apb15_sel_o              (apb15_sel_o  ),
    .apb15_ena_o              (apb15_ena_o  ),
    .apb15_wr_o               (apb15_wr_o   ),
    .apb15_rdata_i            (apb15_rdata_i),
    .apb15_wdata_o            (apb15_wdata_o),
    .apb15_rdy_i              (apb15_rdy_i  ),
    .apb15_strb_o             (apb15_strb_o ),

	.local0_wren_o     (local0_wren_o     ),
	.local0_addr_o     (local0_addr_o     ),
	.local0_rden_o     (local0_rden_o     ),
	.local0_wdat_o     (local0_wdat_o     ),
	.local0_rdat_i     (local0_rdat_i     ),
	.local0_rdat_vld_i (local0_rdat_vld_i ),
    .local0_wdat_rdy_i (local0_wdat_rdy_i ),
	.local1_wren_o     (local1_wren_o     ),
	.local1_addr_o     (local1_addr_o     ),
	.local1_rden_o     (local1_rden_o     ),
	.local1_wdat_o     (local1_wdat_o     ),
	.local1_rdat_i     (local1_rdat_i     ),
	.local1_rdat_vld_i (local1_rdat_vld_i ),
    .local1_wdat_rdy_i (local1_wdat_rdy_i ),
	.local2_wren_o     (local2_wren_o     ),
	.local2_addr_o     (local2_addr_o     ),
	.local2_rden_o     (local2_rden_o     ),
	.local2_wdat_o     (local2_wdat_o     ),
	.local2_rdat_i     (local2_rdat_i     ),
	.local2_rdat_vld_i (local2_rdat_vld_i ),
    .local2_wdat_rdy_i (local2_wdat_rdy_i ),
	.local3_wren_o     (local3_wren_o     ),
	.local3_addr_o     (local3_addr_o     ),
	.local3_rden_o     (local3_rden_o     ),
	.local3_wdat_o     (local3_wdat_o     ),
	.local3_rdat_i     (local3_rdat_i     ),
	.local3_rdat_vld_i (local3_rdat_vld_i ),
    .local3_wdat_rdy_i (local3_wdat_rdy_i ),	
	.local4_wren_o     (local4_wren_o     ),
	.local4_addr_o     (local4_addr_o     ),
	.local4_rden_o     (local4_rden_o     ),
	.local4_wdat_o     (local4_wdat_o     ),
	.local4_rdat_i     (local4_rdat_i     ),
	.local4_rdat_vld_i (local4_rdat_vld_i ),
    .local4_wdat_rdy_i (local4_wdat_rdy_i ),
	.local5_wren_o     (local5_wren_o     ),
	.local5_addr_o     (local5_addr_o     ),
	.local5_rden_o     (local5_rden_o     ),
	.local5_wdat_o     (local5_wdat_o     ),
	.local5_rdat_i     (local5_rdat_i     ),
	.local5_rdat_vld_i (local5_rdat_vld_i ),
    .local5_wdat_rdy_i (local5_wdat_rdy_i ),
	.local6_wren_o     (local6_wren_o     ),
	.local6_addr_o     (local6_addr_o     ),
	.local6_rden_o     (local6_rden_o     ),
	.local6_wdat_o     (local6_wdat_o     ),
	.local6_rdat_i     (local6_rdat_i     ),
	.local6_rdat_vld_i (local6_rdat_vld_i ),
    .local6_wdat_rdy_i (local6_wdat_rdy_i ),
	.local7_wren_o     (local7_wren_o     ),
	.local7_addr_o     (local7_addr_o     ),
	.local7_rden_o     (local7_rden_o     ),
	.local7_wdat_o     (local7_wdat_o     ),
	.local7_rdat_i     (local7_rdat_i     ),
	.local7_rdat_vld_i (local7_rdat_vld_i ),
    .local7_wdat_rdy_i (local7_wdat_rdy_i ),		
	.local8_wren_o     (local8_wren_o     ),
	.local8_addr_o     (local8_addr_o     ),
	.local8_rden_o     (local8_rden_o     ),
	.local8_wdat_o     (local8_wdat_o     ),
	.local8_rdat_i     (local8_rdat_i     ),
	.local8_rdat_vld_i (local8_rdat_vld_i ),
    .local8_wdat_rdy_i (local8_wdat_rdy_i ),
	.local9_wren_o     (local9_wren_o     ),
	.local9_addr_o     (local9_addr_o     ),
	.local9_rden_o     (local9_rden_o     ),
	.local9_wdat_o     (local9_wdat_o     ),
	.local9_rdat_i     (local9_rdat_i     ),
	.local9_rdat_vld_i (local9_rdat_vld_i ),
    .local9_wdat_rdy_i (local9_wdat_rdy_i ),
	.local10_wren_o    (local10_wren_o    ),
	.local10_addr_o    (local10_addr_o    ),
	.local10_rden_o    (local10_rden_o    ),
	.local10_wdat_o    (local10_wdat_o    ),
	.local10_rdat_i    (local10_rdat_i    ),
	.local10_rdat_vld_i(local10_rdat_vld_i),
    .local10_wdat_rdy_i(local10_wdat_rdy_i),
	.local11_wren_o    (local11_wren_o    ),
	.local11_addr_o    (local11_addr_o    ),
	.local11_rden_o    (local11_rden_o    ),
	.local11_wdat_o    (local11_wdat_o    ),
	.local11_rdat_i    (local11_rdat_i    ),
	.local11_rdat_vld_i(local11_rdat_vld_i),
    .local11_wdat_rdy_i(local11_wdat_rdy_i),	
	.local12_wren_o    (local12_wren_o    ),
	.local12_addr_o    (local12_addr_o    ),
	.local12_rden_o    (local12_rden_o    ),
	.local12_wdat_o    (local12_wdat_o    ),
	.local12_rdat_i    (local12_rdat_i    ),
	.local12_rdat_vld_i(local12_rdat_vld_i),
    .local12_wdat_rdy_i(local12_wdat_rdy_i),
	.local13_wren_o    (local13_wren_o    ),
	.local13_addr_o    (local13_addr_o    ),
	.local13_rden_o    (local13_rden_o    ),
	.local13_wdat_o    (local13_wdat_o    ),
	.local13_rdat_i    (local13_rdat_i    ),
	.local13_rdat_vld_i(local13_rdat_vld_i),
    .local13_wdat_rdy_i(local13_wdat_rdy_i),
	.local14_wren_o    (local14_wren_o    ),
	.local14_addr_o    (local14_addr_o    ),
	.local14_rden_o    (local14_rden_o    ),
	.local14_wdat_o    (local14_wdat_o    ),
	.local14_rdat_i    (local14_rdat_i    ),
	.local14_rdat_vld_i(local14_rdat_vld_i),
    .local14_wdat_rdy_i(local14_wdat_rdy_i),
	.local15_wren_o    (local15_wren_o    ),
	.local15_addr_o    (local15_addr_o    ),
	.local15_rden_o    (local15_rden_o    ),
	.local15_wdat_o    (local15_wdat_o    ),
	.local15_rdat_i    (local15_rdat_i    ),
	.local15_rdat_vld_i(local15_rdat_vld_i),
    .local15_wdat_rdy_i(local15_wdat_rdy_i)	



	
);
		
		
		
		


endmodule

