`include "define.vh"
`include "static_macro_define.v"
module `MODULE_NAME (
        input           RX_P,
        input           RX_N,
        output          TX_P,
        output          TX_N,

        `ifdef SHARED_LOGIC
        input           pll_clkin_i,
        input           pll_clkout0_i,
        input           pll_clkout1_i,
        input           pll_clkout2_i,
        input           pll_clkout3_i,
        input           pll_clkout4_i,
        input           pll_lock_i,
        output          share_clk0_o,
        output          share_clk1_o,
        output          share_clk2_o,
        output          share_clk3_o,
        output          share_clk4_o,
        output          share_clk5_o,
        output          share_reset_o,
        `else
        input           share_clk0_i,
        input           share_clk1_i,
        input           share_clk2_i,
        input           share_clk3_i,
        input           share_clk4_i,
        input           share_clk5_i,
        input           share_reset_i,
        `endif

        input           pcs_rstn_i,

        input           prbs_enable_i,
        output          prbs_err_o,
        output          prbs_lock_o,
        output  [ 3:0]  prbs_err_num_o,

        `ifdef DEBUG_ENABLE
        output  [ 3:0]  dbg_vector_o,
        `endif

        //connected to an optical module to detect the presence of light
        input           signal_detect_i,//1:presence; 0:not presence
        
        //config port
        //link_timer; multiplied by 32.768us
        input   [ 8:0]  basex_link_timer_i,
        input   [ 8:0]  sgmii_link_timer_i,
        input           basex_or_sgmii_i,//0:base-x; 1:sgmii
        input           sgmii_mode_i,//0:mac mode; 1:phy mode
        input           repeater_mode_i,

        `ifdef MAC_FUNC
        output          rx_mac_clk_o,
        output          rx_mac_valid_o,
        output  [ 7:0]  rx_mac_data_o,
        output          rx_mac_last_o,
        output          rx_mac_error_o,
        
        output          tx_mac_clk_o,
        input           tx_mac_valid_i,
        input   [ 7:0]  tx_mac_data_i,
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
        input   [ 7:0]  tx_ifg_delay_i,
        input           tx_fcs_fwd_ena_i,
        output          tx_statistics_valid_o,
        output  [28:0]  tx_statistics_vector_o,

        //mdio
        input           miim_hs_clk_i,
        input           miim_rstn_i,
        input   [ 4:0]  miim_phyad_i,
        input   [ 4:0]  miim_regad_i,
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
        input   [14:0]  configuration_vector_i,
        `else
        //gmii port
        output          gmii_tx_clk_o,
        input           gmii_tx_en_i,
        input           gmii_tx_er_i,
        input   [ 7:0]  gmii_txd_i,
        output          gmii_col_o,
        output          gmii_crs_o,
        output          gmii_rx_clk_o,
        output  [ 7:0]  gmii_rxd_o,
        output          gmii_rx_dv_o,
        output          gmii_rx_er_o,
        output          gmii_isolate_o,
        `ifdef MDIO
        //mdio port
        input   [ 4:0]  phy_addr_i,
        input           mdio_rstn_i,
        input           mdc_i,
        input           mdio_in_i,
        output          mdio_out_o,
        output          mdio_oen_o,
        //out
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

`getname(giga_serial_ethernet,`MODULE_NAME) u_giga_serial_ethernet(
        .RX_P                           (RX_P                           ),
        .RX_N                           (RX_N                           ),
        .TX_P                           (TX_P                           ),
        .TX_N                           (TX_N                           ),

    `ifdef SHARED_LOGIC
        .pll_clkin_i                    (pll_clkin_i                    ),
        .pll_clkout0_i                  (pll_clkout0_i                  ),
        .pll_clkout1_i                  (pll_clkout1_i                  ),
        .pll_clkout2_i                  (pll_clkout2_i                  ),
        .pll_clkout3_i                  (pll_clkout3_i                  ),
        .pll_clkout4_i                  (pll_clkout4_i                  ),
        .pll_lock_i                     (pll_lock_i                     ),
        .share_clk0_o                   (share_clk0_o                   ),
        .share_clk1_o                   (share_clk1_o                   ),
        .share_clk2_o                   (share_clk2_o                   ),
        .share_clk3_o                   (share_clk3_o                   ),
        .share_clk4_o                   (share_clk4_o                   ),
        .share_clk5_o                   (share_clk5_o                   ),
        .share_reset_o                  (share_reset_o                  ),
    `else
        .share_clk0_i                   (share_clk0_i                   ),
        .share_clk1_i                   (share_clk1_i                   ),
        .share_clk2_i                   (share_clk2_i                   ),
        .share_clk3_i                   (share_clk3_i                   ),
        .share_clk4_i                   (share_clk4_i                   ),
        .share_clk5_i                   (share_clk5_i                   ),
        .share_reset_i                  (share_reset_i                  ),
    `endif

        .pcs_rstn_i                     (pcs_rstn_i                     ),

        .prbs_enable_i                  (prbs_enable_i                  ),
        .prbs_err_o                     (prbs_err_o                     ),
        .prbs_lock_o                    (prbs_lock_o                    ),
        .prbs_err_num_o                 (prbs_err_num_o                 ),

    `ifdef DEBUG_ENABLE
        .dbg_vector_o                   (dbg_vector_o                   ),
    `endif

        //connected to an optical module to detect the presence of light
        .signal_detect_i                (signal_detect_i                ),//1:presence; 0:not presence
        
        //config port
        //link_timer; multiplied by 32.768us
        .basex_link_timer_i             (basex_link_timer_i             ),
        .sgmii_link_timer_i             (sgmii_link_timer_i             ),
        .basex_or_sgmii_i               (basex_or_sgmii_i               ),//0:base-x; 1:sgmii
        .sgmii_mode_i                   (sgmii_mode_i                   ),//0:mac mode; 1:phy mode
        .repeater_mode_i                (repeater_mode_i                ),

    `ifdef MAC_FUNC
        .rx_mac_clk_o                   (rx_mac_clk_o                   ),
        .rx_mac_valid_o                 (rx_mac_valid_o                 ),
        .rx_mac_data_o                  (rx_mac_data_o                  ),
        .rx_mac_last_o                  (rx_mac_last_o                  ),
        .rx_mac_error_o                 (rx_mac_error_o                 ),
        
        .tx_mac_clk_o                   (tx_mac_clk_o                   ),
        .tx_mac_valid_i                 (tx_mac_valid_i                 ),
        .tx_mac_data_i                  (tx_mac_data_i                  ),
        .tx_mac_last_i                  (tx_mac_last_i                  ),
        .tx_mac_error_i                 (tx_mac_error_i                 ),
        .tx_mac_ready_o                 (tx_mac_ready_o                 ),
        .tx_collision_o                 (tx_collision_o                 ),
        .tx_retransmit_o                (tx_retransmit_o                ),

        .rx_fcs_fwd_ena_i               (rx_fcs_fwd_ena_i               ),
        .rx_jumbo_ena_i                 (rx_jumbo_ena_i                 ),
        .rx_statistics_valid_o          (rx_statistics_valid_o          ),
        .rx_statistics_vector_o         (rx_statistics_vector_o         ),
        .rx_pause_req_o                 (rx_pause_req_o                 ),
        .rx_pause_val_o                 (rx_pause_val_o                 ),

        .tx_pause_req_i                 (tx_pause_req_i                 ),
        .tx_pause_val_i                 (tx_pause_val_i                 ),
        .tx_pause_source_addr_i         (tx_pause_source_addr_i         ),
        .tx_ifg_delay_ena_i             (tx_ifg_delay_ena_i             ),
        .tx_ifg_delay_i                 (tx_ifg_delay_i                 ),
        .tx_fcs_fwd_ena_i               (tx_fcs_fwd_ena_i               ),
        .tx_statistics_valid_o          (tx_statistics_valid_o          ),
        .tx_statistics_vector_o         (tx_statistics_vector_o         ),

        //mdio
        .miim_hs_clk_i                  (miim_hs_clk_i                  ),
        .miim_rstn_i                    (miim_rstn_i                    ),
        .miim_phyad_i                   (miim_phyad_i                   ),
        .miim_regad_i                   (miim_regad_i                   ),
        .miim_wrdata_i                  (miim_wrdata_i                  ),
        .miim_wren_i                    (miim_wren_i                    ),
        .miim_rden_i                    (miim_rden_i                    ),
        .miim_rddata_o                  (miim_rddata_o                  ),
        .miim_rddata_valid_o            (miim_rddata_valid_o            ),
        .miim_busy_o                    (miim_busy_o                    ),
        .mdc_o                          (mdc_o                          ),
        .mdio_in_i                      (mdio_in_i                      ),
        .mdio_out_o                     (mdio_out_o                     ),
        .mdio_oen_o                     (mdio_oen_o                     ),
        //pcs config
        .configuration_vector_i         (configuration_vector_i         ),
    `else
        //gmii port
        .gmii_tx_clk_o                  (gmii_tx_clk_o                  ),
        .gmii_tx_en_i                   (gmii_tx_en_i                   ),
        .gmii_tx_er_i                   (gmii_tx_er_i                   ),
        .gmii_txd_i                     (gmii_txd_i                     ),
        .gmii_col_o                     (gmii_col_o                     ),
        .gmii_crs_o                     (gmii_crs_o                     ),
        .gmii_rx_clk_o                  (gmii_rx_clk_o                  ),
        .gmii_rxd_o                     (gmii_rxd_o                     ),
        .gmii_rx_dv_o                   (gmii_rx_dv_o                   ),
        .gmii_rx_er_o                   (gmii_rx_er_o                   ),
        .gmii_isolate_o                 (gmii_isolate_o                 ),
    `ifdef MDIO
        //mdio port
        .phy_addr_i                     (phy_addr_i                     ),
        .mdio_rstn_i                    (mdio_rstn_i                    ),
        .mdc_i                          (mdc_i                          ),
        .mdio_in_i                      (mdio_in_i                      ),
        .mdio_out_o                     (mdio_out_o                     ),
        .mdio_oen_o                     (mdio_oen_o                     ),
        //out
        .phy_reg2_i                     (phy_reg2_i                     ),
        .phy_reg3_i                     (phy_reg3_i                     ),
    `else
        //pcs config
        .configuration_vector_i         (configuration_vector_i         ),
    `endif
    `endif
        .status_vector_o                (status_vector_o                ),
        .link_partner_ability_base_o    (link_partner_ability_base_o    )
    );

endmodule