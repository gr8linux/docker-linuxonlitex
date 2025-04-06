`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME (
		input           clk_in_i,
        input           rstn_i,

        input           serdes_pcs_tx_clk_i,
        input           serdes_pcs_rx_clk_i,
        input           serdes_qpll1_ok_i,
        input           serdes_qpll0_ok_i,
        input           serdes_cpll_ok_i,
        input           serdes_align_link_i,
        input           serdes_tx_fifo_afull_i,
        output  [42:0]  serdes_fabric_ctrl_o,
        output  [42:0]  serdes_fabric_ctrl_h_o,
        output          serdes_fabric_rstn_o,
        output          serdes_fabric_tx_clk_o,
        output          serdes_fabric_rx_clk_o,
        output          serdes_pcs_tx_rst_o,
        output          serdes_pcs_rx_rst_o,
        output          serdes_fabric_tx_vld_o,
        input           serdes_rxfifo_aempty_i,
        output          serdes_rxfifo_rd_en_o,

        input   [43:0]  serdes_rxdata_i,
        output  [35:0]  serdes_txdata_o,
//Port0
    //connected to an optical module to detect the presence of light
        input           signal_detect_ch0_i, //1:presence; 0:not presence
    //config port
    //link_timer, multiplied by 32.768us
        input [8:0]     sgmii_link_timer_ch0_i,
        input           sgmii_mode_ch0_i,//0:mac mode; 1:phy mode
        input           repeater_mode_ch0_i,

    `ifdef MAC_FUNC
        output          rx_mac_clk_ch0_o,
        output          rx_mac_valid_ch0_o,
        output [7:0]    rx_mac_data_ch0_o,
        output          rx_mac_last_ch0_o,
        output          rx_mac_error_ch0_o,
        
        output          tx_mac_clk_ch0_o,
        input           tx_mac_valid_ch0_i,
        input [7:0]     tx_mac_data_ch0_i,
        input           tx_mac_last_ch0_i,
        input           tx_mac_error_ch0_i,
        output          tx_mac_ready_ch0_o,
        output          tx_collision_ch0_o,
        output          tx_retransmit_ch0_o,

        input           rx_fcs_fwd_ena_ch0_i,
        input           rx_jumbo_ena_ch0_i,
        output          rx_statistics_valid_ch0_o,
        output [26:0]   rx_statistics_vector_ch0_o,
        output          rx_pause_req_ch0_o,
        output [15:0]   rx_pause_val_ch0_o,
        
        input           tx_pause_req_ch0_i,
        input [15:0]    tx_pause_val_ch0_i,
        input [47:0]    tx_pause_source_addr_ch0_i,
        input           tx_ifg_delay_ena_ch0_i,
        input [7:0]     tx_ifg_delay_ch0_i,
        input           tx_fcs_fwd_ena_ch0_i,
        output          tx_statistics_valid_ch0_o,
        output [28:0]   tx_statistics_vector_ch0_o,

    //mdio
        input           miim_hs_clk_ch0_i,
        input           miim_rstn_ch0_i,
        input   [4:0]   miim_phyad_ch0_i,
        input   [4:0]   miim_regad_ch0_i,
        input  [15:0]   miim_wrdata_ch0_i,
        input           miim_wren_ch0_i,
        input           miim_rden_ch0_i,
        output [15:0]   miim_rddata_ch0_o,
        output          miim_rddata_valid_ch0_o,
        output          miim_busy_ch0_o,
        output          mdc_ch0_o,
        input           mdio_in_ch0_i,
        output          mdio_out_ch0_o,
        output          mdio_oen_ch0_o,
    //pcs config
        input [14:0]    configuration_vector_ch0_i,
    `else
    //gmii port
        output          gmii_tx_clk_ch0_o,
        input           gmii_tx_en_ch0_i,
        input           gmii_tx_er_ch0_i,
        input [7:0]     gmii_txd_ch0_i,
        output          gmii_col_ch0_o,
        output          gmii_crs_ch0_o,
        output          gmii_rx_clk_ch0_o,
        output [7:0]    gmii_rxd_ch0_o,
        output          gmii_rx_dv_ch0_o,
        output          gmii_rx_er_ch0_o,
        output          gmii_isolate_ch0_o,
    `ifdef MDIO
    //mdio port
        input [4:0]     phy_addr_ch0_i,
        input           mdio_rstn_ch0_i,
        input           mdc_ch0_i,
        input           mdio_in_ch0_i,
        output          mdio_out_ch0_o,
        output          mdio_oen_ch0_o,
    //OUI
        input [15:0]    phy_reg2_ch0_i,
        input [15:0]    phy_reg3_ch0_i,
    `else 
    //pcs config
        input [14:0]    configuration_vector_ch0_i,
    `endif
    `endif
        output [10:0]   status_vector_ch0_o,
        output [15:0]   link_partner_ability_base_ch0_o,

//Port1
    //connected to an optical module to detect the presence of light
        input           signal_detect_ch1_i, //1:presence; 0:not presence
    //config port
    //link_timer, multiplied by 32.768us
        input [8:0]     sgmii_link_timer_ch1_i,
        input           sgmii_mode_ch1_i,//0:mac mode; 1:phy mode
        input           repeater_mode_ch1_i,

    `ifdef MAC_FUNC
        output          rx_mac_clk_ch1_o,
        output          rx_mac_valid_ch1_o,
        output [7:0]    rx_mac_data_ch1_o,
        output          rx_mac_last_ch1_o,
        output          rx_mac_error_ch1_o,
        
        output          tx_mac_clk_ch1_o,
        input           tx_mac_valid_ch1_i,
        input [7:0]     tx_mac_data_ch1_i,
        input           tx_mac_last_ch1_i,
        input           tx_mac_error_ch1_i,
        output          tx_mac_ready_ch1_o,
        output          tx_collision_ch1_o,
        output          tx_retransmit_ch1_o,

        input           rx_fcs_fwd_ena_ch1_i,
        input           rx_jumbo_ena_ch1_i,
        output          rx_statistics_valid_ch1_o,
        output [26:0]   rx_statistics_vector_ch1_o,
        output          rx_pause_req_ch1_o,
        output [15:0]   rx_pause_val_ch1_o,
        
        input           tx_pause_req_ch1_i,
        input [15:0]    tx_pause_val_ch1_i,
        input [47:0]    tx_pause_source_addr_ch1_i,
        input           tx_ifg_delay_ena_ch1_i,
        input [7:0]     tx_ifg_delay_ch1_i,
        input           tx_fcs_fwd_ena_ch1_i,
        output          tx_statistics_valid_ch1_o,
        output [28:0]   tx_statistics_vector_ch1_o,

    //mdio
        input           miim_hs_clk_ch1_i,
        input           miim_rstn_ch1_i,
        input   [4:0]   miim_phyad_ch1_i,
        input   [4:0]   miim_regad_ch1_i,
        input  [15:0]   miim_wrdata_ch1_i,
        input           miim_wren_ch1_i,
        input           miim_rden_ch1_i,
        output [15:0]   miim_rddata_ch1_o,
        output          miim_rddata_valid_ch1_o,
        output          miim_busy_ch1_o,
        output          mdc_ch1_o,
        input           mdio_in_ch1_i,
        output          mdio_out_ch1_o,
        output          mdio_oen_ch1_o,
    //pcs config
        input [14:0]    configuration_vector_ch1_i,
    `else
    //gmii port
        output          gmii_tx_clk_ch1_o,
        input           gmii_tx_en_ch1_i,
        input           gmii_tx_er_ch1_i,
        input [7:0]     gmii_txd_ch1_i,
        output          gmii_col_ch1_o,
        output          gmii_crs_ch1_o,
        output          gmii_rx_clk_ch1_o,
        output [7:0]    gmii_rxd_ch1_o,
        output          gmii_rx_dv_ch1_o,
        output          gmii_rx_er_ch1_o,
        output          gmii_isolate_ch1_o,
    `ifdef MDIO
    //mdio port
        input [4:0]     phy_addr_ch1_i,
        input           mdio_rstn_ch1_i,
        input           mdc_ch1_i,
        input           mdio_in_ch1_i,
        output          mdio_out_ch1_o,
        output          mdio_oen_ch1_o,
    //OUI
        input [15:0]    phy_reg2_ch1_i,
        input [15:0]    phy_reg3_ch1_i,
    `else 
    //pcs config
        input [14:0]    configuration_vector_ch1_i,
    `endif
    `endif
        output [10:0]   status_vector_ch1_o,
        output [15:0]   link_partner_ability_base_ch1_o,

//Port2
    //connected to an optical module to detect the presence of light
        input           signal_detect_ch2_i, //1:presence; 0:not presence
    //config port
    //link_timer, multiplied by 32.768us
        input [8:0]     sgmii_link_timer_ch2_i,
        input           sgmii_mode_ch2_i,//0:mac mode; 1:phy mode
        input           repeater_mode_ch2_i,

    `ifdef MAC_FUNC
        output          rx_mac_clk_ch2_o,
        output          rx_mac_valid_ch2_o,
        output [7:0]    rx_mac_data_ch2_o,
        output          rx_mac_last_ch2_o,
        output          rx_mac_error_ch2_o,
        
        output          tx_mac_clk_ch2_o,
        input           tx_mac_valid_ch2_i,
        input [7:0]     tx_mac_data_ch2_i,
        input           tx_mac_last_ch2_i,
        input           tx_mac_error_ch2_i,
        output          tx_mac_ready_ch2_o,
        output          tx_collision_ch2_o,
        output          tx_retransmit_ch2_o,

        input           rx_fcs_fwd_ena_ch2_i,
        input           rx_jumbo_ena_ch2_i,
        output          rx_statistics_valid_ch2_o,
        output [26:0]   rx_statistics_vector_ch2_o,
        output          rx_pause_req_ch2_o,
        output [15:0]   rx_pause_val_ch2_o,
        
        input           tx_pause_req_ch2_i,
        input [15:0]    tx_pause_val_ch2_i,
        input [47:0]    tx_pause_source_addr_ch2_i,
        input           tx_ifg_delay_ena_ch2_i,
        input [7:0]     tx_ifg_delay_ch2_i,
        input           tx_fcs_fwd_ena_ch2_i,
        output          tx_statistics_valid_ch2_o,
        output [28:0]   tx_statistics_vector_ch2_o,

    //mdio
        input           miim_hs_clk_ch2_i,
        input           miim_rstn_ch2_i,
        input   [4:0]   miim_phyad_ch2_i,
        input   [4:0]   miim_regad_ch2_i,
        input  [15:0]   miim_wrdata_ch2_i,
        input           miim_wren_ch2_i,
        input           miim_rden_ch2_i,
        output [15:0]   miim_rddata_ch2_o,
        output          miim_rddata_valid_ch2_o,
        output          miim_busy_ch2_o,
        output          mdc_ch2_o,
        input           mdio_in_ch2_i,
        output          mdio_out_ch2_o,
        output          mdio_oen_ch2_o,
    //pcs config
        input [14:0]    configuration_vector_ch2_i,
    `else
    //gmii port
        output          gmii_tx_clk_ch2_o,
        input           gmii_tx_en_ch2_i,
        input           gmii_tx_er_ch2_i,
        input [7:0]     gmii_txd_ch2_i,
        output          gmii_col_ch2_o,
        output          gmii_crs_ch2_o,
        output          gmii_rx_clk_ch2_o,
        output [7:0]    gmii_rxd_ch2_o,
        output          gmii_rx_dv_ch2_o,
        output          gmii_rx_er_ch2_o,
        output          gmii_isolate_ch2_o,
    `ifdef MDIO
    //mdio port
        input [4:0]     phy_addr_ch2_i,
        input           mdio_rstn_ch2_i,
        input           mdc_ch2_i,
        input           mdio_in_ch2_i,
        output          mdio_out_ch2_o,
        output          mdio_oen_ch2_o,
    //OUI
        input [15:0]    phy_reg2_ch2_i,
        input [15:0]    phy_reg3_ch2_i,
    `else 
    //pcs config
        input [14:0]    configuration_vector_ch2_i,
    `endif
    `endif
        output [10:0]   status_vector_ch2_o,
        output [15:0]   link_partner_ability_base_ch2_o,

//Port3
    //connected to an optical module to detect the presence of light
        input           signal_detect_ch3_i, //1:presence; 0:not presence
    //config port
    //link_timer, multiplied by 32.768us
        input [8:0]     sgmii_link_timer_ch3_i,
        input           sgmii_mode_ch3_i,//0:mac mode; 1:phy mode
        input           repeater_mode_ch3_i,

    `ifdef MAC_FUNC
        output          rx_mac_clk_ch3_o,
        output          rx_mac_valid_ch3_o,
        output [7:0]    rx_mac_data_ch3_o,
        output          rx_mac_last_ch3_o,
        output          rx_mac_error_ch3_o,
        
        output          tx_mac_clk_ch3_o,
        input           tx_mac_valid_ch3_i,
        input [7:0]     tx_mac_data_ch3_i,
        input           tx_mac_last_ch3_i,
        input           tx_mac_error_ch3_i,
        output          tx_mac_ready_ch3_o,
        output          tx_collision_ch3_o,
        output          tx_retransmit_ch3_o,

        input           rx_fcs_fwd_ena_ch3_i,
        input           rx_jumbo_ena_ch3_i,
        output          rx_statistics_valid_ch3_o,
        output [26:0]   rx_statistics_vector_ch3_o,
        output          rx_pause_req_ch3_o,
        output [15:0]   rx_pause_val_ch3_o,
        
        input           tx_pause_req_ch3_i,
        input [15:0]    tx_pause_val_ch3_i,
        input [47:0]    tx_pause_source_addr_ch3_i,
        input           tx_ifg_delay_ena_ch3_i,
        input [7:0]     tx_ifg_delay_ch3_i,
        input           tx_fcs_fwd_ena_ch3_i,
        output          tx_statistics_valid_ch3_o,
        output [28:0]   tx_statistics_vector_ch3_o,

    //mdio
        input           miim_hs_clk_ch3_i,
        input           miim_rstn_ch3_i,
        input   [4:0]   miim_phyad_ch3_i,
        input   [4:0]   miim_regad_ch3_i,
        input  [15:0]   miim_wrdata_ch3_i,
        input           miim_wren_ch3_i,
        input           miim_rden_ch3_i,
        output [15:0]   miim_rddata_ch3_o,
        output          miim_rddata_valid_ch3_o,
        output          miim_busy_ch3_o,
        output          mdc_ch3_o,
        input           mdio_in_ch3_i,
        output          mdio_out_ch3_o,
        output          mdio_oen_ch3_o,
    //pcs config
        input [14:0]    configuration_vector_ch3_i,
    `else
    //gmii port
        output          gmii_tx_clk_ch3_o,
        input           gmii_tx_en_ch3_i,
        input           gmii_tx_er_ch3_i,
        input [7:0]     gmii_txd_ch3_i,
        output          gmii_col_ch3_o,
        output          gmii_crs_ch3_o,
        output          gmii_rx_clk_ch3_o,
        output [7:0]    gmii_rxd_ch3_o,
        output          gmii_rx_dv_ch3_o,
        output          gmii_rx_er_ch3_o,
        output          gmii_isolate_ch3_o,
    `ifdef MDIO
    //mdio port
        input [4:0]     phy_addr_ch3_i,
        input           mdio_rstn_ch3_i,
        input           mdc_ch3_i,
        input           mdio_in_ch3_i,
        output          mdio_out_ch3_o,
        output          mdio_oen_ch3_o,
    //OUI
        input [15:0]    phy_reg2_ch3_i,
        input [15:0]    phy_reg3_ch3_i,
    `else 
    //pcs config
        input [14:0]    configuration_vector_ch3_i,
    `endif
    `endif
        output [10:0]   status_vector_ch3_o,
        output [15:0]   link_partner_ability_base_ch3_o
	);

`include "parameter.vh"

