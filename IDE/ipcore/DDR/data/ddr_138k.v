`include "ddr_param.v"

//======================
//DDR InputMode
//======================
`ifdef INPUT
module `module_name(
            din  ,
    `ifdef RATIO_2 
            clk  ,
           `ifdef RESET
            reset,
           `endif
    `else
            fclk ,
            pclk ,  //input or output
            reset,
            calib,
    `endif
    `ifdef IDELAY_DYNAMIC
            idly_dlystep ,
    `endif
    `ifdef IDELAY_ADAPTIVE
            idly_sdtap,
            idly_value,
            idly_dlystep ,
    `endif
            q
);

        input [WIDTH-1:0] din   ;
`ifdef RATIO_2 
        input             clk   ;
        `ifdef RESET
        input             reset ;
        `endif
`else
        input             fclk  ;
    `ifdef CLKDIV       
        output            pclk  ;
    `else
        input             pclk  ;
    `endif
        input             reset ;
        input             calib ;
`endif

`ifdef IDELAY_DYNAMIC
        input    [7:0] idly_dlystep  ;
`endif

`ifdef IDELAY_ADAPTIVE
        input             idly_sdtap ;
        input             idly_value ;
        input    [7:0] idly_dlystep  ;
`endif

        output [WIDTH*RATIO-1:0] q ;

`ifdef IDELAY_EN
    wire [WIDTH-1:0] iodly_o;
`endif

/////////////////CLKDIV///////////////////
`ifdef CLKDIV
    CLKDIV #(
      .DIV_MODE(RATIO_STR)
    ) clkdiv_inst(
      .HCLKIN(fclk),
      .RESETN(~reset),
      .CALIB(1'b0),
      .CLKOUT(pclk)
    );
`endif

/////////////////IODELAY/////////////
generate 
  genvar i0;
    for(i0 = 0; i0 < WIDTH; i0 = i0 + 1) begin: iodelay_gen
    `ifdef IDELAY_ADAPTIVE
      IODELAY #(
        .C_STATIC_DLY(IDELAY_STEP),
        .DYN_DLY_EN("FALSE"),
        .ADAPT_EN("TRUE")
      )iodelay_inst(
        .DO(iodly_o[i0]), 
        .DF(), 
        .DI(din[i0]), 
        .SDTAP(idly_sdtap), 
        .DLYSTEP(idly_dlystep), 
        .VALUE(idly_value)
     );
    `endif
    `ifdef IDELAY_DYNAMIC
      IODELAY #(
        .C_STATIC_DLY(0),
        .DYN_DLY_EN("TRUE"),
        .ADAPT_EN("FALSE")
      )iodelay_inst(
        .DO(iodly_o[i0]), 
        .DF(), 
        .DI(din[i0]), 
        .SDTAP(1'b0), 
        .DLYSTEP(idly_dlystep), 
        .VALUE(1'b0)
     );
    `endif
    `ifdef IDELAY_STATIC
      IODELAY #(
        .C_STATIC_DLY(IDELAY_STEP),
        .DYN_DLY_EN("FALSE"),
        .ADAPT_EN("FALSE")
      )iodelay_inst(
        .DO(iodly_o[i0]), 
        .DF(), 
        .DI(din[i0]), 
        .SDTAP(1'b0), 
        .DLYSTEP(8'b00000000), 
        .VALUE(1'b0)
     );
    `endif
    end
endgenerate

