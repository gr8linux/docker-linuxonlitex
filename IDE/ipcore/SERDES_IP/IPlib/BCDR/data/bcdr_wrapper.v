
`include "static_macro_define.vh"
`include "define.vh"

module `MODULE_NAME(

    output rx_clk_o,
    output rx_data_valid_o,
    output [15:0] rx_data_o,
    input  rx_enable_i,
    output tx_clk_o,
    input [15:0] tx_data_i,
    input rx_reset_i,
    
    output serdes_lane_fabric_rx_clk_o,
    input serdes_lane_fabric_rx_clk_i, 
    input serdes_lane_fabric_rx_vld_i,
    input [87:0] serdes_lane_rxdata_i,
    input [5:0] serdes_lane_astat_i,
    input serdes_lane_rx_aempty_i, 
    output serdes_lane_rx_rden_o,
    input serdes_lane_fabric_tx_clk_i,
    output serdes_lane_fabric_tx_clk_o,
    output [79:0] serdes_lane_txdata_o,
    output serdes_lane_tx_vld_o,
    output serdes_lane_pma_rstn_o
);

 `getname(bcdr,`MODULE_NAME) bcdr(
    .rx_clk_o(rx_clk_o),
    .rx_data_valid_o(rx_data_valid_o),
    .rx_data_o(rx_data_o),
    .rx_enable_i(rx_enable_i),
    .tx_clk_o(tx_clk_o),
    .tx_data_i(tx_data_i),
    .rx_reset(rx_reset_i),
    
    .serdes_lane_fabric_rx_clk_o(serdes_lane_fabric_rx_clk_o),
    .serdes_lane_fabric_rx_clk_i(serdes_lane_fabric_rx_clk_i), 
    .serdes_lane_fabric_rx_vld_i(serdes_lane_fabric_rx_vld_i),
    .serdes_lane_rxdata_i(serdes_lane_rxdata_i),
    .serdes_lane_astat_i(serdes_lane_astat_i),
    .serdes_lane_rx_aempty_i(serdes_lane_rx_aempty_i), 
    .serdes_lane_rx_rden_o(serdes_lane_rx_rden_o),
    .serdes_lane_fabric_tx_clk_i(serdes_lane_fabric_tx_clk_i),
    .serdes_lane_fabric_tx_clk_o(serdes_lane_fabric_tx_clk_o),
    .serdes_lane_txdata_o(serdes_lane_txdata_o),
    .serdes_lane_tx_vld_o(serdes_lane_tx_vld_o),
    .serdes_lane_pma_rstn_o(serdes_lane_pma_rstn_o)
);
    
    
    
endmodule