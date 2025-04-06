`timescale 1ps/1ps
`include "apsram_define.v"
`include "apsram_local_define.v"

module `module_name_apsram (
               clk_d,
               rst_n,
               memory_clk,
               memory_clk_p,
               pll_lock,
               //psram IO
               O_apsram_ck,
               O_apsram_ck_n,
               IO_apsram_dqs,
               IO_apsram_dq,
               O_apsram_cs_n,
               O_apsram_dm,
               //user IO
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
               wr_en0,
               wr_en1,
               rd_data0,
               rd_data1,
               rd_data_valid0,
               rd_data_valid1,
               data_mask0,
               data_mask1,
               burst_num0,
               burst_num1,
               cmd_rdy0,
               cmd_rdy1
               );

`include "apsram_param.v"
`include "apsram_local_param.v"

input                              clk_d;
input                              rst_n;
input                              memory_clk;
input                              memory_clk_p;
input                              pll_lock;
output                             clk_out;
output  [2*CS_WIDTH-1:0]           O_apsram_ck;
output  [2*CS_WIDTH-1:0]           O_apsram_ck_n;
inout   [2*CS_WIDTH-1:0]           IO_apsram_dqs;
inout   [2*DQ_WIDTH-1:0]           IO_apsram_dq;
output  [2*CS_WIDTH-1:0]           O_apsram_dm;
output  [2*CS_WIDTH-1:0]           O_apsram_cs_n;
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
input   [9:0]                      burst_num0;
input   [9:0]                      burst_num1;
input                              wr_en0;
input                              wr_en1;
output                             cmd_rdy0;
output                             cmd_rdy1;



wire    [7:0]                      dll_step;
wire                               dll_lock;
wire                               clk_x1;
wire                               clk_x2;
wire                               clk_x1p;
wire                               clk_x2p;
wire                               memory_clk;
wire                               pll_lock;



assign clk_out = clk_x1;


/*DLL #(
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
        );*/


DHCEN u_dhcen_clk_x2 (
            .CLKIN      (memory_clk),
            .CE         (stop),
            .CLKOUT     (clk_x2)
         );

DHCEN u_dhcen_clk_x2p (
            .CLKIN      (memory_clk_p),
            .CE         (stop),
            .CLKOUT     (clk_x2p)
         );




 CLKDIV clkdiv (
            .HCLKIN     (clk_x2),
            .RESETN     (!ddr_rsti),
            .CALIB      (1'b0),
            .CLKOUT     (clk_x1)
        );
defparam clkdiv.DIV_MODE="2";
defparam clkdiv.GSREN="false";



`getname(apsram_sync,`module_name_apsram)  u_psram_sync (
            .start_clk   (clk_d),
            .rst         (!rst_n),
            .pll_lock    (pll_lock),
            .dll_lock    (1'b1),
            .update      (1'b0),
            .pause       (pause), 
            .stop        (stop),
            .uddcntln    (uddcntln),
            .dll_rst     (dll_rsti),
            .ddr_rst     (ddr_rsti),
            .ready       (ready)           
        );


`getname(apsram_top,`module_name_apsram)  #(
       ) u_psram_top0  (
           // .clk        (clk),
            .clk_x2     (clk_x2),
            .clk_x2p    (clk_x2p),
            .clk_x1     (clk_x1),
            .ready      (ready),
            .ddr_rsti   (ddr_rsti),
            .dll_lock   (1'b1),
            .dll_step   (dll_step),
            .O_apsram_ck (O_apsram_ck[(CS_WIDTH-1):0]),
            .O_apsram_ck_n(O_apsram_ck_n[(CS_WIDTH-1):0]),
            .IO_apsram_dqs(IO_apsram_dqs[(CS_WIDTH-1):0]),
            .IO_apsram_dq(IO_apsram_dq[(CS_WIDTH*8-1):0]),
            .O_apsram_dm(O_apsram_dm[(CS_WIDTH-1):0]),
            .O_apsram_cs_n(O_apsram_cs_n[(CS_WIDTH-1):0]),
            .wr_data    (wr_data0),
            .rd_data    (rd_data0),
            .rd_data_valid(rd_data_valid0),
            .addr       (addr0),
            .cmd        (cmd0),
            .cmd_en     (cmd_en0),
            .data_mask  (data_mask0),
            .init_calib (init_calib0),
            .cmd_rdy    (cmd_rdy0),
            .wr_en      (wr_en0),
            .burst_num  (burst_num0)
        );

`getname(apsram_top,`module_name_apsram)   #(
      ) u_psram_top1 (
            //.clk        (clk),                    
            .clk_x2     (clk_x2),
            .clk_x2p    (clk_x2p),
            .clk_x1     (clk_x1),
            .ready      (ready),
            .ddr_rsti   (ddr_rsti),
            .dll_lock   (1'b1),
            .dll_step   (dll_step),
            .O_apsram_ck (O_apsram_ck[(CS_WIDTH*2-1):CS_WIDTH]),
            .O_apsram_ck_n(O_apsram_ck_n[(CS_WIDTH*2-1):CS_WIDTH]),
            .IO_apsram_dqs(IO_apsram_dqs[(CS_WIDTH*2-1):CS_WIDTH]),
            .IO_apsram_dq(IO_apsram_dq[(CS_WIDTH*16-1):CS_WIDTH*8]),
            .O_apsram_dm(O_apsram_dm[(CS_WIDTH*2-1):CS_WIDTH]),
            .O_apsram_cs_n(O_apsram_cs_n[(CS_WIDTH*2-1):CS_WIDTH]),
            .wr_data    (wr_data1),
            .rd_data    (rd_data1),
            .rd_data_valid(rd_data_valid1),
            .addr       (addr1),
            .cmd        (cmd1),
            .cmd_en     (cmd_en1),                     
            .data_mask  (data_mask1),
            .init_calib (init_calib1),
            .cmd_rdy    (cmd_rdy1),
            .wr_en      (wr_en1),
            .burst_num  (burst_num1)
        );

endmodule




