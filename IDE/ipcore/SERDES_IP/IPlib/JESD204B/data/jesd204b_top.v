`include"top_define.vh"
`include"static_macro_define.vh"
`include"jesd204b_top_defines.vh"

`timescale 1ns / 1ps





module `module_name (



	
	
`ifdef TX_AND_RX_EN

    input                               tx_rst_i            ,
    input                               tx_core_clk_i       ,
	input                               tx_cfg_clk_i        ,
	input                               tx_cfg_rstn_i       ,
	input   [31:0]                      tx_cfg_addr_i       ,
	input                               tx_cfg_sel_i        ,
	input                               tx_cfg_ena_i        ,
	input                               tx_cfg_wr_i         ,
	output  [31:0]                      tx_cfg_rdata_o      ,
	input   [31:0]                      tx_cfg_wdata_i      ,
	output                              tx_cfg_rdy_o        ,
	input   [3 :0]                      tx_cfg_strb_i       , 
    input                               tx_sysref_i         ,
    input                               tx_sync_i           ,
    output                              tx_data_ready_o     ,
    

    output  [4*`MODE-1:0]                       tx_data_sof_o       ,
    output  [4*`MODE-1:0]                       tx_data_eof_o       ,
    output  [4*`MODE-1:0]                       tx_data_somf_o      ,
    output  [4*`MODE-1:0]                       tx_data_eomf_o      ,
    input   [32*`MODE*`LANE-1:0]              tx_data_i           ,
    output  [80*`LANE-1:0]              serdes_txdata_o     ,
    output  [36*`MODE*`LANE-1:0]              tx_debug_o          ,  
                                        
                                                            
	input                               rx_rst_i            ,  
	input                               rx_core_clk_i       , 
	input                               rx_cfg_clk_i        ,
	input                               rx_cfg_rstn_i       ,
	input  [31:0]                       rx_cfg_addr_i       ,
	input                               rx_cfg_sel_i        ,
	input                               rx_cfg_ena_i        ,
	input                               rx_cfg_wr_i         ,
	output [31:0]                       rx_cfg_rdata_o      ,
	input  [31:0]                       rx_cfg_wdata_i      ,
	output                              rx_cfg_rdy_o        ,
	input  [3 :0]                       rx_cfg_strb_i       , 
	input                               rx_sysref_i         , 
	output                              rx_sync_o           , 
	output                              rx_data_valid_o     , 
	output [4*`MODE-1:0]                        rx_data_sof_o       ,  
	output [4*`MODE-1:0]                        rx_data_eof_o       ,  
	output [4*`MODE-1:0]                        rx_data_somf_o      ,  
	output [4*`MODE-1:0]                        rx_data_eomf_o      ,  
	output [32*`MODE*`LANE-1:0]               rx_data_o           , 
	output [4*`MODE*`LANE*-1:0]                rx_data_err_o       , 
    input  [88*`LANE-1:0]               serdes_rxdata_i     , 
    output [44*`MODE*`LANE-1:0]               rx_debug_o          ,
     
    
    
`ifdef DRP_PORT_EN
	output                              user_drp_clk_o           ,  // jesd -> user
	input[23:0]                         user_drp_addr_i          ,  // user -> jesd 
	input                               user_drp_wren_i          ,  // user -> jesd 
	input[31:0]                         user_drp_wrdata_i        ,  // user -> jesd 
	input[7:0]                          user_drp_strb_i          ,  // user -> jesd 
	input                               user_drp_rden_i          ,  // user -> jesd 
	output                              user_drp_ready_o         ,  // jesd -> user
	output                              user_drp_rdvld_o         ,  // jesd -> user
	output [31:0]                       user_drp_rddata_o        ,  // jesd -> user
	output                              user_drp_resp_o          ,  // jesd -> user
	
    input                               upar_arbiter_drp_clk_i   ,	// upararbiter - >jesd
    output[23:0]                        upar_arbiter_drp_addr_o  ,	// jesd -> upararbiter 
    output                              upar_arbiter_drp_wren_o  ,	// jesd -> upararbiter 
    output[31:0]                        upar_arbiter_drp_wrdata_o,	// jesd -> upararbiter 
    output[7:0]                         upar_arbiter_drp_strb_o  , 	// jesd -> upararbiter 
	output                              upar_arbiter_drp_rden_o  ,	// jesd -> upararbiter
    input                               upar_arbiter_drp_ready_i ,	// upararbiter -> jesd 
    input                               upar_arbiter_drp_rdvld_i ,	// upararbiter -> jesd
    input [31:0]                        upar_arbiter_drp_rddata_i,	// upararbiter -> jesd
    input                               upar_arbiter_drp_resp_i  ,	// upararbiter -> jesd
`endif	
	
	
    //COMMON     
    input                               serdes_q0_qpll0_ok_i   ,   // serdes -> jesd
    input                               serdes_q0_qpll1_ok_i   ,   // serdes -> jesd
    input                               serdes_q1_qpll0_ok_i   ,   // serdes -> jesd
    input                               serdes_q1_qpll1_ok_i   ,   // serdes -> jesd
    input  [1*`LANE-1:0]                serdes_cpll_ok_i    ,   // serdes -> jesd 
    output                              gt_q0_qpll0_ok_o          ,   // jesd -> user
    output                              gt_q0_qpll1_ok_o          ,   // jesd -> user
    output                              gt_q1_qpll0_ok_o          ,   // jesd -> user
    output                              gt_q1_qpll1_ok_o          ,   // jesd -> user
    output  [1*`LANE-1:0]                gt_cpll_ok_o           ,   // jesd -> user        
    
    input                               gt_fabric_rstn_i       ,   // user -> jesd
    output                              serdes_fabric_rstn_o,   // jesd -> serdes
    
    //serdes connect TX
    input  [1*`LANE-1:0]                 serdes_pcs_tx_clk_i   ,   // serdes -> jesd
    output                              gt_pcs_tx_clk_o          ,   // jesd -> user
    output                              serdes_fabric_tx_clk_o, // jesd -> serdes
    
    input                               gt_pcs_tx_rst_i,    
    output                              serdes_pcs_tx_rst_o,

    output                              serdes_fabric_tx_vld_o,    // jesd -> serdes 

    input   [5*`LANE-1:0]                serdes_tx_fifo_wrusewd_i,  // serdes -> jesd
    output  [5*`LANE-1:0]                gt_tx_fifo_wrusewd_o,  // jesd -> user(debug)

    //serdes connect RX
    
    input  [1*`LANE-1:0]                 serdes_pcs_rx_clk_i ,   // serdes -> jesd
    output                               gt_pcs_rx_clk_o ,   // jesd -> user    
    output                               serdes_fabric_rx_clk_o, // jesd -> serdes    
    
    
    input  [1*`LANE-1:0]                 serdes_pma_rx_lock_i  , // serdes -> jesd 
	input  [1*`LANE-1:0]                 serdes_rx_k_lock_i    , // serdes -> jesd
	input  [1*`LANE-1:0]                 serdes_rx_align_link_i, // serdes -> jesd
    
    output  [1*`LANE-1:0]                gt_pma_rx_lock_o  , // jesd -> user 
	output  [1*`LANE-1:0]                gt_rx_k_lock_o    , // jesd -> user
	output  [1*`LANE-1:0]                gt_rx_align_link_o, // jesd -> user
    
    input                               gt_pcs_rx_rst_i,
    output                              serdes_pcs_rx_rst_o,
    
    output  [1*`LANE-1:0]               serdes_rxfifo_rd_en_o,     // jesd -> serdes
    input   [1*`LANE-1:0]               serdes_rxfifo_aempty_i,    // serdes -> jesd 

    input   [5*`LANE-1:0]                serdes_rx_fifo_rdusewd_i,  // serdes -> jesd
    output  [5*`LANE-1:0]                gt_rx_fifo_rdusewd_o  // jesd -> user(debug)

	

	
