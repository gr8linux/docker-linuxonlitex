//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.10.01
//Part Number: GW5AST-LV138FPG676AES
//Device: GW5AST-138
//Device Version: B
//Created Time: Wed Aug  7 10:01:44 2024

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    Serdes_Top your_instance_name(
        .JESD204B_Top_tx_cfg_rdata_o(JESD204B_Top_tx_cfg_rdata_o), //output [31:0] JESD204B_Top_tx_cfg_rdata_o
        .JESD204B_Top_tx_cfg_rdy_o(JESD204B_Top_tx_cfg_rdy_o), //output JESD204B_Top_tx_cfg_rdy_o
        .JESD204B_Top_tx_data_ready_o(JESD204B_Top_tx_data_ready_o), //output JESD204B_Top_tx_data_ready_o
        .JESD204B_Top_tx_data_sof_o(JESD204B_Top_tx_data_sof_o), //output [3:0] JESD204B_Top_tx_data_sof_o
        .JESD204B_Top_tx_data_eof_o(JESD204B_Top_tx_data_eof_o), //output [3:0] JESD204B_Top_tx_data_eof_o
        .JESD204B_Top_tx_data_somf_o(JESD204B_Top_tx_data_somf_o), //output [3:0] JESD204B_Top_tx_data_somf_o
        .JESD204B_Top_tx_data_eomf_o(JESD204B_Top_tx_data_eomf_o), //output [3:0] JESD204B_Top_tx_data_eomf_o
        .JESD204B_Top_tx_debug_o(JESD204B_Top_tx_debug_o), //output [71:0] JESD204B_Top_tx_debug_o
        .JESD204B_Top_rx_cfg_rdata_o(JESD204B_Top_rx_cfg_rdata_o), //output [31:0] JESD204B_Top_rx_cfg_rdata_o
        .JESD204B_Top_rx_cfg_rdy_o(JESD204B_Top_rx_cfg_rdy_o), //output JESD204B_Top_rx_cfg_rdy_o
        .JESD204B_Top_rx_sync_o(JESD204B_Top_rx_sync_o), //output JESD204B_Top_rx_sync_o
        .JESD204B_Top_rx_data_valid_o(JESD204B_Top_rx_data_valid_o), //output JESD204B_Top_rx_data_valid_o
        .JESD204B_Top_rx_data_sof_o(JESD204B_Top_rx_data_sof_o), //output [3:0] JESD204B_Top_rx_data_sof_o
        .JESD204B_Top_rx_data_eof_o(JESD204B_Top_rx_data_eof_o), //output [3:0] JESD204B_Top_rx_data_eof_o
        .JESD204B_Top_rx_data_somf_o(JESD204B_Top_rx_data_somf_o), //output [3:0] JESD204B_Top_rx_data_somf_o
        .JESD204B_Top_rx_data_eomf_o(JESD204B_Top_rx_data_eomf_o), //output [3:0] JESD204B_Top_rx_data_eomf_o
        .JESD204B_Top_rx_data_o(JESD204B_Top_rx_data_o), //output [63:0] JESD204B_Top_rx_data_o
        .JESD204B_Top_rx_data_err_o(JESD204B_Top_rx_data_err_o), //output [7:0] JESD204B_Top_rx_data_err_o
        .JESD204B_Top_rx_debug_o(JESD204B_Top_rx_debug_o), //output [87:0] JESD204B_Top_rx_debug_o
        .JESD204B_Top_gt_q1_qpll1_ok_o(JESD204B_Top_gt_q1_qpll1_ok_o), //output JESD204B_Top_gt_q1_qpll1_ok_o
        .JESD204B_Top_gt_cpll_ok_o(JESD204B_Top_gt_cpll_ok_o), //output [1:0] JESD204B_Top_gt_cpll_ok_o
        .JESD204B_Top_gt_pcs_tx_clk_o(JESD204B_Top_gt_pcs_tx_clk_o), //output JESD204B_Top_gt_pcs_tx_clk_o
        .JESD204B_Top_gt_tx_fifo_wrusewd_o(JESD204B_Top_gt_tx_fifo_wrusewd_o), //output [9:0] JESD204B_Top_gt_tx_fifo_wrusewd_o
        .JESD204B_Top_gt_pcs_rx_clk_o(JESD204B_Top_gt_pcs_rx_clk_o), //output JESD204B_Top_gt_pcs_rx_clk_o
        .JESD204B_Top_gt_pma_rx_lock_o(JESD204B_Top_gt_pma_rx_lock_o), //output [1:0] JESD204B_Top_gt_pma_rx_lock_o
        .JESD204B_Top_gt_rx_k_lock_o(JESD204B_Top_gt_rx_k_lock_o), //output [1:0] JESD204B_Top_gt_rx_k_lock_o
        .JESD204B_Top_gt_rx_align_link_o(JESD204B_Top_gt_rx_align_link_o), //output [1:0] JESD204B_Top_gt_rx_align_link_o
        .JESD204B_Top_gt_rx_fifo_rdusewd_o(JESD204B_Top_gt_rx_fifo_rdusewd_o), //output [9:0] JESD204B_Top_gt_rx_fifo_rdusewd_o
        .JESD204B_Top_tx_rst_i(JESD204B_Top_tx_rst_i), //input JESD204B_Top_tx_rst_i
        .JESD204B_Top_tx_core_clk_i(JESD204B_Top_tx_core_clk_i), //input JESD204B_Top_tx_core_clk_i
        .JESD204B_Top_tx_cfg_clk_i(JESD204B_Top_tx_cfg_clk_i), //input JESD204B_Top_tx_cfg_clk_i
        .JESD204B_Top_tx_cfg_rstn_i(JESD204B_Top_tx_cfg_rstn_i), //input JESD204B_Top_tx_cfg_rstn_i
        .JESD204B_Top_tx_cfg_addr_i(JESD204B_Top_tx_cfg_addr_i), //input [31:0] JESD204B_Top_tx_cfg_addr_i
        .JESD204B_Top_tx_cfg_sel_i(JESD204B_Top_tx_cfg_sel_i), //input JESD204B_Top_tx_cfg_sel_i
        .JESD204B_Top_tx_cfg_ena_i(JESD204B_Top_tx_cfg_ena_i), //input JESD204B_Top_tx_cfg_ena_i
        .JESD204B_Top_tx_cfg_wr_i(JESD204B_Top_tx_cfg_wr_i), //input JESD204B_Top_tx_cfg_wr_i
        .JESD204B_Top_tx_cfg_wdata_i(JESD204B_Top_tx_cfg_wdata_i), //input [31:0] JESD204B_Top_tx_cfg_wdata_i
        .JESD204B_Top_tx_cfg_strb_i(JESD204B_Top_tx_cfg_strb_i), //input [3:0] JESD204B_Top_tx_cfg_strb_i
        .JESD204B_Top_tx_sysref_i(JESD204B_Top_tx_sysref_i), //input JESD204B_Top_tx_sysref_i
        .JESD204B_Top_tx_sync_i(JESD204B_Top_tx_sync_i), //input JESD204B_Top_tx_sync_i
        .JESD204B_Top_tx_data_i(JESD204B_Top_tx_data_i), //input [63:0] JESD204B_Top_tx_data_i
        .JESD204B_Top_rx_rst_i(JESD204B_Top_rx_rst_i), //input JESD204B_Top_rx_rst_i
        .JESD204B_Top_rx_core_clk_i(JESD204B_Top_rx_core_clk_i), //input JESD204B_Top_rx_core_clk_i
        .JESD204B_Top_rx_cfg_clk_i(JESD204B_Top_rx_cfg_clk_i), //input JESD204B_Top_rx_cfg_clk_i
        .JESD204B_Top_rx_cfg_rstn_i(JESD204B_Top_rx_cfg_rstn_i), //input JESD204B_Top_rx_cfg_rstn_i
        .JESD204B_Top_rx_cfg_addr_i(JESD204B_Top_rx_cfg_addr_i), //input [31:0] JESD204B_Top_rx_cfg_addr_i
        .JESD204B_Top_rx_cfg_sel_i(JESD204B_Top_rx_cfg_sel_i), //input JESD204B_Top_rx_cfg_sel_i
        .JESD204B_Top_rx_cfg_ena_i(JESD204B_Top_rx_cfg_ena_i), //input JESD204B_Top_rx_cfg_ena_i
        .JESD204B_Top_rx_cfg_wr_i(JESD204B_Top_rx_cfg_wr_i), //input JESD204B_Top_rx_cfg_wr_i
        .JESD204B_Top_rx_cfg_wdata_i(JESD204B_Top_rx_cfg_wdata_i), //input [31:0] JESD204B_Top_rx_cfg_wdata_i
        .JESD204B_Top_rx_cfg_strb_i(JESD204B_Top_rx_cfg_strb_i), //input [3:0] JESD204B_Top_rx_cfg_strb_i
        .JESD204B_Top_rx_sysref_i(JESD204B_Top_rx_sysref_i), //input JESD204B_Top_rx_sysref_i
        .JESD204B_Top_gt_fabric_rstn_i(JESD204B_Top_gt_fabric_rstn_i), //input JESD204B_Top_gt_fabric_rstn_i
        .JESD204B_Top_gt_pcs_tx_rst_i(JESD204B_Top_gt_pcs_tx_rst_i), //input JESD204B_Top_gt_pcs_tx_rst_i
        .JESD204B_Top_gt_pcs_rx_rst_i(JESD204B_Top_gt_pcs_rx_rst_i) //input JESD204B_Top_gt_pcs_rx_rst_i
    );

//--------Copy end-------------------
