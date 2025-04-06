
`include "static_macro_define.v"
`include "usb3_0_phy_name.v"
`include "usb3_0_phy_top_define.vh"

`ifdef MSIM
module USB3_0_PHY_TOP
`else
module `module_name
`endif
(
	input			    phy_resetn,
    input               ref_clk,
	
	//pipe interface
	output			    pclk,
	input       [31:0]  PipeTxData,
    input       [3:0]   PipeTxDataK,
    output      [31:0]  PipeRxData,
    output      [3:0]   PipeRxDataK,
    output              PipeRxDataValid,

    input               TxDetectRx_loopback,
    input               TxElecIdle,
    input               RxPolarity,
    input               RxEqTraining,
    input               RxTermination,
    output              RxElecIdle,
    output  [2:0]       RxStatus,
    input               TxOnesZeros,
    input   [1:0]       PowerDown,
    output              PhyStatus,
    output              PowerPresent,
    input               ElasticityBufferMode,

    //serdes interface
    input               serdes_upar_clk_i,
    output              serdes_upar_wren_o,
    output  [23:0]      serdes_upar_addr_o,
    output  [31:0]      serdes_upar_wrdata_o,
    output              serdes_upar_rden_o,
    input               serdes_upar_resp_i, 
    output  [7:0]       serdes_upar_strb_o,
    input   [31:0]      serdes_upar_rddata_i,
    input               serdes_upar_rdvld_i,
    input               serdes_upar_ready_i,
    input               serdes_q0_qpll0_ok_i,
    input               serdes_q0_qpll1_ok_i,
    input               serdes_q1_qpll0_ok_i,
    input               serdes_q1_qpll1_ok_i,
    input               serdes_cpll_ok_i,
    output              serdes_fabric_rstn_o,
    input               serdes_pcs_tx_clk_i,
    output              serdes_fabric_tx_clk_o,
    output              serdes_pcs_tx_rst_o,
    output              serdes_fabric_tx_vld_o,
    input   [4:0]       serdes_tx_fifo_wrusewd_i,
    output  [79:0]      serdes_txdata_o,
    input               serdes_pcs_rx_clk_i,
    output              serdes_fabric_rx_clk_o,
    input               serdes_pma_rx_lock_i,
    output              serdes_pcs_rx_rst_o,
    output              serdes_rxfifo_rd_en_o,
    input               serdes_rxfifo_aempty_i,
    input   [4:0]       serdes_rx_fifo_rdusewd_i,
    input   [87:0]      serdes_rxdata_i,
    input               serdes_rx_vld_i,
    input               serdes_rxelecidle_i,
    input   [5:0]       serdes_astat_i,
	output				serdes_locked_from_fabric
);

`getname(usb3_0_phy,`module_name) Inst_usb3_0_phy(
	.phy_resetn					(phy_resetn					), //input			
    .ref_clk                    (ref_clk                    ), //input	
	.pclk						(pclk						), //output			    
	.PipeTxData					(PipeTxData					), //input       [31:0]  
    .PipeTxDataK				(PipeTxDataK				), //input       [3:0]   
    .PipeRxData					(PipeRxData					), //output      [31:0]  
    .PipeRxDataK				(PipeRxDataK				), //output      [3:0]   
    .PipeRxDataValid			(PipeRxDataValid			), //output              
    .TxDetectRx_loopback		(TxDetectRx_loopback		), //input               
    .TxElecIdle					(TxElecIdle					), //input               
    .RxPolarity					(RxPolarity					), //input               
    .RxEqTraining				(RxEqTraining				), //input               
    .RxTermination				(RxTermination				), //input               
    .RxElecIdle					(RxElecIdle					), //output              
    .RxStatus					(RxStatus					), //output  [2:0]       
    .TxOnesZeros				(TxOnesZeros				), //input               
    .PowerDown					(PowerDown					), //input   [1:0]       
    .PhyStatus					(PhyStatus					), //output              
    .PowerPresent				(PowerPresent				), //output              
	.ElasticityBufferMode		(ElasticityBufferMode		), //input
    .serdes_upar_clk_i          (serdes_upar_clk_i          ),//input               
    .serdes_upar_wren_o         (serdes_upar_wren_o         ),//output              
    .serdes_upar_addr_o         (serdes_upar_addr_o         ),//output  [23:0]      
    .serdes_upar_wrdata_o       (serdes_upar_wrdata_o       ),//output  [31:0]      
    .serdes_upar_rden_o         (serdes_upar_rden_o         ),//output              
    .serdes_upar_resp_i         (serdes_upar_resp_i         ),//input                
    .serdes_upar_strb_o         (serdes_upar_strb_o         ),//output   [7:0]    
    .serdes_upar_rddata_i       (serdes_upar_rddata_i       ),//input   [31:0]      
    .serdes_upar_rdvld_i        (serdes_upar_rdvld_i        ),//input               
    .serdes_upar_ready_i        (serdes_upar_ready_i        ),//input               
    .serdes_q0_qpll0_ok_i		(serdes_q0_qpll0_ok_i		), //input               
    .serdes_q0_qpll1_ok_i		(serdes_q0_qpll1_ok_i		), //input               
    .serdes_q1_qpll0_ok_i		(serdes_q1_qpll0_ok_i		), //input               
    .serdes_q1_qpll1_ok_i		(serdes_q1_qpll1_ok_i		), //input               
    .serdes_cpll_ok_i			(serdes_cpll_ok_i			), //input               
    .serdes_fabric_rstn_o		(serdes_fabric_rstn_o		), //output              
    .serdes_pcs_tx_clk_i		(serdes_pcs_tx_clk_i		), //input               
    .serdes_fabric_tx_clk_o		(serdes_fabric_tx_clk_o		), //output              
    .serdes_pcs_tx_rst_o		(serdes_pcs_tx_rst_o		), //output              
    .serdes_fabric_tx_vld_o		(serdes_fabric_tx_vld_o		), //output              
    .serdes_tx_fifo_wrusewd_i	(serdes_tx_fifo_wrusewd_i	), //input   [4:0]       
    .serdes_txdata_o			(serdes_txdata_o			), //output  [79:0]      
    .serdes_pcs_rx_clk_i		(serdes_pcs_rx_clk_i		), //input               
    .serdes_fabric_rx_clk_o		(serdes_fabric_rx_clk_o		), //output              
    .serdes_pma_rx_lock_i		(serdes_pma_rx_lock_i		), //input               
    .serdes_pcs_rx_rst_o		(serdes_pcs_rx_rst_o		), //output              
    .serdes_rxfifo_rd_en_o		(serdes_rxfifo_rd_en_o		), //output              
    .serdes_rxfifo_aempty_i		(serdes_rxfifo_aempty_i		), //input               
    .serdes_rx_fifo_rdusewd_i	(serdes_rx_fifo_rdusewd_i	), //input   [4:0]       
    .serdes_rxdata_i			(serdes_rxdata_i			), //input   [87:0]      
    .serdes_rx_vld_i            (serdes_rx_vld_i            ), //input	
    .serdes_rxelecidle_i		(serdes_rxelecidle_i		), //input               
	.serdes_astat_i				(serdes_astat_i				), //input	 [5:0]
	.serdes_locked_from_fabric	(serdes_locked_from_fabric	)
);

endmodule