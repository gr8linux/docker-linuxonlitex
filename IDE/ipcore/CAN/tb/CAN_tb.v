
`timescale 1ns/1ps
`include "define.vh"
module tb;
 reg sysclk;
 reg canclk;
 reg ponrst_n;
 reg [7:0] cfgstrp_clkdiv;
 reg send,send1;
 reg rec,rec1;
 wire cbus_t0;
 wire cbus_t1;
 wand c;
assign c=cbus_t0;
assign c=cbus_t1;

top top_uut(
 .sysclk(sysclk),
 .canclk(canclk),
 .ponrst_n(ponrst_n),
 .cfgstrp_clkdiv(cfgstrp_clkdiv),
 .send(send),
 .rec(rec),
 .cbus_rxd(c),
 .cbus_txd(cbus_t0)
);
top top_uut1(
 .sysclk(sysclk),
 .canclk(canclk),
 .ponrst_n(ponrst_n),
 .cfgstrp_clkdiv(cfgstrp_clkdiv),
 .send(send1),
 .rec(rec1),
 .cbus_rxd(c),
 .cbus_txd(cbus_t1)
);


initial begin
 cfgstrp_clkdiv=8'd10;
end

initial begin
 sysclk=0;
 forever #5 sysclk=~sysclk;
end
initial begin
 canclk=0;
 forever #50 canclk=~canclk;
end

initial begin
 ponrst_n=0;
 #60000 ponrst_n=1;
end

initial begin
 send=0;
 send1=0;
 #150000 send=1;
 #165 send=0;
end
initial begin
 rec=0;
 rec1=0;
 #1500000 rec1=1;
 #245 rec1=0;
end
initial begin
 #2000000 $finish;
end
initial begin
 $fsdbDumpfile("can_tb_verdi.fsdb");
 $fsdbDumpvars;
end
endmodule
`ifdef AHB
module top(
sysclk,
canclk,
ponrst_n,
cfgstrp_clkdiv,
send,
rec,
cbus_rxd,
cbus_txd
);

input sysclk,canclk,ponrst_n;
input [7:0]cfgstrp_clkdiv;
input send,rec;
input cbus_rxd;
output cbus_txd;

wire canclk;
wire t_hsel;
wire t_hwrite;
wire [31:0] t_haddr;
wire [31:0] t_hwdata;
wire [31:0] t_hrdata;
wire [2:0] t_hsize;
wire [1:0] t_htrans;
wire [1:0] t_hresp;
wire t_hready;
wire int_o;

`module_name can_uut(
 .sysclk(sysclk),
 .canclk(canclk),
 .ponrst_n(ponrst_n),
 .cfgstrp_clkdiv(cfgstrp_clkdiv),
 .cbus_rxd(cbus_rxd),
 .cbus_txd(cbus_txd),
 .t_hsel(t_hsel),
 .t_hsize(t_hsize),
 .t_htrans(t_htrans),
 .t_hresp(t_hresp),
 .t_hready_in(t_hready_in),
 .t_hwrite(t_hwrite),
 .t_haddr(t_haddr),
 .t_hwdata(t_hwdata),
 .t_hrdata(t_hrdata),
 .t_hready(t_hready),
 .int_o(int_o)
);
 
ahb ahb_uut(
 .sysclk(sysclk),
 .ponrst_n(ponrst_n),
 .send(send),
 .rec(rec),
 .t_hsel(t_hsel),
 .t_hsize(t_hsize),
 .t_htrans(t_htrans),
 .t_hready(t_hready),
 .t_haddr(t_haddr),
 .t_hwdata(t_hwdata),
 .t_hrdata(t_hrdata),
 .t_hwrite(t_hwrite),
 .t_hready_in(t_hready_in)
);
endmodule
module ahb(
sysclk,
ponrst_n,
send,
rec,
t_hsel,
t_hrdata,
t_hready,
t_haddr,
t_hwdata,
t_hwrite,
t_hsize,
t_htrans,
t_hready_in
);

input sysclk;
input ponrst_n;
input t_hready;
input send;
input rec;
input [31:0] t_hrdata;
output reg t_hsel;
output reg [31:0] t_haddr;
output reg [31:0] t_hwdata;
output reg t_hwrite;
output [2:0] t_hsize;
output [1:0] t_htrans;
output t_hready_in;

