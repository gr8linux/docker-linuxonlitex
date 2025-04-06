`include "static_macro_define.vh"
`include "define.vh"

`ifdef GW5AT60K
module `module_name (
    
    // to serdes
    input           serdes_pma_rx_lock_i,
    input           serdes_qpll0_pll_lock_i,
    input           serdes_qpll1_pll_lock_i,
    input           serdes_cpll_pll_lock_i,
    input           serdes_pcs_tx_clk_i,
    output          serdes_pcs_tx_clk_o,
    output [79:0]   serdes_txdata_o,
    input           serdes_pcs_rx_clk_i,
    output          serdes_pcs_rx_clk_o,
    input  [87:0]   serdes_rxdata_i,
    input           serdes_refclk0_i,
    input           serdes_refclk1_i,
    output          serdes_pma_rstn_o,
    output          serdes_pcs_tx_rst_o,
    output          serdes_pcs_rx_rst_o,
    output          serdes_pcs_rx_rden_o,
    input           serdes_pcs_rx_aempty_i,
    output          serdes_pcs_tx_wren_o,
    input           serdes_pcs_tx_afull_i,
    input  [5:0]    serdes_astat_i,
    input           serdes_cpll_refclk_i,
    
    //to user
    input           xgmii_rx_clk_i,
    input           xgmii_tx_clk_i,
    input  [7:0]    xgmii_txc_i,
    input  [63:0]   xgmii_txd_i,
    output [7:0]    xgmii_rxc_o,
    output [63:0]   xgmii_rxd_o,
    output          ref_clk_o,
    output block_lock_o,     
    `ifdef DBG_O
    output [15:0] debug_vector_o,
    `endif
    output hi_ber_o


    );
    

`getname(xg_baser,`module_name) u_xg_baser (
    .serdes_pma_rx_lock_i(serdes_pma_rx_lock_i),
    .serdes_qpll0_pll_lock_i(serdes_qpll0_pll_lock_i),
    .serdes_qpll1_pll_lock_i(serdes_qpll1_pll_lock_i),
    .serdes_cpll_pll_lock_i(serdes_cpll_pll_lock_i),
    .serdes_pcs_tx_clk_i(serdes_pcs_tx_clk_i),
    .serdes_pcs_tx_clk_o(serdes_pcs_tx_clk_o),
    .serdes_txdata_o(serdes_txdata_o),
    .serdes_pcs_rx_clk_i(serdes_pcs_rx_clk_i),
    .serdes_pcs_rx_clk_o(serdes_pcs_rx_clk_o),
    .serdes_rxdata_i(serdes_rxdata_i),
    .serdes_refclk0_i(serdes_refclk0_i),
    .serdes_refclk1_i(serdes_refclk1_i),
    .serdes_pma_rstn_o(serdes_pma_rstn_o),
    .serdes_pcs_tx_rst_o(serdes_pcs_tx_rst_o),
    .serdes_pcs_rx_rst_o(serdes_pcs_rx_rst_o),
    .serdes_pcs_rx_rden_o(serdes_pcs_rx_rden_o),
    .serdes_pcs_rx_aempty_i(serdes_pcs_rx_aempty_i),
    .serdes_pcs_tx_wren_o(serdes_pcs_tx_wren_o),
    .serdes_pcs_tx_afull_i(serdes_pcs_tx_afull_i),
    .serdes_astat_i(serdes_astat_i),
    .serdes_cpll_refclk_i(serdes_cpll_refclk_i),
    .xgmii_rx_clk_i(xgmii_rx_clk_i),
    .xgmii_tx_clk_i(xgmii_tx_clk_i),
    .xgmii_txc_i(xgmii_txc_i),
    .xgmii_txd_i(xgmii_txd_i),
    .xgmii_rxc_o(xgmii_rxc_o),
    .xgmii_rxd_o(xgmii_rxd_o),
    .ref_clk_o(ref_clk_o),
    .block_lock_o(block_lock_o),
    `ifdef DBG_O
    .debug_vector_o(debug_vector_o),
    `endif
    .hi_ber_o(hi_ber_o)


    );
    
    
