

`timescale 1ns / 100ps


module top (
    input i_clk, //50M

    output o_led1 ,
    output o_led2 ,
    output o_led3 ,
    output o_led4 ,

    output     o_tx,
    input      i_rx,
    input i_key,


    input  i_sysref,    //紫色线  SYSREF
    output o_rx_sync,   //灰色线 SYNC
    input  i_tx_sync    //白色线  SYNC


);



wire [31:0] reg0x0000;wire [31:0] reg0x0010;wire [31:0] mon0x0080;wire [31:0] mon0x0090;
wire [31:0] reg0x0001;wire [31:0] reg0x0011;wire [31:0] mon0x0081;wire [31:0] mon0x0091;
wire [31:0] reg0x0002;wire [31:0] reg0x0012;wire [31:0] mon0x0082;wire [31:0] mon0x0092;
wire [31:0] reg0x0003;wire [31:0] reg0x0013;wire [31:0] mon0x0083;wire [31:0] mon0x0093;
wire [31:0] reg0x0004;wire [31:0] reg0x0014;wire [31:0] mon0x0084;wire [31:0] mon0x0094;
wire [31:0] reg0x0005;wire [31:0] reg0x0015;wire [31:0] mon0x0085;wire [31:0] mon0x0095;
wire [31:0] reg0x0006;wire [31:0] reg0x0016;wire [31:0] mon0x0086;wire [31:0] mon0x0096;
wire [31:0] reg0x0007;wire [31:0] reg0x0017;wire [31:0] mon0x0087;wire [31:0] mon0x0097;
wire [31:0] reg0x0008;wire [31:0] reg0x0018;wire [31:0] mon0x0088;wire [31:0] mon0x0098;
wire [31:0] reg0x0009;wire [31:0] reg0x0019;wire [31:0] mon0x0089;wire [31:0] mon0x0099;
wire [31:0] reg0x000A;wire [31:0] reg0x001A;wire [31:0] mon0x008A;wire [31:0] mon0x009A;
wire [31:0] reg0x000B;wire [31:0] reg0x001B;wire [31:0] mon0x008B;wire [31:0] mon0x009B;
wire [31:0] reg0x000C;wire [31:0] reg0x001C;wire [31:0] mon0x008C;wire [31:0] mon0x009C;
wire [31:0] reg0x000D;wire [31:0] reg0x001D;wire [31:0] mon0x008D;wire [31:0] mon0x009D;
wire [31:0] reg0x000E;wire [31:0] reg0x001E;wire [31:0] mon0x008E;wire [31:0] mon0x009E;
wire [31:0] reg0x000F;wire [31:0] reg0x001F;wire [31:0] mon0x008F;wire [31:0] mon0x009F;

wire w_clk10m;
wire w_pll_lock;
reg  w_clk10m_rst_n;


assign w_fpga_sysref = i_sysref;


wire w_fpga_rx_sync/* synthesis syn_preserve = 1 */;
wire w_fpga_tx_sync/* synthesis syn_preserve = 1 */;

assign o_rx_sync = w_fpga_rx_sync;
assign w_fpga_tx_sync = i_tx_sync;



Gowin_PLL u_Gowin_PLL(
    .lock(w_pll_lock), //output lock
    .clkout0(w_clk10m), //output clkout0
    .clkin(i_clk) //input clkin
);

    

assign mon0x008D = w_pll_lock;



reg [11:0]r_cnt = 0;

always @(posedge w_clk10m)
begin
    if(w_pll_lock == 0)
    begin
        r_cnt <= 0;
    end
    else if(r_cnt < 12'hfff)
    begin
        r_cnt <= r_cnt + 1;
    end


    if(r_cnt == 12'hfff)
        w_clk10m_rst_n <= 1;
    else
        w_clk10m_rst_n <= 0;
end



assign mon0x0080 = reg0x0000 + 1;



wire               w_apb1_clk;
wire               w_apb1_rstn;
wire  [31:0]       w_apb1_addr;
wire               w_apb1_sel ;
wire               w_apb1_ena ;
wire               w_apb1_wr  ;
wire[31:0]         w_apb1_rdata;
wire  [31:0]       w_apb1_wdata;
wire               w_apb1_rdy;
wire  [3:0]        w_apb1_strb;


wire               w_apb2_clk  ;
wire               w_apb2_rstn ;
wire  [31:0]       w_apb2_addr ;
wire               w_apb2_sel  ;
wire               w_apb2_ena  ;
wire               w_apb2_wr   ;
wire[31:0]         w_apb2_rdata;
wire  [31:0]       w_apb2_wdata;
wire               w_apb2_rdy  ;
wire  [3:0]        w_apb2_strb ;

wire               w_apb3_clk  ;
wire               w_apb3_rstn ;
wire  [31:0]       w_apb3_addr ;
wire               w_apb3_sel  ;
wire               w_apb3_ena  ;
wire               w_apb3_wr   ;
wire[31:0]         w_apb3_rdata;
wire  [31:0]       w_apb3_wdata;
wire               w_apb3_rdy  ;
wire  [3:0]        w_apb3_strb ;	

wire                        uart_rx_led             ;
wire                        uart_tx_led             ;
wire                        uart_rx_err             ;
                                                              

Uart_to_Bus_Top u_Uart_to_Bus_Top(
	.rst_n_i                  (w_clk10m_rst_n ),                        
	.clk_i                    (w_clk10m       ),                
	.uart_rx_led_o            (uart_rx_led    ),
	.uart_tx_led_o            (uart_tx_led    ),
	.uart_rx_i                (i_rx           ),
	.uart_tx_o                (o_tx           ),
    .apb0_addr_o              (w_apb1_addr    ),
    .apb0_sel_o               (w_apb1_sel     ),
    .apb0_ena_o               (w_apb1_ena     ),
    .apb0_wr_o                (w_apb1_wr      ),
    .apb0_rdata_i             (w_apb1_rdata   ),
    .apb0_wdata_o             (w_apb1_wdata   ),
    .apb0_rdy_i               (w_apb1_rdy     ),
    .apb0_strb_o              (w_apb1_strb    ),   

    .apb1_addr_o              (w_apb2_addr    ),
    .apb1_sel_o               (w_apb2_sel     ),
    .apb1_ena_o               (w_apb2_ena     ),
    .apb1_wr_o                (w_apb2_wr      ),
    .apb1_rdata_i             (w_apb2_rdata   ),
    .apb1_wdata_o             (w_apb2_wdata   ),
    .apb1_rdy_i               (w_apb2_rdy     ),
    .apb1_strb_o              (w_apb2_strb    ),  
	
    .apb2_addr_o              (w_apb3_addr    ),
    .apb2_sel_o               (w_apb3_sel     ),
    .apb2_ena_o               (w_apb3_ena     ),
    .apb2_wr_o                (w_apb3_wr      ),
    .apb2_rdata_i             (w_apb3_rdata   ),
    .apb2_wdata_o             (w_apb3_wdata   ),
    .apb2_rdy_i               (w_apb3_rdy     ),
    .apb2_strb_o              (w_apb3_strb    )
);


	wire           local_wren_w;
	wire [29:0]    local_addr_w;
	wire           local_rden_w;
	wire [31:0]    local_wdat_w;
	wire [31:0]    local_rdat_w;
	wire [3 :0]    local_strb_w;
    wire           local_rdat_vld_w;
    wire           local_wdat_rdy_w;


assign w_apb1_clk = w_clk10m;
assign w_apb2_clk = w_clk10m;
assign w_apb3_clk = w_clk10m;

assign w_apb1_rstn = w_clk10m_rst_n;
assign w_apb2_rstn = w_clk10m_rst_n;
assign w_apb3_rstn = w_clk10m_rst_n;	
	


apb2local u_apb2local
(

	.cfg_clk_i  (w_apb1_clk     ),
	.cfg_rstn_i (w_apb1_rstn    ),
	.cfg_addr_i (w_apb1_addr    ),
	.cfg_sel_i  (w_apb1_sel     ),
	.cfg_ena_i  (w_apb1_ena     ),
	.cfg_wr_i   (w_apb1_wr      ),
	.cfg_rdata_o(w_apb1_rdata   ),
	.cfg_wdata_i(w_apb1_wdata   ),
	.cfg_rdy_o  (w_apb1_rdy     ),
	.cfg_strb_i (w_apb1_strb    ),
	
	.local_wren_o(local_wren_w),
	.local_addr_o(local_addr_w),
	.local_strb_o(local_strb_w),
	.local_rden_o(local_rden_w),
	.local_wdat_o(local_wdat_w),
	.local_rdat_i(local_rdat_w),
	.local_rdat_vld_i(local_rdat_vld_w),
	.local_wdat_rdy_i(local_wdat_rdy_w)


);



local2reg u_local2reg
(

	.cfg_clk_i(w_apb1_clk),
	.cfg_rstn_i(w_apb1_rstn),
	.local_wren_i(local_wren_w),
	.local_addr_i(local_addr_w),
	.local_strb_i(4'hf),	
	.local_rden_i(local_rden_w),
	.local_wdat_i(local_wdat_w),
	.local_rdat_o(local_rdat_w),
	.local_rdat_vld_o(local_rdat_vld_w),
	.local_wdat_rdy_o(local_wdat_rdy_w),	
	
	
	.reg0x0000(reg0x0000),.reg0x0010(reg0x0010),.mon0x0080(mon0x0080),.mon0x0090(mon0x0090),
	.reg0x0001(reg0x0001),.reg0x0011(reg0x0011),.mon0x0081(mon0x0081),.mon0x0091(mon0x0091),
	.reg0x0002(reg0x0002),.reg0x0012(reg0x0012),.mon0x0082(mon0x0082),.mon0x0092(mon0x0092),
    .reg0x0003(reg0x0003),.reg0x0013(reg0x0013),.mon0x0083(mon0x0083),.mon0x0093(mon0x0093),
    .reg0x0004(reg0x0004),.reg0x0014(reg0x0014),.mon0x0084(mon0x0084),.mon0x0094(mon0x0094),
    .reg0x0005(reg0x0005),.reg0x0015(reg0x0015),.mon0x0085(mon0x0085),.mon0x0095(mon0x0095),
    .reg0x0006(reg0x0006),.reg0x0016(reg0x0016),.mon0x0086(mon0x0086),.mon0x0096(mon0x0096),
    .reg0x0007(reg0x0007),.reg0x0017(reg0x0017),.mon0x0087(mon0x0087),.mon0x0097(mon0x0097),
    .reg0x0008(reg0x0008),.reg0x0018(reg0x0018),.mon0x0088(mon0x0088),.mon0x0098(mon0x0098),
    .reg0x0009(reg0x0009),.reg0x0019(reg0x0019),.mon0x0089(mon0x0089),.mon0x0099(mon0x0099),
    .reg0x000A(reg0x000A),.reg0x001A(reg0x001A),.mon0x008A(mon0x008A),.mon0x009A(mon0x009A),
    .reg0x000B(reg0x000B),.reg0x001B(reg0x001B),.mon0x008B(mon0x008B),.mon0x009B(mon0x009B),
    .reg0x000C(reg0x000C),.reg0x001C(reg0x001C),.mon0x008C(mon0x008C),.mon0x009C(mon0x009C),
    .reg0x000D(reg0x000D),.reg0x001D(reg0x001D),.mon0x008D(mon0x008D),.mon0x009D(mon0x009D),
    .reg0x000E(reg0x000E),.reg0x001E(reg0x001E),.mon0x008E(mon0x008E),.mon0x009E(mon0x009E),
    .reg0x000F(reg0x000F),.reg0x001F(reg0x001F),.mon0x008F(mon0x008F),.mon0x009F(mon0x009F)   
	
	
	
);




///////////////////////////////////////以下是JESD204B的模块///////////////////////



wire                              tx_data_ready;
wire[3:0]                         tx_data_sof;
wire[3:0]                         tx_data_eof;
wire[3:0]                         tx_data_somf;
wire[3:0]                         tx_data_eomf;
reg [127:0]r_tx_data = 0;

wire rx_sync;
wire                        rx_data_valid;
wire[3:0]                   rx_data_sof;   
wire[3:0]                   rx_data_eof;  
wire[3:0]                   rx_data_somf; 
wire[3:0]                   rx_data_eomf; 
wire[127:0]                  rx_data;
wire[15:0]                  rx_data_err;


reg r1_key = 1;
reg r2_key = 1;

reg set_loop = 0;
reg pma_rstn = 0;
reg jesd_tx_rst = 0;
reg jesd_rx_rst = 0;
reg send_dds = 0;
reg [23:0]test_cnt = 0;
reg       test_start = 0;
always @(posedge w_clk10m or negedge w_clk10m_rst_n)
if(w_clk10m_rst_n == 0)
begin

    r1_key <= 1;
    r2_key <= 1;
end
else

begin
    r1_key <= i_key;
    r2_key <= r1_key;

    if(r2_key == 0 && r1_key == 1)
    begin
        test_start <= 1;
    end

            
    if(test_start)
        test_cnt <= (&test_cnt) ? test_cnt : test_cnt + 1;
    else
        test_cnt <= 0;

    
    set_loop    <= (test_cnt[23:21] > 0);
    pma_rstn    <= (test_cnt[23:21] > 1);
    jesd_tx_rst <= (test_cnt[23:21] > 2);
    jesd_rx_rst <= (test_cnt[23:21] > 3);
    send_dds    <= (test_cnt[23:21] > 4);

end





wire w_tx_sync/* synthesis syn_preserve = 1 */;
assign w_tx_sync = (reg0x0015[0] || set_loop) ? w_fpga_rx_sync : w_fpga_tx_sync;
//assign w_tx_sync = w_fpga_rx_sync;

reg [11:0]sysref_cnt = 0;
reg tx_sysref = 0;

wire [11:0]period;

assign period = 127;


always @(posedge w_sys_clk)
begin
    sysref_cnt <= sysref_cnt == period ? 0 :  sysref_cnt + 1;
    tx_sysref <= sysref_cnt == period ? ~tx_sysref : tx_sysref;
end

reg r1_fpga_sysref;
reg r2_fpga_sysref;
reg r3_fpga_sysref;
always @(posedge w_sys_clk)
begin
    r1_fpga_sysref <= (reg0x0015[0] || set_loop)? tx_sysref : w_fpga_sysref ;
    //r1_fpga_sysref <= tx_sysref;
    r2_fpga_sysref <= r1_fpga_sysref;
    r3_fpga_sysref <= r2_fpga_sysref;
end




    Serdes_Top Serdes_Top(
        .JESD204B_Top_tx_cfg_rdata_o(w_apb2_rdata), //output [31:0] JESD204B_Top_tx_cfg_rdata_o
        .JESD204B_Top_tx_cfg_rdy_o(w_apb2_rdy), //output JESD204B_Top_tx_cfg_rdy_o
        .JESD204B_Top_tx_data_ready_o(tx_data_ready), //output JESD204B_Top_tx_data_ready_o
        .JESD204B_Top_tx_data_sof_o(tx_data_sof), //output [3:0] JESD204B_Top_tx_data_sof_o
        .JESD204B_Top_tx_data_eof_o(tx_data_eof), //output [3:0] JESD204B_Top_tx_data_eof_o
        .JESD204B_Top_tx_data_somf_o(tx_data_somf), //output [3:0] JESD204B_Top_tx_data_somf_o
        .JESD204B_Top_tx_data_eomf_o(tx_data_eomf), //output [3:0] JESD204B_Top_tx_data_eomf_o
        .JESD204B_Top_tx_debug_o(), //output [71:0] JESD204B_Top_tx_debug_o
        .JESD204B_Top_gt_pcs_tx_clk_o(w_sys_clk), //output JESD204B_Top_gt_pcs_tx_clk_o
        .JESD204B_Top_gt_tx_fifo_wrusewd_o(), //output [9:0] JESD204B_Top_gt_tx_fifo_wrusewd_o
        .JESD204B_Top_rx_cfg_rdata_o(w_apb3_rdata), //output [31:0] JESD204B_Top_rx_cfg_rdata_o
        .JESD204B_Top_rx_cfg_rdy_o(w_apb3_rdy), //output JESD204B_Top_rx_cfg_rdy_o
        .JESD204B_Top_rx_sync_o(w_fpga_rx_sync), //output JESD204B_Top_rx_sync_o
        .JESD204B_Top_rx_data_valid_o(rx_data_valid), //output JESD204B_Top_rx_data_valid_o
        .JESD204B_Top_rx_data_sof_o(rx_data_sof), //output [3:0] JESD204B_Top_rx_data_sof_o
        .JESD204B_Top_rx_data_eof_o(rx_data_eof), //output [3:0] JESD204B_Top_rx_data_eof_o
        .JESD204B_Top_rx_data_somf_o(rx_data_somf), //output [3:0] JESD204B_Top_rx_data_somf_o
        .JESD204B_Top_rx_data_eomf_o(rx_data_eomf), //output [3:0] JESD204B_Top_rx_data_eomf_o
        .JESD204B_Top_rx_data_o(rx_data), //output [63:0] JESD204B_Top_rx_data_o
        .JESD204B_Top_rx_data_err_o(rx_data_err), //output [7:0] JESD204B_Top_rx_data_err_o
        .JESD204B_Top_rx_debug_o(), //output [87:0] JESD204B_Top_rx_debug_o
        .JESD204B_Top_gt_rx_k_lock_o(mon0x0093[11:08]), //output [1:0] JESD204B_Top_gt_rx_k_lock_o
        .JESD204B_Top_gt_rx_align_link_o(mon0x0093[03:00]), //output [1:0] JESD204B_Top_gt_rx_align_link_o
        .JESD204B_Top_gt_rx_fifo_rdusewd_o(), //output [9:0] JESD204B_Top_gt_rx_fifo_rdusewd_o
        .JESD204B_Top_gt_pcs_rx_clk_o(), //output JESD204B_Top_gt_pcs_rx_clk_o
        .JESD204B_Top_gt_pma_rx_lock_o(mon0x0094[3:0]), //output [1:0] JESD204B_Top_gt_pma_rx_lock_o
        .JESD204B_Top_gt_q1_qpll1_ok_o(mon0x0092[3]), //output JESD204B_Top_gt_q0_qpll1_ok_o
        .JESD204B_Top_gt_cpll_ok_o(), //output [1:0] JESD204B_Top_gt_cpll_ok_o
        .JESD204B_Top_tx_rst_i((~jesd_tx_rst) & (~reg0x0013[0])), //input JESD204B_Top_tx_rst_i
        .JESD204B_Top_tx_core_clk_i(w_sys_clk), //input JESD204B_Top_tx_core_clk_i
        .JESD204B_Top_tx_cfg_clk_i(w_apb2_clk), //input JESD204B_Top_tx_cfg_clk_i
        .JESD204B_Top_tx_cfg_rstn_i(w_apb2_rstn), //input JESD204B_Top_tx_cfg_rstn_i
        .JESD204B_Top_tx_cfg_addr_i(w_apb2_addr), //input [31:0] JESD204B_Top_tx_cfg_addr_i
        .JESD204B_Top_tx_cfg_sel_i(w_apb2_sel), //input JESD204B_Top_tx_cfg_sel_i
        .JESD204B_Top_tx_cfg_ena_i(w_apb2_ena), //input JESD204B_Top_tx_cfg_ena_i
        .JESD204B_Top_tx_cfg_wr_i(w_apb2_wr), //input JESD204B_Top_tx_cfg_wr_i
        .JESD204B_Top_tx_cfg_wdata_i(w_apb2_wdata), //input [31:0] JESD204B_Top_tx_cfg_wdata_i
        .JESD204B_Top_tx_cfg_strb_i(w_apb2_strb), //input [3:0] JESD204B_Top_tx_cfg_strb_i
        .JESD204B_Top_tx_sysref_i(r3_fpga_sysref), //input JESD204B_Top_tx_sysref_i
        .JESD204B_Top_tx_sync_i(w_tx_sync), //input JESD204B_Top_tx_sync_i
        .JESD204B_Top_tx_data_i(r_tx_data), //input [63:0] JESD204B_Top_tx_data_i
        .JESD204B_Top_gt_pcs_tx_rst_i(reg0x0011[0]), //input JESD204B_Top_gt_pcs_tx_rst_i
        .JESD204B_Top_rx_rst_i((~jesd_rx_rst) & (~reg0x0014[0])), //input JESD204B_Top_rx_rst_i
        .JESD204B_Top_rx_core_clk_i(w_sys_clk), //input JESD204B_Top_rx_core_clk_i
        .JESD204B_Top_rx_cfg_clk_i(w_apb3_clk), //input JESD204B_Top_rx_cfg_clk_i
        .JESD204B_Top_rx_cfg_rstn_i(w_apb3_rstn), //input JESD204B_Top_rx_cfg_rstn_i
        .JESD204B_Top_rx_cfg_addr_i(w_apb3_addr), //input [31:0] JESD204B_Top_rx_cfg_addr_i
        .JESD204B_Top_rx_cfg_sel_i(w_apb3_sel), //input JESD204B_Top_rx_cfg_sel_i
        .JESD204B_Top_rx_cfg_ena_i(w_apb3_ena), //input JESD204B_Top_rx_cfg_ena_i
        .JESD204B_Top_rx_cfg_wr_i(w_apb3_wr), //input JESD204B_Top_rx_cfg_wr_i
        .JESD204B_Top_rx_cfg_wdata_i(w_apb3_wdata), //input [31:0] JESD204B_Top_rx_cfg_wdata_i
        .JESD204B_Top_rx_cfg_strb_i(w_apb3_strb), //input [3:0] JESD204B_Top_rx_cfg_strb_i
        .JESD204B_Top_rx_sysref_i(r3_fpga_sysref), //input JESD204B_Top_rx_sysref_i
        .JESD204B_Top_gt_pcs_rx_rst_i(reg0x0012[0]), //input JESD204B_Top_gt_pcs_rx_rst_i
        .JESD204B_Top_gt_fabric_rstn_i(pma_rstn | reg0x0010[0]) //input JESD204B_Top_gt_fabric_rstn_i
    );


assign mon0x0090[0] = w_tx_sync;
assign mon0x0090[1] = tx_data_ready;
assign mon0x0091[0] = w_fpga_rx_sync;
assign mon0x0091[1] = rx_data_valid;



assign o_led1 = w_tx_sync;
assign o_led2 = tx_data_ready;
assign o_led3 = w_fpga_rx_sync;
assign o_led4 = rx_data_valid;


////////////////////////////////////////////////////////////////////////////////////////////////





wire [15:0]w_ant1_idata/* synthesis syn_preserve = 1 */;
wire [15:0]w_ant1_qdata/* synthesis syn_preserve = 1 */;

wire [15:0]w_ant2_idata/* synthesis syn_preserve = 1 */;
wire [15:0]w_ant2_qdata/* synthesis syn_preserve = 1 */;



assign w_ant1_idata = {rx_data[7 : 0],rx_data[15: 8]};
assign w_ant1_qdata = {rx_data[23:16],rx_data[31:24]};

assign w_ant2_idata = {rx_data[32+7 : 32+0],rx_data[32+15: 32+8]};
assign w_ant2_qdata = {rx_data[32+23:32+16],rx_data[32+31:32+24]};



reg [15:0]r1_ant1_idata/* synthesis syn_preserve = 1 */;
reg [15:0]r1_ant1_qdata/* synthesis syn_preserve = 1 */;
reg [15:0]r1_ant2_idata/* synthesis syn_preserve = 1 */;
reg [15:0]r1_ant2_qdata/* synthesis syn_preserve = 1 */;
reg [15:0]r2_ant1_idata/* synthesis syn_preserve = 1 */;
reg [15:0]r2_ant1_qdata/* synthesis syn_preserve = 1 */;
reg [15:0]r2_ant2_idata/* synthesis syn_preserve = 1 */;
reg [15:0]r2_ant2_qdata/* synthesis syn_preserve = 1 */;




reg [15:0]nco_dataout1 = 0/* synthesis syn_preserve = 1 */;
reg [15:0]r_ant1_cosdata/* synthesis syn_preserve = 1 */;
reg [15:0]r_ant1_sindata/* synthesis syn_preserve = 1 */;
reg [15:0]r_ant2_cosdata/* synthesis syn_preserve = 1 */;
reg [15:0]r_ant2_sindata/* synthesis syn_preserve = 1 */;


wire [15:0]cosdata1/* synthesis syn_preserve = 1 */;
wire [15:0]sindata1/* synthesis syn_preserve = 1 */;


always @(posedge w_sys_clk)
begin
     nco_dataout1 <= nco_dataout1 + 1067;   //2MHz
end

cos_sin_table cos_sin_table_inst1
     (
      .mclk(w_sys_clk),
      .addr(nco_dataout1[15 : 6]),
      .dout_cos(cosdata1),
      .dout_sin(sindata1)
      );


always @(posedge w_sys_clk)
begin
     r_ant1_cosdata <= cosdata1;   
     r_ant1_sindata <= sindata1;   
     r_ant2_cosdata <= cosdata1;   
     r_ant2_sindata <= sindata1;   


end

always @(posedge w_sys_clk)
begin
    r1_ant1_idata <= (reg0x0016[0] || (send_dds))? r_ant1_cosdata : w_ant1_idata ;
    r1_ant1_qdata <= (reg0x0016[0] || (send_dds))? r_ant1_sindata : w_ant1_qdata ;
    r1_ant2_idata <= (reg0x0016[0] || (send_dds))? r_ant2_cosdata : w_ant2_idata ;
    r1_ant2_qdata <= (reg0x0016[0] || (send_dds))? r_ant2_sindata : w_ant2_qdata ;

    r2_ant1_idata <= r1_ant1_idata;
    r2_ant1_qdata <= r1_ant1_qdata;
    r2_ant2_idata <= r1_ant2_idata;
    r2_ant2_qdata <= r1_ant2_qdata;

end


always @(posedge w_sys_clk)
begin
    r_tx_data[31: 0] <= {r2_ant1_qdata[7:0],r2_ant1_qdata[15:8],r2_ant1_idata[7:0],r2_ant1_idata[15:8]};
    r_tx_data[63:32] <= {r2_ant2_qdata[7:0],r2_ant2_qdata[15:8],r2_ant2_idata[7:0],r2_ant2_idata[15:8]};
end








assign mon0x008A = 32'h20230406;
assign mon0x008B = 32'h00000048;




endmodule