assign t_hsize=3'b010;
assign t_htrans=2'b10;
assign t_hready_in=1'b1;
reg [1:0]cs;
reg [1:0]ns;
parameter idle=2'b00;
parameter send_s=2'b01;
parameter rec_s=2'b10;
parameter ini_s=2'b11;

wire [31:0] txhdr2;
wire [31:0] txhdr1;
wire [31:0]send_data1;
wire [31:0]send_data2;
parameter IDE=1'b0;
parameter RTR=1'b0;
parameter EDL=1'b0;
parameter BID=11'b10101010101;
parameter IE=18'b0;
parameter BRS=0;
parameter RSVD=24'b0;
parameter NUMBYTES=7'd8;
assign txhdr1={IDE,RTR,EDL,BID,IE};
assign txhdr2={BRS,RSVD,NUMBYTES};
assign send_data1=32'h7c01a579;
assign send_data2=32'h88888888;


parameter brp_addr=32'h0008;
parameter btn_addr=32'h000c;
parameter btd_addr=32'h0010;
parameter rb_addr=32'h0040;
parameter tb_addr=32'h0044;
parameter thb_addr=32'h0048;
parameter ie_addr=32'h0024;
parameter af1_addr=32'h0100;
parameter af2_addr=32'h0104;
parameter cmd_addr=32'h0004;

parameter brp_data=32'h000a;
parameter btn_data={3'b0,5'b00001,10'b0,6'd4,2'b0,6'd4};
parameter btd_data={3'b0,5'b00001,10'b0,6'd4,2'b0,6'd4};
parameter rb_data=32'h00030000;
parameter thb_data=32'h000f0008;
parameter tb_data=32'h00070004;
parameter ie_data=32'h1;
parameter af1_data=32'h80000000;
parameter af2_data=32'ha0000000;
parameter cmd_data=1;

parameter brp=4'd1;
parameter btn=4'd2;
parameter btd=4'd3;
parameter rb=4'd4;
parameter tb=4'd5;
parameter thb=4'd6;
parameter ie=4'd7;
parameter af1=4'd8;
parameter af2=4'd9;
parameter cmd=4'd10;

reg [3:0] start_cnt;
reg [11:0] ini_cnt;
reg [2:0] cnt;

always @(posedge sysclk or negedge ponrst_n) begin
if(!ponrst_n) t_hsel<=0;
else if(t_hsel==1) t_hsel<=0;
else if(t_hready && cs!=idle && ns!=idle) t_hsel<=1;
else t_hsel<=0;
end

always @(posedge sysclk or negedge ponrst_n) begin
if(!ponrst_n) t_hwrite<=0;
else if(t_hwrite==1 || ns==idle) t_hwrite<=0;
else if(t_hready && (cs==ini_s || cs==send_s) && t_hwrite==0) t_hwrite<=1;
else t_hwrite<=0;
end

