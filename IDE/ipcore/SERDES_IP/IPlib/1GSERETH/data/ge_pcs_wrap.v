
`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME (
		input           clk_in_i,
  		input           rstn_i,

  		input           serdes_pcs_tx_clk_i,//LANE#_PCS_TX_O_FABRIC_CLK
  		input           serdes_pcs_rx_clk_i,//LANE#_PCS_RX_O_FABRIC_CLK
  		input           serdes_qpll1_ok_i,//FABRIC_CMU1_OK_O
        input           serdes_qpll0_ok_i,//FABRIC_CMU_OK_O
        input           serdes_cpll_ok_i,//FABRIC_LANE#_CMU_OK_O
  		input           serdes_align_link_i,//LANE#_ALIGN_LINK
  		input           serdes_tx_fifo_afull_i,//LANE#_TX_IF_FIFO_AFULL
        output  [42:0]  serdes_fabric_ctrl_o,//FABRIC_LN#_CTRL_I
  		output  [42:0]  serdes_fabric_ctrl_h_o,//FABRIC_LN#_CTRL_I_H
  		output          serdes_fabric_rstn_o,//FABRIC_LN#_RSTN_I
  		output          serdes_fabric_tx_clk_o,//LANE#_FABRIC_TX_CLK
  		output          serdes_fabric_rx_clk_o,//LANE#_FABRIC_RX_CLK
  		output          serdes_pcs_tx_rst_o,//LANE#_PCS_TX_RST
  		output          serdes_pcs_rx_rst_o,//LANE#_PCS_RX_RST
    	output          serdes_fabric_tx_vld_o,//FABRIC_LN#_TX_VLD_IN
        input           serdes_rxfifo_aempty_i,//LANE#_RX_IF_FIFO_AEMPTY
        output          serdes_rxfifo_rd_en_o,//LANE#_RX_IF_FIFO_RDEN
        input   [10:0]  serdes_rxdata_i,//FABRIC_LN#_RXDATA_O
        output  [9:0]   serdes_txdata_o,//FABRIC_LN#_TXDATA_I
    //connected to an optical module to detect the presence of light
    	input           signal_detect_i, //1:presence; 0:not presence
    //config port
    //link_timer, multiplied by 32.768us
        input   [8:0]   basex_link_timer_i,
        input   [8:0]   sgmii_link_timer_i,
    	input           basex_or_sgmii_i,//0:base-x; 1:sgmii
    	input           sgmii_mode_i,//0:mac mode; 1:phy mode
    	input           repeater_mode_i,
    `ifdef MAC_FUNC
		output          rx_mac_clk_o,
		output          rx_mac_valid_o,
        output  [7:0]   rx_mac_data_o,
		output          rx_mac_last_o,
		output          rx_mac_error_o,

		output          tx_mac_clk_o,
		input           tx_mac_valid_i,
        input   [7:0]   tx_mac_data_i,
		input           tx_mac_last_i,
		input           tx_mac_error_i,
		output          tx_mac_ready_o,
		output          tx_collision_o,
		output          tx_retransmit_o,

		input           rx_fcs_fwd_ena_i,
		input           rx_jumbo_ena_i,
		output          rx_statistics_valid_o,
        output  [26:0]  rx_statistics_vector_o,
		output          rx_pause_req_o,
        output  [15:0]  rx_pause_val_o,

		input           tx_pause_req_i,
        input   [15:0]  tx_pause_val_i,
        input   [47:0]  tx_pause_source_addr_i,
		input           tx_ifg_delay_ena_i,
        input   [7:0]   tx_ifg_delay_i,
		input           tx_fcs_fwd_ena_i,
		output          tx_statistics_valid_o,
        output  [28:0]  tx_statistics_vector_o,
    //mdio
    	input           miim_hs_clk_i,             
        input           miim_rstn_i,
        input   [4:0]   miim_phyad_i,        
        input   [4:0]   miim_regad_i,        
        input   [15:0]  miim_wrdata_i,       
    	input           miim_wren_i,         
    	input           miim_rden_i,         
        output  [15:0]  miim_rddata_o,       
    	output          miim_rddata_valid_o,
    	output          miim_busy_o,         
    	output          mdc_o,               
    	input           mdio_in_i,           
    	output          mdio_out_o,          
    	output          mdio_oen_o,
    //pcs config
    	input  [14:0]   configuration_vector_i,
    `else
    //gmii port
    	output          gmii_tx_clk_o,
    	input           gmii_tx_en_i,
    	input           gmii_tx_er_i,
        input   [7:0]   gmii_txd_i,
    	output          gmii_col_o,
    	output          gmii_crs_o,
    	output          gmii_rx_clk_o,
        output  [7:0]   gmii_rxd_o,
    	output          gmii_rx_dv_o,  
    	output          gmii_rx_er_o,
    	output          gmii_isolate_o,
    `ifdef MDIO
    //mdio port
        input   [4:0]   phy_addr_i,
    	input           mdio_rstn_i,
    	input           mdc_i, 
    	input           mdio_in_i,
    	output          mdio_out_o,
    	output          mdio_oen_o,
    //OUI
        input   [15:0]  phy_reg2_i,
        input   [15:0]  phy_reg3_i,
    `else 
    //pcs config
        input   [14:0]  configuration_vector_i,
    `endif
    `endif
        output  [10:0]  status_vector_o,
        output  [15:0]  link_partner_ability_base_o
	);

`include "parameter.vh"

