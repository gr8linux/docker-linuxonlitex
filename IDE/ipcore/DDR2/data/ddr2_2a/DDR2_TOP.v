
`timescale 1ps/1ps
`include "ddr_name.v"
`include "DDR_define.v"

module `module_name_ddr 
(
    clk,
    memory_clk,
    pll_lock,
    rst_n,
    cmd_ready,
    cmd,
    cmd_en,
    addr,
    wr_data_rdy,
    wr_data,
    wr_data_en,
    wr_data_end,
    wr_data_mask,
    rd_data,
    rd_data_valid,
    rd_data_end,
    sr_req,
    ref_req,
    sr_ack,
    ref_ack,
    init_calib_complete,
    clk_out,
    ddr_rst,
    `ifdef ECC
    ecc_err,
    `endif
    burst,
    `ifdef DEBUG_PORT_ENABLE
    dbg_vector3_out,
    dbg_vector2_out,
    dbg_vector1_out,
    `endif
    O_ddr_addr,
    O_ddr_ba,
    O_ddr_cs_n,
    O_ddr_ras_n,
    O_ddr_cas_n,
    O_ddr_we_n,
    O_ddr_clk,
    O_ddr_clk_n,
    O_ddr_cke,
    O_ddr_odt,
    O_ddr_reset_n,
    O_ddr_dqm,
    IO_ddr_dq,
	`ifdef DQS_DIFF
    IO_ddr_dqs,
    IO_ddr_dqs_n
	`else
	IO_ddr_dqs
	`endif
);

`include "gwmc_param.v"
`include "gwmc_local_param.v"

input                          clk;
input                          memory_clk;
input                          pll_lock;
input                          rst_n;
input                          wr_data_en;
input [APP_MASK_WIDTH-1:0]     wr_data_mask;
input                          wr_data_end;
input [APP_DATA_WIDTH-1:0]     wr_data;
input                          cmd_en;
input [2:0]                    cmd;
input [ADDR_WIDTH-1:0]         addr;
output                         sr_ack;
output                         ref_ack;
output                         wr_data_rdy;
output                         init_calib_complete;
output                         cmd_ready;
output                         rd_data_valid; 
output                         rd_data_end;
output [APP_DATA_WIDTH-1:0]    rd_data;
`ifdef ECC
output [APP_DATA_WIDTH/32-1:0] ecc_err;
`endif
input                          sr_req;
input                          ref_req;
input                          burst;
output                         clk_out;
output                         ddr_rst;
`ifdef DEBUG_PORT_ENABLE
output [3*DQS_WIDTH-1:0]       dbg_vector3_out;
output [2*DQS_WIDTH-1:0]       dbg_vector2_out;
output [7:0]                   dbg_vector1_out; 
`endif
output [ROW_WIDTH-1:0]         O_ddr_addr;
output [BANK_WIDTH-1:0]        O_ddr_ba;
output                         O_ddr_cs_n;
output                         O_ddr_ras_n;
output                         O_ddr_cas_n;
output                         O_ddr_we_n;
output                         O_ddr_clk;
output                         O_ddr_clk_n;
output                         O_ddr_cke;
output                         O_ddr_odt;
output                         O_ddr_reset_n;
output [DM_WIDTH-1:0]          O_ddr_dqm;
inout  [DQ_WIDTH-1:0]          IO_ddr_dq;
`ifdef DQS_DIFF
inout  [DQS_WIDTH-1:0]         IO_ddr_dqs;
inout  [DQS_WIDTH-1:0]         IO_ddr_dqs_n; 
`else
inout  [DQS_WIDTH-1:0]         IO_ddr_dqs;
`endif
//////////////////////////////////////////////////////////////////
`getname(gw2_phy_mc,`module_name_ddr) gw2mc_top
(
    .clk                     (clk),
    .memory_clk              (memory_clk     ),
    .pll_lock                (pll_lock       ),
    .rst_n                   (rst_n),
    .wr_data_en              (wr_data_en),
    .wr_data_mask            (wr_data_mask),
    .wr_data_end             (wr_data_end),
    .wr_data                 (wr_data),
    .cmd_en                  (cmd_en),
    .cmd                     (cmd),
    .addr                    (addr),
    .sr_ack                  (sr_ack),
    .ref_ack                 (ref_ack),
    .wr_data_rdy             (wr_data_rdy),
    .init_calib_complete     (init_calib_complete),
    .cmd_ready               (cmd_ready),
    .rd_data_valid           (rd_data_valid),
    .rd_data_end             (rd_data_end),
    .rd_data                 (rd_data),
    `ifdef ECC
    .ecc_err                 (ecc_err),
    `endif
    .sr_req                  (sr_req),
    .ref_req                 (ref_req),
    .clk_out                 (clk_out),
    .ddr_rst                 (ddr_rst),
    .burst                   (burst),
    `ifdef DEBUG_PORT_ENABLE
    .dbg_vector3_out         (dbg_vector3_out),
    .dbg_vector2_out         (dbg_vector2_out), 
    .dbg_vector1_out         (dbg_vector1_out), 
    `endif
    .O_ddr_addr              (O_ddr_addr),
    .O_ddr_ba                (O_ddr_ba),
    .O_ddr_cs_n              (O_ddr_cs_n),
    .O_ddr_ras_n             (O_ddr_ras_n),
    .O_ddr_cas_n             (O_ddr_cas_n),
    .O_ddr_we_n              (O_ddr_we_n),
    .O_ddr_clk               (O_ddr_clk),
    .O_ddr_clk_n             (O_ddr_clk_n),
    .O_ddr_cke               (O_ddr_cke),
    .O_ddr_odt               (O_ddr_odt),
    .O_ddr_reset_n           (O_ddr_reset_n),
    .O_ddr_dqm               (O_ddr_dqm),
    .IO_ddr_dq               (IO_ddr_dq),
    .IO_ddr_dqs              (IO_ddr_dqs),
	`ifdef DQS_DIFF
    .IO_ddr_dqs_n            (IO_ddr_dqs_n)
	`else
	.IO_ddr_dqs_n            ()
	`endif
);




endmodule