`elsif TX_EN	
    input                               tx_rst_i            ,
    input                               tx_core_clk_i       ,
	input                               tx_cfg_clk_i        ,
	input                               tx_cfg_rstn_i       ,
	input   [31:0]                      tx_cfg_addr_i       ,
	input                               tx_cfg_sel_i        ,
	input                               tx_cfg_ena_i        ,
	input                               tx_cfg_wr_i         ,
	output  [31:0]                      tx_cfg_rdata_o      ,
	input   [31:0]                      tx_cfg_wdata_i      ,
	output                              tx_cfg_rdy_o        ,
	input   [3 :0]                      tx_cfg_strb_i       , 
    input                               tx_sysref_i         ,
    input                               tx_sync_i         ,
    output                              tx_data_ready_o     ,
    
    
    output  [4*`MODE-1:0]                       tx_data_sof_o       ,
    output  [4*`MODE-1:0]                       tx_data_eof_o       ,
    output  [4*`MODE-1:0]                       tx_data_somf_o      ,
    output  [4*`MODE-1:0]                       tx_data_eomf_o      ,
    input   [32*`MODE*`LANE-1:0]              tx_data_i           ,
    output  [80*`LANE-1:0]              serdes_txdata_o     ,
    output  [36*`MODE*`LANE-1:0]              tx_debug_o          ,      
    
    

	
