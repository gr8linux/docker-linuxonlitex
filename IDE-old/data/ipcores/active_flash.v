module activeFlash (
  I_active_flash_holdn,
  I_active_flash_sclk,
  O_active_flash_ready
)
;
input I_active_flash_holdn;
input I_active_flash_sclk;
output O_active_flash_ready;
wire clk;
wire n9_4;
wire n9_5;
wire O_active_flash_ready_12;
wire n19_11;
wire n9_7;
wire n18_1;
wire n18_2;
wire n17_1;
wire n17_2;
wire n16_1;
wire n16_2;
wire n15_1;
wire n15_2;
wire n14_1;
wire n14_2;
wire n13_1;
wire n13_2;
wire n12_1;
wire n12_2;
wire n11_1;
wire n11_0_COUT;
wire [8:0] cnt;
wire VCC;
wire GND;
  LUT2 clk_s0 (
    .F(clk),
    .I0(I_active_flash_holdn),
    .I1(I_active_flash_sclk)
);
defparam clk_s0.INIT=4'h8;
  LUT4 n9_s1 (
    .F(n9_4),
    .I0(cnt[1]),
    .I1(cnt[6]),
    .I2(cnt[7]),
    .I3(cnt[8])
);
defparam n9_s1.INIT=16'h0100;
  LUT4 n9_s2 (
    .F(n9_5),
    .I0(cnt[2]),
    .I1(cnt[3]),
    .I2(cnt[4]),
    .I3(cnt[5])
);
defparam n9_s2.INIT=16'h0001;
  LUT4 O_active_flash_ready_s9 (
    .F(O_active_flash_ready_12),
    .I0(cnt[0]),
    .I1(n9_4),
    .I2(n9_5),
    .I3(O_active_flash_ready)
);
defparam O_active_flash_ready_s9.INIT=16'hFF40;
  LUT4 n19_s3 (
    .F(n19_11),
    .I0(cnt[0]),
    .I1(n9_4),
    .I2(n9_5),
    .I3(O_active_flash_ready)
);
defparam n19_s3.INIT=16'hAA15;
  LUT4 n9_s3 (
    .F(n9_7),
    .I0(cnt[0]),
    .I1(n9_4),
    .I2(n9_5),
    .I3(O_active_flash_ready)
);
defparam n9_s3.INIT=16'h00BF;
  DFFE cnt_7_s0 (
    .Q(cnt[7]),
    .D(n12_1),
    .CLK(clk),
    .CE(n9_7)
);
defparam cnt_7_s0.INIT=1'b0;
  DFFE cnt_6_s0 (
    .Q(cnt[6]),
    .D(n13_1),
    .CLK(clk),
    .CE(n9_7)
);
defparam cnt_6_s0.INIT=1'b0;
  DFFE cnt_5_s0 (
    .Q(cnt[5]),
    .D(n14_1),
    .CLK(clk),
    .CE(n9_7)
);
defparam cnt_5_s0.INIT=1'b0;
  DFFE cnt_4_s0 (
    .Q(cnt[4]),
    .D(n15_1),
    .CLK(clk),
    .CE(n9_7)
);
defparam cnt_4_s0.INIT=1'b0;
  DFFE cnt_3_s0 (
    .Q(cnt[3]),
    .D(n16_1),
    .CLK(clk),
    .CE(n9_7)
);
defparam cnt_3_s0.INIT=1'b0;
  DFFE cnt_2_s0 (
    .Q(cnt[2]),
    .D(n17_1),
    .CLK(clk),
    .CE(n9_7)
);
defparam cnt_2_s0.INIT=1'b0;
  DFFE cnt_1_s0 (
    .Q(cnt[1]),
    .D(n18_1),
    .CLK(clk),
    .CE(n9_7)
);
defparam cnt_1_s0.INIT=1'b0;
  DFFE cnt_8_s0 (
    .Q(cnt[8]),
    .D(n11_1),
    .CLK(clk),
    .CE(n9_7)
);
defparam cnt_8_s0.INIT=1'b0;
  DFFE O_active_flash_ready_s6 (
    .Q(O_active_flash_ready),
    .D(VCC),
    .CLK(clk),
    .CE(O_active_flash_ready_12)
);
defparam O_active_flash_ready_s6.INIT=1'b0;
  DFF cnt_0_s1 (
    .Q(cnt[0]),
    .D(n19_11),
    .CLK(clk)
);
defparam cnt_0_s1.INIT=1'b0;
  ALU n18_s (
    .SUM(n18_1),
    .COUT(n18_2),
    .I0(cnt[1]),
    .I1(cnt[0]),
    .I3(GND),
    .CIN(GND)
);
defparam n18_s.ALU_MODE=0;
  ALU n17_s (
    .SUM(n17_1),
    .COUT(n17_2),
    .I0(cnt[2]),
    .I1(GND),
    .I3(GND),
    .CIN(n18_2)
);
defparam n17_s.ALU_MODE=0;
  ALU n16_s (
    .SUM(n16_1),
    .COUT(n16_2),
    .I0(cnt[3]),
    .I1(GND),
    .I3(GND),
    .CIN(n17_2)
);
defparam n16_s.ALU_MODE=0;
  ALU n15_s (
    .SUM(n15_1),
    .COUT(n15_2),
    .I0(cnt[4]),
    .I1(GND),
    .I3(GND),
    .CIN(n16_2)
);
defparam n15_s.ALU_MODE=0;
  ALU n14_s (
    .SUM(n14_1),
    .COUT(n14_2),
    .I0(cnt[5]),
    .I1(GND),
    .I3(GND),
    .CIN(n15_2)
);
defparam n14_s.ALU_MODE=0;
  ALU n13_s (
    .SUM(n13_1),
    .COUT(n13_2),
    .I0(cnt[6]),
    .I1(GND),
    .I3(GND),
    .CIN(n14_2)
);
defparam n13_s.ALU_MODE=0;
  ALU n12_s (
    .SUM(n12_1),
    .COUT(n12_2),
    .I0(cnt[7]),
    .I1(GND),
    .I3(GND),
    .CIN(n13_2)
);
defparam n12_s.ALU_MODE=0;
  ALU n11_s (
    .SUM(n11_1),
    .COUT(n11_0_COUT),
    .I0(cnt[8]),
    .I1(GND),
    .I3(GND),
    .CIN(n12_2)
);
defparam n11_s.ALU_MODE=0;
  VCC VCC_cZ (
    .V(VCC)
);
  GND GND_cZ (
    .G(GND)
);
  GSR GSR (
    .GSRI(VCC)
);
endmodule /* activeFlash */
