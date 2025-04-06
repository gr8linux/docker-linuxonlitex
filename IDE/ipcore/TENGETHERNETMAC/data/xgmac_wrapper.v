`include "define.vh"
`include "static_macro_define.vh"


module `module_name    (
    //rstn
    input           rx_rstn_i,
    input           tx_rstn_i,
    //XGMII
    input           xgmii_rx_clk_i,
    input           xgtx_clk_i,
    `ifdef DDR
    input   [3:0]   xgmii_rxc_i,
    input   [31:0]  xgmii_rxd_i,
    output  [3:0]   xgmii_txc_o,
    output  [31:0]  xgmii_txd_o,
    output          xgmii_tx_clk_o,
    `else 
    input   [7:0]   xgmii_rxc_i,
    input   [63:0]  xgmii_rxd_i,
    output  [7:0]   xgmii_txc_o,
    output  [63:0]  xgmii_txd_o,
    `endif
    //Config IF
    input           rx_fcs_fwd_ena_i,
    input           rx_jumbo_ena_i,
    input           tx_fcs_fwd_ena_i,
    input           tx_fault_ena_i,
    input           tx_ifg_delay_ena_i,
    input  [7:0]    tx_ifg_delay_i,
    //User IF
    output          rx_mac_clk_o,
    output          rx_mac_valid_o,
    output [63:0]   rx_mac_data_o,
    output [7:0]    rx_mac_byte_o,
    output          rx_mac_last_o,
    output          rx_mac_error_o,
    output          rx_statistics_valid_o,
    output [19:0]   rx_statistics_vector_o,
    
    output          tx_mac_clk_o,
    input           tx_mac_valid_i,
    input  [63:0]   tx_mac_data_i,
    input  [7:0]    tx_mac_byte_i,
    input           tx_mac_last_i,
    input           tx_mac_error_i,
    output          tx_mac_ready_o,
    output          tx_statistics_valid_o,
    output [18:0]   tx_statistics_vector_o,

    output          local_fault_o,
    output          remote_fault_o

);

`getname(xgmac,`module_name) xgmac   (
    
    .rx_rstn(rx_rstn_i),
    .tx_rstn(tx_rstn_i),
    
    .xgmii_rx_clk(xgmii_rx_clk_i),
    .xgtx_clk(xgtx_clk_i),
    `ifdef DDR
    .xgmii_rxc(xgmii_rxc_i),
    .xgmii_rxd(xgmii_rxd_i),
    .xgmii_txc(xgmii_txc_o),
    .xgmii_txd(xgmii_txd_o),
    .xgmii_tx_clk(xgmii_tx_clk_o),
    `else
    .xgmii_rxc(xgmii_rxc_i),
    .xgmii_rxd(xgmii_rxd_i),
    .xgmii_txc(xgmii_txc_o),
    .xgmii_txd(xgmii_txd_o),
    `endif
    
    .rx_fcs_fwd_ena(rx_fcs_fwd_ena_i),
    .rx_jumbo_ena(rx_jumbo_ena_i),
    .tx_fcs_fwd_ena(tx_fcs_fwd_ena_i),
    .tx_fault_ena(tx_fault_ena_i),
    .tx_ifg_delay_ena(tx_ifg_delay_ena_i),
    .tx_ifg_delay(tx_ifg_delay_i),
    
    .rx_mac_clk(rx_mac_clk_o),
    .rx_mac_valid(rx_mac_valid_o),
    .rx_mac_data(rx_mac_data_o),
    .rx_mac_byte(rx_mac_byte_o),
    .rx_mac_last(rx_mac_last_o),
    .rx_mac_error(rx_mac_error_o),
    .rx_statistics_valid(rx_statistics_valid_o),
    .rx_statistics_vector(rx_statistics_vector_o),
    
    .tx_mac_clk(tx_mac_clk_o),
    .tx_mac_valid(tx_mac_valid_i),
    .tx_mac_data(tx_mac_data_i),
    .tx_mac_byte(tx_mac_byte_i),
    .tx_mac_last(tx_mac_last_i),
    .tx_mac_error(tx_mac_error_i),
    .tx_mac_ready(tx_mac_ready_o),
    .tx_statistics_valid(tx_statistics_valid_o),
    .tx_statistics_vector(tx_statistics_vector_o),
    
    .local_fault(local_fault_o),
    .remote_fault(remote_fault_o)

);


endmodule