//////////////IDDR//////////////////////
`ifdef RATIO_2
    `ifdef RESET
        generate
          genvar i1;
            for(i1 = 0; i1 < WIDTH; i1 = i1 + 1) begin: iddrc_gen
              IDDRC iddrc_inst(
                .Q0(q[i1+WIDTH*0]),
                .Q1(q[i1+WIDTH*1]),
                .CLK(clk),
                .CLEAR(reset),
              `ifndef IDELAY_EN
                .D(din[i1])
              `else
                .D(iodly_o[i1])
              `endif
              );
            end
        endgenerate
    `else
        generate
          genvar i2;
            for(i2 = 0; i2 < WIDTH; i2 = i2 + 1) begin: iddr_gen
              IDDR iddr_inst(
                .Q0(q[i2+WIDTH*0]),
                .Q1(q[i2+WIDTH*1]),
                .CLK(clk),
              `ifndef IDELAY_EN
                .D(din[i2])
              `else
                .D(iodly_o[i2])
              `endif
              );
            end
        endgenerate
    `endif
`endif

//////////////IDES4//////////////////////
`ifdef RATIO_4
generate
  genvar i3;
    for(i3 = 0; i3 < WIDTH; i3 = i3 +1)begin: ides4_gen
      IDES4 ides4_inst(
        .Q0(q[i3+WIDTH*0]),
        .Q1(q[i3+WIDTH*1]),
        .Q2(q[i3+WIDTH*2]),
        .Q3(q[i3+WIDTH*3]),
      `ifndef IDELAY_EN
        .D(din[i3]),
      `else
        .D(iodly_o[i3]),
      `endif
        .FCLK(fclk),
        .PCLK(pclk),
        .RESET(reset),
        .CALIB(calib)
      );
    end
endgenerate
`endif

//////////////IDES8//////////////////////
`ifdef RATIO_8
generate
  genvar i4;
    for(i4 = 0; i4 < WIDTH; i4 = i4 +1)begin: ides8_gen
      IDES8 ides8_inst(
        .Q0(q[i4+WIDTH*0]),
        .Q1(q[i4+WIDTH*1]),
        .Q2(q[i4+WIDTH*2]),
        .Q3(q[i4+WIDTH*3]),
        .Q4(q[i4+WIDTH*4]),
        .Q5(q[i4+WIDTH*5]),
        .Q6(q[i4+WIDTH*6]),
        .Q7(q[i4+WIDTH*7]),
      `ifndef IDELAY_EN
        .D(din[i4]),
      `else
        .D(iodly_o[i4]),
      `endif
        .FCLK(fclk),
        .PCLK(pclk),
        .RESET(reset),
        .CALIB(calib)
      );
    end
endgenerate
`endif

//////////////IDES10//////////////////////
`ifdef RATIO_10
generate
  genvar i5;
    for(i5 = 0; i5 < WIDTH; i5 = i5 +1)begin: ides10_gen
      IDES10 ides10_inst(
        .Q0(q[i5+WIDTH*0]),
        .Q1(q[i5+WIDTH*1]),
        .Q2(q[i5+WIDTH*2]),
        .Q3(q[i5+WIDTH*3]),
        .Q4(q[i5+WIDTH*4]),
        .Q5(q[i5+WIDTH*5]),
        .Q6(q[i5+WIDTH*6]),
        .Q7(q[i5+WIDTH*7]),
        .Q8(q[i5+WIDTH*8]),
        .Q9(q[i5+WIDTH*9]),
      `ifndef IDELAY_EN
        .D(din[i5]),
      `else
        .D(iodly_o[i5]),
      `endif
        .FCLK(fclk),
        .PCLK(pclk),
        .RESET(reset),
        .CALIB(calib)
      );
    end
endgenerate
`endif

//////////////IDES16//////////////////////
`ifdef RATIO_16
generate
  genvar i6;
    for(i6 = 0; i6 < WIDTH; i6 = i6 +1)begin: ides16_gen
      IDES16 ides16_inst(
        .Q0(q[i6+WIDTH*0]),
        .Q1(q[i6+WIDTH*1]),
        .Q2(q[i6+WIDTH*2]),
        .Q3(q[i6+WIDTH*3]),
        .Q4(q[i6+WIDTH*4]),
        .Q5(q[i6+WIDTH*5]),
        .Q6(q[i6+WIDTH*6]),
        .Q7(q[i6+WIDTH*7]),
        .Q8(q[i6+WIDTH*8]),
        .Q9(q[i6+WIDTH*9]),
        .Q10(q[i6+WIDTH*10]),
        .Q11(q[i6+WIDTH*11]),
        .Q12(q[i6+WIDTH*12]),
        .Q13(q[i6+WIDTH*13]),
        .Q14(q[i6+WIDTH*14]),
        .Q15(q[i6+WIDTH*15]),
      `ifndef IDELAY_EN
        .D(din[i6]),
      `else
        .D(iodly_o[i6]),
      `endif
        .FCLK(fclk),
        .PCLK(pclk),
        .RESET(reset),
        .CALIB(calib)
      );
    end
endgenerate
`endif

//////////////IVIDEO//////////////////////
`ifdef RATIO_7
generate
  genvar i7;
    for(i7 = 0; i7 < WIDTH; i7 = i7 +1)begin: ivideo_gen
      IVIDEO ivideo_inst(
        .Q0(q[i7+WIDTH*0]),
        .Q1(q[i7+WIDTH*1]),
        .Q2(q[i7+WIDTH*2]),
        .Q3(q[i7+WIDTH*3]),
        .Q4(q[i7+WIDTH*4]),
        .Q5(q[i7+WIDTH*5]),
        .Q6(q[i7+WIDTH*6]),
      `ifndef IDELAY_EN
        .D(din[i7]),
      `else
        .D(iodly_o[i7]),
      `endif
        .FCLK(fclk),
        .PCLK(pclk),
        .RESET(reset),
        .CALIB(calib)
      );
    end
endgenerate
`endif

//////////////IDES14//////////////////////
`ifdef RATIO_14
generate
  genvar i8;
    for(i8 = 0; i8 < WIDTH; i8 = i8 +1)begin: ides14_gen
      IDES14 ides14_inst(
        .Q0(q[i8+WIDTH*0]),
        .Q1(q[i8+WIDTH*1]),
        .Q2(q[i8+WIDTH*2]),
        .Q3(q[i8+WIDTH*3]),
        .Q4(q[i8+WIDTH*4]),
        .Q5(q[i8+WIDTH*5]),
        .Q6(q[i8+WIDTH*6]),
        .Q7(q[i8+WIDTH*7]),
        .Q8(q[i8+WIDTH*8]),
        .Q9(q[i8+WIDTH*9]),
        .Q10(q[i8+WIDTH*10]),
        .Q11(q[i8+WIDTH*11]),
        .Q12(q[i8+WIDTH*12]),
        .Q13(q[i8+WIDTH*13]),
      `ifndef IDELAY_EN
        .D(din[i8]),
      `else
        .D(iodly_o[i8]),
      `endif
        .FCLK(fclk),
        .PCLK(pclk),
        .RESET(reset),
        .CALIB(calib)
      );
    end
endgenerate
`endif

//////////////IDES32//////////////////////
`ifdef RATIO_32
generate
  genvar i9;
    for(i9 = 0; i9 < WIDTH; i9 = i9 +1)begin: ides32_gen
      IDES32 ides32_inst(
        .Q0(q[i9+WIDTH*0]),
        .Q1(q[i9+WIDTH*1]),
        .Q2(q[i9+WIDTH*2]),
        .Q3(q[i9+WIDTH*3]),
        .Q4(q[i9+WIDTH*4]),
        .Q5(q[i9+WIDTH*5]),
        .Q6(q[i9+WIDTH*6]),
        .Q7(q[i9+WIDTH*7]),
        .Q8(q[i9+WIDTH*8]),
        .Q9(q[i9+WIDTH*9]),
        .Q10(q[i9+WIDTH*10]),
        .Q11(q[i9+WIDTH*11]),
        .Q12(q[i9+WIDTH*12]),
        .Q13(q[i9+WIDTH*13]),
        .Q14(q[i9+WIDTH*14]),
        .Q15(q[i9+WIDTH*15]),
        .Q16(q[i9+WIDTH*16]),
        .Q17(q[i9+WIDTH*17]),
        .Q18(q[i9+WIDTH*18]),
        .Q19(q[i9+WIDTH*19]),
        .Q20(q[i9+WIDTH*20]),
        .Q21(q[i9+WIDTH*21]),
        .Q22(q[i9+WIDTH*22]),
        .Q23(q[i9+WIDTH*23]),
        .Q24(q[i9+WIDTH*24]),
        .Q25(q[i9+WIDTH*25]),
        .Q26(q[i9+WIDTH*26]),
        .Q27(q[i9+WIDTH*27]),
        .Q28(q[i9+WIDTH*28]),
        .Q29(q[i9+WIDTH*29]),
        .Q30(q[i9+WIDTH*30]),
        .Q31(q[i9+WIDTH*31]),
      `ifndef IDELAY_EN
        .D(din[i9]),
      `else
        .D(iodly_o[i9]),
      `endif
        .FCLK(fclk),
        .PCLK(pclk),
        .RESET(reset),
        .CALIB(calib)
      );
    end
endgenerate
`endif


endmodule
`endif

//======================
//DDR Output Mode
//======================
`ifdef OUTPUT
module `module_name(
            din  ,
    `ifdef RATIO_2
            clk  ,
           `ifdef RESET
            reset,
           `endif
    `else
            fclk ,
            pclk ,  //input or output
            reset,
    `endif
    `ifdef ODELAY_DYNAMIC
            odly_dlystep ,
    `endif
    `ifdef ODELAY_ADAPTIVE
            odly_sdtap,
            odly_value,
            odly_dlystep ,
    `endif
            q
);

        input [WIDTH*RATIO-1:0] din ; 
`ifdef RATIO_2 
        input             clk   ;
        `ifdef RESET
        input             reset ;
        `endif
`else
        input             fclk  ;
        `ifdef CLKDIV       
        output            pclk  ;
        `else
        input             pclk  ;
        `endif
        input             reset ;
`endif

`ifdef ODELAY_DYNAMIC
        input    [7:0] odly_dlystep  ;
`endif

`ifdef ODELAY_ADAPTIVE
        input             odly_sdtap ;
        input             odly_value ;
        input    [7:0] odly_dlystep  ;
`endif
        output [WIDTH-1:0] q ;

wire [WIDTH-1:0] ddr_inst_o;

/////////////////CLKDIV///////////////////
`ifdef CLKDIV
    CLKDIV #(
      .DIV_MODE(RATIO_STR)
    ) clkdiv_inst(
      .HCLKIN(fclk),
      .RESETN(~reset),
      .CALIB(1'b0),
      .CLKOUT(pclk)
    );
`endif

/////////////////IODELAY/////////////
generate 
  genvar j0;
    for(j0 = 0; j0 < WIDTH; j0 = j0 + 1) begin: iodly_gen
    `ifdef ODELAY_ADAPTIVE
          IODELAY #(
            .C_STATIC_DLY(ODELAY_STEP),
            .DYN_DLY_EN("FALSE"),
            .ADAPT_EN("TRUE")
          )iodelay_inst(
            .DO(q[j0]), 
            .DF(), 
            .DI(ddr_inst_o[j0]), 
            .SDTAP(odly_sdtap), 
            .DLYSTEP(odly_dlystep), 
            .VALUE(odly_value)
         );
    `endif
    `ifdef ODELAY_DYNAMIC
          IODELAY #(
            .C_STATIC_DLY(0),
            .DYN_DLY_EN("TRUE"),
            .ADAPT_EN("FALSE")
          )iodelay_inst(
            .DO(q[j0]), 
            .DF(), 
            .DI(ddr_inst_o[j0]), 
            .SDTAP(1'b0), 
            .DLYSTEP(odly_dlystep), 
            .VALUE(1'b0)
         );
    `endif
    `ifdef ODELAY_STATIC
          IODELAY #(
            .C_STATIC_DLY(ODELAY_STEP),
            .DYN_DLY_EN("FALSE"),
            .ADAPT_EN("FALSE")
          )iodelay_inst(
            .DO(q[j0]), 
            .DF(), 
            .DI(ddr_inst_o[j0]), 
            .SDTAP(1'b0), 
            .DLYSTEP(8'b00000000), 
            .VALUE(1'b0)
         );
    `endif
    end
endgenerate

//////////////ODDR//////////////////////
`ifdef RATIO_2
    `ifdef RESET
        generate
          genvar j1;
            for(j1 = 0; j1 < WIDTH; j1 = j1 + 1) begin: oddrc_gen
              ODDRC oddrc_inst(
              `ifndef ODELAY_EN
                .Q0(q[j1]),
              `else
                .Q0(ddr_inst_o[j1]),
              `endif
                .Q1(),
                .D0(din[j1+WIDTH*0]),
                .D1(din[j1+WIDTH*1]),
                .TX(1'b0),
                .CLEAR(reset),
                .CLK(clk)
              );
            end
        endgenerate
    `else
        generate
          genvar j2;
            for(j2 = 0; j2 < WIDTH; j2 = j2 + 1) begin: oddr_gen
              ODDR oddr_inst(
              `ifndef ODELAY_EN
                .Q0(q[j2]),
              `else
                .Q0(ddr_inst_o[j2]),
              `endif
                .Q1(),
                .D0(din[j2+WIDTH*0]),
                .D1(din[j2+WIDTH*1]),
                .TX(1'b0),
                .CLK(clk)
              );
            end
        endgenerate
    `endif
`endif

//////////////OSER4//////////////////////
`ifdef RATIO_4
generate
  genvar j3;
    for(j3 = 0; j3 < WIDTH; j3 = j3 +1)begin: oser4_gen
      OSER4 oser4_inst(
      `ifndef ODELAY_EN
        .Q0(q[j3]),
      `else
        .Q0(ddr_inst_o[j3]),
      `endif
        .Q1(),
        .D0(din[j3+WIDTH*0]),
        .D1(din[j3+WIDTH*1]),
        .D2(din[j3+WIDTH*2]),
        .D3(din[j3+WIDTH*3]),
        .TX0(1'b0),
        .TX1(1'b0),
        .PCLK(pclk),
        .FCLK(fclk),
        .RESET(reset)
      );
    end
endgenerate
`endif

//////////////OSER8//////////////////////
`ifdef RATIO_8
generate
  genvar j4;
    for(j4 = 0; j4 < WIDTH; j4 = j4 +1)begin: oser8_gen
      OSER8 oser8_inst(
      `ifndef ODELAY_EN
        .Q0(q[j4]),
      `else
        .Q0(ddr_inst_o[j4]),
      `endif
        .Q1(),
        .D0(din[j4+WIDTH*0]),
        .D1(din[j4+WIDTH*1]),
        .D2(din[j4+WIDTH*2]),
        .D3(din[j4+WIDTH*3]),
        .D4(din[j4+WIDTH*4]),
        .D5(din[j4+WIDTH*5]),
        .D6(din[j4+WIDTH*6]),
        .D7(din[j4+WIDTH*7]),
        .TX0(1'b0),
        .TX1(1'b0),
        .TX2(1'b0),
        .TX3(1'b0),
        .PCLK(pclk),
        .FCLK(fclk),
        .RESET(reset)
      );
    end
endgenerate
`endif

//////////////OSER10//////////////////////
`ifdef RATIO_10
generate
  genvar j5;
    for(j5 = 0; j5 < WIDTH; j5 = j5 +1)begin: oser10_gen
      OSER10 oser10_inst(
      `ifndef ODELAY_EN
        .Q(q[j5]),
      `else
        .Q(ddr_inst_o[j5]),
      `endif
        .D0(din[j5+WIDTH*0]),
        .D1(din[j5+WIDTH*1]),
        .D2(din[j5+WIDTH*2]),
        .D3(din[j5+WIDTH*3]),
        .D4(din[j5+WIDTH*4]),
        .D5(din[j5+WIDTH*5]),
        .D6(din[j5+WIDTH*6]),
        .D7(din[j5+WIDTH*7]),
        .D8(din[j5+WIDTH*8]),
        .D9(din[j5+WIDTH*9]),
        .PCLK(pclk),
        .FCLK(fclk),
        .RESET(reset)
      );
    end
endgenerate
`endif

//////////////OSER16//////////////////////
`ifdef RATIO_16
generate
  genvar j6;
    for(j6 = 0; j6 < WIDTH; j6 = j6 +1)begin: oser16_gen
      OSER16 oser16_inst(
      `ifndef ODELAY_EN
        .Q(q[j6]),
      `else
        .Q(ddr_inst_o[j6]),
      `endif
        .D0(din[j6+WIDTH*0]),
        .D1(din[j6+WIDTH*1]),
        .D2(din[j6+WIDTH*2]),
        .D3(din[j6+WIDTH*3]),
        .D4(din[j6+WIDTH*4]),
        .D5(din[j6+WIDTH*5]),
        .D6(din[j6+WIDTH*6]),
        .D7(din[j6+WIDTH*7]),
        .D8(din[j6+WIDTH*8]),
        .D9(din[j6+WIDTH*9]),
        .D10(din[j6+WIDTH*10]),
        .D11(din[j6+WIDTH*11]),
        .D12(din[j6+WIDTH*12]),
        .D13(din[j6+WIDTH*13]),
        .D14(din[j6+WIDTH*14]),
        .D15(din[j6+WIDTH*15]),
        .PCLK(pclk),
        .FCLK(fclk),
        .RESET(reset)
      );
    end
endgenerate
`endif

//////////////OVIDEO//////////////////////
`ifdef RATIO_7
generate
  genvar j7;
    for(j7 = 0; j7 < WIDTH; j7 = j7 +1)begin: ovideo_gen
      OVIDEO ovideo_inst(
      `ifndef ODELAY_EN
        .Q(q[j7]),
      `else
        .Q(ddr_inst_o[j7]),
      `endif
        .D0(din[j7+WIDTH*0]),
        .D1(din[j7+WIDTH*1]),
        .D2(din[j7+WIDTH*2]),
        .D3(din[j7+WIDTH*3]),
        .D4(din[j7+WIDTH*4]),
        .D5(din[j7+WIDTH*5]),
        .D6(din[j7+WIDTH*6]),
        .PCLK(pclk),
        .FCLK(fclk),
        .RESET(reset)
      );
    end
endgenerate
`endif

endmodule
`endif

//======================
//DDR Tristate Mode
//======================
`ifdef TRISTATE
module `module_name(
            din  ,
            tx   ,
    `ifdef RATIO_2 
            clk  ,
           `ifdef RESET
            reset,
           `endif
    `else
            fclk ,
            pclk ,  //input or output
            reset,
    `endif
    `ifdef ODELAY_DYNAMIC
            odly_dlystep ,
    `endif
    `ifdef ODELAY_ADAPTIVE
            odly_sdtap,
            odly_value,
            odly_dlystep ,
    `endif
            q
);

        input [WIDTH*RATIO-1:0] din ; 
        input [WIDTH*RATIO/2-1:0] tx ;
`ifdef RATIO_2 
        input             clk   ;
        `ifdef RESET
        input             reset ;
        `endif
`else
        input             fclk  ;
        `ifdef CLKDIV       
        output            pclk  ;
        `else
        input             pclk  ;
        `endif
        input             reset ;
`endif
`ifdef ODELAY_DYNAMIC
        input    [7:0] odly_dlystep  ;
`endif

`ifdef ODELAY_ADAPTIVE
        input             odly_sdtap ;
        input             odly_value ;
        input    [7:0] odly_dlystep  ;
`endif
        output [WIDTH-1:0] q ;

wire [WIDTH-1:0] ddr_inst_q0;
wire [WIDTH-1:0] ddr_inst_q1;
`ifdef ODELAY_EN
    wire [WIDTH-1:0] iodly_o;
`endif

/////////////////CLKDIV///////////////////
`ifdef CLKDIV
    CLKDIV #(
      .DIV_MODE(RATIO_STR)
    ) clkdiv_inst(
      .HCLKIN(fclk),
      .RESETN(~reset),
      .CALIB(1'b0),
      .CLKOUT(pclk)
    );
`endif

/////////////////TBUF+IODELAY/////////////
generate 
  genvar k;
    for(k = 0; k < WIDTH; k = k + 1) begin: tbuf_gen
      TBUF tbuf_inst(
        .O  (q[k]),
        .OEN(ddr_inst_q1[k]),
      `ifndef ODELAY_EN
        .I  (ddr_inst_q0[k]) 
      `else
        .I  (iodly_o[k])
      `endif      
      );
    end
endgenerate
generate 
  genvar k0;
    for(k0 = 0; k0 < WIDTH; k0 = k0 + 1) begin: iodly_gen
    `ifdef ODELAY_ADAPTIVE
          IODELAY #(
            .C_STATIC_DLY(ODELAY_STEP),
            .DYN_DLY_EN("FALSE"),
            .ADAPT_EN("TRUE")
          )iodelay_inst(
            .DO(iodly_o[k0]), 
            .DF(), 
            .DI(ddr_inst_q0[k0]), 
            .SDTAP(odly_sdtap), 
            .DLYSTEP(odly_dlystep), 
            .VALUE(odly_value)
         );
    `endif
    `ifdef ODELAY_DYNAMIC
          IODELAY #(
            .C_STATIC_DLY(0),
            .DYN_DLY_EN("TRUE"),
            .ADAPT_EN("FALSE")
          )iodelay_inst(
            .DO(iodly_o[k0]), 
            .DF(), 
            .DI(ddr_inst_q0[k0]), 
            .SDTAP(1'b0), 
            .DLYSTEP(odly_dlystep), 
            .VALUE(1'b0)
         );
    `endif
    `ifdef ODELAY_STATIC
          IODELAY #(
            .C_STATIC_DLY(ODELAY_STEP),
            .DYN_DLY_EN("FALSE"),
            .ADAPT_EN("FALSE")
          )iodelay_inst(
            .DO(iodly_o[k0]), 
            .DF(), 
            .DI(ddr_inst_q0[k0]), 
            .SDTAP(1'b0), 
            .DLYSTEP(8'b00000000), 
            .VALUE(1'b0)
         );
    `endif
    end
endgenerate

//////////////ODDR//////////////////////
`ifdef RATIO_2
    `ifdef RESET
        generate
          genvar k1;
            for(k1 = 0; k1 < WIDTH; k1 = k1 + 1) begin: oddrc_gen
              ODDRC oddrc_inst(
                .Q0(ddr_inst_q0[k1]),
                .Q1(ddr_inst_q1[k1]),
                .D0(din[k1+WIDTH*0]),
                .D1(din[k1+WIDTH*1]),
                .TX(tx[k1+WIDTH*0]),
                .CLEAR(reset),
                .CLK(clk)
              );
            end
        endgenerate
    `else
        generate
          genvar k2;
            for(k2 = 0; k2 < WIDTH; k2 = k2 + 1) begin: oddr_gen
              ODDR oddr_inst(
                .Q0(ddr_inst_q0[k2]),
                .Q1(ddr_inst_q1[k2]),
                .D0(din[k2+WIDTH*0]),
                .D1(din[k2+WIDTH*1]),
                .TX(tx[k2+WIDTH*0]),
                .CLK(clk)
              );
            end
        endgenerate
    `endif
`endif

//////////////OSER4//////////////////////
`ifdef RATIO_4
generate
  genvar k3;
    for(k3 = 0; k3 < WIDTH; k3 = k3 +1)begin: oser4_gen
      OSER4 oser4_inst(
        .Q0(ddr_inst_q0[k3]),
        .Q1(ddr_inst_q1[k3]),
        .D0(din[k3+WIDTH*0]),
        .D1(din[k3+WIDTH*1]),
        .D2(din[k3+WIDTH*2]),
        .D3(din[k3+WIDTH*3]),
        .TX0(tx[k3+WIDTH*0]),
        .TX1(tx[k3+WIDTH*1]),
        .PCLK(pclk),
        .FCLK(fclk),
        .RESET(reset)
      );
    end
endgenerate
`endif

//////////////OSER8//////////////////////
`ifdef RATIO_8
generate
  genvar k4;
    for(k4 = 0; k4 < WIDTH; k4 = k4 +1)begin: oser8_gen
      OSER8 oser8_inst(
        .Q0(ddr_inst_q0[k4]),
        .Q1(ddr_inst_q1[k4]),
        .D0(din[k4+WIDTH*0]),
        .D1(din[k4+WIDTH*1]),
        .D2(din[k4+WIDTH*2]),
        .D3(din[k4+WIDTH*3]),
        .D4(din[k4+WIDTH*4]),
        .D5(din[k4+WIDTH*5]),
        .D6(din[k4+WIDTH*6]),
        .D7(din[k4+WIDTH*7]),
        .TX0(tx[k4+WIDTH*0]),
        .TX1(tx[k4+WIDTH*1]),
        .TX2(tx[k4+WIDTH*2]),
        .TX3(tx[k4+WIDTH*3]),
        .PCLK(pclk),
        .FCLK(fclk),
        .RESET(reset)
      );
    end
endgenerate
`endif

endmodule
`endif

//========================
//DDR Bidirectional Mode
//========================
`ifdef BIDIRECTIONAL
module `module_name(
            din  ,
            tx   ,
    `ifdef RATIO_2 
            clk  ,
           `ifdef RESET
            reset,
           `endif
    `else
            fclk ,
            pclk ,  //input or output
            reset,
            calib,
    `endif
    `ifdef IDELAY_DYNAMIC
            idly_dlystep ,
    `endif
    `ifdef IDELAY_ADAPTIVE
            idly_sdtap,
            idly_value,
            idly_dlystep ,
    `endif
    `ifdef ODELAY_DYNAMIC
            odly_dlystep ,
    `endif
    `ifdef ODELAY_ADAPTIVE
            odly_sdtap,
            odly_value,
            odly_dlystep ,
    `endif
            io   ,
            q
);   
        input [WIDTH*RATIO-1:0] din ; 
        input [WIDTH*RATIO/2-1:0] tx ;
        
`ifdef RATIO_2 
        input             clk   ;
        `ifdef RESET
        input             reset ;
        `endif
`else
        input             fclk  ;
        `ifdef CLKDIV       
        output            pclk  ;
        `else
        input             pclk  ;
        `endif
        input             reset ;
        input             calib ;
`endif
`ifdef IDELAY_DYNAMIC
        input    [7:0] idly_dlystep  ;
`endif

`ifdef IDELAY_ADAPTIVE
        input             idly_sdtap ;
        input             idly_value ;
        input    [7:0] idly_dlystep  ;
`endif
`ifdef ODELAY_DYNAMIC
        input    [7:0] odly_dlystep  ;
`endif

`ifdef ODELAY_ADAPTIVE
        input             odly_sdtap ;
        input             odly_value ;
        input    [7:0] odly_dlystep  ;
`endif
        
        inout [WIDTH-1:0] io ;
        
        output [WIDTH*RATIO-1:0] q ;

wire [WIDTH-1:0] ddr_inst_q0;
wire [WIDTH-1:0] ddr_inst_q1;
`ifdef IDELAY_EN
    `ifdef ODELAY_EN
        wire [WIDTH-1:0] idly_o;
        wire [WIDTH-1:0] odly_o;
    `else
        wire [WIDTH-1:0] iodly_o;
    `endif
`else  
    `ifdef ODELAY_EN
        wire [WIDTH-1:0] iodly_o;
    `endif
`endif
wire [WIDTH-1:0] iobuf_o;

/////////////////CLKDIV///////////////////
`ifdef CLKDIV
    CLKDIV #(
      .DIV_MODE(RATIO_STR)
    ) clkdiv_inst(
      .HCLKIN(fclk),
      .RESETN(~reset),
      .CALIB(1'b0),
      .CLKOUT(pclk)
    );
`endif

/////////////////IOBUF+IODELAY/////////////
generate 
  genvar s;
    for(s = 0; s < WIDTH; s = s + 1) begin: iodly_gen
      `ifdef IDELAY_EN
        `ifdef ODELAY_EN
            ///IODELAY Direction Inout          
              IOBUF iobuf_inst(
                .O  (iobuf_o[s]),
                .IO (io[s]),
                .OEN(ddr_inst_q1[s]),
                .I  (odly_o[s]) 
              );
              `ifdef IDELAY_ADAPTIVE
                  IODELAY #(
                    .C_STATIC_DLY(IDELAY_STEP),
                    .DYN_DLY_EN("FALSE"),
                    .ADAPT_EN("TRUE")
                  )idelay_inst(
                    .DO(idly_o[s]), 
                    .DF(), 
                    .DI(iobuf_o[s]), 
                    .SDTAP(idly_sdtap), 
                    .DLYSTEP(idly_dlystep), 
                    .VALUE(idly_value)
                 );
              `endif
              `ifdef ODELAY_ADAPTIVE    
                 IODELAY #(
                    .C_STATIC_DLY(ODELAY_STEP),
                    .DYN_DLY_EN("FALSE"),
                    .ADAPT_EN("TRUE")
                  )odelay_inst(
                    .DO(odly_o[s]), 
                    .DF(), 
                    .DI(ddr_inst_q0[s]), 
                    .SDTAP(odly_sdtap), 
                    .DLYSTEP(odly_dlystep), 
                    .VALUE(odly_value)
                 );
              `endif
              `ifdef IDELAY_DYNAMIC
                  IODELAY #(
                    .C_STATIC_DLY(0),
                    .DYN_DLY_EN("TRUE"),
                    .ADAPT_EN("FALSE")
                  )idelay_inst(
                    .DO(idly_o[s]), 
                    .DF(), 
                    .DI(iobuf_o[s]), 
                    .SDTAP(1'b0), 
                    .DLYSTEP(idly_dlystep), 
                    .VALUE(1'b0)
                 );
              `endif
              `ifdef ODELAY_DYNAMIC
                 IODELAY #(
                    .C_STATIC_DLY(0),
                    .DYN_DLY_EN("TRUE"),
                    .ADAPT_EN("FALSE")
                  )odelay_inst(
                    .DO(odly_o[s]), 
                    .DF(), 
                    .DI(ddr_inst_q0[s]), 
                    .SDTAP(1'b0), 
                    .DLYSTEP(odly_dlystep), 
                    .VALUE(1'b0)
                 );
              `endif
              `ifdef IDELAY_STATIC
                  IODELAY #(
                    .C_STATIC_DLY(IDELAY_STEP),
                    .DYN_DLY_EN("FALSE"),
                    .ADAPT_EN("FALSE")
                  )idelay_inst(
                    .DO(idly_o[s]), 
                    .DF(), 
                    .DI(iobuf_o[s]), 
                    .SDTAP(1'b0), 
                    .DLYSTEP(8'b00000000), 
                    .VALUE(1'b0)
                 );
              `endif
              `ifdef ODELAY_STATIC
                 IODELAY #(
                    .C_STATIC_DLY(ODELAY_STEP),
                    .DYN_DLY_EN("FALSE"),
                    .ADAPT_EN("FALSE")
                  )odelay_inst(
                    .DO(odly_o[s]), 
                    .DF(), 
                    .DI(ddr_inst_q0[s]), 
                    .SDTAP(1'b0), 
                    .DLYSTEP(8'b00000000), 
                    .VALUE(1'b0)
                 );
              `endif
        `else
             ///IODELAY Direction Input          
              IOBUF iobuf_inst(
                .O  (iobuf_o[s]),
                .IO (io[s]),
                .OEN(ddr_inst_q1[s]),
                .I  (ddr_inst_q0[s]) 
              );
          
              `ifdef IDELAY_ADAPTIVE
                  IODELAY #(
                    .C_STATIC_DLY(IDELAY_STEP),
                    .DYN_DLY_EN("FALSE"),
                    .ADAPT_EN("TRUE")
                  )iodelay_inst(
                    .DO(iodly_o[s]), 
                    .DF(), 
                    .DI(iobuf_o[s]), 
                    .SDTAP(idly_sdtap), 
                    .DLYSTEP(idly_dlystep), 
                    .VALUE(idly_value)
                 );
              `endif
              `ifdef IDELAY_DYNAMIC
                  IODELAY #(
                    .C_STATIC_DLY(0),
                    .DYN_DLY_EN("TRUE"),
                    .ADAPT_EN("FALSE")
                  )iodelay_inst(
                    .DO(iodly_o[s]), 
                    .DF(), 
                    .DI(iobuf_o[s]), 
                    .SDTAP(1'b0), 
                    .DLYSTEP(idly_dlystep), 
                    .VALUE(1'b0)
                 );
              `endif
              `ifdef IDELAY_STATIC
                  IODELAY #(
                    .C_STATIC_DLY(IDELAY_STEP),
                    .DYN_DLY_EN("FALSE"),
                    .ADAPT_EN("FALSE")
                  )iodelay_inst(
                    .DO(iodly_o[s]), 
                    .DF(), 
                    .DI(iobuf_o[s]), 
                    .SDTAP(1'b0), 
                    .DLYSTEP(8'b00000000), 
                    .VALUE(1'b0)
                 );
              `endif
        `endif ///end ODELAY_EN
      `else
            `ifdef ODELAY_EN
            ///IODELAY Direction Output          
              IOBUF iobuf_inst(
                .O  (iobuf_o[s]),
                .IO (io[s]),
                .OEN(ddr_inst_q1[s]),
                .I  (iodly_o[s])
              );
              `ifdef ODELAY_ADAPTIVE
                  IODELAY #(
                    .C_STATIC_DLY(ODELAY_STEP),
                    .DYN_DLY_EN("FALSE"),
                    .ADAPT_EN("TRUE")
                  )iodelay_inst(
                    .DO(iodly_o[s]), 
                    .DF(), 
                    .DI(ddr_inst_q0[s]), 
                    .SDTAP(odly_sdtap), 
                    .DLYSTEP(odly_dlystep), 
                    .VALUE(odly_value)
                 );
              `endif
              `ifdef ODELAY_DYNAMIC
                  IODELAY #(
                    .C_STATIC_DLY(0),
                    .DYN_DLY_EN("TRUE"),
                    .ADAPT_EN("FALSE")
                  )iodelay_inst(
                    .DO(iodly_o[s]), 
                    .DF(), 
                    .DI(ddr_inst_q0[s]), 
                    .SDTAP(1'b0), 
                    .DLYSTEP(odly_dlystep), 
                    .VALUE(1'b0)
                 );
              `endif
              `ifdef ODELAY_STATIC
                  IODELAY #(
                    .C_STATIC_DLY(ODELAY_STEP),
                    .DYN_DLY_EN("FALSE"),
                    .ADAPT_EN("FALSE")
                  )iodelay_inst(
                    .DO(iodly_o[s]), 
                    .DF(), 
                    .DI(ddr_inst_q0[s]), 
                    .SDTAP(1'b0), 
                    .DLYSTEP(8'b00000000), 
                    .VALUE(1'b0)
                 );
              `endif
           `else
                ///without IODELAY 
                IOBUF iobuf_inst(
                    .O  (iobuf_o[s]),
                    .IO (io[s]),
                    .OEN(ddr_inst_q1[s]),
                    .I  (ddr_inst_q0[s]) 
                ); 
            `endif ///end ODELAY_EN         

      `endif ///end IDEALY_EN
    end
endgenerate

//////////////ODDR+IDDR//////////////////////
`ifdef RATIO_2
    `ifdef RESET
        generate
          genvar s0;
            for(s0 = 0; s0 < WIDTH; s0 = s0 + 1) begin: ddrcx1_gen
              ODDRC oddrc_inst(
                .Q0(ddr_inst_q0[s0]),
                .Q1(ddr_inst_q1[s0]),
                .D0(din[s0+WIDTH*0]),
                .D1(din[s0+WIDTH*1]),
                .TX(tx[s0+WIDTH*0]),
                .CLEAR(reset),
                .CLK(clk)
              );
              IDDRC iddrc_inst(
                .Q0(q[s0+WIDTH*0]),
                .Q1(q[s0+WIDTH*1]),
                .CLK(clk),
                .CLEAR(reset),
              `ifdef IDELAY_EN
                `ifdef ODELAY_EN
                    .D(idly_o[s0])
                `else
                    .D(iodly_o[s0])
                `endif
              `else
                `ifdef ODELAY_EN
                    .D(iobuf_o[s0])
                `else
                    .D(iobuf_o[s0])
                `endif
               `endif
              
              );  
            end
        endgenerate
    `else
        generate
          genvar s1;
            for(s1 = 0; s1 < WIDTH; s1 = s1 + 1) begin: ddrx1_gen
              ODDR oddr_inst(
                .Q0(ddr_inst_q0[s1]),
                .Q1(ddr_inst_q1[s1]),
                .D0(din[s1+WIDTH*0]),
                .D1(din[s1+WIDTH*1]),
                .TX(tx[s1+WIDTH*0]),
                .CLK(clk)
              );
              IDDR iddr_inst(
                .Q0(q[s1+WIDTH*0]),
                .Q1(q[s1+WIDTH*1]),
                .CLK(clk),
              `ifdef IDELAY_EN
                `ifdef ODELAY_EN
                    .D(idly_o[s1])
                `else
                    .D(iodly_o[s1])
                `endif
              `else
                `ifdef ODELAY_EN
                    .D(iobuf_o[s1])
                `else
                    .D(iobuf_o[s1])
                `endif
               `endif
              );  
            end
        endgenerate
    `endif
`endif

//////////////OSER4+IDES4//////////////////////
`ifdef RATIO_4
generate
  genvar s2;
    for(s2 = 0; s2 < WIDTH; s2 = s2 +1)begin: ddrx2_gen
      OSER4 oser4_inst(
        .Q0(ddr_inst_q0[s2]),
        .Q1(ddr_inst_q1[s2]),
        .D0(din[s2+WIDTH*0]),
        .D1(din[s2+WIDTH*1]),
        .D2(din[s2+WIDTH*2]),
        .D3(din[s2+WIDTH*3]),
        .TX0(tx[s2+WIDTH*0]),
        .TX1(tx[s2+WIDTH*1]),
        .PCLK(pclk),
        .FCLK(fclk),
        .RESET(reset)
      );
      IDES4 ides4_inst(
        .Q0(q[s2+WIDTH*0]),
        .Q1(q[s2+WIDTH*1]),
        .Q2(q[s2+WIDTH*2]),
        .Q3(q[s2+WIDTH*3]),
        `ifdef IDELAY_EN
         `ifdef ODELAY_EN
             .D(idly_o[s2]),
         `else
             .D(iodly_o[s2]),
         `endif
        `else
         `ifdef ODELAY_EN
             .D(iobuf_o[s2]),
         `else
             .D(iobuf_o[s2]),
         `endif
        `endif
        .FCLK(fclk),
        .PCLK(pclk),
        .RESET(reset),
        .CALIB(calib)
      );
    end
endgenerate
`endif

//////////////OSER8+IDES8//////////////////////
`ifdef RATIO_8
generate
  genvar s3;
    for(s3 = 0; s3 < WIDTH; s3 = s3 +1)begin: ddrx4_gen
      OSER8 oser8_inst(
        .Q0(ddr_inst_q0[s3]),
        .Q1(ddr_inst_q1[s3]),
        .D0(din[s3+WIDTH*0]),
        .D1(din[s3+WIDTH*1]),
        .D2(din[s3+WIDTH*2]),
        .D3(din[s3+WIDTH*3]),
        .D4(din[s3+WIDTH*4]),
        .D5(din[s3+WIDTH*5]),
        .D6(din[s3+WIDTH*6]),
        .D7(din[s3+WIDTH*7]),
        .TX0(tx[s3+WIDTH*0]),
        .TX1(tx[s3+WIDTH*1]),
        .TX2(tx[s3+WIDTH*2]),
        .TX3(tx[s3+WIDTH*3]),
        .PCLK(pclk),
        .FCLK(fclk),
        .RESET(reset)
      );
      IDES8 ides8_inst(
        .Q0(q[s3+WIDTH*0]),
        .Q1(q[s3+WIDTH*1]),
        .Q2(q[s3+WIDTH*2]),
        .Q3(q[s3+WIDTH*3]),
        .Q4(q[s3+WIDTH*4]),
        .Q5(q[s3+WIDTH*5]),
        .Q6(q[s3+WIDTH*6]),
        .Q7(q[s3+WIDTH*7]),
       `ifdef IDELAY_EN
         `ifdef ODELAY_EN
             .D(idly_o[s3]),
         `else
             .D(iodly_o[s3]),
         `endif
        `else
         `ifdef ODELAY_EN
             .D(iobuf_o[s3]),
         `else
             .D(iobuf_o[s3]),
         `endif
        `endif
        .FCLK(fclk),
        .PCLK(pclk),
        .RESET(reset),
        .CALIB(calib)
      );
    end
endgenerate
`endif

endmodule
`endif