`getname(ge_pcs,`MODULE_NAME) u_ge_pcs(
		.clk_in						    (clk_in_i					),
		.rstn                           (rstn_i                     ),

        .serdes_pcs_tx_clk              (serdes_pcs_tx_clk_i        ),
        .serdes_pcs_rx_clk              (serdes_pcs_rx_clk_i        ),
        .serdes_qpll1_ok                (serdes_qpll1_ok_i          ),
        .serdes_qpll0_ok                (serdes_qpll0_ok_i          ),
        .serdes_cpll_ok                 (serdes_cpll_ok_i           ),
        .serdes_align_link              (serdes_align_link_i       ),
        .serdes_tx_fifo_afull           (serdes_tx_fifo_afull_i     ),
        .serdes_fabric_ctrl             (serdes_fabric_ctrl_o       ),
        .serdes_fabric_ctrl_h           (serdes_fabric_ctrl_h_o     ),
        .serdes_fabric_rstn             (serdes_fabric_rstn_o       ),
        .serdes_fabric_tx_clk           (serdes_fabric_tx_clk_o     ),
        .serdes_fabric_rx_clk           (serdes_fabric_rx_clk_o     ),
        .serdes_pcs_tx_rst              (serdes_pcs_tx_rst_o        ),
        .serdes_pcs_rx_rst              (serdes_pcs_rx_rst_o        ),
        .serdes_fabric_tx_vld           (serdes_fabric_tx_vld_o     ),
    //connected to an optical module to detect the presence of light
        .signal_detect                  (signal_detect_i            ),//1:presence; 0:not presence
    
        .serdes_rxfifo_aempty           (serdes_rxfifo_aempty_i	    ),
        .serdes_rxfifo_rd_en            (serdes_rxfifo_rd_en_o 	    ),//nc
    //from 8b10b decode
        .decode_k                       (serdes_rxdata_i[8]         ),
        .decode_rxd                     (serdes_rxdata_i[7:0]       ),
    //8b10b disparity and coding errors 
        .decode_disparity_err           (serdes_rxdata_i[9]	        ),
        .decode_coding_err              (serdes_rxdata_i[10]   	    ),
    //to 8b10b encode
        .encode_k                       (serdes_txdata_o[8]         ),
        .encode_txd                     (serdes_txdata_o[7:0]       ),
        .encode_disp_force              (   	                    ), //0:Auto Cal Disp; 1:Force Disp
        .encode_disp_val                (serdes_txdata_o[9]         ), // 0:Negative Running Disparity, 1:Positive Running Disparity
    //config port
    //link_timer; multiplied by 32.768us
        .basex_link_timer               (basex_link_timer_i         ),
        .sgmii_link_timer               (sgmii_link_timer_i         ),
        .basex_or_sgmii                 (basex_or_sgmii_i           ),//0:base-x; 1:sgmii
        .sgmii_mode                     (sgmii_mode_i               ),//0:mac mode; 1:phy mode
        .repeater_mode                  (repeater_mode_i            ),
    `ifdef MAC_FUNC
        .rx_mac_clk                     (rx_mac_clk_o               ),
        .rx_mac_valid                   (rx_mac_valid_o             ),
        .rx_mac_data                    (rx_mac_data_o              ),
        .rx_mac_last                    (rx_mac_last_o              ),
        .rx_mac_error                   (rx_mac_error_o             ),
        
        .tx_mac_clk                     (tx_mac_clk_o               ),
        .tx_mac_valid                   (tx_mac_valid_i             ),
        .tx_mac_data                    (tx_mac_data_i              ),
        .tx_mac_last                    (tx_mac_last_i              ),
        .tx_mac_error                   (tx_mac_error_i             ),
        .tx_mac_ready                   (tx_mac_ready_o             ),
        .tx_collision                   (tx_collision_o             ),
        .tx_retransmit                  (tx_retransmit_o            ),
        
        .rx_fcs_fwd_ena                 (rx_fcs_fwd_ena_i           ),
        .rx_jumbo_ena                   (rx_jumbo_ena_i             ),
        .rx_statistics_valid            (rx_statistics_valid_o      ),
        .rx_statistics_vector           (rx_statistics_vector_o     ),
        .rx_pause_req                   (rx_pause_req_o             ),
        .rx_pause_val                   (rx_pause_val_o             ),
        
        .tx_pause_req                   (tx_pause_req_i             ),
        .tx_pause_val                   (tx_pause_val_i             ),
        .tx_pause_source_addr           (tx_pause_source_addr_i     ),
        .tx_ifg_delay_ena               (tx_ifg_delay_ena_i         ),
        .tx_ifg_delay                   (tx_ifg_delay_i             ),
        .tx_fcs_fwd_ena                 (tx_fcs_fwd_ena_i           ),
        .tx_statistics_valid            (tx_statistics_valid_o      ),
        .tx_statistics_vector           (tx_statistics_vector_o     ),
    //mdio
        .miim_hs_clk                    (miim_hs_clk_i              ),
        .miim_rstn                      (miim_rstn_i                ),
        .miim_phyad                     (miim_phyad_i               ),
        .miim_regad                     (miim_regad_i               ),
        .miim_wrdata                    (miim_wrdata_i              ),
        .miim_wren                      (miim_wren_i                ),
        .miim_rden                      (miim_rden_i                ),
        .miim_rddata                    (miim_rddata_o              ),
        .miim_rddata_valid              (miim_rddata_valid_o        ),
        .miim_busy                      (miim_busy_o                ),
        .mdc                            (mdc_o                      ),
        .mdio_in                        (mdio_in_i                  ),
        .mdio_out                       (mdio_out_o                 ),
        .mdio_oen                       (mdio_oen_o                 ),
    //pcs config
        .configuration_vector           (configuration_vector_i     ),
    `else
    //gmii port
        .gmii_tx_clk                    (gmii_tx_clk_o              ),
        .gmii_tx_en                     (gmii_tx_en_i               ),
        .gmii_tx_er                     (gmii_tx_er_i               ),
        .gmii_txd                       (gmii_txd_i                 ),
        .gmii_col                       (gmii_col_o                 ),
        .gmii_crs                       (gmii_crs_o                 ),
        .gmii_rx_clk                    (gmii_rx_clk_o              ),
        .gmii_rxd                       (gmii_rxd_o                 ),
        .gmii_rx_dv                     (gmii_rx_dv_o               ),
        .gmii_rx_er                     (gmii_rx_er_o               ),
        .gmii_isolate                   (gmii_isolate_o             ),
    `ifdef MDIO
    //mdio port
        .phy_addr                       (phy_addr_i                 ),
        .mdio_rstn                      (mdio_rstn_i                ),
        .mdc                            (mdc_i                      ),
        .mdio_in                        (mdio_in_i                  ),
        .mdio_out                       (mdio_out_o                 ),
        .mdio_oen                       (mdio_oen_o                 ),
    //out
        .phy_reg2                       (phy_reg2_i                 ),
        .phy_reg3                       (phy_reg3_i                 ),
    `else
    //pcs config
        .configuration_vector           (configuration_vector_i     ),
    `endif
    `endif
        .status_vector                  (status_vector_o            ),
        .link_partner_ability_base      (link_partner_ability_base_o)    
	);

endmodule