`ifdef DRP_PORT_EN
	output                              user_drp_clk_o           ,  // jesd -> user
	input[23:0]                         user_drp_addr_i          ,  // user -> jesd 
	input                               user_drp_wren_i          ,  // user -> jesd 
	input[31:0]                         user_drp_wrdata_i        ,  // user -> jesd 
	input[7:0]                          user_drp_strb_i          ,  // user -> jesd 
	input                               user_drp_rden_i          ,  // user -> jesd 
	output                              user_drp_ready_o         ,  // jesd -> user
	output                              user_drp_rdvld_o         ,  // jesd -> user
	output [31:0]                       user_drp_rddata_o        ,  // jesd -> user
	output                              user_drp_resp_o          ,  // jesd -> user
	
    input                               upar_arbiter_drp_clk_i   ,	// upararbiter - >jesd
    output[23:0]                        upar_arbiter_drp_addr_o  ,	// jesd -> upararbiter 
    output                              upar_arbiter_drp_wren_o  ,	// jesd -> upararbiter 
    output[31:0]                        upar_arbiter_drp_wrdata_o,	// jesd -> upararbiter 
    output[7:0]                         upar_arbiter_drp_strb_o  , 	// jesd -> upararbiter 
	output                              upar_arbiter_drp_rden_o  ,	// jesd -> upararbiter
    input                               upar_arbiter_drp_ready_i ,	// upararbiter -> jesd 
    input                               upar_arbiter_drp_rdvld_i ,	// upararbiter -> jesd
    input [31:0]                        upar_arbiter_drp_rddata_i,	// upararbiter -> jesd
    input                               upar_arbiter_drp_resp_i  ,	// upararbiter -> jesd
`endif		
	
	
    //COMMON     
    input                               serdes_q0_qpll0_ok_i   ,   // serdes -> jesd
    input                               serdes_q0_qpll1_ok_i   ,   // serdes -> jesd
    input                               serdes_q1_qpll0_ok_i   ,   // serdes -> jesd
    input                               serdes_q1_qpll1_ok_i   ,   // serdes -> jesd
    input  [1*`LANE-1:0]                 serdes_cpll_ok_i    ,   // serdes -> jesd 
    output                              gt_q0_qpll0_ok_o          ,   // jesd -> user
    output                              gt_q0_qpll1_ok_o          ,   // jesd -> user
    output                              gt_q1_qpll0_ok_o          ,   // jesd -> user
    output                              gt_q1_qpll1_ok_o          ,   // jesd -> user
    output  [1*`LANE-1:0]                gt_cpll_ok_o           ,   // jesd -> user        
    
    input                               gt_fabric_rstn_i       ,   // user -> jesd
    output                              serdes_fabric_rstn_o,   // jesd -> serdes
    
    //serdes connect TX
    input  [1*`LANE-1:0]                 serdes_pcs_tx_clk_i   ,   // serdes -> jesd
    output                              gt_pcs_tx_clk_o          ,   // jesd -> user
    output                              serdes_fabric_tx_clk_o, // jesd -> serdes
    
    input                               gt_pcs_tx_rst_i,    
    output                              serdes_pcs_tx_rst_o,

    output                              serdes_fabric_tx_vld_o,    // jesd -> serdes 

    input   [5*`LANE-1:0]                serdes_tx_fifo_wrusewd_i,  // serdes -> jesd
    output  [5*`LANE-1:0]                gt_tx_fifo_wrusewd_o  // jesd -> user(debug)




    
`else	

	input                               rx_rst_i            ,  
	input                               rx_core_clk_i       , 
	input                               rx_cfg_clk_i        ,
	input                               rx_cfg_rstn_i       ,
	input  [31:0]                       rx_cfg_addr_i       ,
	input                               rx_cfg_sel_i        ,
	input                               rx_cfg_ena_i        ,
	input                               rx_cfg_wr_i         ,
	output [31:0]                       rx_cfg_rdata_o      ,
	input  [31:0]                       rx_cfg_wdata_i      ,
	output                              rx_cfg_rdy_o        ,
	input  [3 :0]                       rx_cfg_strb_i       , 
	input                               rx_sysref_i         , 
	output                              rx_sync_o         , 
	output                              rx_data_valid_o     , 
	output [4*`MODE-1:0]                        rx_data_sof_o       ,  
	output [4*`MODE-1:0]                        rx_data_eof_o       ,  
	output [4*`MODE-1:0]                        rx_data_somf_o      ,  
	output [4*`MODE-1:0]                        rx_data_eomf_o      ,  
	output [32*`MODE*`LANE-1:0]               rx_data_o           , 
	output [4*`MODE*`LANE*-1:0]                rx_data_err_o       , 
    input  [88*`LANE-1:0]               serdes_rxdata_i     , 
    output [44*`MODE*`LANE-1:0]               rx_debug_o          ,
 

    
`ifdef DRP_PORT_EN
	output                              user_drp_clk_o           ,  // jesd -> user
	input[23:0]                         user_drp_addr_i          ,  // user -> jesd 
	input                               user_drp_wren_i          ,  // user -> jesd 
	input[31:0]                         user_drp_wrdata_i        ,  // user -> jesd 
	input[7:0]                          user_drp_strb_i          ,  // user -> jesd 
	input                               user_drp_rden_i          ,  // user -> jesd 
	output                              user_drp_ready_o         ,  // jesd -> user
	output                              user_drp_rdvld_o         ,  // jesd -> user
	output [31:0]                       user_drp_rddata_o        ,  // jesd -> user
	output                              user_drp_resp_o          ,  // jesd -> user
	
    input                               upar_arbiter_drp_clk_i   ,	// upararbiter - >jesd
    output[23:0]                        upar_arbiter_drp_addr_o  ,	// jesd -> upararbiter 
    output                              upar_arbiter_drp_wren_o  ,	// jesd -> upararbiter 
    output[31:0]                        upar_arbiter_drp_wrdata_o,	// jesd -> upararbiter 
    output[7:0]                         upar_arbiter_drp_strb_o  , 	// jesd -> upararbiter 
	output                              upar_arbiter_drp_rden_o  ,	// jesd -> upararbiter
    input                               upar_arbiter_drp_ready_i ,	// upararbiter -> jesd 
    input                               upar_arbiter_drp_rdvld_i ,	// upararbiter -> jesd
    input [31:0]                        upar_arbiter_drp_rddata_i,	// upararbiter -> jesd
    input                               upar_arbiter_drp_resp_i  ,	// upararbiter -> jesd
`endif			
	
	
    //COMMON     
    input                               serdes_q0_qpll0_ok_i   ,   // serdes -> jesd
    input                               serdes_q0_qpll1_ok_i   ,   // serdes -> jesd
    input                               serdes_q1_qpll0_ok_i   ,   // serdes -> jesd
    input                               serdes_q1_qpll1_ok_i   ,   // serdes -> jesd
    input  [1*`LANE-1:0]                 serdes_cpll_ok_i    ,   // serdes -> jesd 
    output                              gt_q0_qpll0_ok_o          ,   // jesd -> user
    output                              gt_q0_qpll1_ok_o          ,   // jesd -> user
    output                              gt_q1_qpll0_ok_o          ,   // jesd -> user
    output                              gt_q1_qpll1_ok_o          ,   // jesd -> user
    output  [1*`LANE-1:0]                gt_cpll_ok_o           ,   // jesd -> user        
    
    input                               gt_fabric_rstn_i       ,   // user -> jesd
    output                              serdes_fabric_rstn_o,   // jesd -> serdes
    


    //serdes connect RX
    
    input  [1*`LANE-1:0]                 serdes_pcs_rx_clk_i ,   // serdes -> jesd
    output                              gt_pcs_rx_clk_o ,   // jesd -> user    
    output                              serdes_fabric_rx_clk_o, // jesd -> serdes    
    
    
    input  [1*`LANE-1:0]                 serdes_pma_rx_lock_i  , // serdes -> jesd 
	input  [1*`LANE-1:0]                 serdes_rx_k_lock_i    , // serdes -> jesd
	input  [1*`LANE-1:0]                 serdes_rx_align_link_i, // serdes -> jesd
    
    output  [1*`LANE-1:0]                gt_pma_rx_lock_o  , // jesd -> user 
	output  [1*`LANE-1:0]                gt_rx_k_lock_o    , // jesd -> user
	output  [1*`LANE-1:0]                gt_rx_align_link_o, // jesd -> user
    
    input                               gt_pcs_rx_rst_i,
    output                              serdes_pcs_rx_rst_o,
    
    output  [1*`LANE-1:0]                serdes_rxfifo_rd_en_o,     // jesd -> serdes
    input   [1*`LANE-1:0]                serdes_rxfifo_aempty_i,    // serdes -> jesd 

    input   [5*`LANE-1:0]                serdes_rx_fifo_rdusewd_i,  // serdes -> jesd
    output  [5*`LANE-1:0]                gt_rx_fifo_rdusewd_o  // jesd -> user(debug)

    
    
`endif

);






`ifdef TX_AND_RX_EN


`getname(jesd204b_core,`module_name)  #(
	.MODE            ( `MODE             ),
    .LANE            ( `LANE             ),
	.INIT_F          ( `INIT_F           ),
	.INIT_K          ( `INIT_K           ), 
	.INIT_SCAMEBLE   ( `INIT_SCAMEBLE    ), 
    .INIT_SYSMODE    ( `INIT_SYSMODE     ), 
	.INIT_REINIT_MODE( `INIT_REINIT_MODE ),
	.RPAT_EN         ( `RPAT_EN          ),
	.JSPAT_EN        ( `JSPAT_EN         ),
	.BUFFER_SIZE     ( `BUFFER_SIZE      ),
	.JESD_TX         ( `JESD_TX          ),
	.JESD_RX         ( `JESD_RX          ),
    .CFG_CLK         ( `CFG_CLK          ),
    .FIX_EN          ( `FIX_EN           ),
    .FIX_SCAM        ( `FIX_SCAM         ),
    .FIX_F           ( `FIX_F            )


) u_jesd204b_core
(
    .tx_rst_i                  ( tx_rst_i                ),
    .tx_core_clk_i             ( tx_core_clk_i           ),  
    // cfg  
	.tx_cfg_clk_i              ( tx_cfg_clk_i            ),
	.tx_cfg_rstn_i             ( tx_cfg_rstn_i           ),
	.tx_cfg_addr_i             ( tx_cfg_addr_i           ),
	.tx_cfg_sel_i              ( tx_cfg_sel_i            ),
	.tx_cfg_ena_i              ( tx_cfg_ena_i            ),
	.tx_cfg_wr_i               ( tx_cfg_wr_i             ),
	.tx_cfg_rdata_o            ( tx_cfg_rdata_o          ),
	.tx_cfg_wdata_i            ( tx_cfg_wdata_i          ),
	.tx_cfg_rdy_o              ( tx_cfg_rdy_o            ),
	.tx_cfg_strb_i             ( tx_cfg_strb_i           ), 

    .tx_sysref_i               ( tx_sysref_i             ),
    .tx_sync_i                 ( tx_sync_i             ),
	
    .tx_data_ready_o           ( tx_data_ready_o         ),
    .tx_data_sof_o             ( tx_data_sof_o           ),
    .tx_data_eof_o             ( tx_data_eof_o           ),
    .tx_data_somf_o            ( tx_data_somf_o          ),
    .tx_data_eomf_o            ( tx_data_eomf_o          ),
    .tx_data_i                 ( tx_data_i               ),

    .serdes_txdata_o           (serdes_txdata_o          ),
    .tx_debug_o                (tx_debug_o               ),
    
    .rx_rst_i                  ( rx_rst_i                ),  
    .rx_core_clk_i             ( rx_core_clk_i           ),

	.rx_cfg_clk_i              (rx_cfg_clk_i             ),
	.rx_cfg_rstn_i             (rx_cfg_rstn_i            ),
	.rx_cfg_addr_i             (rx_cfg_addr_i            ),
	.rx_cfg_sel_i              (rx_cfg_sel_i             ),
	.rx_cfg_ena_i              (rx_cfg_ena_i             ),
	.rx_cfg_wr_i               (rx_cfg_wr_i              ),
	.rx_cfg_rdata_o            (rx_cfg_rdata_o           ),
	.rx_cfg_wdata_i            (rx_cfg_wdata_i           ),
	.rx_cfg_rdy_o              (rx_cfg_rdy_o             ),
	.rx_cfg_strb_i             (rx_cfg_strb_i            ), 

    .rx_sysref_i               (rx_sysref_i              ),  
    .rx_sync_o                 (rx_sync_o                ),
	
    .rx_data_valid_o           ( rx_data_valid_o         ),
    .rx_data_sof_o             ( rx_data_sof_o           ),
    .rx_data_eof_o             ( rx_data_eof_o           ),
    .rx_data_somf_o            ( rx_data_somf_o          ),
    .rx_data_eomf_o            ( rx_data_eomf_o          ),
    .rx_data_o                 ( rx_data_o               ),
    .rx_data_err_o             ( rx_data_err_o           ),

    .serdes_rxdata_i           (serdes_rxdata_i          ),
    .rx_debug_o                (rx_debug_o               ),
	

`ifdef DRP_PORT_EN
	.user_drp_clk_o            ( user_drp_clk_o          ),     // jesd -> user      
	.user_drp_addr_i           ( user_drp_addr_i         ),     // user -> jesd     	
	.user_drp_wren_i           ( user_drp_wren_i         ),     // user -> jesd      	
	.user_drp_wrdata_i         ( user_drp_wrdata_i       ),     // user -> jesd    	
	.user_drp_strb_i           ( user_drp_strb_i         ),     // user -> jesd      	
	.user_drp_rden_i           ( user_drp_rden_i         ),     // user -> jesd      	
	.user_drp_ready_o          ( user_drp_ready_o        ),     // jesd -> user    	
	.user_drp_rdvld_o          ( user_drp_rdvld_o        ),     // jesd -> user    	
	.user_drp_rddata_o         ( user_drp_rddata_o       ),     // jesd -> user   	
	.user_drp_resp_o           ( user_drp_resp_o         ),     // jesd -> user     	
		                                                       
	.upar_arbiter_drp_clk_i    ( upar_arbiter_drp_clk_i   ),    // upararbiter - >jesd
	.upar_arbiter_drp_addr_o   ( upar_arbiter_drp_addr_o  ),  	// jesd -> upararbiter
	.upar_arbiter_drp_wren_o   ( upar_arbiter_drp_wren_o  ),  	// jesd -> upararbiter
	.upar_arbiter_drp_wrdata_o ( upar_arbiter_drp_wrdata_o),	// jesd -> upararbiter
	.upar_arbiter_drp_strb_o   ( upar_arbiter_drp_strb_o  ),  	// jesd -> upararbiter
	.upar_arbiter_drp_rden_o   ( upar_arbiter_drp_rden_o  ),  	// jesd -> upararbiter
	.upar_arbiter_drp_ready_i  ( upar_arbiter_drp_ready_i ), 	// upararbiter -> jesd
	.upar_arbiter_drp_rdvld_i  ( upar_arbiter_drp_rdvld_i ), 	// upararbiter -> jesd
	.upar_arbiter_drp_rddata_i ( upar_arbiter_drp_rddata_i),	// upararbiter -> jesd
	.upar_arbiter_drp_resp_i   ( upar_arbiter_drp_resp_i  ), 	// upararbiter -> jesd
`endif

//SERDES
    .serdes_q0_qpll0_ok_i        (serdes_q0_qpll0_ok_i       ),   // serdes -> jesd
    .serdes_q0_qpll1_ok_i        (serdes_q0_qpll1_ok_i       ),   // serdes -> jesd
    .serdes_q1_qpll0_ok_i        (serdes_q1_qpll0_ok_i       ),   // serdes -> jesd
    .serdes_q1_qpll1_ok_i        (serdes_q1_qpll1_ok_i       ),   // serdes -> jesd
    .serdes_cpll_ok_i            (serdes_cpll_ok_i           ),   // serdes -> jesd 
    .gt_q0_qpll0_ok_o            (gt_q0_qpll0_ok_o           ),   // jesd -> user
    .gt_q0_qpll1_ok_o            (gt_q0_qpll1_ok_o           ),   // jesd -> user
    .gt_q1_qpll0_ok_o            (gt_q1_qpll0_ok_o           ),   // jesd -> user
    .gt_q1_qpll1_ok_o            (gt_q1_qpll1_ok_o           ),   // jesd -> user
    .gt_cpll_ok_o                (gt_cpll_ok_o               ),   // jesd -> user        
    .gt_fabric_rstn_i            (gt_fabric_rstn_i           ),   // user -> jesd
    .serdes_fabric_rstn_o     (serdes_fabric_rstn_o    ),   // jesd -> serdes
    .serdes_pcs_tx_clk_i      (serdes_pcs_tx_clk_i     ),   // serdes -> jesd
    .gt_pcs_tx_clk_o             (gt_pcs_tx_clk_o            ),   // jesd -> user
    .serdes_fabric_tx_clk_o   (serdes_fabric_tx_clk_o  ), // jesd -> serdes
    .gt_pcs_tx_rst_i             (gt_pcs_tx_rst_i            ),    
    .serdes_pcs_tx_rst_o      (serdes_pcs_tx_rst_o     ),
    .serdes_fabric_tx_vld_o   (serdes_fabric_tx_vld_o  ),    // jesd -> serdes 
    .serdes_tx_fifo_wrusewd_i (serdes_tx_fifo_wrusewd_i),  // serdes -> jesd
    .gt_tx_fifo_wrusewd_o        (gt_tx_fifo_wrusewd_o       ),  // jesd -> user(debug)
    .serdes_pcs_rx_clk_i      (serdes_pcs_rx_clk_i     ),   // serdes -> jesd
    .gt_pcs_rx_clk_o             (gt_pcs_rx_clk_o            ),   // jesd -> user    
    .serdes_fabric_rx_clk_o   (serdes_fabric_rx_clk_o  ), // jesd -> serdes    
    .serdes_pma_rx_lock_i     (serdes_pma_rx_lock_i    ), // serdes -> jesd 
	.serdes_rx_k_lock_i       (serdes_rx_k_lock_i      ), // serdes -> jesd
	.serdes_rx_align_link_i   (serdes_rx_align_link_i  ), // serdes -> jesd
    .gt_pma_rx_lock_o            (gt_pma_rx_lock_o           ), // jesd -> user 
	.gt_rx_k_lock_o              (gt_rx_k_lock_o             ), // jesd -> user
	.gt_rx_align_link_o          (gt_rx_align_link_o         ), // jesd -> user
    .gt_pcs_rx_rst_i             (gt_pcs_rx_rst_i            ),
    .serdes_pcs_rx_rst_o      (serdes_pcs_rx_rst_o     ),
    .serdes_rxfifo_rd_en_o    (serdes_rxfifo_rd_en_o   ),    // jesd -> serdes
    .serdes_rxfifo_aempty_i   (serdes_rxfifo_aempty_i  ),    // serdes -> jesd 
    .serdes_rx_fifo_rdusewd_i (serdes_rx_fifo_rdusewd_i),    // serdes -> jesd
    .gt_rx_fifo_rdusewd_o        (gt_rx_fifo_rdusewd_o       )     // jesd -> user(debug)


);