`getname(ge_pcs_qsgmii,`MODULE_NAME) u_ge_pcs_qsgmii(
        .clk_in_i                       (clk_in_i                       ),
        .rstn_i                         (rstn_i                         ),

        .serdes_pcs_tx_clk_i            (serdes_pcs_tx_clk_i            ),
        .serdes_pcs_rx_clk_i            (serdes_pcs_rx_clk_i            ),
        .serdes_qpll1_ok_i              (serdes_qpll1_ok_i              ),
        .serdes_qpll0_ok_i              (serdes_qpll0_ok_i              ),
        .serdes_cpll_ok_i               (serdes_cpll_ok_i               ),
        .serdes_align_link_i            (serdes_align_link_i            ),
        .serdes_tx_fifo_afull_i         (serdes_tx_fifo_afull_i         ),
        .serdes_fabric_ctrl_o           (serdes_fabric_ctrl_o           ),
        .serdes_fabric_ctrl_h_o         (serdes_fabric_ctrl_h_o         ),
        .serdes_fabric_rstn_o           (serdes_fabric_rstn_o           ),
        .serdes_fabric_tx_clk_o         (serdes_fabric_tx_clk_o         ),
        .serdes_fabric_rx_clk_o         (serdes_fabric_rx_clk_o         ),
        .serdes_pcs_tx_rst_o            (serdes_pcs_tx_rst_o            ),
        .serdes_pcs_rx_rst_o            (serdes_pcs_rx_rst_o            ),
        .serdes_fabric_tx_vld_o         (serdes_fabric_tx_vld_o         ),
        .serdes_rxfifo_aempty_i         (serdes_rxfifo_aempty_i	        ),
        .serdes_rxfifo_rd_en_o          (serdes_rxfifo_rd_en_o 	        ),//nc

        .serdes_rxdata_i                (serdes_rxdata_i                ),
        .serdes_txdata_o                (serdes_txdata_o                ),

//Port0
    //connected to an optical module to detect the presence of light
        .signal_detect_ch0_i            (signal_detect_ch0_i            ),//1:presence; 0:not presence
    //config port
    //link_timer; multiplied by 32.768us
        .sgmii_link_timer_ch0_i         (sgmii_link_timer_ch0_i         ),
        .sgmii_mode_ch0_i               (sgmii_mode_ch0_i               ),//0:mac mode; 1:phy mode
        .repeater_mode_ch0_i            (repeater_mode_ch0_i            ),
    `ifdef MAC_FUNC
        .rx_mac_clk_ch0_o               (rx_mac_clk_ch0_o               ),
        .rx_mac_valid_ch0_o             (rx_mac_valid_ch0_o             ),
        .rx_mac_data_ch0_o              (rx_mac_data_ch0_o              ),
        .rx_mac_last_ch0_o              (rx_mac_last_ch0_o              ),
        .rx_mac_error_ch0_o             (rx_mac_error_ch0_o             ),
        
        .tx_mac_clk_ch0_o               (tx_mac_clk_ch0_o               ),
        .tx_mac_valid_ch0_i             (tx_mac_valid_ch0_i             ),
        .tx_mac_data_ch0_i              (tx_mac_data_ch0_i              ),
        .tx_mac_last_ch0_i              (tx_mac_last_ch0_i              ),
        .tx_mac_error_ch0_i             (tx_mac_error_ch0_i             ),
        .tx_mac_ready_ch0_o             (tx_mac_ready_ch0_o             ),
        .tx_collision_ch0_o             (tx_collision_ch0_o             ),
        .tx_retransmit_ch0_o            (tx_retransmit_ch0_o            ),
        
        .rx_fcs_fwd_ena_ch0_i           (rx_fcs_fwd_ena_ch0_i           ),
        .rx_jumbo_ena_ch0_i             (rx_jumbo_ena_ch0_i             ),
        .rx_statistics_valid_ch0_o      (rx_statistics_valid_ch0_o      ),
        .rx_statistics_vector_ch0_o     (rx_statistics_vector_ch0_o     ),
        .rx_pause_req_ch0_o             (rx_pause_req_ch0_o             ),
        .rx_pause_val_ch0_o             (rx_pause_val_ch0_o             ),
        
        .tx_pause_req_ch0_i             (tx_pause_req_ch0_i             ),
        .tx_pause_val_ch0_i             (tx_pause_val_ch0_i             ),
        .tx_pause_source_addr_ch0_i     (tx_pause_source_addr_ch0_i     ),
        .tx_ifg_delay_ena_ch0_i         (tx_ifg_delay_ena_ch0_i         ),
        .tx_ifg_delay_ch0_i             (tx_ifg_delay_ch0_i             ),
        .tx_fcs_fwd_ena_ch0_i           (tx_fcs_fwd_ena_ch0_i           ),
        .tx_statistics_valid_ch0_o      (tx_statistics_valid_ch0_o      ),
        .tx_statistics_vector_ch0_o     (tx_statistics_vector_ch0_o     ),
    //mdio
        .miim_hs_clk_ch0_i              (miim_hs_clk_ch0_i              ),
        .miim_rstn_ch0_i                (miim_rstn_ch0_i                ),
        .miim_phyad_ch0_i               (miim_phyad_ch0_i               ),
        .miim_regad_ch0_i               (miim_regad_ch0_i               ),
        .miim_wrdata_ch0_i              (miim_wrdata_ch0_i              ),
        .miim_wren_ch0_i                (miim_wren_ch0_i                ),
        .miim_rden_ch0_i                (miim_rden_ch0_i                ),
        .miim_rddata_ch0_o              (miim_rddata_ch0_o              ),
        .miim_rddata_valid_ch0_o        (miim_rddata_valid_ch0_o        ),
        .miim_busy_ch0_o                (miim_busy_ch0_o                ),
        .mdc_ch0_o                      (mdc_ch0_o                      ),
        .mdio_in_ch0_i                  (mdio_in_ch0_i                  ),
        .mdio_out_ch0_o                 (mdio_out_ch0_o                 ),
        .mdio_oen_ch0_o                 (mdio_oen_ch0_o                 ),
    //pcs config
        .configuration_vector_ch0_i     (configuration_vector_ch0_i     ),
    `else
    //gmii port
        .gmii_tx_clk_ch0_o              (gmii_tx_clk_ch0_o              ),
        .gmii_tx_en_ch0_i               (gmii_tx_en_ch0_i               ),
        .gmii_tx_er_ch0_i               (gmii_tx_er_ch0_i               ),
        .gmii_txd_ch0_i                 (gmii_txd_ch0_i                 ),
        .gmii_col_ch0_o                 (gmii_col_ch0_o                 ),
        .gmii_crs_ch0_o                 (gmii_crs_ch0_o                 ),
        .gmii_rx_clk_ch0_o              (gmii_rx_clk_ch0_o              ),
        .gmii_rxd_ch0_o                 (gmii_rxd_ch0_o                 ),
        .gmii_rx_dv_ch0_o               (gmii_rx_dv_ch0_o               ),
        .gmii_rx_er_ch0_o               (gmii_rx_er_ch0_o               ),
        .gmii_isolate_ch0_o             (gmii_isolate_ch0_o             ),
    `ifdef MDIO
    //mdio port
        .phy_addr_ch0_i                 (phy_addr_ch0_i                 ),
        .mdio_rstn_ch0_i                (mdio_rstn_ch0_i                ),
        .mdc_ch0_i                      (mdc_ch0_i                      ),
        .mdio_in_ch0_i                  (mdio_in_ch0_i                  ),
        .mdio_out_ch0_o                 (mdio_out_ch0_o                 ),
        .mdio_oen_ch0_o                 (mdio_oen_ch0_o                 ),
    //out
        .phy_reg2_ch0_i                 (phy_reg2_ch0_i                 ),
        .phy_reg3_ch0_i                 (phy_reg3_ch0_i                 ),
    `else
    //pcs config
        .configuration_vector_ch0_i     (configuration_vector_ch0_i     ),
    `endif
    `endif
        .status_vector_ch0_o            (status_vector_ch0_o            ),
        .link_partner_ability_base_ch0_o(link_partner_ability_base_ch0_o),

//Port1
    //connected to an optical module to detect the presence of light
        .signal_detect_ch1_i            (signal_detect_ch1_i            ),//1:presence; 0:not presence
    //config port
    //link_timer; multiplied by 32.768us
        .sgmii_link_timer_ch1_i         (sgmii_link_timer_ch1_i         ),
        .sgmii_mode_ch1_i               (sgmii_mode_ch1_i               ),//0:mac mode; 1:phy mode
        .repeater_mode_ch1_i            (repeater_mode_ch1_i            ),
    `ifdef MAC_FUNC
        .rx_mac_clk_ch1_o               (rx_mac_clk_ch1_o               ),
        .rx_mac_valid_ch1_o             (rx_mac_valid_ch1_o             ),
        .rx_mac_data_ch1_o              (rx_mac_data_ch1_o              ),
        .rx_mac_last_ch1_o              (rx_mac_last_ch1_o              ),
        .rx_mac_error_ch1_o             (rx_mac_error_ch1_o             ),
        
        .tx_mac_clk_ch1_o               (tx_mac_clk_ch1_o               ),
        .tx_mac_valid_ch1_i             (tx_mac_valid_ch1_i             ),
        .tx_mac_data_ch1_i              (tx_mac_data_ch1_i              ),
        .tx_mac_last_ch1_i              (tx_mac_last_ch1_i              ),
        .tx_mac_error_ch1_i             (tx_mac_error_ch1_i             ),
        .tx_mac_ready_ch1_o             (tx_mac_ready_ch1_o             ),
        .tx_collision_ch1_o             (tx_collision_ch1_o             ),
        .tx_retransmit_ch1_o            (tx_retransmit_ch1_o            ),
        
        .rx_fcs_fwd_ena_ch1_i           (rx_fcs_fwd_ena_ch1_i           ),
        .rx_jumbo_ena_ch1_i             (rx_jumbo_ena_ch1_i             ),
        .rx_statistics_valid_ch1_o      (rx_statistics_valid_ch1_o      ),
        .rx_statistics_vector_ch1_o     (rx_statistics_vector_ch1_o     ),
        .rx_pause_req_ch1_o             (rx_pause_req_ch1_o             ),
        .rx_pause_val_ch1_o             (rx_pause_val_ch1_o             ),
        
        .tx_pause_req_ch1_i             (tx_pause_req_ch1_i             ),
        .tx_pause_val_ch1_i             (tx_pause_val_ch1_i             ),
        .tx_pause_source_addr_ch1_i     (tx_pause_source_addr_ch1_i     ),
        .tx_ifg_delay_ena_ch1_i         (tx_ifg_delay_ena_ch1_i         ),
        .tx_ifg_delay_ch1_i             (tx_ifg_delay_ch1_i             ),
        .tx_fcs_fwd_ena_ch1_i           (tx_fcs_fwd_ena_ch1_i           ),
        .tx_statistics_valid_ch1_o      (tx_statistics_valid_ch1_o      ),
        .tx_statistics_vector_ch1_o     (tx_statistics_vector_ch1_o     ),
    //mdio
        .miim_hs_clk_ch1_i              (miim_hs_clk_ch1_i              ),
        .miim_rstn_ch1_i                (miim_rstn_ch1_i                ),
        .miim_phyad_ch1_i               (miim_phyad_ch1_i               ),
        .miim_regad_ch1_i               (miim_regad_ch1_i               ),
        .miim_wrdata_ch1_i              (miim_wrdata_ch1_i              ),
        .miim_wren_ch1_i                (miim_wren_ch1_i                ),
        .miim_rden_ch1_i                (miim_rden_ch1_i                ),
        .miim_rddata_ch1_o              (miim_rddata_ch1_o              ),
        .miim_rddata_valid_ch1_o        (miim_rddata_valid_ch1_o        ),
        .miim_busy_ch1_o                (miim_busy_ch1_o                ),
        .mdc_ch1_o                      (mdc_ch1_o                      ),
        .mdio_in_ch1_i                  (mdio_in_ch1_i                  ),
        .mdio_out_ch1_o                 (mdio_out_ch1_o                 ),
        .mdio_oen_ch1_o                 (mdio_oen_ch1_o                 ),
    //pcs config
        .configuration_vector_ch1_i     (configuration_vector_ch1_i     ),
    `else
    //gmii port
        .gmii_tx_clk_ch1_o              (gmii_tx_clk_ch1_o              ),
        .gmii_tx_en_ch1_i               (gmii_tx_en_ch1_i               ),
        .gmii_tx_er_ch1_i               (gmii_tx_er_ch1_i               ),
        .gmii_txd_ch1_i                 (gmii_txd_ch1_i                 ),
        .gmii_col_ch1_o                 (gmii_col_ch1_o                 ),
        .gmii_crs_ch1_o                 (gmii_crs_ch1_o                 ),
        .gmii_rx_clk_ch1_o              (gmii_rx_clk_ch1_o              ),
        .gmii_rxd_ch1_o                 (gmii_rxd_ch1_o                 ),
        .gmii_rx_dv_ch1_o               (gmii_rx_dv_ch1_o               ),
        .gmii_rx_er_ch1_o               (gmii_rx_er_ch1_o               ),
        .gmii_isolate_ch1_o             (gmii_isolate_ch1_o             ),
    `ifdef MDIO
    //mdio port
        .phy_addr_ch1_i                 (phy_addr_ch1_i                 ),
        .mdio_rstn_ch1_i                (mdio_rstn_ch1_i                ),
        .mdc_ch1_i                      (mdc_ch1_i                      ),
        .mdio_in_ch1_i                  (mdio_in_ch1_i                  ),
        .mdio_out_ch1_o                 (mdio_out_ch1_o                 ),
        .mdio_oen_ch1_o                 (mdio_oen_ch1_o                 ),
    //out
        .phy_reg2_ch1_i                 (phy_reg2_ch1_i                 ),
        .phy_reg3_ch1_i                 (phy_reg3_ch1_i                 ),
    `else
    //pcs config
        .configuration_vector_ch1_i     (configuration_vector_ch1_i     ),
    `endif
    `endif
        .status_vector_ch1_o            (status_vector_ch1_o            ),
        .link_partner_ability_base_ch1_o(link_partner_ability_base_ch1_o),

//Port2
    //connected to an optical module to detect the presence of light
        .signal_detect_ch2_i            (signal_detect_ch2_i            ),//1:presence; 0:not presence
    //config port
    //link_timer; multiplied by 32.768us
        .sgmii_link_timer_ch2_i         (sgmii_link_timer_ch2_i         ),
        .sgmii_mode_ch2_i               (sgmii_mode_ch2_i               ),//0:mac mode; 1:phy mode
        .repeater_mode_ch2_i            (repeater_mode_ch2_i            ),
    `ifdef MAC_FUNC
        .rx_mac_clk_ch2_o               (rx_mac_clk_ch2_o               ),
        .rx_mac_valid_ch2_o             (rx_mac_valid_ch2_o             ),
        .rx_mac_data_ch2_o              (rx_mac_data_ch2_o              ),
        .rx_mac_last_ch2_o              (rx_mac_last_ch2_o              ),
        .rx_mac_error_ch2_o             (rx_mac_error_ch2_o             ),
        
        .tx_mac_clk_ch2_o               (tx_mac_clk_ch2_o               ),
        .tx_mac_valid_ch2_i             (tx_mac_valid_ch2_i             ),
        .tx_mac_data_ch2_i              (tx_mac_data_ch2_i              ),
        .tx_mac_last_ch2_i              (tx_mac_last_ch2_i              ),
        .tx_mac_error_ch2_i             (tx_mac_error_ch2_i             ),
        .tx_mac_ready_ch2_o             (tx_mac_ready_ch2_o             ),
        .tx_collision_ch2_o             (tx_collision_ch2_o             ),
        .tx_retransmit_ch2_o            (tx_retransmit_ch2_o            ),
        
        .rx_fcs_fwd_ena_ch2_i           (rx_fcs_fwd_ena_ch2_i           ),
        .rx_jumbo_ena_ch2_i             (rx_jumbo_ena_ch2_i             ),
        .rx_statistics_valid_ch2_o      (rx_statistics_valid_ch2_o      ),
        .rx_statistics_vector_ch2_o     (rx_statistics_vector_ch2_o     ),
        .rx_pause_req_ch2_o             (rx_pause_req_ch2_o             ),
        .rx_pause_val_ch2_o             (rx_pause_val_ch2_o             ),
        
        .tx_pause_req_ch2_i             (tx_pause_req_ch2_i             ),
        .tx_pause_val_ch2_i             (tx_pause_val_ch2_i             ),
        .tx_pause_source_addr_ch2_i     (tx_pause_source_addr_ch2_i     ),
        .tx_ifg_delay_ena_ch2_i         (tx_ifg_delay_ena_ch2_i         ),
        .tx_ifg_delay_ch2_i             (tx_ifg_delay_ch2_i             ),
        .tx_fcs_fwd_ena_ch2_i           (tx_fcs_fwd_ena_ch2_i           ),
        .tx_statistics_valid_ch2_o      (tx_statistics_valid_ch2_o      ),
        .tx_statistics_vector_ch2_o     (tx_statistics_vector_ch2_o     ),
    //mdio
        .miim_hs_clk_ch2_i              (miim_hs_clk_ch2_i              ),
        .miim_rstn_ch2_i                (miim_rstn_ch2_i                ),
        .miim_phyad_ch2_i               (miim_phyad_ch2_i               ),
        .miim_regad_ch2_i               (miim_regad_ch2_i               ),
        .miim_wrdata_ch2_i              (miim_wrdata_ch2_i              ),
        .miim_wren_ch2_i                (miim_wren_ch2_i                ),
        .miim_rden_ch2_i                (miim_rden_ch2_i                ),
        .miim_rddata_ch2_o              (miim_rddata_ch2_o              ),
        .miim_rddata_valid_ch2_o        (miim_rddata_valid_ch2_o        ),
        .miim_busy_ch2_o                (miim_busy_ch2_o                ),
        .mdc_ch2_o                      (mdc_ch2_o                      ),
        .mdio_in_ch2_i                  (mdio_in_ch2_i                  ),
        .mdio_out_ch2_o                 (mdio_out_ch2_o                 ),
        .mdio_oen_ch2_o                 (mdio_oen_ch2_o                 ),
    //pcs config
        .configuration_vector_ch2_i     (configuration_vector_ch2_i     ),
    `else
    //gmii port
        .gmii_tx_clk_ch2_o              (gmii_tx_clk_ch2_o              ),
        .gmii_tx_en_ch2_i               (gmii_tx_en_ch2_i               ),
        .gmii_tx_er_ch2_i               (gmii_tx_er_ch2_i               ),
        .gmii_txd_ch2_i                 (gmii_txd_ch2_i                 ),
        .gmii_col_ch2_o                 (gmii_col_ch2_o                 ),
        .gmii_crs_ch2_o                 (gmii_crs_ch2_o                 ),
        .gmii_rx_clk_ch2_o              (gmii_rx_clk_ch2_o              ),
        .gmii_rxd_ch2_o                 (gmii_rxd_ch2_o                 ),
        .gmii_rx_dv_ch2_o               (gmii_rx_dv_ch2_o               ),
        .gmii_rx_er_ch2_o               (gmii_rx_er_ch2_o               ),
        .gmii_isolate_ch2_o             (gmii_isolate_ch2_o             ),
    `ifdef MDIO
    //mdio port
        .phy_addr_ch2_i                 (phy_addr_ch2_i                 ),
        .mdio_rstn_ch2_i                (mdio_rstn_ch2_i                ),
        .mdc_ch2_i                      (mdc_ch2_i                      ),
        .mdio_in_ch2_i                  (mdio_in_ch2_i                  ),
        .mdio_out_ch2_o                 (mdio_out_ch2_o                 ),
        .mdio_oen_ch2_o                 (mdio_oen_ch2_o                 ),
    //out
        .phy_reg2_ch2_i                 (phy_reg2_ch2_i                 ),
        .phy_reg3_ch2_i                 (phy_reg3_ch2_i                 ),
    `else
    //pcs config
        .configuration_vector_ch2_i     (configuration_vector_ch2_i     ),
    `endif
    `endif
        .status_vector_ch2_o            (status_vector_ch2_o            ),
        .link_partner_ability_base_ch2_o(link_partner_ability_base_ch2_o),

//Port3
    //connected to an optical module to detect the presence of light
        .signal_detect_ch3_i            (signal_detect_ch3_i            ),//1:presence; 0:not presence
    //config port
    //link_timer; multiplied by 32.768us
        .sgmii_link_timer_ch3_i         (sgmii_link_timer_ch3_i         ),
        .sgmii_mode_ch3_i               (sgmii_mode_ch3_i               ),//0:mac mode; 1:phy mode
        .repeater_mode_ch3_i            (repeater_mode_ch3_i            ),
    `ifdef MAC_FUNC
        .rx_mac_clk_ch3_o               (rx_mac_clk_ch3_o               ),
        .rx_mac_valid_ch3_o             (rx_mac_valid_ch3_o             ),
        .rx_mac_data_ch3_o              (rx_mac_data_ch3_o              ),
        .rx_mac_last_ch3_o              (rx_mac_last_ch3_o              ),
        .rx_mac_error_ch3_o             (rx_mac_error_ch3_o             ),
        
        .tx_mac_clk_ch3_o               (tx_mac_clk_ch3_o               ),
        .tx_mac_valid_ch3_i             (tx_mac_valid_ch3_i             ),
        .tx_mac_data_ch3_i              (tx_mac_data_ch3_i              ),
        .tx_mac_last_ch3_i              (tx_mac_last_ch3_i              ),
        .tx_mac_error_ch3_i             (tx_mac_error_ch3_i             ),
        .tx_mac_ready_ch3_o             (tx_mac_ready_ch3_o             ),
        .tx_collision_ch3_o             (tx_collision_ch3_o             ),
        .tx_retransmit_ch3_o            (tx_retransmit_ch3_o            ),
        
        .rx_fcs_fwd_ena_ch3_i           (rx_fcs_fwd_ena_ch3_i           ),
        .rx_jumbo_ena_ch3_i             (rx_jumbo_ena_ch3_i             ),
        .rx_statistics_valid_ch3_o      (rx_statistics_valid_ch3_o      ),
        .rx_statistics_vector_ch3_o     (rx_statistics_vector_ch3_o     ),
        .rx_pause_req_ch3_o             (rx_pause_req_ch3_o             ),
        .rx_pause_val_ch3_o             (rx_pause_val_ch3_o             ),
        
        .tx_pause_req_ch3_i             (tx_pause_req_ch3_i             ),
        .tx_pause_val_ch3_i             (tx_pause_val_ch3_i             ),
        .tx_pause_source_addr_ch3_i     (tx_pause_source_addr_ch3_i     ),
        .tx_ifg_delay_ena_ch3_i         (tx_ifg_delay_ena_ch3_i         ),
        .tx_ifg_delay_ch3_i             (tx_ifg_delay_ch3_i             ),
        .tx_fcs_fwd_ena_ch3_i           (tx_fcs_fwd_ena_ch3_i           ),
        .tx_statistics_valid_ch3_o      (tx_statistics_valid_ch3_o      ),
        .tx_statistics_vector_ch3_o     (tx_statistics_vector_ch3_o     ),
    //mdio
        .miim_hs_clk_ch3_i              (miim_hs_clk_ch3_i              ),
        .miim_rstn_ch3_i                (miim_rstn_ch3_i                ),
        .miim_phyad_ch3_i               (miim_phyad_ch3_i               ),
        .miim_regad_ch3_i               (miim_regad_ch3_i               ),
        .miim_wrdata_ch3_i              (miim_wrdata_ch3_i              ),
        .miim_wren_ch3_i                (miim_wren_ch3_i                ),
        .miim_rden_ch3_i                (miim_rden_ch3_i                ),
        .miim_rddata_ch3_o              (miim_rddata_ch3_o              ),
        .miim_rddata_valid_ch3_o        (miim_rddata_valid_ch3_o        ),
        .miim_busy_ch3_o                (miim_busy_ch3_o                ),
        .mdc_ch3_o                      (mdc_ch3_o                      ),
        .mdio_in_ch3_i                  (mdio_in_ch3_i                  ),
        .mdio_out_ch3_o                 (mdio_out_ch3_o                 ),
        .mdio_oen_ch3_o                 (mdio_oen_ch3_o                 ),
    //pcs config
        .configuration_vector_ch3_i     (configuration_vector_ch3_i     ),
    `else
    //gmii port
        .gmii_tx_clk_ch3_o              (gmii_tx_clk_ch3_o              ),
        .gmii_tx_en_ch3_i               (gmii_tx_en_ch3_i               ),
        .gmii_tx_er_ch3_i               (gmii_tx_er_ch3_i               ),
        .gmii_txd_ch3_i                 (gmii_txd_ch3_i                 ),
        .gmii_col_ch3_o                 (gmii_col_ch3_o                 ),
        .gmii_crs_ch3_o                 (gmii_crs_ch3_o                 ),
        .gmii_rx_clk_ch3_o              (gmii_rx_clk_ch3_o              ),
        .gmii_rxd_ch3_o                 (gmii_rxd_ch3_o                 ),
        .gmii_rx_dv_ch3_o               (gmii_rx_dv_ch3_o               ),
        .gmii_rx_er_ch3_o               (gmii_rx_er_ch3_o               ),
        .gmii_isolate_ch3_o             (gmii_isolate_ch3_o             ),
    `ifdef MDIO
    //mdio port
        .phy_addr_ch3_i                 (phy_addr_ch3_i                 ),
        .mdio_rstn_ch3_i                (mdio_rstn_ch3_i                ),
        .mdc_ch3_i                      (mdc_ch3_i                      ),
        .mdio_in_ch3_i                  (mdio_in_ch3_i                  ),
        .mdio_out_ch3_o                 (mdio_out_ch3_o                 ),
        .mdio_oen_ch3_o                 (mdio_oen_ch3_o                 ),
    //out
        .phy_reg2_ch3_i                 (phy_reg2_ch3_i                 ),
        .phy_reg3_ch3_i                 (phy_reg3_ch3_i                 ),
    `else
    //pcs config
        .configuration_vector_ch3_i     (configuration_vector_ch3_i     ),
    `endif
    `endif
        .status_vector_ch3_o            (status_vector_ch3_o            ),
        .link_partner_ability_base_ch3_o(link_partner_ability_base_ch3_o)
	);

endmodule