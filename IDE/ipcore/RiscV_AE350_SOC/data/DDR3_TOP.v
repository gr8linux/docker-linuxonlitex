


`include "ddr3_name.v"
`include "DDR3_define.v"

module `module_name_ddr
//module DDR3_Memory_Interface_Top
(
    // user interface
    clk,
    `ifndef ARORA_GW2A
    pll_stop,
    `endif
    memory_clk,
    pll_lock,
    rst_n,
    clk_out,
    ddr_rst,
	init_calib_complete,
    `ifdef DDR3_PHY_MC
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
    `ifdef ECC
    ecc_err,
    `endif
    burst,
	`elsif DDR3_PHY
	eye_calib_start,
	eye_cmd_rdy,
	eye_app_cmd_en,
	eye_app_cmd,
	eye_app_addr,
	eye_wdf_rdy,
	eye_app_wdf_wren,
	eye_app_wdf_wdata,
	
	ddr_init_internal,

	mc_ras_n,
	mc_cas_n,
	mc_we_n,
	mc_address,
	mc_bank,
	mc_cs_n,
	mc_odt,
	mc_cke,
	mc_reset_n,
	mc_wrdata,
	mc_wrdata_mask,
	mc_wrdata_en,
	mc_cmd_wren,
	
	phy_rd_data,
	phy_rddata_valid,
	
	updata_dqs_req ,
	updata_dqs_ack ,
	updata_dqs_finished,
	`endif
    `ifdef DEBUG_PORT_ENABLE
    dbg_vector4_out,
    dbg_vector3_out,
    dbg_vector2_out,
    dbg_vector1_out,
    `endif
    // mem interface
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
    IO_ddr_dqs,
    IO_ddr_dqs_n
);

`include "gwmc_param.v"
`include "gwmc_local_param.v"

input                          clk;
`ifndef ARORA_GW2A
output                         pll_stop;
`endif
input                          memory_clk;
input                          pll_lock;
input                          rst_n;
output                         init_calib_complete;
`ifdef DDR3_PHY_MC 
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
`elsif DDR3_PHY
output									eye_calib_start;
input 									eye_cmd_rdy;
output 									eye_app_cmd_en;
output [2:0] 							eye_app_cmd;
output [ADDR_WIDTH-1:0] 				eye_app_addr;
input 									eye_wdf_rdy;
output 									eye_app_wdf_wren;
output [APP_DATA_WIDTH-1:0] 			eye_app_wdf_wdata;

output                            		ddr_init_internal;

