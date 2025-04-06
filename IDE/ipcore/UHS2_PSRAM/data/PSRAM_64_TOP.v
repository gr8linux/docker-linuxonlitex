
 `timescale 1ns/1ps
`include "apsram64_local_define.v"
`include "apsram_define.v"
module `module_name_apm64 (
                 clk,
                 memory_clk,
                 rst_n,
                 pll_lock,
                 //psram IO
                 O_apsram_ck,
                 O_apsram_ck_n,
                 IO_apsram_dq,
                 IO_apsram_dqs,
                 IO_apsram_dqs_n,
                 O_apsram_cs_n,
                 O_apsram_dm,
                 //user IO
                 wr_data,
                 wr_en, 
                 rd_data,
                 rd_data_valid,
                 addr,
                 cmd,
                 cmd_en,
                 cmd_rdy, 
                 data_rdy,
                 clk_out,
                 data_mask,
                 burst_num,
                 init_calib_done,
                 srf_entry_req,
                 srf_entry_ack,
                 srf_exit_req,
                 srf_exit_ack,
                 half_sleep_entry_req,
                 half_sleep_entry_ack,
                 half_sleep_exit_req,
                 half_sleep_exit_ack
                 );
`include "apsram_param.v"
`include "apsram64_local_param.v"

input                            clk;
input                            memory_clk;
input                            pll_lock;
input                            rst_n;


output [CS_WIDTH-1:0]			 O_apsram_ck;
output [CS_WIDTH-1:0]			 O_apsram_ck_n;
output [CS_WIDTH-1:0]            O_apsram_cs_n;
output [DQS_WIDTH-1:0]           O_apsram_dm;
inout  [DQ_WIDTH-1:0]            IO_apsram_dq;
inout  [DQS_WIDTH-1:0]           IO_apsram_dqs;
inout  [DQS_WIDTH-1:0]           IO_apsram_dqs_n;

input  [8*DQ_WIDTH-1:0]          wr_data;
input  [DQS_WIDTH*MASK_WIDTH-1:0]data_mask;
input  [1:0]                     cmd;
input                       	 cmd_en;
input  [7:0]                     burst_num;
input                            wr_en;
input  [ADDR_WIDTH-1:0]          addr;
input                            srf_entry_req;
output                           srf_entry_ack;
input                            srf_exit_req;
output                           srf_exit_ack;
input                            half_sleep_entry_req;
output                           half_sleep_entry_ack;
input                            half_sleep_exit_req;
output                           half_sleep_exit_ack;
output                           init_calib_done;
output                           clk_out;
output [8*DQ_WIDTH-1:0]          rd_data;
output                           rd_data_valid;
output                           cmd_rdy;
output                           data_rdy;


//Memory Interface
`getname(apm64_top,`module_name_apm64) u_apm64_top (
//psram_top u_psram_top(
                      .clk            (clk),
                      .memory_clk     (memory_clk), 
                      .rst_n          (rst_n),
                      .pll_lock       (pll_lock),
                      //psram IO
                      .O_apsram_ck     (O_apsram_ck),
                      .O_apsram_ck_n   (O_apsram_ck_n),
                      .IO_apsram_dq    (IO_apsram_dq),
                      .IO_apsram_dqs   (IO_apsram_dqs),
                      .IO_apsram_dqs_n (IO_apsram_dqs_n),
                      .O_apsram_dm     (O_apsram_dm),
                      .O_apsram_cs_n   (O_apsram_cs_n),
                      //user IO
                      .wr_data        (wr_data),
                      .wr_en          (wr_en),
                      .rd_data        (rd_data),
                      .rd_data_valid  (rd_data_valid),
                      .addr           (addr),
                      .cmd            (cmd),
                      .cmd_en         (cmd_en),
                      .cmd_rdy        (cmd_rdy),
                      .data_rdy       (data_rdy), 
                      .clk_out        (clk_out),
                      .data_mask      (data_mask),
                      .burst_num      (burst_num),
                      .init_calib_done(init_calib_done),
                      .srf_entry_req(srf_entry_req),
                      .srf_entry_ack(srf_entry_ack),
                      .srf_exit_req(srf_exit_req),
                      .srf_exit_ack(srf_exit_ack),
                      .half_sleep_entry_req(half_sleep_entry_req),
                      .half_sleep_entry_ack(half_sleep_entry_ack),
                      .half_sleep_exit_req(half_sleep_exit_req),
                      .half_sleep_exit_ack(half_sleep_exit_ack)
                     );
endmodule
