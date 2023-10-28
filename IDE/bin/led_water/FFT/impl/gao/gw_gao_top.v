module gw_gao(
    \sXnRe[15] ,
    \sXnRe[14] ,
    \sXnRe[13] ,
    \sXnRe[12] ,
    \sXnRe[11] ,
    \sXnRe[10] ,
    \sXnRe[9] ,
    \sXnRe[8] ,
    \sXnRe[7] ,
    \sXnRe[6] ,
    \sXnRe[5] ,
    \sXnRe[4] ,
    \sXnRe[3] ,
    \sXnRe[2] ,
    \sXnRe[1] ,
    \sXnRe[0] ,
    \out_d_14[55] ,
    \out_d_14[54] ,
    \out_d_14[53] ,
    \out_d_14[52] ,
    \out_d_14[51] ,
    \out_d_14[50] ,
    \out_d_14[49] ,
    \out_d_14[48] ,
    \out_d_14[47] ,
    \out_d_14[46] ,
    \out_d_14[45] ,
    \out_d_14[44] ,
    \out_d_14[43] ,
    \out_d_14[42] ,
    \out_d_14[41] ,
    \out_d_14[40] ,
    \out_d_14[32] ,
    \out_d_14[26] ,
    \out_d_14[25] ,
    \out_d_14[24] ,
    \out_d_14[23] ,
    \out_d_14[22] ,
    \out_d_14[21] ,
    \out_d_14[20] ,
    \out_d_14[19] ,
    \out_d_14[18] ,
    \out_d_14[17] ,
    \out_d_14[16] ,
    \out_d_14[15] ,
    \out_d_14[14] ,
    \out_d_14[13] ,
    \out_d_14[12] ,
    \out_d_14[11] ,
    \out_d_11[35] ,
    \out_d_13[28] ,
    \out[55] ,
    \out[54] ,
    \out[53] ,
    \out[52] ,
    \out[51] ,
    \out[50] ,
    \out[49] ,
    \out[48] ,
    \out[47] ,
    \out[46] ,
    \out[45] ,
    \out[44] ,
    \out[43] ,
    \out[42] ,
    \out[41] ,
    \out[40] ,
    \out[26] ,
    \out[25] ,
    \out[24] ,
    \out[23] ,
    \out[22] ,
    \out[21] ,
    \out[20] ,
    \out[19] ,
    \out[18] ,
    \out[17] ,
    \out[16] ,
    \out[15] ,
    \out[14] ,
    \out[13] ,
    \out[12] ,
    \out[11] ,
    \out[28] ,
    \out[32] ,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \sXnRe[15] ;
input \sXnRe[14] ;
input \sXnRe[13] ;
input \sXnRe[12] ;
input \sXnRe[11] ;
input \sXnRe[10] ;
input \sXnRe[9] ;
input \sXnRe[8] ;
input \sXnRe[7] ;
input \sXnRe[6] ;
input \sXnRe[5] ;
input \sXnRe[4] ;
input \sXnRe[3] ;
input \sXnRe[2] ;
input \sXnRe[1] ;
input \sXnRe[0] ;
input \out_d_14[55] ;
input \out_d_14[54] ;
input \out_d_14[53] ;
input \out_d_14[52] ;
input \out_d_14[51] ;
input \out_d_14[50] ;
input \out_d_14[49] ;
input \out_d_14[48] ;
input \out_d_14[47] ;
input \out_d_14[46] ;
input \out_d_14[45] ;
input \out_d_14[44] ;
input \out_d_14[43] ;
input \out_d_14[42] ;
input \out_d_14[41] ;
input \out_d_14[40] ;
input \out_d_14[32] ;
input \out_d_14[26] ;
input \out_d_14[25] ;
input \out_d_14[24] ;
input \out_d_14[23] ;
input \out_d_14[22] ;
input \out_d_14[21] ;
input \out_d_14[20] ;
input \out_d_14[19] ;
input \out_d_14[18] ;
input \out_d_14[17] ;
input \out_d_14[16] ;
input \out_d_14[15] ;
input \out_d_14[14] ;
input \out_d_14[13] ;
input \out_d_14[12] ;
input \out_d_14[11] ;
input \out_d_11[35] ;
input \out_d_13[28] ;
input \out[55] ;
input \out[54] ;
input \out[53] ;
input \out[52] ;
input \out[51] ;
input \out[50] ;
input \out[49] ;
input \out[48] ;
input \out[47] ;
input \out[46] ;
input \out[45] ;
input \out[44] ;
input \out[43] ;
input \out[42] ;
input \out[41] ;
input \out[40] ;
input \out[26] ;
input \out[25] ;
input \out[24] ;
input \out[23] ;
input \out[22] ;
input \out[21] ;
input \out[20] ;
input \out[19] ;
input \out[18] ;
input \out[17] ;
input \out[16] ;
input \out[15] ;
input \out[14] ;
input \out[13] ;
input \out[12] ;
input \out[11] ;
input \out[28] ;
input \out[32] ;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \sXnRe[15] ;
wire \sXnRe[14] ;
wire \sXnRe[13] ;
wire \sXnRe[12] ;
wire \sXnRe[11] ;
wire \sXnRe[10] ;
wire \sXnRe[9] ;
wire \sXnRe[8] ;
wire \sXnRe[7] ;
wire \sXnRe[6] ;
wire \sXnRe[5] ;
wire \sXnRe[4] ;
wire \sXnRe[3] ;
wire \sXnRe[2] ;
wire \sXnRe[1] ;
wire \sXnRe[0] ;
wire \out_d_14[55] ;
wire \out_d_14[54] ;
wire \out_d_14[53] ;
wire \out_d_14[52] ;
wire \out_d_14[51] ;
wire \out_d_14[50] ;
wire \out_d_14[49] ;
wire \out_d_14[48] ;
wire \out_d_14[47] ;
wire \out_d_14[46] ;
wire \out_d_14[45] ;
wire \out_d_14[44] ;
wire \out_d_14[43] ;
wire \out_d_14[42] ;
wire \out_d_14[41] ;
wire \out_d_14[40] ;
wire \out_d_14[32] ;
wire \out_d_14[26] ;
wire \out_d_14[25] ;
wire \out_d_14[24] ;
wire \out_d_14[23] ;
wire \out_d_14[22] ;
wire \out_d_14[21] ;
wire \out_d_14[20] ;
wire \out_d_14[19] ;
wire \out_d_14[18] ;
wire \out_d_14[17] ;
wire \out_d_14[16] ;
wire \out_d_14[15] ;
wire \out_d_14[14] ;
wire \out_d_14[13] ;
wire \out_d_14[12] ;
wire \out_d_14[11] ;
wire \out_d_11[35] ;
wire \out_d_13[28] ;
wire \out[55] ;
wire \out[54] ;
wire \out[53] ;
wire \out[52] ;
wire \out[51] ;
wire \out[50] ;
wire \out[49] ;
wire \out[48] ;
wire \out[47] ;
wire \out[46] ;
wire \out[45] ;
wire \out[44] ;
wire \out[43] ;
wire \out[42] ;
wire \out[41] ;
wire \out[40] ;
wire \out[26] ;
wire \out[25] ;
wire \out[24] ;
wire \out[23] ;
wire \out[22] ;
wire \out[21] ;
wire \out[20] ;
wire \out[19] ;
wire \out[18] ;
wire \out[17] ;
wire \out[16] ;
wire \out[15] ;
wire \out[14] ;
wire \out[13] ;
wire \out[12] ;
wire \out[11] ;
wire \out[28] ;
wire \out[32] ;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top_0  u_la0_top(
    .control(control0[9:0]),
    .trig0_i({\out_d_13[28] ,\out_d_14[32] }),
    .trig1_i({\out[55] ,\out[54] ,\out[53] ,\out[52] ,\out[51] ,\out[50] ,\out[49] ,\out[48] ,\out[47] ,\out[46] ,\out[45] ,\out[44] ,\out[43] ,\out[42] ,\out[41] ,\out[40] }),
    .trig2_i({\out[26] ,\out[25] ,\out[24] ,\out[23] ,\out[22] ,\out[21] ,\out[20] ,\out[19] ,\out[18] ,\out[17] ,\out[16] ,\out[15] ,\out[14] ,\out[13] ,\out[12] ,\out[11] }),
    .trig3_i(\out[28] ),
    .trig4_i(\out[32] ),
    .data_i({\sXnRe[15] ,\sXnRe[14] ,\sXnRe[13] ,\sXnRe[12] ,\sXnRe[11] ,\sXnRe[10] ,\sXnRe[9] ,\sXnRe[8] ,\sXnRe[7] ,\sXnRe[6] ,\sXnRe[5] ,\sXnRe[4] ,\sXnRe[3] ,\sXnRe[2] ,\sXnRe[1] ,\sXnRe[0] ,\out_d_14[55] ,\out_d_14[54] ,\out_d_14[53] ,\out_d_14[52] ,\out_d_14[51] ,\out_d_14[50] ,\out_d_14[49] ,\out_d_14[48] ,\out_d_14[47] ,\out_d_14[46] ,\out_d_14[45] ,\out_d_14[44] ,\out_d_14[43] ,\out_d_14[42] ,\out_d_14[41] ,\out_d_14[40] ,\out_d_14[32] ,\out_d_14[26] ,\out_d_14[25] ,\out_d_14[24] ,\out_d_14[23] ,\out_d_14[22] ,\out_d_14[21] ,\out_d_14[20] ,\out_d_14[19] ,\out_d_14[18] ,\out_d_14[17] ,\out_d_14[16] ,\out_d_14[15] ,\out_d_14[14] ,\out_d_14[13] ,\out_d_14[12] ,\out_d_14[11] ,\out_d_14[32] ,\out_d_11[35] ,\out_d_13[28] }),
    .clk_i(\out_d_11[35] )
);

endmodule
