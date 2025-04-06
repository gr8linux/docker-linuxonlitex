
// ===========Oooo==========================================Oooo========
// =  Copyright (C) 2014-2021 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// =====================================================================
//
//  __      __      __
//  \ \    /  \    / /   [File name   ] prim_syn.v
//   \ \  / /\ \  / /    [Description ] GW2A hardcore verilog functional synthesis library
//    \ \/ /  \ \/ /     [Timestamp   ] Fri January 22 11:00:30 2020
//     \  /    \  /      [version     ] 1.2
//      \/      \/       
//
// ===========Oooo==========================================Oooo========



`timescale 1ns / 1ps

//CLKDIV2
module CLKDIV2(CLKOUT, HCLKIN, RESETN) /* synthesis syn_black_box  */;

parameter GSREN = "false"; //"false", "true"

input HCLKIN, RESETN;
output CLKOUT;

endmodule

//IODELAYA
module IODELAYA (DO, DF, DI, SDTAP, VALUE, SETN) /* synthesis syn_black_box  */;

parameter C_STATIC_DLY = 0; //integer, 0~127

input DI;
input  SDTAP;
input  SETN;
input  VALUE;
output DF;
output DO;

endmodule

//rPLL, revision PLL
module rPLL (CLKOUT, CLKOUTP, CLKOUTD, CLKOUTD3, LOCK, CLKIN, CLKFB, FBDSEL, IDSEL, ODSEL, DUTYDA, PSDA, FDLY, RESET, RESET_P) /* synthesis syn_black_box  */;
input CLKIN;
input CLKFB;
input RESET; 
input RESET_P; 
input [5:0] FBDSEL; 
input [5:0] IDSEL;
input [5:0] ODSEL;
input [3:0] PSDA,FDLY; 
input [3:0] DUTYDA;

output CLKOUT;
output LOCK;
output CLKOUTP;
output CLKOUTD;
output CLKOUTD3;

parameter FCLKIN = "100.0"; // frequency of the CLKIN(M)
parameter DYN_IDIV_SEL= "false";//true:IDSEL; false:IDIV_SEL
parameter IDIV_SEL = 0; // 0:1,1:2...63:64. 1~64
parameter DYN_FBDIV_SEL= "false";//true:FBDSEL; false:FBDIV_SEL
parameter FBDIV_SEL = 0; // 0:1,1:2...63:64. 1~64
parameter DYN_ODIV_SEL= "false";//true:ODSEL; false:ODIV_SEL
parameter ODIV_SEL = 8; // 2/4/8/16/32/48/64/80/96/112/128

parameter PSDA_SEL= "0000";//
parameter DYN_DA_EN = "false";//true:PSDA or DUTYDA or FDA; false: DA_SEL
parameter DUTYDA_SEL= "1000";//

parameter CLKOUT_FT_DIR = 1'b1; // CLKOUT fine tuning direction. 1'b1 only
parameter CLKOUTP_FT_DIR = 1'b1; // 1'b1 only
parameter CLKOUT_DLY_STEP = 0; // 0,1,2,4
parameter CLKOUTP_DLY_STEP = 0; // 0,1,2

parameter CLKFB_SEL = "internal"; //"internal", "external";
parameter CLKOUT_BYPASS = "false";  //"true"; "false"
parameter CLKOUTP_BYPASS = "false";   //"true"; "false"
parameter CLKOUTD_BYPASS = "false";  //"true"; "false"
parameter DYN_SDIV_SEL = 2; // 2~128,only even num
parameter CLKOUTD_SRC =  "CLKOUT";  //CLKOUT,CLKOUTP
parameter CLKOUTD3_SRC = "CLKOUT"; //CLKOUT,CLKOUTP
parameter DEVICE = "GW2A-55";//"GW2A-18","GW2A-55","GW2AR-18","GW2A-55C","GW2A-18C","GW2AR-18C","GW2ANR-18C","GW2AN-55C"

endmodule

//IBUF with ODT
module IBUF_R (O, I, RTEN)/* synthesis syn_black_box black_box_pad_pin = "I"  */;

input  I;
input RTEN;
output O;
 
endmodule

//IOBUF with ODT
module IOBUF_R (O, IO, I, OEN, RTEN)/* synthesis syn_black_box black_box_pad_pin = "IO"  */;

input I,OEN;
input RTEN;
output O;
inout IO;
    
endmodule 

//ELVDS_IBUF with ODT
module ELVDS_IBUF_R (O, I, IB, RTEN)/* synthesis syn_black_box black_box_pad_pin = "I, IB" */;
output O;
input I, IB;
input RTEN;
endmodule

//ELVDS_IOBUF with ODT
module ELVDS_IOBUF_R (O, IO, IOB, I, OEN, RTEN)/* synthesis syn_black_box black_box_pad_pin = "IO, IOB" */;
output  O;
inout IO, IOB;
input I, OEN;
input RTEN;
endmodule

// Foscw = 200M/FREQ_DIV
module OSCW (OSCOUT)/* synthesis syn_black_box  */;
parameter FREQ_DIV = 80; // 2~128,only even num
output OSCOUT;

endmodule

//OTP,One-Time-Programming
module OTP (DOUT, CSB, SCLK)/* synthesis syn_black_box  */;
input CSB, SCLK;
output DOUT;

endmodule

//SAMB,spi address for multi boot
module SAMB(SPIAD, LOADN_SPIAD)/* synthesis syn_black_box syn_noprune=1  */;
input [23:0] SPIAD;//spi flash address
input LOADN_SPIAD;//Select dynamic address signal SPIAD at low level

endmodule

// CLKDIVG
module CLKDIVG(CLKOUT, CALIB, CLKIN, RESETN)/* synthesis syn_black_box  */; 

input CLKIN;
input RESETN;
input CALIB;
output CLKOUT;

parameter DIV_MODE = "2"; //"2", "3.5", "4", "5"
parameter GSREN = "false"; //"false", "true"

endmodule

//PLLO
module PLLO (CLKOUTA, CLKOUTB, CLKOUTC, CLKOUTD, LOCK, CLKIN, CLKFB, ENCLKA, ENCLKB, ENCLKC, ENCLKD, FBDSEL, IDSEL, ODSELA, ODSELB, ODSELC, ODSELD, DTA, DTB, PSSEL, PSDIR, PSPULSE, ICPSEL, LPFRES, RESET, RESET_P, RESET_I, RESET_S)/* synthesis syn_black_box  */;
input CLKIN;
input CLKFB;
input RESET;
input RESET_P;
input RESET_I;
input RESET_S;
input [5:0] FBDSEL;
input [5:0] IDSEL;
input [6:0] ODSELA;
input [6:0] ODSELB;
input [6:0] ODSELC;
input [6:0] ODSELD;

input [3:0] DTA;
input [3:0] DTB;
input [4:0] ICPSEL;
input [2:0] LPFRES;

input [1:0] PSSEL;
input PSDIR;
input PSPULSE;

input ENCLKA;
input ENCLKB;
input ENCLKC;
input ENCLKD;

output LOCK;
output CLKOUTA;
output CLKOUTB;
output CLKOUTC;
output CLKOUTD;

parameter FCLKIN = "100.0"; // frequency of the CLKIN(M)
parameter DYN_IDIV_SEL= "FALSE";//TRUE:IDSEL; FALSE:IDIV_SEL
parameter IDIV_SEL = 0; // 0:1,1:2...63:64. 1~64
parameter DYN_FBDIV_SEL= "FALSE";//TRUE:FBDSEL; FALSE:FBDIV_SEL
parameter FBDIV_SEL = 0; // 0:1,1:2...63:64. 1~64

parameter DYN_ODIVA_SEL= "FALSE";//TRUE:ODSELA; FALSE:ODIVA_SEL
parameter ODIVA_SEL = 6; // 1~128
parameter DYN_ODIVB_SEL= "FALSE";//TRUE:ODSELB; FALSE:ODIVB_SEL
parameter ODIVB_SEL = 6; // 1~128
parameter DYN_ODIVC_SEL= "FALSE";//TRUE:ODSELC; FALSE:ODIVC_SEL
parameter ODIVC_SEL = 6; // 1~128
parameter DYN_ODIVD_SEL= "FALSE";//TRUE:ODSELD; FALSE:ODIVD_SEL
parameter ODIVD_SEL = 6; // 1~128

parameter CLKOUTA_EN = "TRUE";//"TRUE","FALSE"
parameter CLKOUTB_EN = "TRUE";//"TRUE","FALSE"
parameter CLKOUTC_EN = "TRUE";//"TRUE","FALSE"
parameter CLKOUTD_EN = "TRUE";//"TRUE","FALSE"

parameter DYN_DTA_SEL = "FALSE"; //TRUE:DTA; FALSE:CLKOUTA_DT_DIR & CLKOUTA_DT_STEP
parameter DYN_DTB_SEL = "FALSE"; //TRUE:DTB; FALSE:CLKOUTB_DT_DIR & CLKOUTB_DT_STEP
parameter CLKOUTA_DT_DIR = 1'b1; // CLKOUTA dutycycle adjust direction. 1'b1: + ; 1'b0: -
parameter CLKOUTB_DT_DIR = 1'b1; // CLKOUTB dutycycle adjust direction. 1'b1: + ; 1'b0: -
parameter CLKOUTA_DT_STEP = 0; // 0,1,2,4; 50ps/step
parameter CLKOUTB_DT_STEP = 0; // 0,1,2,4; 50ps/step

parameter CLKA_IN_SEL = 2'b00;//DIVA input source select. 0x:from VCO;11:from CLKIN
parameter CLKA_OUT_SEL = 1'b0;//CLKOUTA output select. 0:DIVA output; 1:CLKIN
parameter CLKB_IN_SEL = 2'b00;//DIVB input source select. 0x:from VCO;10:from CLKCAS_A;11:from CLKIN
parameter CLKB_OUT_SEL = 1'b0;//CLKOUTB output select. 0:DIVB output; 1:CLKIN
parameter CLKC_IN_SEL = 2'b00;//DIVC input source select. 0x:from VCO;10:from CLKCAS_B;11:from CLKIN
parameter CLKC_OUT_SEL = 1'b0;//CLKOUTC output select. 0:DIVC output; 1:CLKIN
parameter CLKD_IN_SEL = 2'b00;//DIVD input source select. 0x:from VCO;10:from CLKCAS_C;11:from CLKIN
parameter CLKD_OUT_SEL = 1'b0;//CLKOUTD output select. 0:DIVD output; 1:CLKIN

parameter CLKFB_SEL = "INTERNAL"; // "INTERNAL", "EXTERNAL";

parameter DYN_DPA_EN = "FALSE";//dynamic phaseshift adjustment Enable."TRUE","FALSE"

parameter DYN_PSB_SEL = "FALSE";//"TRUE": select dynamic dpa signal for phase shift B. DYN_DPA_EN="TRUE" at the same time. "FALSE":select PSB_COARSE & PSB_FINE as the static control signal for phase shift B
parameter DYN_PSC_SEL = "FALSE";//"TRUE": select dynamic dpa signal for phase shift C. DYN_DPA_EN="TRUE" at the same time. "FALSE":select PSC_COARSE & PSC_FINE as the static control signal for phase shift C
parameter DYN_PSD_SEL = "FALSE";//"TRUE": select dynamic dpa signal for phase shift D. DYN_DPA_EN="TRUE" at the same time. "FALSE":select PSD_COARSE & PSD_FINE as the static control signal for phase shift D
parameter PSB_COARSE = 0;//0~127
parameter PSB_FINE = 0;//0~7
parameter PSC_COARSE = 0;//0~127
parameter PSC_FINE = 0;//0~7
parameter PSD_COARSE = 0;//0~127
parameter PSD_FINE = 0;//0~7

parameter DTMS_ENB = "FALSE";//"FALSE":fixed 50% duty cycle for case odivb=2~128; "TRUE":set PSB_COARSE & PSB_FINE as duty edge when DYN_DPA_EN="TRUE" for case odivb=2~128
parameter DTMS_ENC = "FALSE";//"FALSE":fixed 50% duty cycle for case odivc=2~128; "TRUE":set PSC_COARSE & PSC_FINE as duty edge when DYN_DPA_EN="TRUE" for case odivc=2~128
parameter DTMS_END = "FALSE";//"FALSE":fixed 50% duty cycle for case odivd=2~128; "TRUE":set PSD_COARSE & PSD_FINE as duty edge when DYN_DPA_EN="TRUE" for case odivd=2~128

parameter RESET_I_EN = "FALSE";//"TRUE","FALSE". Enable RESET_I through the dedicated signal from ciu.
parameter RESET_S_EN =  "FALSE";//"TRUE","FALSE". Enable RESET_S through the dedicated signal from ciu.

parameter DYN_ICP_SEL= "FALSE";//TRUE:ICPSEL; FALSE:ICP_SEL
parameter ICP_SEL = 5'bXXXXX;//X means that software will automatically calculate and set this parameter.If the user wants to set it, use 5'b00000~5'b11111
parameter DYN_RES_SEL= "FALSE";//TRUE:LPFRES; FALSE:LPR_REF
parameter LPR_REF = 7'bXXXXXXX;//X means that software will automatically calculate and set this parameter.If the user wants to set it, use 7'b0000000(R0)/7'b0000001(R1)/7'b0000010(R2)/7'b0000100(R3)/7'b0001000(R4)/7'b0010000(R5)/7'b0100000(R6)/7'b1000000(R7)

endmodule

//IBUF for mipi input
module MIPI_IBUF (OH, OL, OB, IO, IOB, I, IB, OEN, OENB, HSREN) /* synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin = "IO, IOB" */;
output OH, OL, OB;
inout IO, IOB;
input  I, IB;
input OEN, OENB;
input HSREN;
endmodule

//IOBUF for I3C mode
module I3C_IOBUF (O, IO, I, MODESEL)/* synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin = "IO" */;
output O;
inout IO;
input  I, MODESEL;

endmodule


