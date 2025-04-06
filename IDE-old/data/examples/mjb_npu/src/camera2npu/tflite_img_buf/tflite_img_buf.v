
module tflite_img_buf (dout, clka, cea, reseta, clkb, ceb, resetb, oce, ada, din, adb);

output [31:0] dout;
input clka;
input cea;
input reseta;
input clkb;
input ceb;
input resetb;
input oce;
input [13:0] ada;
input [7:0] din;
input [11:0] adb;

wire [23:0] sdpb_inst_0_dout_w;
wire [25:0] sdpb_inst_0_dout;
wire [23:0] sdpb_inst_1_dout_w;
wire [27:2] sdpb_inst_1_dout;
wire [23:0] sdpb_inst_2_dout_w;
wire [29:4] sdpb_inst_2_dout;
wire [23:0] sdpb_inst_3_dout_w;
wire [31:6] sdpb_inst_3_dout;
wire [31:0] sdpb_inst_4_dout;
wire dff_q_0;
wire gw_gnd;

assign gw_gnd = 1'b0;

SDPB sdpb_inst_0 (
    .DO({sdpb_inst_0_dout_w[23:0],sdpb_inst_0_dout[25:24],sdpb_inst_0_dout[17:16],sdpb_inst_0_dout[9:8],sdpb_inst_0_dout[1:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,ada[13]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[11]}),
    .ADA({ada[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[1:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpb_inst_0.READ_MODE = 1'b0;
defparam sdpb_inst_0.BIT_WIDTH_0 = 2;
defparam sdpb_inst_0.BIT_WIDTH_1 = 8;
defparam sdpb_inst_0.BLK_SEL_0 = 3'b000;
defparam sdpb_inst_0.BLK_SEL_1 = 3'b000;
defparam sdpb_inst_0.RESET_MODE = "SYNC";

SDPB sdpb_inst_1 (
    .DO({sdpb_inst_1_dout_w[23:0],sdpb_inst_1_dout[27:26],sdpb_inst_1_dout[19:18],sdpb_inst_1_dout[11:10],sdpb_inst_1_dout[3:2]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,ada[13]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[11]}),
    .ADA({ada[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:2]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpb_inst_1.READ_MODE = 1'b0;
defparam sdpb_inst_1.BIT_WIDTH_0 = 2;
defparam sdpb_inst_1.BIT_WIDTH_1 = 8;
defparam sdpb_inst_1.BLK_SEL_0 = 3'b000;
defparam sdpb_inst_1.BLK_SEL_1 = 3'b000;
defparam sdpb_inst_1.RESET_MODE = "SYNC";

SDPB sdpb_inst_2 (
    .DO({sdpb_inst_2_dout_w[23:0],sdpb_inst_2_dout[29:28],sdpb_inst_2_dout[21:20],sdpb_inst_2_dout[13:12],sdpb_inst_2_dout[5:4]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,ada[13]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[11]}),
    .ADA({ada[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[5:4]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpb_inst_2.READ_MODE = 1'b0;
defparam sdpb_inst_2.BIT_WIDTH_0 = 2;
defparam sdpb_inst_2.BIT_WIDTH_1 = 8;
defparam sdpb_inst_2.BLK_SEL_0 = 3'b000;
defparam sdpb_inst_2.BLK_SEL_1 = 3'b000;
defparam sdpb_inst_2.RESET_MODE = "SYNC";

SDPB sdpb_inst_3 (
    .DO({sdpb_inst_3_dout_w[23:0],sdpb_inst_3_dout[31:30],sdpb_inst_3_dout[23:22],sdpb_inst_3_dout[15:14],sdpb_inst_3_dout[7:6]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,ada[13]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[11]}),
    .ADA({ada[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:6]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpb_inst_3.READ_MODE = 1'b0;
defparam sdpb_inst_3.BIT_WIDTH_0 = 2;
defparam sdpb_inst_3.BIT_WIDTH_1 = 8;
defparam sdpb_inst_3.BLK_SEL_0 = 3'b000;
defparam sdpb_inst_3.BLK_SEL_1 = 3'b000;
defparam sdpb_inst_3.RESET_MODE = "SYNC";

SDPB sdpb_inst_4 (
    .DO({sdpb_inst_4_dout[31:24],sdpb_inst_4_dout[23:16],sdpb_inst_4_dout[15:8],sdpb_inst_4_dout[7:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[11],adb[10],adb[9]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:0]}),
    .ADB({adb[8:0],gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpb_inst_4.READ_MODE = 1'b0;
defparam sdpb_inst_4.BIT_WIDTH_0 = 8;
defparam sdpb_inst_4.BIT_WIDTH_1 = 32;
defparam sdpb_inst_4.BLK_SEL_0 = 3'b100;
defparam sdpb_inst_4.BLK_SEL_1 = 3'b100;
defparam sdpb_inst_4.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(adb[11]),
  .CLK(clkb),
  .CE(ceb)
);
MUX2 mux_inst_4 (
  .O(dout[0]),
  .I0(sdpb_inst_0_dout[0]),
  .I1(sdpb_inst_4_dout[0]),
  .S0(dff_q_0)
);
MUX2 mux_inst_9 (
  .O(dout[1]),
  .I0(sdpb_inst_0_dout[1]),
  .I1(sdpb_inst_4_dout[1]),
  .S0(dff_q_0)
);
MUX2 mux_inst_14 (
  .O(dout[2]),
  .I0(sdpb_inst_1_dout[2]),
  .I1(sdpb_inst_4_dout[2]),
  .S0(dff_q_0)
);
MUX2 mux_inst_19 (
  .O(dout[3]),
  .I0(sdpb_inst_1_dout[3]),
  .I1(sdpb_inst_4_dout[3]),
  .S0(dff_q_0)
);
MUX2 mux_inst_24 (
  .O(dout[4]),
  .I0(sdpb_inst_2_dout[4]),
  .I1(sdpb_inst_4_dout[4]),
  .S0(dff_q_0)
);
MUX2 mux_inst_29 (
  .O(dout[5]),
  .I0(sdpb_inst_2_dout[5]),
  .I1(sdpb_inst_4_dout[5]),
  .S0(dff_q_0)
);
MUX2 mux_inst_34 (
  .O(dout[6]),
  .I0(sdpb_inst_3_dout[6]),
  .I1(sdpb_inst_4_dout[6]),
  .S0(dff_q_0)
);
MUX2 mux_inst_39 (
  .O(dout[7]),
  .I0(sdpb_inst_3_dout[7]),
  .I1(sdpb_inst_4_dout[7]),
  .S0(dff_q_0)
);
MUX2 mux_inst_44 (
  .O(dout[8]),
  .I0(sdpb_inst_0_dout[8]),
  .I1(sdpb_inst_4_dout[8]),
  .S0(dff_q_0)
);
MUX2 mux_inst_49 (
  .O(dout[9]),
  .I0(sdpb_inst_0_dout[9]),
  .I1(sdpb_inst_4_dout[9]),
  .S0(dff_q_0)
);
MUX2 mux_inst_54 (
  .O(dout[10]),
  .I0(sdpb_inst_1_dout[10]),
  .I1(sdpb_inst_4_dout[10]),
  .S0(dff_q_0)
);
MUX2 mux_inst_59 (
  .O(dout[11]),
  .I0(sdpb_inst_1_dout[11]),
  .I1(sdpb_inst_4_dout[11]),
  .S0(dff_q_0)
);
MUX2 mux_inst_64 (
  .O(dout[12]),
  .I0(sdpb_inst_2_dout[12]),
  .I1(sdpb_inst_4_dout[12]),
  .S0(dff_q_0)
);
MUX2 mux_inst_69 (
  .O(dout[13]),
  .I0(sdpb_inst_2_dout[13]),
  .I1(sdpb_inst_4_dout[13]),
  .S0(dff_q_0)
);
MUX2 mux_inst_74 (
  .O(dout[14]),
  .I0(sdpb_inst_3_dout[14]),
  .I1(sdpb_inst_4_dout[14]),
  .S0(dff_q_0)
);
MUX2 mux_inst_79 (
  .O(dout[15]),
  .I0(sdpb_inst_3_dout[15]),
  .I1(sdpb_inst_4_dout[15]),
  .S0(dff_q_0)
);
MUX2 mux_inst_84 (
  .O(dout[16]),
  .I0(sdpb_inst_0_dout[16]),
  .I1(sdpb_inst_4_dout[16]),
  .S0(dff_q_0)
);
MUX2 mux_inst_89 (
  .O(dout[17]),
  .I0(sdpb_inst_0_dout[17]),
  .I1(sdpb_inst_4_dout[17]),
  .S0(dff_q_0)
);
MUX2 mux_inst_94 (
  .O(dout[18]),
  .I0(sdpb_inst_1_dout[18]),
  .I1(sdpb_inst_4_dout[18]),
  .S0(dff_q_0)
);
MUX2 mux_inst_99 (
  .O(dout[19]),
  .I0(sdpb_inst_1_dout[19]),
  .I1(sdpb_inst_4_dout[19]),
  .S0(dff_q_0)
);
MUX2 mux_inst_104 (
  .O(dout[20]),
  .I0(sdpb_inst_2_dout[20]),
  .I1(sdpb_inst_4_dout[20]),
  .S0(dff_q_0)
);
MUX2 mux_inst_109 (
  .O(dout[21]),
  .I0(sdpb_inst_2_dout[21]),
  .I1(sdpb_inst_4_dout[21]),
  .S0(dff_q_0)
);
MUX2 mux_inst_114 (
  .O(dout[22]),
  .I0(sdpb_inst_3_dout[22]),
  .I1(sdpb_inst_4_dout[22]),
  .S0(dff_q_0)
);
MUX2 mux_inst_119 (
  .O(dout[23]),
  .I0(sdpb_inst_3_dout[23]),
  .I1(sdpb_inst_4_dout[23]),
  .S0(dff_q_0)
);
MUX2 mux_inst_124 (
  .O(dout[24]),
  .I0(sdpb_inst_0_dout[24]),
  .I1(sdpb_inst_4_dout[24]),
  .S0(dff_q_0)
);
MUX2 mux_inst_129 (
  .O(dout[25]),
  .I0(sdpb_inst_0_dout[25]),
  .I1(sdpb_inst_4_dout[25]),
  .S0(dff_q_0)
);
MUX2 mux_inst_134 (
  .O(dout[26]),
  .I0(sdpb_inst_1_dout[26]),
  .I1(sdpb_inst_4_dout[26]),
  .S0(dff_q_0)
);
MUX2 mux_inst_139 (
  .O(dout[27]),
  .I0(sdpb_inst_1_dout[27]),
  .I1(sdpb_inst_4_dout[27]),
  .S0(dff_q_0)
);
MUX2 mux_inst_144 (
  .O(dout[28]),
  .I0(sdpb_inst_2_dout[28]),
  .I1(sdpb_inst_4_dout[28]),
  .S0(dff_q_0)
);
MUX2 mux_inst_149 (
  .O(dout[29]),
  .I0(sdpb_inst_2_dout[29]),
  .I1(sdpb_inst_4_dout[29]),
  .S0(dff_q_0)
);
MUX2 mux_inst_154 (
  .O(dout[30]),
  .I0(sdpb_inst_3_dout[30]),
  .I1(sdpb_inst_4_dout[30]),
  .S0(dff_q_0)
);
MUX2 mux_inst_159 (
  .O(dout[31]),
  .I0(sdpb_inst_3_dout[31]),
  .I1(sdpb_inst_4_dout[31]),
  .S0(dff_q_0)
);
endmodule //tflite_img_buf
