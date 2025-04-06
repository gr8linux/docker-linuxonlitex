//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.10.01
//Part Number: GW5AST-LV138FPG676AES
//Device: GW5AST-138
//Device Version: B
//Created Time: Wed Aug  7 10:01:41 2024

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	JESD204B_Top your_instance_name(
		.tx_rst_i(tx_rst_i), //input tx_rst_i
		.tx_core_clk_i(tx_core_clk_i), //input tx_core_clk_i
		.tx_cfg_clk_i(tx_cfg_clk_i), //input tx_cfg_clk_i
		.tx_cfg_rstn_i(tx_cfg_rstn_i), //input tx_cfg_rstn_i
		.tx_cfg_addr_i(tx_cfg_addr_i), //input [31:0] tx_cfg_addr_i
		.tx_cfg_sel_i(tx_cfg_sel_i), //input tx_cfg_sel_i
		.tx_cfg_ena_i(tx_cfg_ena_i), //input tx_cfg_ena_i
		.tx_cfg_wr_i(tx_cfg_wr_i), //input tx_cfg_wr_i
		.tx_cfg_rdata_o(tx_cfg_rdata_o), //output [31:0] tx_cfg_rdata_o
		.tx_cfg_wdata_i(tx_cfg_wdata_i), //input [31:0] tx_cfg_wdata_i
		.tx_cfg_rdy_o(tx_cfg_rdy_o), //output tx_cfg_rdy_o
		.tx_cfg_strb_i(tx_cfg_strb_i), //input [3:0] tx_cfg_strb_i
		.tx_sysref_i(tx_sysref_i), //input tx_sysref_i
		.tx_sync_i(tx_sync_i), //input tx_sync_i
		.tx_data_ready_o(tx_data_ready_o), //output tx_data_ready_o
		.tx_data_sof_o(tx_data_sof_o), //output [3:0] tx_data_sof_o
		.tx_data_eof_o(tx_data_eof_o), //output [3:0] tx_data_eof_o
		.tx_data_somf_o(tx_data_somf_o), //output [3:0] tx_data_somf_o
		.tx_data_eomf_o(tx_data_eomf_o), //output [3:0] tx_data_eomf_o
		.tx_data_i(tx_data_i), //input [63:0] tx_data_i
		.serdes_txdata_o(serdes_txdata_o), //output [159:0] serdes_txdata_o
		.tx_debug_o(tx_debug_o), //output [71:0] tx_debug_o
		.rx_rst_i(rx_rst_i), //input rx_rst_i
		.rx_core_clk_i(rx_core_clk_i), //input rx_core_clk_i
		.rx_cfg_clk_i(rx_cfg_clk_i), //input rx_cfg_clk_i
		.rx_cfg_rstn_i(rx_cfg_rstn_i), //input rx_cfg_rstn_i
		.rx_cfg_addr_i(rx_cfg_addr_i), //input [31:0] rx_cfg_addr_i
		.rx_cfg_sel_i(rx_cfg_sel_i), //input rx_cfg_sel_i
		.rx_cfg_ena_i(rx_cfg_ena_i), //input rx_cfg_ena_i
		.rx_cfg_wr_i(rx_cfg_wr_i), //input rx_cfg_wr_i
		.rx_cfg_rdata_o(rx_cfg_rdata_o), //output [31:0] rx_cfg_rdata_o
		.rx_cfg_wdata_i(rx_cfg_wdata_i), //input [31:0] rx_cfg_wdata_i
		.rx_cfg_rdy_o(rx_cfg_rdy_o), //output rx_cfg_rdy_o
		.rx_cfg_strb_i(rx_cfg_strb_i), //input [3:0] rx_cfg_strb_i
		.rx_sysref_i(rx_sysref_i), //input rx_sysref_i
		.rx_sync_o(rx_sync_o), //output rx_sync_o
		.rx_data_valid_o(rx_data_valid_o), //output rx_data_valid_o
		.rx_data_sof_o(rx_data_sof_o), //output [3:0] rx_data_sof_o
		.rx_data_eof_o(rx_data_eof_o), //output [3:0] rx_data_eof_o
		.rx_data_somf_o(rx_data_somf_o), //output [3:0] rx_data_somf_o
		.rx_data_eomf_o(rx_data_eomf_o), //output [3:0] rx_data_eomf_o
		.rx_data_o(rx_data_o), //output [63:0] rx_data_o
		.rx_data_err_o(rx_data_err_o), //output [0:8] rx_data_err_o
		.serdes_rxdata_i(serdes_rxdata_i), //input [175:0] serdes_rxdata_i
		.rx_debug_o(rx_debug_o), //output [87:0] rx_debug_o
		.serdes_q0_qpll0_ok_i(serdes_q0_qpll0_ok_i), //input serdes_q0_qpll0_ok_i
		.serdes_q0_qpll1_ok_i(serdes_q0_qpll1_ok_i), //input serdes_q0_qpll1_ok_i
		.serdes_q1_qpll0_ok_i(serdes_q1_qpll0_ok_i), //input serdes_q1_qpll0_ok_i
		.serdes_q1_qpll1_ok_i(serdes_q1_qpll1_ok_i), //input serdes_q1_qpll1_ok_i
		.serdes_cpll_ok_i(serdes_cpll_ok_i), //input [1:0] serdes_cpll_ok_i
		.gt_q0_qpll0_ok_o(gt_q0_qpll0_ok_o), //output gt_q0_qpll0_ok_o
		.gt_q0_qpll1_ok_o(gt_q0_qpll1_ok_o), //output gt_q0_qpll1_ok_o
		.gt_q1_qpll0_ok_o(gt_q1_qpll0_ok_o), //output gt_q1_qpll0_ok_o
		.gt_q1_qpll1_ok_o(gt_q1_qpll1_ok_o), //output gt_q1_qpll1_ok_o
		.gt_cpll_ok_o(gt_cpll_ok_o), //output [1:0] gt_cpll_ok_o
		.gt_fabric_rstn_i(gt_fabric_rstn_i), //input gt_fabric_rstn_i
		.serdes_fabric_rstn_o(serdes_fabric_rstn_o), //output serdes_fabric_rstn_o
		.serdes_pcs_tx_clk_i(serdes_pcs_tx_clk_i), //input [1:0] serdes_pcs_tx_clk_i
		.gt_pcs_tx_clk_o(gt_pcs_tx_clk_o), //output gt_pcs_tx_clk_o
		.serdes_fabric_tx_clk_o(serdes_fabric_tx_clk_o), //output serdes_fabric_tx_clk_o
		.gt_pcs_tx_rst_i(gt_pcs_tx_rst_i), //input gt_pcs_tx_rst_i
		.serdes_pcs_tx_rst_o(serdes_pcs_tx_rst_o), //output serdes_pcs_tx_rst_o
		.serdes_fabric_tx_vld_o(serdes_fabric_tx_vld_o), //output serdes_fabric_tx_vld_o
		.serdes_tx_fifo_wrusewd_i(serdes_tx_fifo_wrusewd_i), //input [9:0] serdes_tx_fifo_wrusewd_i
		.gt_tx_fifo_wrusewd_o(gt_tx_fifo_wrusewd_o), //output [9:0] gt_tx_fifo_wrusewd_o
		.serdes_pcs_rx_clk_i(serdes_pcs_rx_clk_i), //input [1:0] serdes_pcs_rx_clk_i
		.gt_pcs_rx_clk_o(gt_pcs_rx_clk_o), //output gt_pcs_rx_clk_o
		.serdes_fabric_rx_clk_o(serdes_fabric_rx_clk_o), //output serdes_fabric_rx_clk_o
		.serdes_pma_rx_lock_i(serdes_pma_rx_lock_i), //input [1:0] serdes_pma_rx_lock_i
		.serdes_rx_k_lock_i(serdes_rx_k_lock_i), //input [1:0] serdes_rx_k_lock_i
		.serdes_rx_align_link_i(serdes_rx_align_link_i), //input [1:0] serdes_rx_align_link_i
		.gt_pma_rx_lock_o(gt_pma_rx_lock_o), //output [1:0] gt_pma_rx_lock_o
		.gt_rx_k_lock_o(gt_rx_k_lock_o), //output [1:0] gt_rx_k_lock_o
		.gt_rx_align_link_o(gt_rx_align_link_o), //output [1:0] gt_rx_align_link_o
		.gt_pcs_rx_rst_i(gt_pcs_rx_rst_i), //input gt_pcs_rx_rst_i
		.serdes_pcs_rx_rst_o(serdes_pcs_rx_rst_o), //output serdes_pcs_rx_rst_o
		.serdes_rxfifo_rd_en_o(serdes_rxfifo_rd_en_o), //output [1:0] serdes_rxfifo_rd_en_o
		.serdes_rxfifo_aempty_i(serdes_rxfifo_aempty_i), //input [1:0] serdes_rxfifo_aempty_i
		.serdes_rx_fifo_rdusewd_i(serdes_rx_fifo_rdusewd_i), //input [9:0] serdes_rx_fifo_rdusewd_i
		.gt_rx_fifo_rdusewd_o(gt_rx_fifo_rdusewd_o) //output [9:0] gt_rx_fifo_rdusewd_o
	);

//--------Copy end-------------------
