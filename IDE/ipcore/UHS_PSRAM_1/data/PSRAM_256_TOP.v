`timescale 1ps/1ps
`include "apsram_define.v"
`include "apsram_local_define.v"

module `module_name_apsram
(
                 clk,
                 memory_clk,
                 rst_n,
                 pll_lock,
                 //psram IO
                 O_apsram_ck, 
                 IO_apsram_dq,
                 IO_apsram_dqsm,
                 O_apsram_cs_n,
                 //user IO
                 wr_data,
                 wr_en, 
                 rd_data,
                 rd_data_valid,
                 addr,
                 cmd,
                 cmd_en, 
                 init_calib,
                 clk_out,
                 data_mask,
                 burst_num,
                 cmd_rdy
                 );
`include "apsram_param.v"
`include "apsram_local_param.v"

input  clk;
input  memory_clk;
input  pll_lock;
input  rst_n;
input  wr_en;
output clk_out;
input  [ADDR_WIDTH-1:0] addr;
output [CS_WIDTH-1:0]   O_apsram_ck;
output [CS_WIDTH-1:0]   O_apsram_cs_n;
inout  [DQ_WIDTH-1:0]   IO_apsram_dq;
inout  [CS_WIDTH-1:0]   IO_apsram_dqsm;
input  [4*DQ_WIDTH-1:0] wr_data;
input  [CS_WIDTH*MASK_WIDTH-1:0] data_mask;
output [4*DQ_WIDTH-1:0] rd_data;
output rd_data_valid;
output cmd_rdy;
input  cmd;
input  cmd_en;
input  [9:0] burst_num;
output init_calib;


`getname(apsram_top,`module_name_apsram) u_apsram_top (
//psram_top u_psram_top(
                      .clk(clk),
                      .memory_clk(memory_clk),
                      .pll_lock(pll_lock),
                      .rst_n(rst_n),
                      .O_apsram_ck(O_apsram_ck),
                      .IO_apsram_dqsm(IO_apsram_dqsm),
                      .IO_apsram_dq(IO_apsram_dq),
                      .O_apsram_cs_n(O_apsram_cs_n),
                      .wr_data(wr_data),
                      .wr_en(wr_en),
                      .rd_data(rd_data),
                      .rd_data_valid(rd_data_valid),
                      .addr(addr),
                      .cmd(cmd),
                      .cmd_en(cmd_en),
                      .cmd_rdy(cmd_rdy), 
                      .clk_out(clk_out),
                      .data_mask(data_mask),
                      .burst_num(burst_num),
                      .init_calib(init_calib) 
                     );

endmodule