endmodule
`endif

`ifdef GW5AT138K
module `module_name (
    input           rx_rstn_i,
    input           tx_rstn_i,
    
    input           signal_detect_i,

    input           xgmii_rx_clk_i,
    input           xgmii_tx_clk_i,
    input           xgmii_rx_clk_ready_i,
    input           xgmii_tx_clk_ready_i,
    
    input  [7:0]    xgmii_txc_i,
    input  [63:0]   xgmii_txd_i,
    output [7:0]    xgmii_rxc_o,
    output [63:0]   xgmii_rxd_o,

    output          ref_clk_o,

    output          clk_out0_o,
    output          clk_out1_o,
    output          block_lock_o,
    output          hi_ber_o,
    output          pcs_status_o,
    input           clear_ber_count_i,
    output [5:0]    ber_count_o,
    input           clear_errored_block_count_i,
    output [7:0]    errored_block_count_o,
    
    `ifdef DBG_O
    output [15:0]   debug_vector_o,
    `endif

    input           serdes_pma_rx_lock_i,
    input           serdes_qpll0_pll_lock_i,
    input           serdes_qpll1_pll_lock_i,
    input           serdes_cpll_pll_lock_i,
    input           serdes_pcs_tx_clk_i,
    output          serdes_pcs_tx_clk_o,
    output [79:0]   serdes_txdata_o,
    input           serdes_pcs_rx_clk_i,
    output          serdes_pcs_rx_clk_o,
    input  [87:0]   serdes_rxdata_i,
    input           serdes_refclk0_i,
    input           serdes_refclk1_i,
    input           serdes_cpll_refclk_i,
    output          serdes_pma_rstn_o,
    output          serdes_pcs_tx_rst_o,
    output          serdes_pcs_rx_rst_o,
    output          serdes_pcs_rx_rden_o,
    input           serdes_pcs_rx_aempty_i,
    output          serdes_pcs_tx_wren_o,
    input           serdes_pcs_tx_afull_i,
    input  [5:0]    serdes_astat_i
);


`getname(xg_baser,`module_name) u_xg_baser (
    .rx_rstn_i(rx_rstn_i),
    .tx_rstn_i(tx_rstn_i),
    .signal_detect_i(signal_detect_i),
    .xgmii_rx_clk_i(xgmii_rx_clk_i),
    .xgmii_tx_clk_i(xgmii_tx_clk_i),
    .xgmii_rx_clk_ready_i(xgmii_rx_clk_ready_i),
    .xgmii_tx_clk_ready_i(xgmii_tx_clk_ready_i),
    .xgmii_txc_i(xgmii_txc_i),
    .xgmii_txd_i(xgmii_txd_i),
    .xgmii_rxc_o(xgmii_rxc_o),
    .xgmii_rxd_o(xgmii_rxd_o),
    .ref_clk_o(ref_clk_o),
    .clk_out0_o(clk_out0_o),
    .clk_out1_o(clk_out1_o),
    .block_lock_o(block_lock_o),
    .hi_ber_o(hi_ber_o),
    .pcs_status_o(pcs_status_o),
    .clear_ber_count_i(clear_ber_count_i),
    .ber_count_o(ber_count_o),
    .clear_errored_block_count_i(clear_errored_block_count_i),
    .errored_block_count_o(errored_block_count_o),
    `ifdef DBG_O
    .debug_vector_o(debug_vector_o),
    `endif
    .serdes_pma_rx_lock_i(serdes_pma_rx_lock_i),
    .serdes_qpll0_pll_lock_i(serdes_qpll0_pll_lock_i),
    .serdes_qpll1_pll_lock_i(serdes_qpll1_pll_lock_i),
    .serdes_cpll_pll_lock_i(serdes_cpll_pll_lock_i),
    .serdes_pcs_tx_clk_i(serdes_pcs_tx_clk_i),
    .serdes_pcs_tx_clk_o(serdes_pcs_tx_clk_o),
    .serdes_txdata_o(serdes_txdata_o),
    .serdes_pcs_rx_clk_i(serdes_pcs_rx_clk_i),
    .serdes_pcs_rx_clk_o(serdes_pcs_rx_clk_o),
    .serdes_rxdata_i(serdes_rxdata_i),
    .serdes_refclk0_i(serdes_refclk0_i),
    .serdes_refclk1_i(serdes_refclk1_i),
    .serdes_cpll_refclk_i(serdes_cpll_refclk_i),
    .serdes_pma_rstn_o(serdes_pma_rstn_o),
    .serdes_pcs_tx_rst_o(serdes_pcs_tx_rst_o),
    .serdes_pcs_rx_rst_o(serdes_pcs_rx_rst_o),
    .serdes_pcs_rx_rden_o(serdes_pcs_rx_rden_o),
    .serdes_pcs_rx_aempty_i(serdes_pcs_rx_aempty_i),
    .serdes_pcs_tx_wren_o(serdes_pcs_tx_wren_o),
    .serdes_pcs_tx_afull_i(serdes_pcs_tx_afull_i),
    .serdes_astat_i(serdes_astat_i)
    );
    
endmodule
`endif
