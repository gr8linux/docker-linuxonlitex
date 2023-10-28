module reg_if(
    input   hclk,
    input   rstn,
    output reg cpu_cs,
    output reg cpu_read,
    output reg cpu_write,
    output reg [31:0] cpu_addr,
    output reg [31:0] cpu_wdat,
    input [31:0] cpu_rdat,
    input cpu_ack,
    input cpu_err,

    input   rd_config_en,	
    input   send_en,
    input   rcv_en
);

assign t_htrans = 2'b10;
assign t_hsize = 3'b010;
assign t_hready_in = 1'b1;

reg [2:0] c_state,n_state;
localparam s_idle = 3'd0;
localparam s_config = 3'd1;
localparam s_send = 3'd2;
localparam s_rcv = 3'd3;
localparam s_rd_config = 3'd4;

reg [4:0] cnt;
reg [11:0] start_cnt;
reg start_config;

parameter BRP_addr = 32'h0008;
parameter BRP_data = 32'h4;

parameter BTN_addr = 32'h000c;
parameter BTN_data = {3'b0,5'h4,10'h0,8'h2c,6'h4};

parameter BTD_addr = 32'h0010;
parameter BTD_data = {3'b0,5'h4,10'h0,8'h2c,6'h4};

parameter TBUF_addr = 32'h0044;
parameter TBUF_data = 32'h007f0056;

parameter RBUF_addr = 32'h0040;
parameter RBUF_data = 32'h002a0000;

parameter HTBUF_addr = 32'h0048;
parameter HTBUF_data = 32'h0055002b;

parameter IE_addr = 32'h0024;
parameter IE_data = 32'h1;

parameter AF_addr = 32'h0100;
parameter AF_data = 32'h80000000;

parameter AF1_addr = 32'h0104;
parameter AF1_data = 32'hc0000000;

parameter AF2_addr = 32'h0108;
parameter AF2_data = 32'ha0000000;

parameter CMD_addr = 32'h0004;
parameter CMD_data = 32'h1;

parameter IDE = 1'b0;
parameter RTR = 1'b0;
parameter EDL = 1'b0;
parameter BID = 11'b10110111110;
parameter IE = 18'd201;
parameter SEND_DATA_addr = 32'h0204;
parameter BRS = 1'b0;
parameter RSVD = 24'h000000;
parameter NUMBYTES = 7'd8;
wire [31:0] txhdr1, txhdr2;
assign txhdr1 = {IDE,RTR,EDL,BID,IE};
assign txhdr2 = {BRS,RSVD,NUMBYTES};
wire [31:0] send_data1,send_data2;
assign send_data1 = 32'b11100011100011100011100010101101;
assign send_data2 = 32'b11011011011011011011011011011010;
parameter RCV_DATA_addr = 32'h0200;
parameter send_const = 4;
parameter rcv_const = 1;
parameter rd_config_const = 4;
parameter config_const = 11;

reg user_rd_vld;
reg [31:0] user_rd_data;


always@(posedge hclk or negedge rstn) begin
    if (!rstn) begin    
        start_cnt <= 12'd0;
    end
    else begin
        if (start_cnt < 12'hfff) begin
            start_cnt <= start_cnt + 1;
        end
    end
end

always@(posedge hclk or negedge rstn) begin
    if (!rstn) begin   
        start_config <= 1'b0;
    end
    else begin
        start_config <= start_cnt == 12'hffe;
    end
end

always@(posedge hclk or negedge rstn) begin
    if (!rstn) begin
        c_state <= s_idle;
    end
    else begin
        c_state <= n_state;
    end
end

always@(*) begin
    n_state = c_state;
    case(c_state)
    s_idle:
        if(start_config) n_state = s_config;
        else if (send_en) n_state = s_send;
        else if (rcv_en) n_state = s_rcv;
        else if (rd_config_en) n_state = s_rd_config;
    s_config:
        if (cnt == config_const-1 && cpu_ack) n_state =s_idle;
    s_send:
        if (cnt == send_const-1 && cpu_ack) n_state =s_idle;
    s_rcv:
        if (cnt == rcv_const-1 && cpu_ack) n_state =s_idle;  
    s_rd_config:
        if (cnt == rd_config_const-1 && cpu_ack) n_state =s_idle;  
    default:
        n_state = s_idle;
    endcase
end

always@(posedge hclk or negedge rstn) begin
    if (!rstn) begin
        cpu_write <= 1'b0;
    end
    else begin
	    if (cpu_ack) begin
            cpu_write <= 1'b0;
        end			
        else if ((c_state == s_config) || (c_state == s_send)) begin
                 cpu_write <= 1'b1;
        end
    end
end

always@(posedge hclk or negedge rstn) begin
    if (!rstn) begin
        cpu_read <= 1'b0;		
    end
    else begin
	    if (cpu_ack) begin		
            cpu_read <= 1'b0;
        end			
        else if ((c_state == s_rcv) || (c_state == s_rd_config)) begin	
                 cpu_read <= 1'b1;
        end
    end
end


always@(posedge hclk or negedge rstn) begin
    if (!rstn) begin
        cpu_cs <= 1'b0;		
    end
    else begin
	    if (cpu_ack) begin		
            cpu_cs <= 1'b0;
        end			
        else if ((c_state == s_config) || (c_state == s_send) || (c_state == s_rcv) || (c_state == s_rd_config)) begin	
                 cpu_cs <= 1'b1;
        end
    end
end

always@(posedge hclk or negedge rstn) begin
    if (!rstn) begin
        cnt <= 0;
    end
    else begin
        if (c_state == s_idle) begin
            cnt <= 0;
        end
        else begin
            if (cpu_ack) begin
                cnt <= cnt + 1;
            end
        end
    end
end

always@(*) begin
    if (c_state == s_config) begin
        if (cnt == 0) begin
            cpu_addr = BRP_addr;
            cpu_wdat = BRP_data;
        end
        else if (cnt == 1) begin
            cpu_addr = BTN_addr;
            cpu_wdat = BTN_data;
        end
        else if (cnt == 2) begin
            cpu_addr = BTD_addr;
            cpu_wdat = BTD_data;
        end
        else if (cnt == 3) begin
            cpu_addr = TBUF_addr;
            cpu_wdat = TBUF_data;
        end
        else if (cnt == 4) begin
            cpu_addr = RBUF_addr;
            cpu_wdat = RBUF_data;
        end
        else if (cnt == 5) begin
            cpu_addr = HTBUF_addr;
            cpu_wdat = HTBUF_data;
        end
        else if (cnt == 6) begin
            cpu_addr = IE_addr;
            cpu_wdat = IE_data;
        end
        else if (cnt == 7) begin
            cpu_addr = AF_addr;
            cpu_wdat = AF_data;
        end
        else if (cnt == 8) begin
            cpu_addr = AF1_addr;
            cpu_wdat = AF1_data;
        end
        else if (cnt == 9) begin
            cpu_addr = AF2_addr;
            cpu_wdat = AF2_data;
        end
        else if (cnt == 10) begin
            cpu_addr = CMD_addr;
            cpu_wdat = CMD_data;
        end
        else begin
            cpu_addr = 0;
            cpu_wdat = 0;
        end
    end
    else if (c_state == s_send) begin
        cpu_addr = SEND_DATA_addr;
        if (cnt == 0) begin
            cpu_wdat = txhdr1;
        end
        else if (cnt == 1) begin
            cpu_wdat = txhdr2;
        end
        else if (cnt == 2) begin
            cpu_wdat = send_data1;
        end
        else if (cnt == 3) begin
            cpu_wdat = send_data2;
        end
        else begin
            cpu_wdat = 0;
        end
    end
    else if (c_state == s_rcv) begin
        cpu_addr = RCV_DATA_addr;
        cpu_wdat = 0;
    end
    else if (c_state == s_rd_config) begin
        cpu_wdat = 0;
        if (cnt == 0) begin
            cpu_addr = 32'h44;
        end
        else if (cnt == 1) begin
            cpu_addr = 32'h48;
        end
        else if (cnt == 2) begin
            cpu_addr = 32'h40;
        end
        else if (cnt == 3) begin
            cpu_addr = 32'h20c;
        end
        else begin
            cpu_addr = 32'h0;
        end
    end
    else begin
        cpu_addr = 0;
        cpu_wdat = 0;
    end
end

always@(posedge hclk or negedge rstn) begin
    if (!rstn) begin
        user_rd_vld <= 1'b0;
        user_rd_data <= 32'd0;
    end
    else begin
        if (c_state == s_rcv & cpu_ack) begin
            user_rd_vld <= 1'b1;
            user_rd_data <= cpu_rdat;
        end
        else begin
            user_rd_vld <= 1'b0;
        end
    end
end

endmodule