`elsif TX_EN

`getname(jesd204b_core,`module_name)  #(
	.MODE            ( `MODE             ),
    .LANE            ( `LANE             ),
	.INIT_F          ( `INIT_F           ),
	.INIT_K          ( `INIT_K           ), 
	.INIT_SCAMEBLE   ( `INIT_SCAMEBLE    ), 
    .INIT_SYSMODE    ( `INIT_SYSMODE     ), 
	.INIT_REINIT_MODE( `INIT_REINIT_MODE ),
	.RPAT_EN         ( `RPAT_EN          ),
	.JSPAT_EN        ( `JSPAT_EN         ),
	.BUFFER_SIZE     ( `BUFFER_SIZE      ),
	.JESD_TX         ( `JESD_TX          ),
	.JESD_RX         ( `JESD_RX          ),
    .CFG_CLK         ( `CFG_CLK          ),
    .FIX_EN          ( `FIX_EN           ),
    .FIX_SCAM        ( `FIX_SCAM         ),
    .FIX_F           ( `FIX_F            )
) u_jesd204b_core
(
    .tx_rst_i                  ( tx_rst_i                ),
    .tx_core_clk_i             ( tx_core_clk_i           ),  
    // cfg  
	.tx_cfg_clk_i              ( tx_cfg_clk_i            ),
	.tx_cfg_rstn_i             ( tx_cfg_rstn_i           ),
	.tx_cfg_addr_i             ( tx_cfg_addr_i           ),
	.tx_cfg_sel_i              ( tx_cfg_sel_i            ),
	.tx_cfg_ena_i              ( tx_cfg_ena_i            ),
	.tx_cfg_wr_i               ( tx_cfg_wr_i             ),
	.tx_cfg_rdata_o            ( tx_cfg_rdata_o          ),
	.tx_cfg_wdata_i            ( tx_cfg_wdata_i          ),
	.tx_cfg_rdy_o              ( tx_cfg_rdy_o            ),
	.tx_cfg_strb_i             ( tx_cfg_strb_i           ), 

    .tx_sysref_i               ( tx_sysref_i             ),
    .tx_sync_i                 ( tx_sync_i             ),

    .tx_data_ready_o           ( tx_data_ready_o         ),
    .tx_data_sof_o             ( tx_data_sof_o           ),
    .tx_data_eof_o             ( tx_data_eof_o           ),
    .tx_data_somf_o            ( tx_data_somf_o          ),
    .tx_data_eomf_o            ( tx_data_eomf_o          ),
    .tx_data_i                 ( tx_data_i               ),

    .serdes_txdata_o           (serdes_txdata_o          ),
    .tx_debug_o                (tx_debug_o               ),
    

`ifdef DRP_PORT_EN
	.user_drp_clk_o            ( user_drp_clk_o          ),     // jesd -> user      
	.user_drp_addr_i           ( user_drp_addr_i         ),     // user -> jesd     	
	.user_drp_wren_i           ( user_drp_wren_i         ),     // user -> jesd      	
	.user_drp_wrdata_i         ( user_drp_wrdata_i       ),     // user -> jesd    	
	.user_drp_strb_i           ( user_drp_strb_i         ),     // user -> jesd      	
	.user_drp_rden_i           ( user_drp_rden_i         ),     // user -> jesd      	
	.user_drp_ready_o          ( user_drp_ready_o        ),     // jesd -> user    	
	.user_drp_rdvld_o          ( user_drp_rdvld_o        ),     // jesd -> user    	
	.user_drp_rddata_o         ( user_drp_rddata_o       ),     // jesd -> user   	
	.user_drp_resp_o           ( user_drp_resp_o         ),     // jesd -> user     	
		                                                       
	.upar_arbiter_drp_clk_i    ( upar_arbiter_drp_clk_i   ),    // upararbiter - >jesd
	.upar_arbiter_drp_addr_o   ( upar_arbiter_drp_addr_o  ),  	// jesd -> upararbiter
	.upar_arbiter_drp_wren_o   ( upar_arbiter_drp_wren_o  ),  	// jesd -> upararbiter
	.upar_arbiter_drp_wrdata_o ( upar_arbiter_drp_wrdata_o),	// jesd -> upararbiter
	.upar_arbiter_drp_strb_o   ( upar_arbiter_drp_strb_o  ),  	// jesd -> upararbiter
	.upar_arbiter_drp_rden_o   ( upar_arbiter_drp_rden_o  ),  	// jesd -> upararbiter
	.upar_arbiter_drp_ready_i  ( upar_arbiter_drp_ready_i ), 	// upararbiter -> jesd
	.upar_arbiter_drp_rdvld_i  ( upar_arbiter_drp_rdvld_i ), 	// upararbiter -> jesd
	.upar_arbiter_drp_rddata_i ( upar_arbiter_drp_rddata_i),	// upararbiter -> jesd
	.upar_arbiter_drp_resp_i   ( upar_arbiter_drp_resp_i  ), 	// upararbiter -> jesd
`endif	
	
	
//SERDES

    .serdes_q0_qpll0_ok_i        (serdes_q0_qpll0_ok_i       ),   // serdes -> jesd
    .serdes_q0_qpll1_ok_i        (serdes_q0_qpll1_ok_i       ),   // serdes -> jesd
    .serdes_q1_qpll0_ok_i        (serdes_q1_qpll0_ok_i       ),   // serdes -> jesd
    .serdes_q1_qpll1_ok_i        (serdes_q1_qpll1_ok_i       ),   // serdes -> jesd
    .serdes_cpll_ok_i         (serdes_cpll_ok_i        ),   // serdes -> jesd 
    .gt_q0_qpll0_ok_o            (gt_q0_qpll0_ok_o           ),   // jesd -> user
    .gt_q0_qpll1_ok_o            (gt_q0_qpll1_ok_o           ),   // jesd -> user
    .gt_q1_qpll0_ok_o            (gt_q1_qpll0_ok_o           ),   // jesd -> user
    .gt_q1_qpll1_ok_o            (gt_q1_qpll1_ok_o           ),   // jesd -> user
    .gt_cpll_ok_o                (gt_cpll_ok_o               ),   // jesd -> user        
    .gt_fabric_rstn_i            (gt_fabric_rstn_i           ),   // user -> jesd
    .serdes_fabric_rstn_o     (serdes_fabric_rstn_o    ),   // jesd -> serdes
    .serdes_pcs_tx_clk_i      (serdes_pcs_tx_clk_i     ),   // serdes -> jesd
    .gt_pcs_tx_clk_o             (gt_pcs_tx_clk_o            ),   // jesd -> user
    .serdes_fabric_tx_clk_o   (serdes_fabric_tx_clk_o  ), // jesd -> serdes
    .gt_pcs_tx_rst_i             (gt_pcs_tx_rst_i            ),    
    .serdes_pcs_tx_rst_o      (serdes_pcs_tx_rst_o     ),
    .serdes_fabric_tx_vld_o   (serdes_fabric_tx_vld_o  ),    // jesd -> serdes 
    .serdes_tx_fifo_wrusewd_i (serdes_tx_fifo_wrusewd_i),  // serdes -> jesd
    .gt_tx_fifo_wrusewd_o        (gt_tx_fifo_wrusewd_o       )  // jesd -> user(debug)



    
    
	

);


`else

`getname(jesd204b_core,`module_name)  #(
	.MODE            ( `MODE             ),
    .LANE            ( `LANE             ),
	.INIT_F          ( `INIT_F           ),
	.INIT_K          ( `INIT_K           ), 
	.INIT_SCAMEBLE   ( `INIT_SCAMEBLE    ), 
    .INIT_SYSMODE    ( `INIT_SYSMODE     ), 
	.INIT_REINIT_MODE( `INIT_REINIT_MODE ),
	.RPAT_EN         ( `RPAT_EN          ),
	.JSPAT_EN        ( `JSPAT_EN         ),
	.BUFFER_SIZE     ( `BUFFER_SIZE      ),
	.JESD_TX         ( `JESD_TX          ),
	.JESD_RX         ( `JESD_RX          ),
    .CFG_CLK         ( `CFG_CLK          ),
    .FIX_EN          ( `FIX_EN           ),
    .FIX_SCAM        ( `FIX_SCAM         ),
    .FIX_F           ( `FIX_F            )
) u_jesd204b_core
(
	
    .rx_rst_i                  ( rx_rst_i                ),  
    .rx_core_clk_i             ( rx_core_clk_i           ),

	.rx_cfg_clk_i              (rx_cfg_clk_i             ),
	.rx_cfg_rstn_i             (rx_cfg_rstn_i            ),
	.rx_cfg_addr_i             (rx_cfg_addr_i            ),
	.rx_cfg_sel_i              (rx_cfg_sel_i             ),
	.rx_cfg_ena_i              (rx_cfg_ena_i             ),
	.rx_cfg_wr_i               (rx_cfg_wr_i              ),
	.rx_cfg_rdata_o            (rx_cfg_rdata_o           ),
	.rx_cfg_wdata_i            (rx_cfg_wdata_i           ),
	.rx_cfg_rdy_o              (rx_cfg_rdy_o             ),
	.rx_cfg_strb_i             (rx_cfg_strb_i            ), 

    .rx_sysref_i               (rx_sysref_i              ),  
    .rx_sync_o                 (rx_sync_o              ),

    .rx_data_valid_o           ( rx_data_valid_o         ),
    .rx_data_sof_o             ( rx_data_sof_o           ),
    .rx_data_eof_o             ( rx_data_eof_o           ),
    .rx_data_somf_o            ( rx_data_somf_o          ),
    .rx_data_eomf_o            ( rx_data_eomf_o          ),
    .rx_data_o                 ( rx_data_o               ),
    .rx_data_err_o             ( rx_data_err_o           ),

    .serdes_rxdata_i           (serdes_rxdata_i          ),
    .rx_debug_o                (rx_debug_o               ),
    
	
`ifdef DRP_PORT_EN
	.user_drp_clk_o            ( user_drp_clk_o          ),     // jesd -> user      
	.user_drp_addr_i           ( user_drp_addr_i         ),     // user -> jesd     	
	.user_drp_wren_i           ( user_drp_wren_i         ),     // user -> jesd      	
	.user_drp_wrdata_i         ( user_drp_wrdata_i       ),     // user -> jesd    	
	.user_drp_strb_i           ( user_drp_strb_i         ),     // user -> jesd      	
	.user_drp_rden_i           ( user_drp_rden_i         ),     // user -> jesd      	
	.user_drp_ready_o          ( user_drp_ready_o        ),     // jesd -> user    	
	.user_drp_rdvld_o          ( user_drp_rdvld_o        ),     // jesd -> user    	
	.user_drp_rddata_o         ( user_drp_rddata_o       ),     // jesd -> user   	
	.user_drp_resp_o           ( user_drp_resp_o         ),     // jesd -> user     	
		                                                       
	.upar_arbiter_drp_clk_i    ( upar_arbiter_drp_clk_i   ),    // upararbiter - >jesd
	.upar_arbiter_drp_addr_o   ( upar_arbiter_drp_addr_o  ),  	// jesd -> upararbiter
	.upar_arbiter_drp_wren_o   ( upar_arbiter_drp_wren_o  ),  	// jesd -> upararbiter
	.upar_arbiter_drp_wrdata_o ( upar_arbiter_drp_wrdata_o),	// jesd -> upararbiter
	.upar_arbiter_drp_strb_o   ( upar_arbiter_drp_strb_o  ),  	// jesd -> upararbiter
	.upar_arbiter_drp_rden_o   ( upar_arbiter_drp_rden_o  ),  	// jesd -> upararbiter
	.upar_arbiter_drp_ready_i  ( upar_arbiter_drp_ready_i ), 	// upararbiter -> jesd
	.upar_arbiter_drp_rdvld_i  ( upar_arbiter_drp_rdvld_i ), 	// upararbiter -> jesd
	.upar_arbiter_drp_rddata_i ( upar_arbiter_drp_rddata_i),	// upararbiter -> jesd
	.upar_arbiter_drp_resp_i   ( upar_arbiter_drp_resp_i  ), 	// upararbiter -> jesd
`endif		
	
    
    .serdes_q0_qpll0_ok_i        (serdes_q0_qpll0_ok_i       ),   // serdes -> jesd
    .serdes_q0_qpll1_ok_i        (serdes_q0_qpll1_ok_i       ),   // serdes -> jesd
    .serdes_q1_qpll0_ok_i        (serdes_q1_qpll0_ok_i       ),   // serdes -> jesd
    .serdes_q1_qpll1_ok_i        (serdes_q1_qpll1_ok_i       ),   // serdes -> jesd
    .serdes_cpll_ok_i         (serdes_cpll_ok_i        ),   // serdes -> jesd 
    .gt_q0_qpll0_ok_o            (gt_q0_qpll0_ok_o           ),   // jesd -> user
    .gt_q0_qpll1_ok_o            (gt_q0_qpll1_ok_o           ),   // jesd -> user
    .gt_q1_qpll0_ok_o            (gt_q1_qpll0_ok_o           ),   // jesd -> user
    .gt_q1_qpll1_ok_o            (gt_q1_qpll1_ok_o           ),   // jesd -> user
    .gt_cpll_ok_o                (gt_cpll_ok_o               ),   // jesd -> user        
    .gt_fabric_rstn_i            (gt_fabric_rstn_i           ),   // user -> jesd
    .serdes_fabric_rstn_o     (serdes_fabric_rstn_o    ),   // jesd -> serdes
    .serdes_pcs_rx_clk_i      (serdes_pcs_rx_clk_i     ),   // serdes -> jesd
    .gt_pcs_rx_clk_o             (gt_pcs_rx_clk_o            ),   // jesd -> user    
    .serdes_fabric_rx_clk_o   (serdes_fabric_rx_clk_o  ), // jesd -> serdes    
    .serdes_pma_rx_lock_i     (serdes_pma_rx_lock_i    ), // serdes -> jesd 
	.serdes_rx_k_lock_i       (serdes_rx_k_lock_i      ), // serdes -> jesd
	.serdes_rx_align_link_i   (serdes_rx_align_link_i  ), // serdes -> jesd
    .gt_pma_rx_lock_o            (gt_pma_rx_lock_o           ), // jesd -> user 
	.gt_rx_k_lock_o              (gt_rx_k_lock_o             ), // jesd -> user
	.gt_rx_align_link_o          (gt_rx_align_link_o         ), // jesd -> user
    .gt_pcs_rx_rst_i             (gt_pcs_rx_rst_i            ),
    .serdes_pcs_rx_rst_o      (serdes_pcs_rx_rst_o     ),
    .serdes_rxfifo_rd_en_o    (serdes_rxfifo_rd_en_o   ),    // jesd -> serdes
    .serdes_rxfifo_aempty_i   (serdes_rxfifo_aempty_i  ),    // serdes -> jesd 
    .serdes_rx_fifo_rdusewd_i (serdes_rx_fifo_rdusewd_i),    // serdes -> jesd
    .gt_rx_fifo_rdusewd_o        (gt_rx_fifo_rdusewd_o       )     // jesd -> user(debug)    
    
	

);



`endif


endmodule
