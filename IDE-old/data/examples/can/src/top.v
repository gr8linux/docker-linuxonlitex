module top(
    input send_en_button,
    input rcv_en_button,
    input rd_config_button,
    input sysclk,
    input cbus_rxd,
    input rstn,
    output cbus_txd,
    output canc_interrupt, 
    output send_en,
    output capture,
    output reg cpu_ack_o,
    output reg cpu_cs_o,
    output reg cpu_read_o,
    output reg [31:0] cpu_rdat_o
    
);

wire send_en_out, rcv_en_out,rd_config_en_out; 
wire canclk;

deUstb uut_deUstb(.out(send_en_out),
                  .in(send_en_button),
                  .clk(sysclk),
                  .rstn(ponrst_n));

deUstb uut_deUstb1(.out(rcv_en_out),
                   .in(rcv_en_button),
                   .clk(sysclk),
                   .rstn(ponrst_n));
                                    
deUstb uut_deUstb2(.out(rd_config_en_out),
                   .in(rd_config_button),
                   .clk(sysclk),
                   .rstn(ponrst_n));

GW_PLL uut_GW_PLL
    (.clkin(sysclk),
     .clkout(canclk)
    );

assign ponrst_n = rstn;



reg send_en_d1,rcv_en_d1,rd_config_en_d1;

wire cpu_cs;
wire cpu_read;
wire cpu_write;
wire [31:0] cpu_addr;
wire [31:0] cpu_wdat;
wire [31:0] cpu_rdat;
wire cpu_ack;
wire cpu_err;


always@(posedge sysclk) begin
    send_en_d1 <= send_en_out;
    rcv_en_d1 <= rcv_en_out;
    rd_config_en_d1 <= rd_config_en_out;
end

assign send_en = send_en_out&&!send_en_d1;
assign rcv_en = rcv_en_out&&!rcv_en_d1;
assign rd_config_en = rd_config_en_out && !rd_config_en_d1;

can_top u_can_top(
	.sysclk(sysclk),
	.canclk(canclk),
	.ponrst_n(ponrst_n),
	.cfgstrp_clkdiv(8'd10),
	.cbus_rxd(cbus_rxd),
    .cbus_txd(cbus_txd),
	.cpu_cs(cpu_cs),
	.cpu_read(cpu_read),
	.cpu_write(cpu_write),
	.cpu_addr(cpu_addr),
	.cpu_wdat(cpu_wdat),
	.cpu_rdat(cpu_rdat),
	.cpu_ack(cpu_ack),
	.cpu_err(cpu_err),
    .int_o(canc_interrupt)
    );

reg_if u_reg_if(
    .hclk(sysclk),
    .rstn(ponrst_n),
    .cpu_cs(cpu_cs),
    .cpu_read(cpu_read),
    .cpu_write(cpu_write),
    .cpu_addr(cpu_addr),
    .cpu_wdat(cpu_wdat),
    .cpu_rdat(cpu_rdat),
    .cpu_ack(cpu_ack),
    .cpu_err(cpu_err),   
    .send_en(send_en),
    .rcv_en(rcv_en),
    .rd_config_en(rd_config_en)
);

reg cpu_write_o;
reg [31:0] cpu_addr_o;
reg [31:0] cpu_wdat_o;
reg cpu_err_o;
reg [2:0] c_state_o;
reg [4:0] cnt_o;

always@(posedge sysclk) begin
    cpu_cs_o <= cpu_cs;
    cpu_read_o <= cpu_read;
    cpu_write_o <= cpu_write;
    cpu_addr_o <= cpu_addr;
    cpu_wdat_o <= cpu_wdat;
    cpu_rdat_o <= cpu_rdat;
    cpu_ack_o <= cpu_ack;
    cpu_err_o <= cpu_err;
    c_state_o <= u_reg_if.c_state;
    cnt_o <= u_reg_if.cnt;
end

assign capture = (^cpu_cs_o) ^ (cpu_read_o) ^ (cpu_write_o) ^ (^cpu_addr_o) ^ (^cpu_wdat_o) ^ (^cpu_rdat_o) ^ (cpu_ack_o) ^ (cpu_err_o) ^ (^c_state_o) ^ (^cnt_o);

endmodule