always @(posedge sysclk or negedge ponrst_n) begin
 if(!ponrst_n) ini_cnt<=0;
 else if(ini_cnt<12'd3500) ini_cnt<=ini_cnt+1;
 else ini_cnt<=ini_cnt;
end

always @(posedge sysclk or negedge ponrst_n) begin
 if(!ponrst_n) start_cnt<=0;
 else if(t_hsel==0 && start_cnt<4'd11 && cs==ini_s && t_hready==1) start_cnt<=start_cnt+1;
 else start_cnt<=start_cnt;
end

assign ini_done=(start_cnt>=4'd11) ? 1'b1:1'b0;

always @(posedge sysclk or negedge ponrst_n)begin
 if(!ponrst_n) cnt<=0;
 else if((cs==send_s || cs==rec_s) && t_hready==1 && t_hsel==0) cnt<=cnt+1;
 else if(cs==idle) cnt<=0;
 else cnt<=cnt;
end

always @(posedge sysclk or negedge ponrst_n) begin
 if(!ponrst_n) cs<=idle;
 else cs<=ns;
end

always @(*) begin
 case(cs)
  idle: begin
   if(start_cnt<4'd11 && ini_cnt>=12'd3500) ns=ini_s;
   else if(send==1 && ini_done==1) ns=send_s;
   else if (rec==1 && ini_done==1) ns=rec_s;
   else ns=idle;
  end
  ini_s: begin
   if(start_cnt>=10 && t_hready==1 && t_hsel==0) ns=idle;
   else ns=ini_s;
  end
  send_s: begin
   if(cnt==4 && t_hready==1 && t_hsel==0) ns=idle;
   else ns=send_s;
  end
  rec_s: begin
   if(t_hready==1 && t_hsel==0 && cnt==4) ns=idle;
   else ns=rec_s;
  end
 endcase
end

always @(*) begin
 case(cs)
  idle: begin
   t_hwrite=0;
   t_hwdata=0;
   t_haddr=0;
  end
  ini_s: begin
   case(start_cnt)
    brp:begin
     t_haddr=brp_addr;
     t_hwdata=brp_data;
    end
    btn:begin
     t_haddr=btn_addr;
     t_hwdata=btn_data;
    end
    btd:begin
     t_haddr=btd_addr;
     t_hwdata=btd_data;
    end
    rb:begin
     t_haddr=rb_addr;
     t_hwdata=rb_data;
    end
    tb:begin
     t_haddr=tb_addr;
     t_hwdata=tb_data;
    end
    thb:begin
     t_haddr=thb_addr;
     t_hwdata=thb_data;
    end
    ie:begin
     t_haddr=ie_addr;
     t_hwdata=ie_data;
    end
    af1:begin
     t_haddr=af1_addr;
     t_hwdata=af1_data;
    end
    af2:begin
     t_haddr=af2_addr;
     t_hwdata=af2_data;
    end
    cmd:begin
     t_haddr=cmd_addr;
     t_hwdata=cmd_data;
    end
    default:begin 
     t_haddr=0;
     t_hwdata=0;
    end
   endcase
 end
 send_s: begin
  t_haddr=32'h0204;
  case(cnt)
   1: t_hwdata=txhdr1;
   2: t_hwdata=txhdr2;
   3: t_hwdata=send_data1;
   4: begin 
    t_hwdata=send_data2;
   end
   default: begin
    t_hwdata=0;
   end
  endcase 
 end
 rec_s: begin
  if(cnt<=4)
  t_haddr=32'h0200;
  else
  t_haddr=0;
  t_hwdata=0;
 end
 endcase
end
endmodule
`endif
`ifdef APB
module top(
sysclk,
canclk,
ponrst_n,
cfgstrp_clkdiv,
send,
rec,
cbus_rxd,
cbus_txd
);
input sysclk;
input canclk;
input ponrst_n;
input [7:0]cfgstrp_clkdiv;
input send;
input rec;
input cbus_rxd;

output cbus_txd;
wire int_o;
wire [31:0]PADDR;
wire [31:0]PWDATA;
wire PSEL;
wire PWRITE;
wire PENABLE;
wire [31:0]PRDATA;
wire PREADY;
wire PSLVERR;
`module_name can_uut(
 .sysclk(sysclk),
 .canclk(canclk),
 .ponrst_n(ponrst_n),
 .cfgstrp_clkdiv(cfgstrp_clkdiv),
 .cbus_rxd(cbus_rxd),
 .PADDR(PADDR),
 .PWDATA(PWDATA),
 .PSEL(PSEL),
 .PWRITE(PWRITE),
 .PENABLE(PENABLE),
 .cbus_txd(cbus_txd),
 .PRDATA(PRDATA),
 .PREADY(PREADY),
 .PSLVERR(PSLVERR),
 .int_o(int_o)
);

apb apb_uut(
 .sysclk(sysclk),
 .ponrst_n(ponrst_n),
 .PREADY(PREADY),
 .send(send),
 .rec(rec),
 .PADDR(PADDR),
 .PWRITE(PWRITE),
 .PSEL(PSEL),
 .PRDATA(PRDATA),
 .PENABLE(PENABLE),
 .PWDATA(PWDATA)
);

endmodule

module apb(
sysclk,
ponrst_n,
PREADY,
send,
rec,
PADDR,
PRDATA,
PWRITE,
PSEL,
PENABLE,
PWDATA
);

input sysclk;
input ponrst_n;
input PREADY;
input [31:0]PRDATA;
input send,rec;

output reg [31:0] PADDR;
output PWRITE;
output PSEL;
output reg PENABLE;
output reg [31:0] PWDATA;

reg [1:0]cs;
reg [1:0]ns;
parameter idle=2'b00;
parameter send_s=2'b01;
parameter rec_s=2'b10;
parameter ini_s=2'b11;

wire [31:0] txhdr2;
wire [31:0] txhdr1;
wire [31:0]send_data1;
wire [31:0]send_data2;
parameter IDE=1'b0;
parameter RTR=1'b0;
parameter EDL=1'b0;
parameter BID=11'b10101010101;
parameter IE=18'b0;
parameter BRS=0;
parameter RSVD=24'b0;
parameter NUMBYTES=7'd8;
assign txhdr1={IDE,RTR,EDL,BID,IE};
assign txhdr2={BRS,RSVD,NUMBYTES};
assign send_data1=32'h7c01a579;
assign send_data2=32'h88888888;


parameter brp_addr=32'h0008;
parameter btn_addr=32'h000c;
parameter btd_addr=32'h0010;
parameter rb_addr=32'h0040;
parameter tb_addr=32'h0044;
parameter thb_addr=32'h0048;
parameter ie_addr=32'h0024;
parameter af1_addr=32'h0100;
parameter af2_addr=32'h0104;
parameter cmd_addr=32'h0004;

parameter brp_data=32'h000a;
parameter btn_data={3'b0,5'b00001,10'b0,6'd4,2'b0,6'd4};
parameter btd_data={3'b0,5'b00001,10'b0,6'd4,2'b0,6'd4};
parameter rb_data=32'h00030000;
parameter thb_data=32'h000f0008;
parameter tb_data=32'h00070004;
parameter ie_data=32'h1;
parameter af1_data=32'h80000000;
parameter af2_data=32'ha0000000;
parameter cmd_data=1;

parameter brp=4'd0;
parameter btn=4'd1;
parameter btd=4'd2;
parameter rb=4'd3;
parameter tb=4'd4;
parameter thb=4'd5;
parameter ie=4'd6;
parameter af1=4'd7;
parameter af2=4'd8;
parameter cmd=4'd9;

reg [1:0]cnt;
reg [3:0]ini_cnt;
always @(posedge sysclk or negedge ponrst_n) begin
 if(!ponrst_n) cs<=0;
 else cs<=ns;
end
reg [11:0]start_cnt;
always @(*)begin
 case(cs)
  idle: begin
   if(start_cnt>=3500 && ini_cnt<10 && !PREADY) ns=ini_s;
   else if(send && !PREADY) ns=send_s;
   else if(rec && !PREADY) ns=rec_s;
   else ns=idle;
  end
  ini_s:begin
   if(ini_cnt==9 && PSEL && PREADY) ns=idle;
   else ns=ini_s;
  end
  send_s:begin
   if(!send || (cnt==3 && PREADY && PSEL)) ns=idle;
   else ns=send_s;
  end
  rec_s:begin
   if(!rec) ns=idle;
   else ns=rec_s;
  end
 endcase
end

always @(posedge sysclk or negedge ponrst_n) begin
 if(!ponrst_n) start_cnt<=0;
 else if(start_cnt<3500) start_cnt<=start_cnt+1;
 else start_cnt<=start_cnt;
end
always @(posedge sysclk or negedge ponrst_n) begin
 if(!ponrst_n) ini_cnt<=0;
 else if(ini_cnt<=9 && PSEL==1 && PENABLE==1) ini_cnt<=ini_cnt+1;
 else ini_cnt<=ini_cnt; 
end
always @(posedge sysclk or negedge ponrst_n)begin
 if(!ponrst_n) cnt<=0; 
 else if(cnt<3 && PSEL && PREADY && (cs==send_s || cs==rec_s)) cnt<=cnt+1;
 else if(cs==idle || cs==ini_s) cnt<=0;
 else cnt<=cnt;
end

assign PSEL=(cs!=idle);
assign PWRITE=(cs==ini_s || cs==send_s);
always @(posedge sysclk or negedge ponrst_n)
begin
 if(!ponrst_n) PENABLE<=0;
 else if(cs!=idle && PSEL && !PENABLE) PENABLE<=1;
 else if(PREADY) PENABLE<=0;
 else PENABLE<=PENABLE;
end
always @(*) begin
 case(cs)
  idle:begin
   PADDR=0;
   PENABLE=0;
   PWDATA=0;
  end
  ini_s:begin
   case(ini_cnt)
    brp:begin
     PADDR=brp_addr;
     PWDATA=brp_data;
    end
    btn:begin
     PADDR=btn_addr;
     PWDATA=btn_data;
    end
    btd:begin
     PADDR=btd_addr;
     PWDATA=btd_data;
    end
    rb:begin
     PADDR=rb_addr;
     PWDATA=rb_data;
    end
    tb:begin
     PADDR=tb_addr;
     PWDATA=tb_data;
    end
    thb:begin
     PADDR=thb_addr;
     PWDATA=thb_data;
    end
    ie:begin
     PADDR=ie_addr;
     PWDATA=ie_data;
    end
    af1:begin
     PADDR=af1_addr;
     PWDATA=af1_data;
    end
    af2:begin
     PADDR=af2_addr;
     PWDATA=af2_data;
    end
    cmd:begin
     PADDR=cmd_addr;
     PWDATA=cmd_data;
    end
    default:begin 
     PADDR=0;
     PWDATA=0;
    end
   endcase
  end 
  send_s:begin
   PADDR=32'h204;
   case(cnt)
    0: PWDATA=txhdr1;
    1: PWDATA=txhdr2;
    2: PWDATA=send_data1;
    3: PWDATA=send_data2;
   default: PWDATA=0;
   endcase
  end
  rec_s:
   PADDR=32'h0200;
 endcase
end
endmodule
`endif
`ifdef WISHBOND
module top(
sysclk,
canclk,
ponrst_n,
cfgstrp_clkdiv,
send,
rec,
cbus_rxd,
cbus_txd
);

input sysclk,canclk;
input ponrst_n;
input [7:0]cfgstrp_clkdiv;
input send;
input rec;
input cbus_rxd;

output cbus_txd;



wire CYC_I;
wire STB_I;
wire WE_I;
wire [31:0]ADR_I;
wire [31:0]DAT_I;
wire ACK_O;
wire [31:0]DAT_O;
wire int_o;
`module_name can_uut(
.sysclk(sysclk),
.canclk(canclk),
.ponrst_n(ponrst_n),
.cfgstrp_clkdiv(cfgstrp_clkdiv),
.cbus_rxd(cbus_rxd),
.CYC_I(CYC_I),
.STB_I(STB_I),
.WE_I(WE_I),
.ADR_I(ADR_I),
.DAT_I(DAT_I),
.cbus_txd(cbus_txd),
.ACK_O(ACK_O),
.DAT_O(DAT_O),
.int_o(int_o)
);

wishbone wb_uut(
.sysclk(sysclk),
.ponrst_n(ponrst_n),
.send(send),
.rec(rec),
.ACK_O(ACK_O),
.DAT_O(DAT_O),
.CYC_I(CYC_I),
.STB_I(STB_I),
.WE_I(WE_I),
.ADR_I(ADR_I),
.DAT_I(DAT_I)
);

endmodule
module wishbone(
sysclk,
ponrst_n,
send,
rec,
ACK_O,
DAT_O,
CYC_I,
STB_I,
WE_I,
ADR_I,
DAT_I
);

input sysclk;
input ponrst_n;
input send;
input rec;
input ACK_O;
input [31:0]DAT_O;

output reg CYC_I;
output reg STB_I;
output WE_I;
output reg [31:0] ADR_I;
output reg [31:0] DAT_I;

reg [1:0]cs;
reg [1:0]ns;
parameter idle=2'b00;
parameter send_s=2'b01;
parameter rec_s=2'b10;
parameter ini_s=2'b11;

wire [31:0] txhdr2;
wire [31:0] txhdr1;
wire [31:0]send_data1;
wire [31:0]send_data2;
parameter IDE=1'b0;
parameter RTR=1'b0;
parameter EDL=1'b0;
parameter BID=11'b10101010101;
parameter IE=18'b0;
parameter BRS=0;
parameter RSVD=24'b0;
parameter NUMBYTES=7'd8;
assign txhdr1={IDE,RTR,EDL,BID,IE};
assign txhdr2={BRS,RSVD,NUMBYTES};
assign send_data1=32'h7c01a579;
assign send_data2=32'h88888888;


parameter brp_addr=32'h0008;
parameter btn_addr=32'h000c;
parameter btd_addr=32'h0010;
parameter rb_addr=32'h0040;
parameter tb_addr=32'h0044;
parameter thb_addr=32'h0048;
parameter ie_addr=32'h0024;
parameter af1_addr=32'h0100;
parameter af2_addr=32'h0104;
parameter cmd_addr=32'h0004;

parameter brp_data=32'h000a;
parameter btn_data={3'b0,5'b00001,10'b0,6'd4,2'b0,6'd4};
parameter btd_data={3'b0,5'b00001,10'b0,6'd4,2'b0,6'd4};
parameter rb_data=32'h00030000;
parameter thb_data=32'h000f0008;
parameter tb_data=32'h00070004;
parameter ie_data=32'h1;
parameter af1_data=32'h80000000;
parameter af2_data=32'ha0000000;
parameter cmd_data=1;

parameter brp=4'd0;
parameter btn=4'd1;
parameter btd=4'd2;
parameter rb=4'd3;
parameter tb=4'd4;
parameter thb=4'd5;
parameter ie=4'd6;
parameter af1=4'd7;
parameter af2=4'd8;
parameter cmd=4'd9;

reg [11:0] start_cnt;
reg [3:0] ini_cnt;
reg [1:0] cnt;
always @(posedge sysclk or negedge ponrst_n) begin
 if(!ponrst_n) start_cnt<=0;
 else if(start_cnt<3500) start_cnt<=start_cnt+1;
 else start_cnt<=start_cnt;
end
always @(posedge sysclk or negedge ponrst_n)begin
 if(!ponrst_n) ini_cnt<=0;
 else if(cs==ini_s && ini_cnt<9 && ACK_O) ini_cnt<=ini_cnt+1;
 else ini_cnt<=ini_cnt;
end 
always @(posedge sysclk or negedge ponrst_n)begin
 if(!ponrst_n) cnt<=0;
 else if((cs==send_s || cs==rec_s) && cnt<3 && ACK_O) cnt<=cnt+1;
 else if(cnt==3 && ACK_O) cnt<=0;
 else cnt<=cnt;
end 

assign WE_I=(cs==ini_s || cs==send_s);
always @(posedge sysclk or negedge ponrst_n)begin
if(!ponrst_n) CYC_I<=0;
else if((cs==ini_s || cs==send_s || cs==rec_s) && !ACK_O) CYC_I<=1;
else if(ACK_O) CYC_I<=0;
else CYC_I<=CYC_I;
end

always @(posedge sysclk or negedge ponrst_n) begin
if(!ponrst_n) STB_I<=0;
else if((cs==ini_s || cs==send_s || cs==rec_s) && !ACK_O) STB_I<=1;
else if(ACK_O) STB_I<=0;
else STB_I<=STB_I;
end

always @(posedge sysclk or negedge ponrst_n) begin
 if(!ponrst_n) cs<=idle;
 else cs<=ns;
end
always @(*)begin
 ns=idle;
 case(cs)
  idle: begin
   if(start_cnt<3500) ns=idle;
   else if(ini_cnt<9) ns=ini_s;
   else if(send) ns=send_s;
   else if(rec) ns=rec_s;
   else ns=idle;
  end
  ini_s:begin
   if(ini_cnt==9 && ACK_O) ns=idle;
   else ns=ini_s;
  end
  send_s:begin
   if(cnt==3 && ACK_O || !send) ns=idle;
   else ns=send_s;
  end
  rec_s: begin
   if(!rec) ns=idle;
   else ns=rec_s;
  end
 endcase
end
always @(*)begin
case(cs)
  idle:begin
   ADR_I=0;
   DAT_I=0;
  end
  ini_s:begin
   case(ini_cnt)
    brp:begin
     ADR_I=brp_addr;
     DAT_I=brp_data;
    end
    btn:begin
     ADR_I=btn_addr;
     DAT_I=btn_data;
    end
    btd:begin
     ADR_I=btd_addr;
     DAT_I=btd_data;
    end
    rb:begin
     ADR_I=rb_addr;
     DAT_I=rb_data;
    end
    tb:begin
     ADR_I=tb_addr;
     DAT_I=tb_data;
    end
    thb:begin
     ADR_I=thb_addr;
     DAT_I=thb_data;
    end
    ie:begin
     ADR_I=ie_addr;
     DAT_I=ie_data;
    end
    af1:begin
     ADR_I=af1_addr;
     DAT_I=af1_data;
    end
    af2:begin
     ADR_I=af2_addr;
     DAT_I=af2_data;
    end
    cmd:begin
     ADR_I=cmd_addr;
     DAT_I=cmd_data;
    end
    default:begin 
     ADR_I=0;
     DAT_I=0;
    end
   endcase
  end 
  send_s:begin
   ADR_I=32'h204;
   case(cnt)
    0: DAT_I=txhdr1;
    1: DAT_I=txhdr2;
    2: DAT_I=send_data1;
    3: DAT_I=send_data2;
   default: DAT_I=0;
   endcase
  end
  rec_s:
   ADR_I=32'h0200;
 endcase
end
endmodule
`endif
`ifdef REG
module top(
sysclk,
canclk,
ponrst_n,
cfgstrp_clkdiv,
send,
rec,
cbus_rxd,
cbus_txd

);

input sysclk,canclk,ponrst_n;
input [7:0]cfgstrp_clkdiv;
input send,rec;
input cbus_rxd;
output cbus_txd;



wire cpu_cs;
wire cpu_read;
wire cpu_write;
wire [31:0] cpu_addr;
wire [31:0] cpu_wdat;
wire [31:0] cpu_rdat;
wire cpu_ack;
wire cpu_err;
wire int_o;


`module_name can_uut(
 .sysclk(sysclk),
 .canclk(canclk),
 .ponrst_n(ponrst_n),
 .cfgstrp_clkdiv(cfgstrp_clkdiv),
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
 .int_o(int_o)
);
 

REG reg_uut(
 .sysclk(sysclk),
 .ponrst_n(ponrst_n),
 .send(send),
 .rec(rec),
 .cpu_cs(cpu_cs),
 .cpu_ack(cpu_ack),
 .cpu_addr(cpu_addr),
 .cpu_wdat(cpu_wdat),
 .cpu_rdat(cpu_rdat),
 .cpu_write(cpu_write),
 .cpu_read(cpu_read)

);
endmodule
module REG(
 sysclk,
 ponrst_n,
 send,
 rec,
 cpu_cs,
 cpu_ack,
 cpu_addr,
 cpu_wdat,
 cpu_rdat,
 cpu_write,
 cpu_read

);
input sysclk,ponrst_n;
input send,rec;
input cpu_ack;
input [31:0] cpu_rdat;

output reg cpu_cs;
output reg [31:0] cpu_addr;
output reg [31:0] cpu_wdat;
output reg cpu_write;
output reg cpu_read;

reg [11:0]ini_cnt;
reg [3:0]start_cnt;
reg [1:0]cnt;


reg [1:0]cs;
reg [1:0]ns;
parameter idle=2'b00;
parameter send_s=2'b01;
parameter rec_s=2'b10;
parameter ini_s=2'b11;


wire [31:0] txhdr2;
wire [31:0] txhdr1;
wire [31:0]send_data1;
wire [31:0]send_data2;
parameter IDE=1'b0;
parameter RTR=1'b0;
parameter EDL=1'b0;
parameter BID=11'b10101010101;
parameter IE=18'b0;
parameter BRS=0;
parameter RSVD=24'b0;
parameter NUMBYTES=7'd8;
assign txhdr1={IDE,RTR,EDL,BID,IE};
assign txhdr2={BRS,RSVD,NUMBYTES};
assign send_data1=32'h7c01a579;
assign send_data2=32'h88888888;

always @(posedge sysclk or negedge ponrst_n) begin
if(!ponrst_n) cpu_cs<=0;
else if(cpu_ack) cpu_cs<=0;
else if(cs!=idle) cpu_cs<=1;
else cpu_cs<=0;
end

always @(posedge sysclk or negedge ponrst_n) begin
if(!ponrst_n) cpu_write<=0;
else if(cpu_ack) cpu_write=0;
else if(cs==ini_s || cs==send_s) cpu_write=1;
else cpu_write<=cpu_write;
end

always @(posedge sysclk or negedge ponrst_n) begin
if(!ponrst_n) cpu_read<=0;
else if(cpu_ack) cpu_read<=0;
else if(cs==rec_s) cpu_read<=1;
else cpu_read<=cpu_read;
end
wire ini_done;

parameter brp_addr=32'h0008;
parameter btn_addr=32'h000c;
parameter btd_addr=32'h0010;
parameter rb_addr=32'h0040;
parameter tb_addr=32'h0044;
parameter thb_addr=32'h0048;
parameter ie_addr=32'h0024;
parameter af1_addr=32'h0100;
parameter af2_addr=32'h0104;
parameter cmd_addr=32'h0004;


parameter brp_data=32'h000a;
parameter btn_data={3'b0,5'b00001,10'b0,6'd4,2'b0,6'd4};
parameter btd_data={3'b0,5'b00001,10'b0,6'd4,2'b0,6'd4};
parameter rb_data=32'h00030000;
parameter thb_data=32'h000f0008;
parameter tb_data=32'h00070004;
parameter ie_data=32'h1;
parameter af1_data=32'h80000000;
parameter af2_data=32'ha0000000;
parameter cmd_data=1;

parameter brp=4'd0;
parameter btn=4'd1;
parameter btd=4'd2;
parameter rb=4'd3;
parameter tb=4'd4;
parameter thb=4'd5;
parameter ie=4'd6;
parameter af1=4'd7;
parameter af2=4'd8;
parameter cmd=4'd9;

always @(posedge sysclk or negedge ponrst_n) begin
 if(!ponrst_n) ini_cnt<=0;
 else if(ini_cnt<12'd3500) ini_cnt<=ini_cnt+1;
 else ini_cnt<=ini_cnt;
end

always @(posedge sysclk or negedge ponrst_n) begin
 if(!ponrst_n) start_cnt<=0;
 else if(start_cnt<4'd10 && cs==ini_s && cpu_ack==1) start_cnt<=start_cnt+1;
 else start_cnt<=start_cnt;
end

assign ini_done=(start_cnt>=4'd10) ? 1'b1:1'b0;

always @(posedge sysclk or negedge ponrst_n)begin
 if(!ponrst_n) cnt<=0;
 else if((cs==send_s || cs==rec_s) && cpu_ack==1) cnt<=cnt+1;
 else if(cs==idle) cnt<=0;
 else cnt<=cnt;
end

always @(posedge sysclk or negedge ponrst_n) begin
 if(!ponrst_n) cs<=idle;
 else cs<=ns;
end

always @(*) begin
 case(cs)
  idle: begin
   if(start_cnt<9 && ini_cnt>=12'd3500) ns=ini_s;
   else if(send==1 && ini_done==1) ns=send_s;
   else if (rec==1 && ini_done==1) ns=rec_s;
   else ns=idle;
  end
  ini_s: begin
   if(start_cnt>=9 && cpu_ack==1) ns=idle;
   else ns=ini_s;
  end
  send_s: begin
   if(cnt==3 &&cpu_ack==1) ns=idle;
   else if(!send) ns=idle;
   else ns=send_s;
  end
  rec_s: begin
   if(!rec) ns=idle;
   else ns=rec_s;
  end
 endcase
end

always @(*) begin
 case(cs)
  idle: begin
   cpu_write=0;
   cpu_read=0;
   cpu_wdat=0;
   cpu_addr=0;
  end
  ini_s: begin
   case(start_cnt)
    brp:begin
     cpu_addr=brp_addr;
     cpu_wdat=brp_data;
    end
    btn:begin
     cpu_addr=btn_addr;
     cpu_wdat=btn_data;
    end
    btd:begin
     cpu_addr=btd_addr;
     cpu_wdat=btd_data;
    end
    rb:begin
     cpu_addr=rb_addr;
     cpu_wdat=rb_data;
    end
    tb:begin
     cpu_addr=tb_addr;
     cpu_wdat=tb_data;
    end
    thb:begin
     cpu_addr=thb_addr;
     cpu_wdat=thb_data;
    end
    ie:begin
     cpu_addr=ie_addr;
     cpu_wdat=ie_data;
    end
    af1:begin
     cpu_addr=af1_addr;
     cpu_wdat=af1_data;
    end
    af2:begin
     cpu_addr=af2_addr;
     cpu_wdat=af2_data;
    end
    cmd:begin
     cpu_addr=cmd_addr;
     cpu_wdat=cmd_data;
    end
    default:begin 
     cpu_addr=0;
     cpu_wdat=0;
    end
   endcase
 end
 send_s: begin
  cpu_addr=32'h0204;
  case(cnt)
   0: cpu_wdat=txhdr1;
   1: cpu_wdat=txhdr2;
   2: cpu_wdat=send_data1;
   3: begin 
    cpu_wdat=send_data2;
   end
   default: begin
    cpu_wdat=0;
   end
  endcase 
 end
 rec_s: begin
  cpu_addr=32'h0200;
  cpu_wdat=0;
 end
 endcase
end
endmodule
`endif