input  [nCK_PER_CLK-1:0]               	mc_ras_n;
input  [nCK_PER_CLK-1:0]               	mc_cas_n;
input  [nCK_PER_CLK-1:0]               	mc_we_n;
input  [nCK_PER_CLK*ROW_WIDTH-1:0]     	mc_address;
input  [nCK_PER_CLK*BANK_WIDTH-1:0]    	mc_bank;
input  [CS_WIDTH*nCS_PER_RANK*nCK_PER_CLK-1:0] mc_cs_n;
input  [1:0]                           	mc_odt;
input  [nCK_PER_CLK-1:0]               	mc_cke;
input                                 	mc_reset_n;
input  [2*nCK_PER_CLK*DQ_WIDTH-1:0]    	mc_wrdata;
input  [2*nCK_PER_CLK*DQ_WIDTH/8-1:0]  	mc_wrdata_mask;
input                                 	mc_wrdata_en;
input                                 	mc_cmd_wren;
output [2*nCK_PER_CLK*DQ_WIDTH-1:0]    	phy_rd_data;
output                                 	phy_rddata_valid;
output                                 	updata_dqs_req ;
input                                 	updata_dqs_ack ;
output                                 	updata_dqs_finished;
`endif
`ifdef DEBUG_PORT_ENABLE
output [8*DQS_WIDTH-1:0]       dbg_vector4_out;
output [3*DQS_WIDTH-1:0]       dbg_vector3_out;
output [4*DQS_WIDTH-1:0]       dbg_vector2_out;
output [7:0]                   dbg_vector1_out; 
`endif
output                         clk_out;
output                         ddr_rst;
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
inout  [DQS_WIDTH-1:0]         IO_ddr_dqs;
inout  [DQS_WIDTH-1:0]         IO_ddr_dqs_n;

//////////////////////////////////////////////////////////////////
`ifdef DDR3_PHY_MC
`getname(GW_DDR3_PHY_MC,`module_name_ddr) gw3_top
//GW_DDR3_PHY_MC gw3_top
(
    .clk                     (clk),
    `ifndef ARORA_GW2A
    .pll_stop                (pll_stop),
    `endif
    .memory_clk              (memory_clk),
    .pll_lock                (pll_lock),
    .rst_n                   (rst_n),
    //.app_burst_number        (app_burst_number),
    .cmd_ready               (cmd_ready),
    .cmd                     (cmd),
    .cmd_en                  (cmd_en),
    .addr                    (addr),
    .wr_data_rdy             (wr_data_rdy),
    .wr_data                 (wr_data),
    .wr_data_en              (wr_data_en),
    .wr_data_end             (wr_data_end),
    .wr_data_mask            (wr_data_mask),
    .rd_data                 (rd_data),
    .rd_data_valid           (rd_data_valid),
    .rd_data_end             (rd_data_end),
    .sr_req                  (sr_req),
    .ref_req                 (ref_req),
    .sr_ack                  (sr_ack),
    .ref_ack                 (ref_ack),
    .init_calib_complete     (init_calib_complete),
    `ifdef ECC
    .ecc_err                 (ecc_err),
    `endif
    `ifdef DEBUG_PORT_ENABLE
    .dbg_vector4_out         (dbg_vector4_out),
    .dbg_vector3_out         (dbg_vector3_out),
    .dbg_vector2_out         (dbg_vector2_out), 
    .dbg_vector1_out         (dbg_vector1_out), 
    `endif
    .clk_out                 (clk_out),
    .burst                   (burst),
    .ddr_rst                 (ddr_rst),
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
    .IO_ddr_dqs_n            (IO_ddr_dqs_n)
);
`elsif DDR3_PHY
`getname(GW_DDR3_PHY,`module_name_ddr) gw3_phy
//module GW_DDR3_PHY
(
    .clk                    (clk),
    `ifndef ARORA_GW2A
    .pll_stop               (pll_stop),
    `endif
    .memory_clk             (memory_clk),
    .pll_lock               (pll_lock),
    .rst_n                  (rst_n),
    .init_calib_complete    (init_calib_complete),
    .clk_out                (clk_out),
	.eye_calib_start		(eye_calib_start),
	.eye_cmd_rdy			(eye_cmd_rdy),
	.eye_app_cmd_en			(eye_app_cmd_en),
	.eye_app_cmd			(eye_app_cmd),
	.eye_app_addr			(eye_app_addr),
	.eye_wdf_rdy			(eye_wdf_rdy),
	.eye_app_wdf_wren		(eye_app_wdf_wren),
	.eye_app_wdf_wdata		(eye_app_wdf_wdata),
	
	.ddr_init_internal		(ddr_init_internal),

	.mc_ras_n				(mc_ras_n),
	.mc_cas_n				(mc_cas_n),
	.mc_we_n				(mc_we_n),
	.mc_address				(mc_address),
	.mc_bank				(mc_bank),
	.mc_cs_n				(mc_cs_n),
	.mc_odt					(mc_odt),
	.mc_cke					(mc_cke),
	.mc_reset_n				(mc_reset_n),
	.mc_wrdata				(mc_wrdata),
	.mc_wrdata_mask			(mc_wrdata_mask),
	.mc_wrdata_en			(mc_wrdata_en),
	.mc_cmd_wren			(mc_cmd_wren),
	
	.phy_rd_data			(phy_rd_data),
	.phy_rddata_valid		(phy_rddata_valid),
	
	.updata_dqs_req			(updata_dqs_req),
	.updata_dqs_ack			(updata_dqs_ack),
	.updata_dqs_finished	(updata_dqs_finished),

    `ifdef DEBUG_PORT_ENABLE
    .dbg_vector4_out        (dbg_vector4_out),
    .dbg_vector3_out        (dbg_vector3_out),
    .dbg_vector2_out        (dbg_vector2_out), 
    .dbg_vector1_out        (dbg_vector1_out),
    `endif
    // mem interface
    .ddr_rst                (ddr_rst),
    .O_ddr_addr             (O_ddr_addr),
    .O_ddr_ba               (O_ddr_ba),
    .O_ddr_cs_n             (O_ddr_cs_n),
    .O_ddr_ras_n            (O_ddr_ras_n),
    .O_ddr_cas_n            (O_ddr_cas_n),
    .O_ddr_we_n             (O_ddr_we_n),
    .O_ddr_clk              (O_ddr_clk),
    .O_ddr_clk_n            (O_ddr_clk_n),
    .O_ddr_cke              (O_ddr_cke),
    .O_ddr_odt              (O_ddr_odt),
    .O_ddr_reset_n          (O_ddr_reset_n),
    .O_ddr_dqm              (O_ddr_dqm),
    .IO_ddr_dq              (IO_ddr_dq),
    .IO_ddr_dqs             (IO_ddr_dqs),
    .IO_ddr_dqs_n           (IO_ddr_dqs_n)
    
);
`endif
    
endmodule








