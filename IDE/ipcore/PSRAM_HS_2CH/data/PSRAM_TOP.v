`timescale 1ps/1ps
`include "psram_define.v"
`include "psram_local_define.v"

module `module_name_psram (
               clk,
               rst_n,
               memory_clk,
               pll_lock,
               O_psram_ck,
               O_psram_ck_n,
               IO_psram_rwds,
               O_psram_reset_n,
               IO_psram_dq,
               O_psram_cs_n,
               init_calib0,
               init_calib1,
               clk_out,
               cmd0, 
               cmd1,
               cmd_en0,
               cmd_en1,
               addr0,
               addr1,
               wr_data0,
               wr_data1,
               rd_data0,
               rd_data1,
               rd_data_valid0,
               rd_data_valid1,
               data_mask0,
               data_mask1
               );

`include "psram_param.v"
`include "psram_local_param.v"

input                              clk;
input                              rst_n;
input                              memory_clk;
input                              pll_lock;
output                             clk_out;
output  [2*CS_WIDTH-1:0]           O_psram_ck;
output  [2*CS_WIDTH-1:0]           O_psram_ck_n;
inout   [2*CS_WIDTH-1:0]           IO_psram_rwds;
inout   [2*DQ_WIDTH-1:0]           IO_psram_dq;
output  [2*CS_WIDTH-1:0]           O_psram_reset_n;
output  [2*CS_WIDTH-1:0]           O_psram_cs_n;
output                             init_calib0;
output                             init_calib1;
input   [4*DQ_WIDTH-1:0]           wr_data0/* synthesis syn_keep=1 */;
output  [4*DQ_WIDTH-1:0]           rd_data0/* synthesis syn_keep=1 */;
output                             rd_data_valid0/* synthesis syn_keep=1 */;
output                             rd_data_valid1/* synthesis syn_keep=1 */;
input   [4*DQ_WIDTH-1:0]           wr_data1/* synthesis syn_keep=1 */;
output  [4*DQ_WIDTH-1:0]           rd_data1/* synthesis syn_keep=1 */;
input                              cmd0;
input                              cmd_en0;
input   [ADDR_WIDTH-1:0]           addr0;
input   [CS_WIDTH*MASK_WIDTH-1:0]  data_mask0;
input                              cmd1;
input                              cmd_en1;
input   [ADDR_WIDTH-1:0]           addr1;
input   [CS_WIDTH*MASK_WIDTH-1:0]  data_mask1;


wire                               recalib;
wire                               recalib0;
wire                               recalib1;
wire    [7:0]                      dll_step;
wire                               dll_lock;
wire                               clk_x1;
wire                               memory_clk;
wire                               pll_lock;



assign clk_out = clk_x1;


DLL #(
  .DLL_FORCE (0),
  .CODESCAL  ("101"), 
  .SCAL_EN   ("false"),
  .DIV_SEL   (1'b1)
) u_dll (
            .CLKIN      (clk_x2), 
            .STOP       (!pll_lock), 
            .RESET      (dll_rsti),
            .UPDNCNTL   (uddcntln), 
            .STEP       (dll_step), 
            .LOCK       (dll_lock)
        );


DHCEN u_dhcen_clk_x2p (
            .CLKIN      (memory_clk),
            .CE         (stop),
            .CLKOUT     (clk_x2)
         );

 CLKDIV clkdiv (
            .HCLKIN     (clk_x2),
            .RESETN     (!ddr_rsti),
            .CALIB      (1'b0),
            .CLKOUT     (clk_x1)
        );
defparam clkdiv.DIV_MODE="2";
defparam clkdiv.GSREN="false";

`getname(psram_sync,`module_name_psram)  u_psram_sync (
            .start_clk   (clk),
            .rst         (!rst_n),
            .pll_lock    (pll_lock),
            .dll_lock    (dll_lock),
            .update      (1'b0),
            .pause       (pause), 
            .stop        (stop),
            .uddcntln    (uddcntln),
            .dll_rst     (dll_rsti),
            .ddr_rst     (ddr_rsti),
            .ready       (ready)           
        );


`getname(psram_memory_interface,`module_name_psram)  #(
        .Reverse_Clk (C0_Reverse_Clk),
        .Diff_Clk(C0_Diff_Clk)
       ) u_psram_top0  (
            .clk        (clk),
            .clk_x2     (clk_x2),
            .clk_x1     (clk_x1),
            .ready      (ready),
            .ddr_rsti   (ddr_rsti),
            .dll_lock   (dll_lock),
            .dll_step   (dll_step),
            .rst_n      (rst_n),  
            .O_psram_ck (O_psram_ck[(CS_WIDTH-1):0]),
            .O_psram_ck_n(O_psram_ck_n[(CS_WIDTH-1):0]),
            .IO_psram_rwds(IO_psram_rwds[(CS_WIDTH-1):0]),
            .IO_psram_dq(IO_psram_dq[(CS_WIDTH*8-1):0]),
            .O_psram_reset_n(O_psram_reset_n[(CS_WIDTH-1):0]),
            .O_psram_cs_n(O_psram_cs_n[(CS_WIDTH-1):0]),
            .wr_data    (wr_data0),
            .rd_data    (rd_data0),
            .rd_data_valid(rd_data_valid0),
            .addr       (addr0),
            .cmd        (cmd0),
            .cmd_en     (cmd_en0),
            .data_mask  (data_mask0),
            .init_calib (init_calib0)
        );

`getname(psram_memory_interface,`module_name_psram)   #(
        .Reverse_Clk (C1_Reverse_Clk),
        .Diff_Clk(C1_Diff_Clk)
      ) u_psram_top1 (
            .clk        (clk),                    
            .clk_x2     (clk_x2),
            .clk_x1     (clk_x1),
            .ready      (ready),
            .ddr_rsti   (ddr_rsti),
            .dll_lock   (dll_lock),
            .dll_step   (dll_step),
            .rst_n      (rst_n),  
            .O_psram_ck (O_psram_ck[(CS_WIDTH*2-1):CS_WIDTH]),
            .O_psram_ck_n(O_psram_ck_n[(CS_WIDTH*2-1):CS_WIDTH]),
            .IO_psram_rwds(IO_psram_rwds[(CS_WIDTH*2-1):CS_WIDTH]),
            .IO_psram_dq(IO_psram_dq[(CS_WIDTH*16-1):CS_WIDTH*8]),
            .O_psram_reset_n(O_psram_reset_n[(CS_WIDTH*2-1):CS_WIDTH]),
            .O_psram_cs_n(O_psram_cs_n[(CS_WIDTH*2-1):CS_WIDTH]),
            .wr_data    (wr_data1),
            .rd_data    (rd_data1),
            .rd_data_valid(rd_data_valid1),
            .addr       (addr1),
            .cmd        (cmd1),
            .cmd_en     (cmd_en1),                     
            .data_mask  (data_mask1),
            .init_calib (init_calib1)
        );

endmodule



