
// ===========Oooo==========================================Oooo========
// =  Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// =====================================================================
//
//  __      __      __
//  \ \    /  \    / /   [File name   ] prim_syn.v
//   \ \  / /\ \  / /    [Description ] GW5AT hardcore verilog functional synthesis library
//    \ \/ /  \ \/ /     [Timestamp   ] Tue April 14 11:00:30 2020
//     \  /    \  /      [version     ] 1.0
//      \/      \/       
//
// ===========Oooo==========================================Oooo========



`timescale 1ns / 1ps


//Iologic
module IDDR(Q0, Q1, D, CLK)  /* synthesis syn_black_box  */;
input D;
input CLK;
output Q0;
output Q1;
parameter Q0_INIT = 1'b0;
parameter Q1_INIT = 1'b0;
endmodule //IDDR (ddr input)

module IDDRC(Q0, Q1, D, CLK, CLEAR)  /* synthesis syn_black_box  */;
input D;
input CLK;
input CLEAR;
output Q0;
output Q1;
parameter Q0_INIT = 1'b0;
parameter Q1_INIT = 1'b0;
endmodule //IDDRC (ddr input, asynchronous clear)

module IDDR_MEM (Q0, Q1, D, WADDR, RADDR, PCLK, ICLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false";  //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
input D, ICLK, PCLK;
input [2:0] WADDR;
input [2:0] RADDR;
input RESET;
output  Q0,Q1;
endmodule // IDDR_MEM (ddr input with asynchronous preset)

module ODDR (Q0, Q1, D0, D1, TX, CLK)  /* synthesis syn_black_box  */;
input D0;
input D1;
input TX;
input CLK;
output Q0;
output Q1;
parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output
parameter INIT = 1'b0;
endmodule // ODDRS (ddr output)

module ODDRC (Q0, Q1, D0, D1, TX, CLK, CLEAR)  /* synthesis syn_black_box  */;
input D0, D1, TX, CLK, CLEAR;
output Q0, Q1;
parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output
parameter INIT = 1'b0;
endmodule // ODDRC (ddr output with asynchronous clear)

module ODDR_MEM (Q0, Q1, D0, D1, TX, PCLK, TCLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
parameter TCLK_SOURCE = "DQSW"; //"DQSW","DQSW270"
parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output

input D0, D1;
input TX, PCLK, TCLK, RESET;
output  Q0, Q1;
endmodule // ODDR_MEM (ddr output with memory)

module IDES4 (Q0, Q1, Q2, Q3, D, CALIB, PCLK, FCLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
input D, FCLK, PCLK, CALIB, RESET;
output Q0,Q1,Q2,Q3;
endmodule // IDES4 (4 to 1 deserializer)

module IDES4_MEM (Q0, Q1, Q2, Q3, D, WADDR, RADDR, CALIB, PCLK, FCLK, ICLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
input D, ICLK, FCLK, PCLK;
input [2:0] WADDR;
input [2:0] RADDR;
input CALIB, RESET;
output Q0,Q1,Q2,Q3;
endmodule //IDES4_MEM (4 to 1 deserializer with memory)

module IVIDEO (Q0, Q1, Q2, Q3, Q4, Q5, Q6, D, CALIB, PCLK, FCLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";   //"true"; "false"
input D, FCLK, PCLK, CALIB, RESET;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6;
endmodule //IVIDEO (7 to 1 deserializer)

module IDES8 (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, D, CALIB, PCLK, FCLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
input D, FCLK, PCLK, CALIB, RESET;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;
endmodule // IDES8 (8 to 1 deserializer)

module IDES8_MEM (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, D, WADDR, RADDR, CALIB, PCLK, FCLK, ICLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
input D, ICLK, FCLK, PCLK;
input [2:0] WADDR;
input [2:0] RADDR;
input CALIB, RESET;
output  Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;
endmodule // IDES8_MEM (8 to 1 deserializer with memory)

module IDES10 (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, D, CALIB, PCLK, FCLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
input D, FCLK, PCLK, CALIB, RESET;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9;
endmodule // IDES10 (10 to 1 deserializer)

//IDES16
module IDES16 (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, D, CALIB, PCLK, FCLK, RESET) /* synthesis syn_black_box  */;

parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"

input D, FCLK, PCLK, CALIB,RESET;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15;
endmodule // IDES16 (16 to 1 deserializer)

module OSER4 (Q0, Q1, D0, D1, D2, D3, TX0, TX1, PCLK, FCLK, RESET)  /* synthesis syn_black_box */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";   //"true"; "false"
parameter HWL = "false";     //"true"; "false"
parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output

input D3, D2, D1, D0;
input TX1, TX0;
input PCLK, FCLK, RESET;
output  Q0, Q1;
endmodule // OSER4 (4 to 1 serializer)

module OSER4_MEM (Q0, Q1, D0, D1, D2, D3, TX0, TX1, PCLK, FCLK, TCLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
parameter HWL = "false";     //"true"; "false"
parameter TCLK_SOURCE = "DQSW"; //"DQSW","DQSW270"
parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output

input D0, D1, D2, D3;
input TX0, TX1;
input PCLK, FCLK, TCLK, RESET;
output  Q0,  Q1;
endmodule // OSER4_MEM (4 to 1 serializer with memory)

module OVIDEO (Q, D0, D1, D2, D3, D4, D5, D6, PCLK, FCLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
input D6, D5, D4, D3, D2, D1, D0;
input PCLK, FCLK, RESET;
output  Q;
endmodule // OVIDEO (7 to 1 serializer)

module OSER8 (Q0, Q1, D0, D1, D2, D3, D4, D5, D6, D7, TX0, TX1, TX2, TX3, PCLK, FCLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
parameter HWL = "false";     //"true"; "false"
parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output

input D0, D1, D2, D3, D4, D5, D6, D7;
input TX0, TX1, TX2, TX3;
input PCLK, FCLK, RESET;
output  Q0,  Q1;
endmodule // OSER8 (8 to 1 serializer)

module OSER8_MEM (Q0, Q1, D0, D1, D2, D3, D4, D5, D6, D7, TX0, TX1, TX2, TX3, PCLK, FCLK, TCLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
parameter HWL = "false";    //"true"; "false"
parameter TCLK_SOURCE = "DQSW"; //"DQSW","DQSW270"
parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output

input D0, D1, D2, D3, D4, D5, D6, D7;
input TX0, TX1, TX2, TX3;
input PCLK, FCLK, TCLK, RESET;
output  Q0,  Q1;
endmodule // OSER8_MEM (8 to 1 serializer with memory)

module OSER10 (Q, D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, PCLK, FCLK, RESET)  /* synthesis syn_black_box  */;
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
input D0, D1, D2, D3, D4, D5, D6, D7, D8, D9;
input PCLK, FCLK, RESET;
output  Q;
endmodule // OSER10 (10 to 1 serializer)

module OSER16 (Q, D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, PCLK, FCLK, RESET) /* synthesis syn_black_box  */;

parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"

input D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15;
input PCLK, FCLK, RESET;
output  Q;
endmodule // OSER16 (16 to 1 serializer)

//IODELAY
module IODELAY (DO, DF, DI, SDTAP, VALUE, SETN)  /* synthesis syn_black_box  */;
parameter C_STATIC_DLY = 0; //integer, 0~127
input DI;
input  SDTAP;
input  SETN;
input  VALUE;
output DF;
output DO;
endmodule // IODELAY

module IEM (LAG, LEAD, D, CLK, MCLK, RESET)  /* synthesis syn_black_box  */;
parameter WINSIZE = "SMALL"; //"SMALL"; "MIDSMALL"; "MIDLARGE"; "LARGE"
parameter GSREN = "false"; //"true"; "false"
parameter LSREN = "true";    //"true"; "false"
input D, CLK, RESET, MCLK;
output LAG, LEAD;
endmodule // IEM


//DCS
module DCS (CLKOUT, CLK0, CLK1, CLK2, CLK3, CLKSEL, SELFORCE) /* synthesis syn_black_box  */;
input CLK0, CLK1, CLK2, CLK3, SELFORCE;
input [3:0] CLKSEL;
output CLKOUT;

parameter DCS_MODE = "RISING";  //CLK0,CLK1,CLK2,CLK3,GND,VCC,RISING,FALLING,CLK0_GND,CLK0_VCC,CLK1_GND,CLK1_VCC,CLK2_GND,CLK2_VCC,CLK3_GND,CLK3_VCC

endmodule

//DQCE
module DQCE(CLKOUT, CLKIN, CE) /* synthesis syn_black_box  */;

input CLKIN;
input CE;
output CLKOUT;

endmodule

//PLLG
module PLLG (CLKOUT0, CLKOUT0N, CLKOUT1, CLKOUT1N, CLKOUT2, CLKOUT2N, CLKOUT3, CLKOUT3N, CLKOUT4, CLKOUT5, LOCK, CLKFBOUT, CLKFBOUTN, CLKIN, CLKFB, IDSEL, FBDSEL, FBODSEL, FBODSEL_FRAC, ODSEL0, ODSEL0_FRAC, ODSEL1, ODSEL2, ODSEL3, ODSEL4, ODSEL5, PSFB, FPSFB, PS0, FPS0, DUTY0, FDUTY0, PS1, FPS1, DUTY1, FDUTY1, PS2, FPS2, DUTY2, FDUTY2, PS3, FPS3, DUTY3, FDUTY3, PS4, FPS4, DUTY4, FDUTY4, PS5, FPS5, DUTY5, FDUTY5, RESET, PLLPWD) /* synthesis syn_black_box  */;
input CLKIN;
input CLKFB;
input RESET, PLLPWD;
input [5:0] IDSEL, FBDSEL;
input [6:0] FBODSEL, ODSEL0, ODSEL1, ODSEL2, ODSEL3, ODSEL4, ODSEL5;
input [2:0] FBODSEL_FRAC, ODSEL0_FRAC;
input [6:0] PSFB, PS0, PS1, PS2, PS3, PS4, PS5;
input [2:0] FPSFB, FPS0, FPS1, FPS2, FPS3, FPS4, FPS5;
input [6:0] DUTY0, DUTY1, DUTY2, DUTY3, DUTY4, DUTY5;
input [2:0] FDUTY0, FDUTY1, FDUTY2, FDUTY3, FDUTY4, FDUTY5;

output LOCK;
output CLKFBOUT, CLKFBOUTN;
output CLKOUT0, CLKOUT0N;
output CLKOUT1, CLKOUT1N;
output CLKOUT2, CLKOUT2N;
output CLKOUT3, CLKOUT3N;
output CLKOUT4;
output CLKOUT5;

parameter FCLKIN = "100.0"; //frequency of the CLKIN
parameter DYN_IDIV_SEL = "FALSE";//TRUE:IDSEL; FALSE:IDIV_SEL
parameter IDIV_SEL = 0; // 0:1,1:2...63:64. 1~64
parameter DYN_FBDIV_SEL = "FALSE";//TRUE:FBDSEL; FALSE:FBDIV_SEL
parameter FBDIV_SEL = 0; // 0:1,1:2...63:64. 1~64
parameter DYN_FBODIV_SEL = "FALSE";//TRUE:FBODSEL, FBODSEL_FRAC; FALSE:FBODIV_SEL, FBODIV_FRAC_SEL
parameter FBODIV_SEL = 8; // 2~128,integer
parameter FBODIV_FRAC_SEL = 0; // 0~7,integer,step=1/8
parameter DYN_ODIV0_SEL = "FALSE";//TRUE:ODSEL0, ODSEL0_FRAC; FALSE:ODIV0_SEL, ODIV0_FRAC_SEL 
parameter ODIV0_SEL = 8; // 2~128,integer;
parameter ODIV0_FRAC_SEL = 0; // 0~7,integer,step=1/8
parameter DYN_ODIV1_SEL = "FALSE"; //TRUE:ODSEL1; FALSE:ODIV1_SEL
parameter ODIV1_SEL = 8; //2~128,integer
parameter DYN_ODIV2_SEL = "FALSE"; //TRUE:ODSEL2; FALSE:ODIV2_SEL
parameter ODIV2_SEL = 8; //2~128,integer
parameter DYN_ODIV3_SEL = "FALSE"; //TRUE:ODSEL3; FALSE:ODIV3_SEL
parameter ODIV3_SEL = 8; //2~128,integer
parameter DYN_ODIV4_SEL = "FALSE"; //TRUE:ODSEL4; FALSE:ODIV4_SEL
parameter ODIV4_SEL = 8; //2~128,integer
parameter DYN_ODIV5_SEL = "FALSE"; //TRUE:ODSEL5; FALSE:ODIV5_SEL
parameter ODIV5_SEL = 8; //2~128,integer

parameter DYN_FB_EN = "FALSE"; //TRUE:PSFB, FPSFB; FALSE:PSFB_SEL, FPSFB_SEL
parameter PSFB_SEL = 0; //0~127,integer
parameter FPSFB_SEL = 0; //0~7,integer,step=1/8
parameter DYN_PD0_EN = "FALSE";//TRUE:PS0, FPS0, DUTY0, FDUTY0; FALSE: PS0_SEL, FPS0_SEL, DUTY0_SEL, FDUTY0_SEL
parameter PS0_SEL = 0; //0~127,integer
parameter FPS0_SEL = 0; //0~7,integer,step=1/8
parameter DUTY0_SEL = 4; //0~127,integer
parameter FDUTY0_SEL = 0; //0~7,integer,step=1/8
parameter DYN_PD1_EN = "FALSE";//TRUE:PS1, FPS1, DUTY1, FDUTY1; FALSE: PS1_SEL, FPS1_SEL, DUTY1_SEL, FDUTY1_SEL
parameter PS1_SEL = 0; //0~127,integer
parameter FPS1_SEL = 0; //0~7,integer,step=1/8
parameter DUTY1_SEL = 4; //0~127,integer
parameter FDUTY1_SEL = 0; //0~7,integer,step=1/8
parameter DYN_PD2_EN = "FALSE";//TRUE:PS2, FPS2, DUTY2, FDUTY2; FALSE: PS2_SEL, FPS2_SEL, DUTY2_SEL, FDUTY2_SEL
parameter PS2_SEL = 0; //0~127,integer
parameter FPS2_SEL = 0; //0~7,integer,step=1/8
parameter DUTY2_SEL = 4; //0~127,integer
parameter FDUTY2_SEL = 0; //0~7,integer,step=1/8
parameter DYN_PD3_EN = "FALSE";//TRUE:PS3, FPS3, DUTY3, FDUTY3; FALSE: PS3_SEL, FPS3_SEL, DUTY3_SEL, FDUTY3_SEL
parameter PS3_SEL = 0; //0~127,integer
parameter FPS3_SEL = 0; //0~7,integer,step=1/8
parameter DUTY3_SEL = 4; //0~127,integer
parameter FDUTY3_SEL = 0; //"TRUE"; "FALSE" //0~7,integer
parameter DYN_PD4_EN = "FALSE";//TRUE:PS4, FPS4, DUTY4, FDUTY4; FALSE: PS4_SEL, FPS4_SEL, DUTY4_SEL, FDUTY4_SEL
parameter PS4_SEL = 0; //0~127,integer
parameter FPS4_SEL = 0; //0~7,integer,step=1/8
parameter DUTY4_SEL = 4; //0~127,integer
parameter FDUTY4_SEL = 0; //0~7,integer,step=1/8
parameter DYN_PD5_EN = "FALSE";//TRUE:PS5, FPS5, DUTY5, FDUTY5; FALSE: PS5_SEL, FPS5_SEL, DUTY5_SEL, FDUTY5_SEL
parameter PS5_SEL = 0; //0~127,integer
parameter FPS5_SEL = 0; //0~7,integer,step=1/8
parameter DUTY5_SEL = 4; //0~127,integer
parameter FDUTY5_SEL = 0; //0~7,integer,step=1/8

parameter CLKFB_SEL = "CLKFBOUT"; //"CLKFBOUT", "CLKOUT0","CLKOUT1","CLKOUT2","CLKOUT3","CLKOUT4","CLKOUT5";
parameter CLKOUT4_CASCADE_SEL = 1'b0; //1'b0: select vco as input; 1'b1: select C5 as odiv4 input
parameter CLKOUT0_BYPASS = "FALSE";  //"TRUE"; "FALSE"
parameter CLKOUT1_BYPASS = "FALSE";  //"TRUE"; "FALSE"
parameter CLKOUT2_BYPASS = "FALSE";  //"TRUE"; "FALSE"
parameter CLKOUT3_BYPASS = "FALSE";  //"TRUE"; "FALSE"
parameter CLKOUT4_BYPASS = "FALSE";  //"TRUE"; "FALSE"
parameter CLKOUT5_BYPASS = "FALSE";  //"TRUE"; "FALSE"

endmodule


//DLL
module DLL (STEP, LOCK, UPDNCNTL, STOP, CLKIN, RESET) /* synthesis syn_black_box  */;

input CLKIN;
input STOP;
input UPDNCNTL;
input RESET;

output [7:0]STEP;
output LOCK;

parameter DLL_FORCE = 0;//1: force lock and code; 0: code/lock generated from DLL loop
parameter CODESCAL="000";//001 010 011 100 101 110 111
parameter SCAL_EN="true";//true,false
parameter DIV_SEL = 1'b0; // 1'b0,normal lock mode; 1'b1,fast lock mode

endmodule

// DLLDLY
module DLLDLY (CLKOUT, FLAG, DLLSTEP, LOADN, MOVE, DIR, CLKIN)  /* synthesis syn_black_box  */;

input CLKIN;
input [7:0] DLLSTEP;
input DIR,LOADN,MOVE;
output CLKOUT;
output FLAG;

parameter DLL_INSEL = 1'b0; //1'b0:bypass mode, 1'b1: use dll_delay cell
parameter DLY_SIGN = 1'b0; // 1'b0:'+',  1'b1: '-'
parameter DLY_ADJ = 0; // 0~255, dly_sign=0 :dly_adj; dly_sign=1: -256+dly_adj

endmodule

// CLKDIV
module CLKDIV(CLKOUT, CALIB, HCLKIN, RESETN) /* synthesis syn_black_box  */; 

input HCLKIN;
input RESETN;
input CALIB;
output CLKOUT;

parameter DIV_MODE = "2"; //"2", "3.5", "4", "5", "8"
parameter GSREN = "false"; //"false", "true"

endmodule

//DHCEN
module DHCEN (CLKOUT, CLKIN, CE) /* synthesis syn_black_box  */;

input CLKIN,CE;
output CLKOUT;

endmodule

//OSCG
//Fosc = 250M/FREQ_DIV
module OSCG (OSCOUT, OSCEN) /* synthesis syn_black_box  */;
parameter  FREQ_DIV = 100; // 2~128,only even num
output OSCOUT;
input OSCEN;
endmodule

// DQS
module DQS(DQSR90, DQSW0, DQSW270, RPOINT, WPOINT, RVALID, RBURST, RFLAG, WFLAG, DQSIN, DLLSTEP, WSTEP, READ, RLOADN, RMOVE, RDIR, WLOADN, WMOVE, WDIR, HOLD, RCLKSEL, PCLK, FCLK, RESET) /* synthesis syn_black_box  */;

input DQSIN,PCLK,FCLK,RESET;
input [3:0] READ;
input [2:0] RCLKSEL;
input [7:0] DLLSTEP;
input [7:0] WSTEP;
input RLOADN, RMOVE, RDIR, WLOADN, WMOVE, WDIR, HOLD;
output DQSR90, DQSW0, DQSW270; 
output [2:0] RPOINT, WPOINT;
output RVALID,RBURST, RFLAG, WFLAG;

parameter FIFO_MODE_SEL = 1'b0; // FIFO mode select,1'b0: DDR memory mode;1'b1: GDDR mode
parameter RD_PNTR = 3'b000; // FIFO read pointer setting
parameter DQS_MODE = "X1"; // "X1", "X2_DDR2", "X2_DDR3","X4","X2_DDR3_EXT"
parameter HWL = "false";     //"true"; "false"
parameter GSREN = "false"; //false, true

endmodule


//AE350_SOC
module AE350_SOC (
            POR_N,          //Power on reset, 0 is reset state
            HW_RSTN,        //Hardware reset input, 0 is reset state
            CORE_CLK,       //CPU core clock, up to 1GHz, dedicated clock path.        
            //ADD DDR_CLK AND DDR_CE
            DDR_CLK,        //DDR bus clock in, up to 250MHz
            AHB_CLK,        //AHB bus clock in, up to 250MHz
            APB_CLK,        //APB bus clock in, up to 250MHz
            DBG_TCK,        //JTAG tck clock input
            RTC_CLK,        //RTC clock input, this clock should be alive while CPU waiting for wake up
            CORE_CE,        //CPU core_clk enable. CPU clock is gated when 0.
            AXI_CE,         //Internal AXI bus clock enable, gated when 0.
            DDR_CE,         //DDR bus clock enable, gated when 0.
            AHB_CE,         //AHB bus clock enable, gated when 0.
            APB_CE,         //APB bus and peripherals clock enable, gated when 0.
            APB2AHB_CE,     //APB to AHB clock valid enable. 1 when apb_clk_in = ahb_clk_in. 
            PRESETN,        //apb_clk_in synced reset_n output
            HRESETN,        //ahb_clk_in synced reset_n output
            //ADD DDR_RSTN
            DDR_RSTN,       //ddr_clk_in synced reset_n output
            
            GP_INT,         //16 user interrupt input.
            DMA_REQ,        //8 dma requests input.
            DMA_ACK,        //8 dma ack output.

            CORE0_WFI_MODE, //CPU going into WFI mode, posedge is WFI valid
            WAKEUP_IN,      //input to wake up CPU, 0 is wake up
            RTC_WAKEUP,     //Output to wake up RTC clock, 1 is wake up
            SCAN_TEST,      //scan test, to SPI and clock gen
            SCAN_EN,        //scan enable, to SPI and clock gen
            TEST_CLK,       //Test mode clock
            TEST_MODE,      //Test mode, 1 is enable
            TEST_RSTN,      //Test mode resetn, 0 is reset state
            //AHB PORT FOR ROM       
            ROM_HADDR ,     //rom AHB address 
            ROM_HRDATA,     //rom AHB read data
            ROM_HREADY,     //rom AHB hready
            ROM_HRESP ,     //rom AHB hresp
            ROM_HTRANS,     //rom AHB htrans control 
            ROM_HWRITE,     //rom AHB hwrite control
            //APB PORT FOR FABRIC
            APB_PADDR    ,  //APB signals
            APB_PENABLE  ,
            APB_PRDATA   ,
            APB_PREADY   ,
            APB_PSEL     ,
            APB_PWDATA   ,
            APB_PWRITE   ,
            APB_PSLVERR  ,
            APB_PPROT    ,
            APB_PSTRB    ,
            //EXT AHB SLV PORT(MCU BUS IS MASTER)
            EXTS_HRDATA,    //EXT AHB slave read data
            EXTS_HREADYIN,  //EXT AHB slave ready input
            EXTS_HRESP,     //EXT AHB slave read response
            EXTS_HADDR,     //EXT AHB slave address
            EXTS_HBURST,    //EXT AHB slave burst
            EXTS_HPROT,     //EXT AHB slave prot
            EXTS_HSEL,      //EXT AHB slave select
            EXTS_HSIZE,     //EXT AHB slave size
            EXTS_HTRANS,    //EXT AHB slave trans
            EXTS_HWDATA,    //EXT AHB slave write data
            EXTS_HWRITE,    //EXT AHB slave write control
            //EXT AHB MST PORT(MCU BUS IS SLAVE)
            EXTM_HADDR,     //EXT AHB master address input
            EXTM_HBURST,    //EXT AHB master burst input
            EXTM_HPROT,     //EXT AHB master prot input
            EXTM_HRDATA,    //EXT AHB master read data output
            EXTM_HREADY,    //EXT AHB master ready input
            EXTM_HREADYOUT, //EXT AHB master ready output
            EXTM_HRESP,     //EXT AHB master read response output
            EXTM_HSEL,      //EXT AHB master select input
            EXTM_HSIZE,     //EXT AHB master size input
            EXTM_HTRANS,    //EXT AHB master trans input
            EXTM_HWDATA,    //EXT AHB master write data input
            EXTM_HWRITE,    //EXT AHB master write control input
            //SRAM PORT FOR FABRIC
            DDR_HADDR,      //ddr/sram AHB access address
            DDR_HBURST,     //ddr/sram AHB burst
            DDR_HPROT,      //ddr/sram AHB prot
            DDR_HRDATA,     //ddr/sram AHB read data
            DDR_HREADY,     //ddr/sram AHB ready
            DDR_HRESP,      //ddr/sram AHB response
            DDR_HSIZE,      //ddr/sram AHB size
            DDR_HTRANS,     //ddr/sram AHB trans
            DDR_HWDATA,     //ddr/sram AHB write data
            DDR_HWRITE,     //ddr/sram AHB write control

            //JTAG
            TMS_IN,     //JTAG tms input
            TRST_IN,    //JTAG trst input
            TDI_IN,     //JTAG tdi input
            TDO_OUT,    //JTAG tdo output
            TDO_OE,     //JTAG tdo_en output
            
            //SPI
            SPI2_HOLDN_IN,  //SPI hold
            SPI2_WPN_IN,    //SPI wpn
            SPI2_CLK_IN,    //SPI clk_in
            SPI2_CSN_IN,    //SPI csn_in
            SPI2_MISO_IN,   //SPI miso_in
            SPI2_MOSI_IN,   //SPI mosi_in
            SPI2_HOLDN_OUT, //SPI holdn_out
            SPI2_HOLDN_OE,  //SPI holdn out enable
            SPI2_WPN_OUT,   //SPI wpn_out
            SPI2_WPN_OE,    //SPI wpn out enable
            SPI2_CLK_OUT,   //SPI clk_out
            SPI2_CLK_OE,    //SPI clk out enable
            SPI2_CSN_OUT,   //SPI csn_out
            SPI2_CSN_OE,    //SPI csn out enable
            SPI2_MISO_OUT,  //SPI miso_out
            SPI2_MISO_OE,   //SPI miso out enable
            SPI2_MOSI_OUT,  //SPI mosi_out
            SPI2_MOSI_OE,   //SPI mosi out enable
            //I2C
            I2C_SCL_IN,     //I2C SCL input
            I2C_SDA_IN,     //I2C SDA input
            I2C_SCL,        //I2C SCL output
            I2C_SDA,        //I2C SDA output
            //UART1
            UART1_TXD,      //UART1 txd
            UART1_RTSN,     //UART1 rtsn
            UART1_RXD,      //UART1 rxd
            UART1_CTSN,     //UART1 ctsn
            UART1_DSRN,     //UART1 dsrn
            UART1_DCDN,     //UART1 dcdn
            UART1_RIN,      //UART1 rin
            UART1_DTRN,     //UART1 dtrn
            UART1_OUT1N,    //UART1 out1n
            UART1_OUT2N,    //UART1 out2n
            //UART2
            UART2_TXD,      //UART2 txd
            UART2_RTSN,     //UART2 rtsn
            UART2_RXD,      //UART2 rxd
            UART2_CTSN,     //UART2 ctsn
            UART2_DCDN,     //UART2 dcdn
            UART2_DSRN,     //UART2 dsrn
            UART2_RIN,      //UART2 rin
            UART2_DTRN,     //UART2 dtrn
            UART2_OUT1N,    //UART2 _out1n
            UART2_OUT2N,    //UART2 out2n
            //PIT
            CH0_PWM,        //Channel 0 output
            CH0_PWMOE,      //Channel 0 output enable
            CH1_PWM,        //Channel 1 output
            CH1_PWMOE,      //Channel 1 output enable
            CH2_PWM,        //Channel 2 output
            CH2_PWMOE,      //Channel 2 output enable
            CH3_PWM,        //Channel 3 output
            CH3_PWMOE,      //Channel 3 output enable
            //GPIO
            GPIO_IN,        //GPIO input
            GPIO_OE,        //GPIO output enable
            GPIO_OUT        //GPIO output
)/* synthesis syn_black_box  */;


input               POR_N;
input               HW_RSTN;
input               CORE_CLK;
input               DDR_CLK;
input               AHB_CLK;
input               APB_CLK;
input               DBG_TCK;
input               RTC_CLK;
input               CORE_CE;
input               AXI_CE;
input               DDR_CE;
input               AHB_CE;
input     [7:0]     APB_CE;
input               APB2AHB_CE;
input               SCAN_TEST;
input               SCAN_EN;
output              PRESETN;
output              HRESETN;
//ADD DDR_RSTN
output              DDR_RSTN;

input       [15:0]  GP_INT;
input       [ 7:0]  DMA_REQ;
output      [ 7:0]  DMA_ACK;

output              CORE0_WFI_MODE;
input               WAKEUP_IN;           
output              RTC_WAKEUP;           

input               TEST_CLK;
input               TEST_MODE;
input               TEST_RSTN;
//AHB PORT FOR ROM, ONLY READ, NO SIZE NO BURST NO SEL
output  [31:0]      ROM_HADDR;
input   [31:0]      ROM_HRDATA;
input               ROM_HREADY;
input               ROM_HRESP;
output   [1:0]      ROM_HTRANS;
output              ROM_HWRITE;
//APB PORT FOR FABRIC
output  [31:0]      APB_PADDR;
output              APB_PENABLE;
input   [31:0]      APB_PRDATA;
input               APB_PREADY;
output              APB_PSEL;
output  [31:0]      APB_PWDATA;
output              APB_PWRITE;
input               APB_PSLVERR;
output   [2:0]      APB_PPROT;
output   [3:0]      APB_PSTRB;
//EXT AHB SLV PORT(MCU BUS IS MASTER)
input   [31:0]      EXTS_HRDATA;
input               EXTS_HREADYIN;
input               EXTS_HRESP;
output  [31:0]      EXTS_HADDR;
output   [2:0]      EXTS_HBURST;
output   [3:0]      EXTS_HPROT;
output              EXTS_HSEL;
output   [2:0]      EXTS_HSIZE;
output   [1:0]      EXTS_HTRANS;
output  [31:0]      EXTS_HWDATA;
output              EXTS_HWRITE;
//EXT AHB MST PORT(MCU BUS IS SLAVE)
input   [31:0]      EXTM_HADDR;
input    [2:0]      EXTM_HBURST;
input    [3:0]      EXTM_HPROT;
output  [63:0]      EXTM_HRDATA;
input               EXTM_HREADY;
output              EXTM_HREADYOUT;
output              EXTM_HRESP;
input               EXTM_HSEL;
input    [2:0]      EXTM_HSIZE;
input    [1:0]      EXTM_HTRANS;
input   [63:0]      EXTM_HWDATA;
input               EXTM_HWRITE;
//SRAM PORT FOR FABRIC
output  [31:0]      DDR_HADDR;
output   [2:0]      DDR_HBURST;
output   [3:0]      DDR_HPROT;
input   [63:0]      DDR_HRDATA;
input               DDR_HREADY;
input               DDR_HRESP;
output   [2:0]      DDR_HSIZE;
output   [1:0]      DDR_HTRANS;
output  [63:0]      DDR_HWDATA;
output              DDR_HWRITE;

//GENERAL PINS
input               TMS_IN;           
input               TRST_IN;
input               TDI_IN;
output              TDO_OUT;
output              TDO_OE;


input               SPI2_HOLDN_IN;
input               SPI2_WPN_IN;
input               SPI2_CLK_IN;
input               SPI2_CSN_IN;
input               SPI2_MISO_IN;
input               SPI2_MOSI_IN;
output              SPI2_HOLDN_OUT;
output              SPI2_HOLDN_OE;
output              SPI2_WPN_OUT;
output              SPI2_WPN_OE;
output              SPI2_CLK_OUT;
output              SPI2_CLK_OE;
output              SPI2_CSN_OUT;
output              SPI2_CSN_OE;
output              SPI2_MISO_OUT;
output              SPI2_MISO_OE;
output              SPI2_MOSI_OUT;
output              SPI2_MOSI_OE;

input               I2C_SCL_IN;
input               I2C_SDA_IN;
output              I2C_SCL;
output              I2C_SDA;

output              UART1_TXD;
output              UART1_RTSN;
input               UART1_RXD;
input               UART1_CTSN;
input               UART1_DSRN;
input               UART1_DCDN;
input               UART1_RIN;
output              UART1_DTRN;
output              UART1_OUT1N;
output              UART1_OUT2N;

output              UART2_TXD;
output              UART2_RTSN;
input               UART2_RXD;
input               UART2_CTSN;
input               UART2_DCDN;
input               UART2_DSRN;
input               UART2_RIN;
output              UART2_DTRN;
output              UART2_OUT1N;
output              UART2_OUT2N;

output              CH0_PWM;
output              CH0_PWMOE;
output              CH1_PWM;
output              CH1_PWMOE;
output              CH2_PWM;
output              CH2_PWMOE;
output              CH3_PWM;
output              CH3_PWMOE;

input     [31:0]    GPIO_IN;
output    [31:0]    GPIO_OE;
output    [31:0]    GPIO_OUT;

/******************************************************************/

endmodule


//
//GTR6_PMAC
module GTR6_PMAC
  (
//add upar if
	input             UPAR_RDEN         ,
	input             UPAR_STAT_CLK     ,
	input             UPAR_WREN         ,
	output            UPAR_READY        ,
	input             UPAR_CLK          ,
	output  [31:0]    UPAR_RDDATA       ,
	input   [31:0]    UPAR_WRDATA       ,
	input             UPAR_SEL          ,
	input   [23:0]    UPAR_ADDR         ,
	input             UPAR_RST          ,
	output            UPAR_RDVLD        ,
//end add upar if
	input   [18:0]      APB_PADDR0                                                      ,
	input   [18:0]      APB_PADDR1                                                      ,
	input   [18:0]      APB_PADDR2                                                      ,
	input   [18:0]      APB_PADDR3                                                      ,
	input               APB_PENABLE0                                                    ,
	input               APB_PENABLE1                                                    ,
	input               APB_PENABLE2                                                    ,
	input               APB_PENABLE3                                                    ,
	output  [31:0]      APB_PRDATA0                                                     ,
	output  [31:0]      APB_PRDATA1                                                     ,
	output  [31:0]      APB_PRDATA2                                                     ,
	output  [31:0]      APB_PRDATA3                                                     ,
	output              APB_PREADY0                                                     ,
	output              APB_PREADY1                                                     ,
	output              APB_PREADY2                                                     ,
	output              APB_PREADY3                                                     ,
	input   [3:0]       APB_PSTRB0                                                      ,
	input   [3:0]       APB_PSTRB1                                                      ,
	input   [3:0]       APB_PSTRB2                                                      ,
	input   [3:0]       APB_PSTRB3                                                      ,
	input   [31:0]      APB_PWDATA0                                                     ,
	input   [31:0]      APB_PWDATA1                                                     ,
	input   [31:0]      APB_PWDATA2                                                     ,
	input   [31:0]      APB_PWDATA3                                                     ,
	input               APB_PWRITE0                                                     ,
	input               APB_PWRITE1                                                     ,
	input               APB_PWRITE2                                                     ,
	input               APB_PWRITE3                                                     ,
	input               FABRIC_CTRL_GATE_TL_CLK                                         ,
	input               FABRIC_PCLK_I                                                   ,
	input   [7:0]       FABRIC_PHY_ACKLOCAL                                             ,
	input   [7:0]       FABRIC_PHY_ACKLOCAL_H                                           ,
	input   [143:0]     FABRIC_PHY_ACKLOCALCOE                                          ,
	input   [143:0]     FABRIC_PHY_ACKLOCALCOE_H                                        ,
	input   [47:0]      FABRIC_PHY_EVALDIRCHNG                                          ,
	input   [47:0]      FABRIC_PHY_EVALDIRCHNG_H                                        ,
	input   [63:0]      FABRIC_PHY_EVALFFBFIGUREMERIT                                   ,
	input   [63:0]      FABRIC_PHY_EVALFFBFIGUREMERIT_H                                 ,
	output  [47:0]      FABRIC_PHY_FS                                                   ,
	output  [47:0]      FABRIC_PHY_FS_H                                                 ,
	output  [7:0]       FABRIC_PHY_INVALIDREQ                                           ,
	output  [7:0]       FABRIC_PHY_INVALIDREQ_H                                         ,
	output  [47:0]      FABRIC_PHY_LF                                                   ,
	output  [47:0]      FABRIC_PHY_LF_H                                                 ,
	input   [47:0]      FABRIC_PHY_LOCALFS                                              ,
	input   [47:0]      FABRIC_PHY_LOCALFS_H                                            ,
	input   [47:0]      FABRIC_PHY_LOCALLF                                              ,
	input   [47:0]      FABRIC_PHY_LOCALLF_H                                            ,
	output  [7:0]       FABRIC_PHY_REQLOCAL                                             ,
	output  [7:0]       FABRIC_PHY_REQLOCAL_H                                           ,
	output  [31:0]      FABRIC_PHY_REQLOCALIDX                                          ,
	output  [31:0]      FABRIC_PHY_REQLOCALIDX_H                                        ,
	output  [7:0]       FABRIC_PHY_RXEQEVAL                                             ,
	output  [7:0]       FABRIC_PHY_RXEQEVAL_H                                           ,
	output  [7:0]       FABRIC_PHY_RXEQINPROGRESS                                       ,
	output  [7:0]       FABRIC_PHY_RXEQINPROGRESS_H                                     ,
	output  [23:0]      FABRIC_PHY_RXPREHINT                                            ,
	output  [23:0]      FABRIC_PHY_RXPREHINT_H                                          ,
	output  [143:0]     FABRIC_PHY_TXDEEMPH                                             ,
	output  [143:0]     FABRIC_PHY_TXDEEMPH_H                                           ,
	output              FABRIC_PL_BLOCKALIGNCONTROL                                     ,
	output              FABRIC_PL_BLOCKALIGNCONTROL_H                                   ,
	input               FABRIC_PL_NPOR                                                  ,
	input               FABRIC_PL_PCLK_STOP                                             ,
	input   [7:0]       FABRIC_PL_PHYSTATUS                                             ,
	input   [7:0]       FABRIC_PL_PHYSTATUS_H                                           ,
	output  [1:0]       FABRIC_PL_POWERDOWN                                             ,
	output  [1:0]       FABRIC_PL_POWERDOWN_H                                           ,
	output  [1:0]       FABRIC_PL_RATE                                                  ,
	output  [1:0]       FABRIC_PL_RATE_H                                                ,
	input               FABRIC_PL_RSTN                                                  ,
	input               FABRIC_PL_RSTNP                                                 ,
	input   [127:0]     FABRIC_PL_RXDATA                                                ,
	input   [127:0]     FABRIC_PL_RXDATA_H                                              ,
	input   [15:0]      FABRIC_PL_RXDATAK                                               ,
	input   [15:0]      FABRIC_PL_RXDATAK_H                                             ,
	input   [7:0]       FABRIC_PL_RXDATAVALID                                           ,
	input   [7:0]       FABRIC_PL_RXDATAVALID_H                                         ,
	input   [7:0]       FABRIC_PL_RXELECIDLE                                            ,
	input   [7:0]       FABRIC_PL_RXELECIDLE_H                                          ,
	output  [7:0]       FABRIC_PL_RXPOLARITY                                            ,
	output  [7:0]       FABRIC_PL_RXPOLARITY_H                                          ,
	output  [7:0]       FABRIC_PL_RXSTANDBY                                             ,
	output  [7:0]       FABRIC_PL_RXSTANDBY_H                                           ,
	input   [7:0]       FABRIC_PL_RXSTARTBLOCK                                          ,
	input   [7:0]       FABRIC_PL_RXSTARTBLOCK_H                                        ,
	input   [23:0]      FABRIC_PL_RXSTATUS                                              ,
	input   [23:0]      FABRIC_PL_RXSTATUS_H                                            ,
	input   [15:0]      FABRIC_PL_RXSYNCHEADER                                          ,
	input   [15:0]      FABRIC_PL_RXSYNCHEADER_H                                        ,
	input   [7:0]       FABRIC_PL_RXVALID                                               ,
	input   [7:0]       FABRIC_PL_RXVALID_H                                             ,
	input               FABRIC_PL_SRST                                                  ,
	output  [7:0]       FABRIC_PL_TXCOMPLIANCE                                          ,
	output  [7:0]       FABRIC_PL_TXCOMPLIANCE_H                                        ,
	output  [127:0]     FABRIC_PL_TXDATA                                                ,
	output  [127:0]     FABRIC_PL_TXDATA_H                                              ,
	output  [15:0]      FABRIC_PL_TXDATAK                                               ,
	output  [15:0]      FABRIC_PL_TXDATAK_H                                             ,
	output  [7:0]       FABRIC_PL_TXDATAVALID                                           ,
	output  [7:0]       FABRIC_PL_TXDATAVALID_H                                         ,
	output  [7:0]       FABRIC_PL_TXDETECTRX                                            ,
	output  [7:0]       FABRIC_PL_TXDETECTRX_H                                          ,
	output  [7:0]       FABRIC_PL_TXELECIDLE                                            ,
	output  [7:0]       FABRIC_PL_TXELECIDLE_H                                          ,
	output  [2:0]       FABRIC_PL_TXMARGIN                                              ,
	output  [2:0]       FABRIC_PL_TXMARGIN_H                                            ,
	output  [7:0]       FABRIC_PL_TXSTARTBLOCK                                          ,
	output  [7:0]       FABRIC_PL_TXSTARTBLOCK_H                                        ,
	output              FABRIC_PL_TXSWING                                               ,
	output              FABRIC_PL_TXSWING_H                                             ,
	output  [15:0]      FABRIC_PL_TXSYNCHEADER                                          ,
	output  [15:0]      FABRIC_PL_TXSYNCHEADER_H                                        ,
	output  [1:0]       FABRIC_PL_WIDTH                                                 ,
	output  [1:0]       FABRIC_PL_WIDTH_H                                               ,
	output  [31:0]      FABRIC_TEST_BUS_MON                                             ,
	input               FABRIC_TL_CRST                                                  ,
	input               FABRIC_TL_CRSTN                                                 ,
	input               FABRIC_TL_NPOR                                                  ,
	input               FABRIC_TL_RSTN                                                  ,
	input               FABRIC_TL_RSTNP                                                 ,
	input               FABRIC_TL_SRST                                                  ,
	input               FPGA_DONE                                                       ,
	output  [19:0]      MAC_TL_RX_BARDEC0                                               ,
	output  [255:0]     MAC_TL_RX_DATA0                                                 ,
	output              MAC_TL_RX_EOP0                                                  ,
	output  [7:0]       MAC_TL_RX_ERR0                                                  ,
	input               MAC_TL_RX_MASKNP0                                               ,
	output  [15:0]      MAC_TL_RX_MCHIT0                                                ,
	output  [31:0]      MAC_TL_RX_PROT0                                                 ,
	output              MAC_TL_RX_SOP0                                                  ,
	output  [7:0]       MAC_TL_RX_VALID0                                                ,
	input               MAC_TL_RX_WAIT0                                                 ,
	output  [95:0]      MAC_TL_TX_CREDITS0                                              ,
	input   [255:0]     MAC_TL_TX_DATA0                                                 ,
	input               MAC_TL_TX_EOP0                                                  ,
	input   [7:0]       MAC_TL_TX_ERR0                                                  ,
	input   [31:0]      MAC_TL_TX_PROT0                                                 ,
	input               MAC_TL_TX_PROTACK0                                              ,
	output  [31:0]      MAC_TL_TX_PROTERR0                                              ,
	input               MAC_TL_TX_SOP0                                                  ,
	input               MAC_TL_TX_STREAM0                                               ,
	input   [7:0]       MAC_TL_TX_VALID0                                                ,
	output              MAC_TL_TX_WAIT0                                                 ,
	output              PCIE_CLK                                                        ,
	output              PCIE_DIV2_REG                                                   ,
	output              PCIE_HALF_CLK                                                   ,
	input               PL_CLKREQ_IN                                                    ,
	output              PL_CLKREQ_OEN                                                   ,
	output  [3:0]       PL_EXIT                                                         ,
	input               PL_LTSSM_ENABLE                                                 ,
	output  [4:0]       PL_LTSSM_O_SIM                                                  ,
	output              PL_PCLK_O_SIM                                                   ,
	output  [2:0]       PL_PCLK_RATE_O_SIM                                              ,
	input               PL_WAKE_IN                                                      ,
	output              PL_WAKE_OEN                                                     ,
	output              PMAC_LN_RSTN                                                    ,
	input               Q0_CLK_I                                                        ,
	input               Q0_CMU1_OK_O                                                    ,
	input               Q0_CMU_OK_O                                                     ,
	input   [3:0]       Q0_PHY_ACKLOCAL                                                 ,
	input   [71:0]      Q0_PHY_ACKLOCALCOE                                              ,
	input   [23:0]      Q0_PHY_EVALDIRCHNG                                              ,
	input   [31:0]      Q0_PHY_EVALFFBFIGUREMERIT                                       ,
	output  [3:0]       Q0_PHY_INVALIDREQ                                               ,
	input   [23:0]      Q0_PHY_LOCALFS                                                  ,
	input   [23:0]      Q0_PHY_LOCALLF                                                  ,
	output  [3:0]       Q0_PHY_REQLOCAL                                                 ,
	output  [15:0]      Q0_PHY_REQLOCALIDX                                              ,
	output  [3:0]       Q0_PHY_RXEQEVAL                                                 ,
	output  [11:0]      Q0_PHY_RXPREHINT                                                ,
	output  [71:0]      Q0_PHY_TXDEEMPH                                                 ,
	output              Q0_PL_BLOCKALIGNCONTROL                                         ,
	input   [3:0]       Q0_PL_PHYSTATUS                                                 ,
	output  [1:0]       Q0_PL_POWERDOWN                                                 ,
	output  [1:0]       Q0_PL_RATE                                                      ,
	input   [63:0]      Q0_PL_RXDATA                                                    ,
	input   [7:0]       Q0_PL_RXDATAK                                                   ,
	input   [3:0]       Q0_PL_RXDATAVALID                                               ,
	input   [3:0]       Q0_PL_RXELECIDLE                                                ,
	output  [3:0]       Q0_PL_RXPOLARITY                                                ,
	input   [3:0]       Q0_PL_RXSTARTBLOCK                                              ,
	input   [11:0]      Q0_PL_RXSTATUS                                                  ,
	input   [7:0]       Q0_PL_RXSYNCHEADER                                              ,
	input   [3:0]       Q0_PL_RXVALID                                                   ,
	output  [3:0]       Q0_PL_TXCOMPLIANCE                                              ,
	output  [63:0]      Q0_PL_TXDATA                                                    ,
	output  [7:0]       Q0_PL_TXDATAK                                                   ,
	output  [3:0]       Q0_PL_TXDATAVALID                                               ,
	output  [3:0]       Q0_PL_TXDETECTRX                                                ,
	output  [3:0]       Q0_PL_TXELECIDLE                                                ,
	output  [2:0]       Q0_PL_TXMARGIN                                                  ,
	output  [3:0]       Q0_PL_TXSTARTBLOCK                                              ,
	output              Q0_PL_TXSWING                                                   ,
	output  [7:0]       Q0_PL_TXSYNCHEADER                                              ,
	input   [11:0]      Q0_TBUS_DATA_O                                                  ,
	input               Q1_CLK_I                                                        ,
	input               Q1_CMU1_OK_O                                                    ,
	input               Q1_CMU_OK_O                                                     ,
	input   [3:0]       Q1_PHY_ACKLOCAL                                                 ,
	input   [71:0]      Q1_PHY_ACKLOCALCOE                                              ,
	input   [23:0]      Q1_PHY_EVALDIRCHNG                                              ,
	input   [31:0]      Q1_PHY_EVALFFBFIGUREMERIT                                       ,
	output  [3:0]       Q1_PHY_INVALIDREQ                                               ,
	input   [23:0]      Q1_PHY_LOCALFS                                                  ,
	input   [23:0]      Q1_PHY_LOCALLF                                                  ,
	output  [3:0]       Q1_PHY_REQLOCAL                                                 ,
	output  [15:0]      Q1_PHY_REQLOCALIDX                                              ,
	output  [3:0]       Q1_PHY_RXEQEVAL                                                 ,
	output  [11:0]      Q1_PHY_RXPREHINT                                                ,
	output  [71:0]      Q1_PHY_TXDEEMPH                                                 ,
	output              Q1_PL_BLOCKALIGNCONTROL                                         ,
	input   [3:0]       Q1_PL_PHYSTATUS                                                 ,
	output  [1:0]       Q1_PL_POWERDOWN                                                 ,
	output  [1:0]       Q1_PL_RATE                                                      ,
	input   [63:0]      Q1_PL_RXDATA                                                    ,
	input   [7:0]       Q1_PL_RXDATAK                                                   ,
	input   [3:0]       Q1_PL_RXDATAVALID                                               ,
	input   [3:0]       Q1_PL_RXELECIDLE                                                ,
	output  [3:0]       Q1_PL_RXPOLARITY                                                ,
	input   [3:0]       Q1_PL_RXSTARTBLOCK                                              ,
	input   [11:0]      Q1_PL_RXSTATUS                                                  ,
	input   [7:0]       Q1_PL_RXSYNCHEADER                                              ,
	input   [3:0]       Q1_PL_RXVALID                                                   ,
	output  [3:0]       Q1_PL_TXCOMPLIANCE                                              ,
	output  [63:0]      Q1_PL_TXDATA                                                    ,
	output  [7:0]       Q1_PL_TXDATAK                                                   ,
	output  [3:0]       Q1_PL_TXDATAVALID                                               ,
	output  [3:0]       Q1_PL_TXDETECTRX                                                ,
	output  [3:0]       Q1_PL_TXELECIDLE                                                ,
	output  [2:0]       Q1_PL_TXMARGIN                                                  ,
	output  [3:0]       Q1_PL_TXSTARTBLOCK                                              ,
	output              Q1_PL_TXSWING                                                   ,
	output  [7:0]       Q1_PL_TXSYNCHEADER                                              ,
	input   [11:0]      Q1_TBUS_DATA_O                                                  ,
	input               Q2_CLK_I                                                        ,
	input               Q2_CMU1_OK_O                                                    ,
	input               Q2_CMU_OK_O                                                     ,
	input   [3:0]       Q2_PHY_ACKLOCAL                                                 ,
	input   [71:0]      Q2_PHY_ACKLOCALCOE                                              ,
	input   [23:0]      Q2_PHY_EVALDIRCHNG                                              ,
	input   [31:0]      Q2_PHY_EVALFFBFIGUREMERIT                                       ,
	output  [3:0]       Q2_PHY_INVALIDREQ                                               ,
	input   [23:0]      Q2_PHY_LOCALFS                                                  ,
	input   [23:0]      Q2_PHY_LOCALLF                                                  ,
	output  [3:0]       Q2_PHY_REQLOCAL                                                 ,
	output  [15:0]      Q2_PHY_REQLOCALIDX                                              ,
	output  [3:0]       Q2_PHY_RXEQEVAL                                                 ,
	output  [11:0]      Q2_PHY_RXPREHINT                                                ,
	output  [71:0]      Q2_PHY_TXDEEMPH                                                 ,
	output              Q2_PL_BLOCKALIGNCONTROL                                         ,
	input   [3:0]       Q2_PL_PHYSTATUS                                                 ,
	output  [1:0]       Q2_PL_POWERDOWN                                                 ,
	output  [1:0]       Q2_PL_RATE                                                      ,
	input   [63:0]      Q2_PL_RXDATA                                                    ,
	input   [7:0]       Q2_PL_RXDATAK                                                   ,
	input   [3:0]       Q2_PL_RXDATAVALID                                               ,
	input   [3:0]       Q2_PL_RXELECIDLE                                                ,
	output  [3:0]       Q2_PL_RXPOLARITY                                                ,
	input   [3:0]       Q2_PL_RXSTARTBLOCK                                              ,
	input   [11:0]      Q2_PL_RXSTATUS                                                  ,
	input   [7:0]       Q2_PL_RXSYNCHEADER                                              ,
	input   [3:0]       Q2_PL_RXVALID                                                   ,
	output  [3:0]       Q2_PL_TXCOMPLIANCE                                              ,
	output  [63:0]      Q2_PL_TXDATA                                                    ,
	output  [7:0]       Q2_PL_TXDATAK                                                   ,
	output  [3:0]       Q2_PL_TXDATAVALID                                               ,
	output  [3:0]       Q2_PL_TXDETECTRX                                                ,
	output  [3:0]       Q2_PL_TXELECIDLE                                                ,
	output  [2:0]       Q2_PL_TXMARGIN                                                  ,
	output  [3:0]       Q2_PL_TXSTARTBLOCK                                              ,
	output              Q2_PL_TXSWING                                                   ,
	output  [7:0]       Q2_PL_TXSYNCHEADER                                              ,
	input   [11:0]      Q2_TBUS_DATA_O                                                  ,
	input               SCAN_EN                                                         ,
	input               SCAN_RST                                                        ,
	output  [511:0]     TEST_OUT_O_SIM                                                  ,
	input   [7:0]       TL_BRSW_IN                                                      ,
	output  [7:0]       TL_BRSW_OUT                                                     ,
	output  [18:0]      TL_CFGEXPADDR0                                                  ,
	output  [18:0]      TL_CFGEXPADDR1                                                  ,
	output  [18:0]      TL_CFGEXPADDR2                                                  ,
	output  [18:0]      TL_CFGEXPADDR3                                                  ,
	input   [31:0]      TL_CFGEXPRDATA0                                                 ,
	input   [31:0]      TL_CFGEXPRDATA1                                                 ,
	input   [31:0]      TL_CFGEXPRDATA2                                                 ,
	input   [31:0]      TL_CFGEXPRDATA3                                                 ,
	output              TL_CFGEXPREAD0                                                  ,
	output              TL_CFGEXPREAD1                                                  ,
	output              TL_CFGEXPREAD2                                                  ,
	output              TL_CFGEXPREAD3                                                  ,
	output  [3:0]       TL_CFGEXPSTRB0                                                  ,
	output  [3:0]       TL_CFGEXPSTRB1                                                  ,
	output  [3:0]       TL_CFGEXPSTRB2                                                  ,
	output  [3:0]       TL_CFGEXPSTRB3                                                  ,
	input               TL_CFGEXPVALID0                                                 ,
	input               TL_CFGEXPVALID1                                                 ,
	input               TL_CFGEXPVALID2                                                 ,
	input               TL_CFGEXPVALID3                                                 ,
	output  [31:0]      TL_CFGEXPWDATA0                                                 ,
	output  [31:0]      TL_CFGEXPWDATA1                                                 ,
	output  [31:0]      TL_CFGEXPWDATA2                                                 ,
	output  [31:0]      TL_CFGEXPWDATA3                                                 ,
	output              TL_CFGEXPWRITE0                                                 ,
	output              TL_CFGEXPWRITE1                                                 ,
	output              TL_CFGEXPWRITE2                                                 ,
	output              TL_CFGEXPWRITE3                                                 ,
	input               TL_CLKP                                                         ,
	input   [21:0]      TL_CLOCK_FREQ                                                   ,
	input   [64:0]      TL_FLR_ACK0                                                     ,
	input   [64:0]      TL_FLR_ACK1                                                     ,
	input   [64:0]      TL_FLR_ACK2                                                     ,
	input   [64:0]      TL_FLR_ACK3                                                     ,
	output  [64:0]      TL_FLR_REQ0                                                     ,
	output  [64:0]      TL_FLR_REQ1                                                     ,
	output  [64:0]      TL_FLR_REQ2                                                     ,
	output  [64:0]      TL_FLR_REQ3                                                     ,
	output              TL_INT_ACK0                                                     ,
	output              TL_INT_ACK1                                                     ,
	output              TL_INT_ACK2                                                     ,
	output              TL_INT_ACK3                                                     ,
	input   [4:0]       TL_INT_MSINUM0                                                  ,
	input   [4:0]       TL_INT_MSINUM1                                                  ,
	input   [4:0]       TL_INT_MSINUM2                                                  ,
	input   [4:0]       TL_INT_MSINUM3                                                  ,
	input   [3:0]       TL_INT_PINCONTROL                                               ,
	output  [3:0]       TL_INT_PINSTATE                                                 ,
	input               TL_INT_REQ0                                                     ,
	input               TL_INT_REQ1                                                     ,
	input               TL_INT_REQ2                                                     ,
	input               TL_INT_REQ3                                                     ,
	input               TL_INT_STATUS0                                                  ,
	input               TL_INT_STATUS1                                                  ,
	input               TL_INT_STATUS2                                                  ,
	input               TL_INT_STATUS3                                                  ,
	input   [6:0]       TL_INT_VFNUM0                                                   ,
	input   [6:0]       TL_INT_VFNUM1                                                   ,
	input   [6:0]       TL_INT_VFNUM2                                                   ,
	input   [6:0]       TL_INT_VFNUM3                                                   ,
	input               TL_PM_AUXPWR                                                    ,
	input   [7:0]       TL_PM_BWCHANGE                                                  ,
	input               TL_PM_CLKCONTROL                                                ,
	output  [3:0]       TL_PM_CLKSTATUS                                                 ,
	input   [9:0]       TL_PM_DATA0                                                     ,
	input   [9:0]       TL_PM_DATA1                                                     ,
	input   [9:0]       TL_PM_DATA2                                                     ,
	input   [9:0]       TL_PM_DATA3                                                     ,
	input               TL_PM_EVENT0                                                    ,
	input               TL_PM_EVENT1                                                    ,
	input               TL_PM_EVENT2                                                    ,
	input               TL_PM_EVENT3                                                    ,
	input   [3:0]       TL_PM_OBFFCONTROL                                               ,
	output  [3:0]       TL_PM_OBFFSTATUS                                                ,
	input               TL_PM_TOCONTROL                                                 ,
	output              TL_PM_TOSTATUS                                                  ,
	input   [64:0]      TL_REPORT_CPLPENDING0                                           ,
	input   [64:0]      TL_REPORT_CPLPENDING1                                           ,
	input   [64:0]      TL_REPORT_CPLPENDING2                                           ,
	input   [64:0]      TL_REPORT_CPLPENDING3                                           ,
	input   [38:0]      TL_REPORT_ERROR0                                                ,
	input   [38:0]      TL_REPORT_ERROR1                                                ,
	input   [38:0]      TL_REPORT_ERROR2                                                ,
	input   [38:0]      TL_REPORT_ERROR3                                                ,
	output  [7:0]       TL_REPORT_EVENT                                                 ,
	input   [255:0]     TL_REPORT_HEADER0                                               ,
	input   [255:0]     TL_REPORT_HEADER1                                               ,
	input   [255:0]     TL_REPORT_HEADER2                                               ,
	input   [255:0]     TL_REPORT_HEADER3                                               ,
	input   [7:0]       TL_REPORT_HOTPLUG                                               ,
	input   [32:0]      TL_REPORT_LATENCY                                               ,
	input   [7:0]       TL_REPORT_STATE0                                                ,
	input   [7:0]       TL_REPORT_STATE1                                                ,
	input   [7:0]       TL_REPORT_STATE2                                                ,
	input   [7:0]       TL_REPORT_STATE3                                                ,
	output  [3:0]       TL_REPORT_TIMER                                                 ,
	output  [19:0]      TL_RX_BARDEC0                                                   ,
	output  [255:0]     TL_RX_DATA0                                                     ,
	output              TL_RX_EOP0                                                      ,
	output  [7:0]       TL_RX_ERR0                                                      ,
	input               TL_RX_MASKNP0                                                   ,
	output  [15:0]      TL_RX_MCHIT0                                                    ,
	output  [31:0]      TL_RX_PROT0                                                     ,
	output              TL_RX_SOP0                                                      ,
	output  [7:0]       TL_RX_VALID0                                                    ,
	input               TL_RX_WAIT0                                                     ,
	output  [95:0]      TL_TX_CREDITS0                                                  ,
	input   [255:0]     TL_TX_DATA0                                                     ,
	input               TL_TX_EOP0                                                      ,
	input   [7:0]       TL_TX_ERR0                                                      ,
	input   [31:0]      TL_TX_PROT0                                                     ,
	input               TL_TX_PROTACK0                                                  ,
	output  [31:0]      TL_TX_PROTERR0                                                  ,
	input               TL_TX_SOP0                                                      ,
	input               TL_TX_STREAM0                                                   ,
	input   [7:0]       TL_TX_VALID0                                                    ,
	output              TL_TX_WAIT0                                                     ,
	output  [12:0]      TLCFG_BUSDEV                                                    ,
	output  [8191:0]    TLCFG_REGS0_SIM                                                 ,
	output  [8191:0]    TLCFG_REGS1_SIM                                                 ,
	output  [8191:0]    TLCFG_REGS2_SIM                                                 ,
	output  [8191:0]    TLCFG_REGS3_SIM                                                 
    )/* synthesis syn_black_box  */;
//End of module defin
//parameter in csr
parameter   [31:0]  P_BUS_TEST_CFG_REG_I                            =   32'h0;
parameter           P_GEARBOX_MAC_I_UPSPEED_CFG_BYPASS_MODE         =   1'h0;
parameter           P_GEARBOX_MAC_O_DOWNSPEED_CFG_BYPASS_MODE       =   1'h0;
parameter           P_GEARBOX_MAC_O_DOWNSPEED_TEST_CFG_BYPASS_MODE  =   1'h0;
parameter   [227:0] P_K_BAR0                                        =   228'hfffff001ffffffffffff000c00000000fff00000;
parameter   [227:0] P_K_BAR1                                        =   228'h0;
parameter   [227:0] P_K_BAR2                                        =   228'h0;
parameter   [227:0] P_K_BAR3                                        =   228'h0;
parameter   [255:0] P_K_EQUPRESET                                   =   256'h0;
parameter   [127:0] P_K_EQUPRESET16                                 =   128'hf0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0;
parameter   [63:0]  P_K_GEN                                         =   64'he201f800613;
parameter   [95:0]  P_K_LMR                                         =   96'h700000005321f2034;
parameter   [287:0] P_K_PCICONF0                                    =   288'h80000051fe000000000000000000000011001550;
parameter   [287:0] P_K_PCICONF1                                    =   288'h0;
parameter   [287:0] P_K_PCICONF2                                    =   288'h0;
parameter   [287:0] P_K_PCICONF3                                    =   288'h0;
parameter   [383:0] P_K_PEXCONF                                     =   384'h28001fd2d0dca500399ff080002000000000000000000000000c000000080000000003;
parameter   [63:0]  P_K_PIPE                                        =   64'h3f008701131c0000;
parameter   [95:0]  P_K_RX_CRED                                     =   96'h230023003501a8;
parameter   [255:0] P_K_SRIOV0                                      =   256'hffffffffffff000c00000000fff000000000000000001100;
parameter   [255:0] P_K_SRIOV1                                      =   256'h0;
parameter   [255:0] P_K_SRIOV2                                      =   256'h0;
parameter   [255:0] P_K_SRIOV3                                      =   256'h0;
parameter   [1:0]   P_MAC_CFG_I_SIGNAL_HPO_SEL                      =   2'h0;
parameter   [1:0]   P_MAC_CFG_I_SIGNAL_LPO_SEL                      =   2'h1;
parameter           P_MAC_CFG_PL_CLKREQ_IN_OVR                      =   1'h0;
parameter           P_MAC_CFG_PL_CLKREQ_IN_VAL                      =   1'h0;
parameter           P_MAC_CFG_PL_LTSSM_ENABLE_OVR                   =   1'h0;
parameter           P_MAC_CFG_PL_LTSSM_ENABLE_VAL                   =   1'h0;
parameter   [7:0]   P_MAC_CFG_PL_PCLK_CHANGE_OK                     =   8'h0;
parameter           P_MAC_CFG_PL_PLL_ACK                            =   1'h0;
parameter           P_MAC_CFG_PL_WAKE_IN_OVR                        =   1'h0;
parameter           P_MAC_CFG_PL_WAKE_IN_VAL                        =   1'h0;
parameter   [31:0]  P_MAC_CFG_RESERVED0                             =   32'h0;
parameter   [7:0]   P_MAC_CFG_TEST_OUT_SEL                          =   8'h5;
parameter           P_MAC_CFG_TM_MODE                               =   1'h0;
parameter           P_MAC_CFG_USE_NP_BUF                            =   1'h0;
parameter           P_MAC_EQ_CFG_K_FINETUNE                         =   1'h1;
parameter   [1:0]   P_MAC_EQ_CFG_K_FINETUNE_ERR                     =   2'h0;
parameter   [5:0]   P_MAC_EQ_CFG_K_FINETUNE_MAX                     =   6'h4;
parameter           P_MAC_EQ_CFG_K_PHYPARAM_QUERY                   =   1'h1;
parameter   [10:0]  P_MAC_EQ_CFG_K_PRESET_TO_USE                    =   11'h0;
parameter           P_MAC_EQ_CFG_K_QUERY_TIMEOUT                    =   1'h0;
parameter           P_MAC_EQ_CFG_PHY_LOCALFS_OVR_B                  =   1'h0;
parameter   [47:0]  P_MAC_EQ_CFG_PHY_LOCALFS_VAL                    =   48'h1b;
parameter           P_MAC_EQ_CFG_PHY_LOCALLF_OVR_B                  =   1'h0;
parameter   [47:0]  P_MAC_EQ_CFG_PHY_LOCALLF_VAL                    =   48'h9;
parameter           P_MEM_CFG_SHUTDOWN                              =   1'h0;
parameter           P_MEM_CFG_SLEEP                                 =   1'h0;
parameter   [1:0]   P_PCIE_CFG_CLK_SEL                              =   2'h1;
parameter           P_PCIE_CFG_HALF_CLK_SEL                         =   1'h0;
parameter           P_PMAC_CFG_GBD_RSTB                             =   1'h0;
parameter           P_PMAC_CFG_GBD_TEST_RSTB                        =   1'h1;
parameter           P_PMAC_CFG_GBU_RSTB                             =   1'h0;
parameter   [3:0]   P_PMAC_CFG_LN_RST_CFG                           =   4'h2;
parameter   [1:0]   P_PMAC_CFG_PL_PCLK_STOP                         =   2'h0;
parameter   [4:0]   P_PMAC_CFG_PL_RST_CTL                           =   5'h0;
parameter   [3:0]   P_PMAC_CFG_PL_RST_OVR                           =   4'h0;
parameter   [3:0]   P_PMAC_CFG_PL_RST_VAL                           =   4'h0;
parameter   [1:0]   P_PMAC_CFG_TL_CLK_GATE_CTL                      =   2'h0;
parameter   [7:0]   P_PMAC_CFG_TL_RST_CTL                           =   8'h0;
parameter   [5:0]   P_PMAC_CFG_TL_RST_OVR                           =   6'h0;
parameter   [5:0]   P_PMAC_CFG_TL_RST_VAL                           =   6'h0;
parameter   [1:0]   P_Q0_CFG_PCIE_I_SIGNAL_PO_SEL                   =   2'h1;
parameter   [1:0]   P_Q1_CFG_PCIE_I_SIGNAL_PO_SEL                   =   2'h0;
parameter   [1:0]   P_Q2_CFG_PCIE_I_SIGNAL_PO_SEL                   =   2'h2;
parameter   [1:0]   P_TBUS_MON_CFG_SEL                              =   2'h0;
parameter   [63:0]  P_TEST_IN                                       =   64'h4000000000084019;

//
endmodule

//
//GTR6_QUAD
module GTR6_QUAD
  (
//add upar if
	input             UPAR_RDEN         ,
	input             UPAR_STAT_CLK     ,
	input             UPAR_WREN         ,
	output            UPAR_READY        ,
	input             UPAR_CLK          ,
	output  [31:0]    UPAR_RDDATA       ,
	input   [31:0]    UPAR_WRDATA       ,
	input             UPAR_SEL          ,
	input   [23:0]    UPAR_ADDR         ,
	input             UPAR_RST          ,
	output            UPAR_RDVLD        ,
//end add upar if
	input   [12:0]      AHB_ADDR_I                                                      ,
	output  [7:0]       AHB_RDATA_O                                                     ,
	output              AHB_READY_O                                                     ,
	input               AHB_SEL_I                                                       ,
	input   [7:0]       AHB_WDATA_I                                                     ,
	input   [7:0]       AHB_WMASK_I                                                     ,
	input               AHB_WRITE_I                                                     ,
	output              ATEST_O                                                         ,
	input               CK_AHB_I                                                        ,
	output              DFT_PMA_CM_CLK_SOC_OUT                                          ,
	input               FABRIC_BURN_IN_I                                                ,
	input   [1:0]       FABRIC_CK_SOC_DIV_I                                             ,
	input   [1:0]       FABRIC_CLK_LIFE_DIV_I                                           ,
	output              FABRIC_CLK_MON_O                                                ,
	input               FABRIC_CLK_REF_CORE_I                                           ,
	output              FABRIC_CM1_LIFE_CLK_O                                           ,
	output              FABRIC_CM_LIFE_CLK_O                                            ,
	output              FABRIC_CMU0_CLK                                                 ,
	output              FABRIC_CMU1_CK_REF_O                                            ,
	output              FABRIC_CMU1_CLK                                                 ,
	input               FABRIC_CMU1_IDDQ_I                                              ,
	output              FABRIC_CMU1_OK_O                                                ,
	input               FABRIC_CMU1_PD_I                                                ,
	input               FABRIC_CMU1_RESETN_I                                            ,
	output              FABRIC_CMU_CK_REF_O                                             ,
	input               FABRIC_CMU_IDDQ_I                                               ,
	output              FABRIC_CMU_OK_O                                                 ,
	input               FABRIC_CMU_PD_I                                                 ,
	input               FABRIC_CMU_RESETN_I                                             ,
	input               FABRIC_EXT_CMU1_PORN_I                                          ,
	input               FABRIC_EXT_CMU_PORN_I                                           ,
	input               FABRIC_EXT_LN0_PORN_I                                           ,
	input               FABRIC_EXT_LN1_PORN_I                                           ,
	input               FABRIC_EXT_LN2_PORN_I                                           ,
	input               FABRIC_EXT_LN3_PORN_I                                           ,
	input               FABRIC_GLUE_MAC_INIT_INFO_I                                     ,
	output  [5:0]       FABRIC_LN0_ASTAT_O                                              ,
	output  [5:0]       FABRIC_LN0_ASTAT_O_H                                            ,
	output              FABRIC_LN0_BURN_IN_TOGGLE_O                                     ,
	input   [42:0]      FABRIC_LN0_CTRL_I                                               ,
	input   [42:0]      FABRIC_LN0_CTRL_I_H                                             ,
	input               FABRIC_LN0_IDDQ_I                                               ,
	input               FABRIC_LN0_JTAG_MUXIN_I                                         ,
	output              FABRIC_LN0_JTAG_OUT_NC_O                                        ,
	output              FABRIC_LN0_JTAG_OUT_NS_O                                        ,
	output              FABRIC_LN0_JTAG_OUT_PC_O                                        ,
	output              FABRIC_LN0_JTAG_OUT_PS_O                                        ,
	input   [2:0]       FABRIC_LN0_PD_I                                                 ,
	input   [2:0]       FABRIC_LN0_PD_I_H                                               ,
	output              FABRIC_LN0_PMA_RX_LOCK_O                                        ,
	input   [1:0]       FABRIC_LN0_RATE_I                                               ,
	input   [1:0]       FABRIC_LN0_RATE_I_H                                             ,
	input               FABRIC_LN0_RSTN_I                                               ,
	output              FABRIC_LN0_RX_VLD_OUT                                           ,
	output              FABRIC_LN0_RX_VLD_OUT_H                                         ,
	output  [19:0]      FABRIC_LN0_RXDATA_O                                             ,
	output  [19:0]      FABRIC_LN0_RXDATA_O_H                                           ,
	output              FABRIC_LN0_RXDET_STATUS_O                                       ,
	output  [52:0]      FABRIC_LN0_STAT_O                                               ,
	output  [52:0]      FABRIC_LN0_STAT_O_H                                             ,
	input               FABRIC_LN0_TX_VLD_IN                                            ,
	input               FABRIC_LN0_TX_VLD_IN_H                                          ,
	input   [19:0]      FABRIC_LN0_TXDATA_I                                             ,
	input   [19:0]      FABRIC_LN0_TXDATA_I_H                                           ,
	output  [5:0]       FABRIC_LN1_ASTAT_O                                              ,
	output  [5:0]       FABRIC_LN1_ASTAT_O_H                                            ,
	output              FABRIC_LN1_BURN_IN_TOGGLE_O                                     ,
	input   [42:0]      FABRIC_LN1_CTRL_I                                               ,
	input   [42:0]      FABRIC_LN1_CTRL_I_H                                             ,
	input               FABRIC_LN1_IDDQ_I                                               ,
	input               FABRIC_LN1_JTAG_MUXIN_I                                         ,
	output              FABRIC_LN1_JTAG_OUT_NC_O                                        ,
	output              FABRIC_LN1_JTAG_OUT_NS_O                                        ,
	output              FABRIC_LN1_JTAG_OUT_PC_O                                        ,
	output              FABRIC_LN1_JTAG_OUT_PS_O                                        ,
	input   [2:0]       FABRIC_LN1_PD_I                                                 ,
	input   [2:0]       FABRIC_LN1_PD_I_H                                               ,
	output              FABRIC_LN1_PMA_RX_LOCK_O                                        ,
	input   [1:0]       FABRIC_LN1_RATE_I                                               ,
	input   [1:0]       FABRIC_LN1_RATE_I_H                                             ,
	input               FABRIC_LN1_RSTN_I                                               ,
	output              FABRIC_LN1_RX_VLD_OUT                                           ,
	output              FABRIC_LN1_RX_VLD_OUT_H                                         ,
	output  [19:0]      FABRIC_LN1_RXDATA_O                                             ,
	output  [19:0]      FABRIC_LN1_RXDATA_O_H                                           ,
	output              FABRIC_LN1_RXDET_STATUS_O                                       ,
	output  [52:0]      FABRIC_LN1_STAT_O                                               ,
	output  [52:0]      FABRIC_LN1_STAT_O_H                                             ,
	input               FABRIC_LN1_TX_VLD_IN                                            ,
	input               FABRIC_LN1_TX_VLD_IN_H                                          ,
	input   [19:0]      FABRIC_LN1_TXDATA_I                                             ,
	input   [19:0]      FABRIC_LN1_TXDATA_I_H                                           ,
	output  [5:0]       FABRIC_LN2_ASTAT_O                                              ,
	output  [5:0]       FABRIC_LN2_ASTAT_O_H                                            ,
	output              FABRIC_LN2_BURN_IN_TOGGLE_O                                     ,
	input   [42:0]      FABRIC_LN2_CTRL_I                                               ,
	input   [42:0]      FABRIC_LN2_CTRL_I_H                                             ,
	input               FABRIC_LN2_IDDQ_I                                               ,
	input               FABRIC_LN2_JTAG_MUXIN_I                                         ,
	output              FABRIC_LN2_JTAG_OUT_NC_O                                        ,
	output              FABRIC_LN2_JTAG_OUT_NS_O                                        ,
	output              FABRIC_LN2_JTAG_OUT_PC_O                                        ,
	output              FABRIC_LN2_JTAG_OUT_PS_O                                        ,
	input   [2:0]       FABRIC_LN2_PD_I                                                 ,
	input   [2:0]       FABRIC_LN2_PD_I_H                                               ,
	output              FABRIC_LN2_PMA_RX_LOCK_O                                        ,
	input   [1:0]       FABRIC_LN2_RATE_I                                               ,
	input   [1:0]       FABRIC_LN2_RATE_I_H                                             ,
	input               FABRIC_LN2_RSTN_I                                               ,
	output              FABRIC_LN2_RX_VLD_OUT                                           ,
	output              FABRIC_LN2_RX_VLD_OUT_H                                         ,
	output  [19:0]      FABRIC_LN2_RXDATA_O                                             ,
	output  [19:0]      FABRIC_LN2_RXDATA_O_H                                           ,
	output              FABRIC_LN2_RXDET_STATUS_O                                       ,
	output  [52:0]      FABRIC_LN2_STAT_O                                               ,
	output  [52:0]      FABRIC_LN2_STAT_O_H                                             ,
	input               FABRIC_LN2_TX_VLD_IN                                            ,
	input               FABRIC_LN2_TX_VLD_IN_H                                          ,
	input   [19:0]      FABRIC_LN2_TXDATA_I                                             ,
	input   [19:0]      FABRIC_LN2_TXDATA_I_H                                           ,
	output  [5:0]       FABRIC_LN3_ASTAT_O                                              ,
	output  [5:0]       FABRIC_LN3_ASTAT_O_H                                            ,
	output              FABRIC_LN3_BURN_IN_TOGGLE_O                                     ,
	input   [42:0]      FABRIC_LN3_CTRL_I                                               ,
	input   [42:0]      FABRIC_LN3_CTRL_I_H                                             ,
	input               FABRIC_LN3_IDDQ_I                                               ,
	input               FABRIC_LN3_JTAG_MUXIN_I                                         ,
	output              FABRIC_LN3_JTAG_OUT_NC_O                                        ,
	output              FABRIC_LN3_JTAG_OUT_NS_O                                        ,
	output              FABRIC_LN3_JTAG_OUT_PC_O                                        ,
	output              FABRIC_LN3_JTAG_OUT_PS_O                                        ,
	input   [2:0]       FABRIC_LN3_PD_I                                                 ,
	input   [2:0]       FABRIC_LN3_PD_I_H                                               ,
	output              FABRIC_LN3_PMA_RX_LOCK_O                                        ,
	input   [1:0]       FABRIC_LN3_RATE_I                                               ,
	input   [1:0]       FABRIC_LN3_RATE_I_H                                             ,
	input               FABRIC_LN3_RSTN_I                                               ,
	output              FABRIC_LN3_RX_VLD_OUT                                           ,
	output              FABRIC_LN3_RX_VLD_OUT_H                                         ,
	output  [19:0]      FABRIC_LN3_RXDATA_O                                             ,
	output  [19:0]      FABRIC_LN3_RXDATA_O_H                                           ,
	output              FABRIC_LN3_RXDET_STATUS_O                                       ,
	output  [52:0]      FABRIC_LN3_STAT_O                                               ,
	output  [52:0]      FABRIC_LN3_STAT_O_H                                             ,
	input               FABRIC_LN3_TX_VLD_IN                                            ,
	input               FABRIC_LN3_TX_VLD_IN_H                                          ,
	input   [19:0]      FABRIC_LN3_TXDATA_I                                             ,
	input   [19:0]      FABRIC_LN3_TXDATA_I_H                                           ,
	input               FABRIC_PD_REFCLK_DETECT_REQ_I                                   ,
	input               FABRIC_POR_N_I                                                  ,
	output              FABRIC_QUAD_CLK_RX                                              ,
	input   [2:0]       FABRIC_REFCLK1_INPUT_SEL_I                                      ,
	input   [3:0]       FABRIC_REFCLK_DET_OFFSET_I                                      ,
	output              FABRIC_REFCLK_DETECT_O                                          ,
	output              FABRIC_REFCLK_GATE_ACK_O                                        ,
	input               FABRIC_REFCLK_GATE_I                                            ,
	input   [2:0]       FABRIC_REFCLK_INPUT_SEL_I                                       ,
	input               FABRIC_REFCLK_OE_L_I                                            ,
	input               FABRIC_REFCLK_OE_R_I                                            ,
	input   [3:0]       FABRIC_REFCLK_OUTPUT_SEL_I                                      ,
	input               FABRIC_RXCLK_OE_L_I                                             ,
	input               FABRIC_RXCLK_OE_R_I                                             ,
	input               FPGA_DONE                                                       ,
	output              LANE0_ALIGN_LINK                                                ,
	input               LANE0_ALIGN_TRIGGER                                             ,
	input               LANE0_CHBOND_START                                              ,
	output  [1:0]       LANE0_CUR_DISP_O                                                ,
	output  [1:0]       LANE0_DEC_ERR_O                                                 ,
	output  [1:0]       LANE0_DISP_ERR_O                                                ,
	input               LANE0_FABRIC_C2I_CLK                                            ,
	input               LANE0_FABRIC_RX_CLK                                             ,
	input               LANE0_FABRIC_TX_CLK                                             ,
	output              LANE0_K_LOCK                                                    ,
	output              LANE0_PCS_RX_O_FABRIC_CLK                                       ,
	input               LANE0_PCS_RX_RST                                                ,
	output              LANE0_PCS_TX_O_FABRIC_CLK                                       ,
	input               LANE0_PCS_TX_RST                                                ,
	output              LANE0_RX_IF_FIFO_AEMPTY                                         ,
	output              LANE0_RX_IF_FIFO_EMPTY                                          ,
	input               LANE0_RX_IF_FIFO_RDEN                                           ,
	output  [5:0]       LANE0_RX_IF_FIFO_RDUSEWD                                        ,
	output              LANE0_TX_IF_FIFO_AFULL                                          ,
	output              LANE0_TX_IF_FIFO_FULL                                           ,
	output  [5:0]       LANE0_TX_IF_FIFO_WRUSEWD                                        ,
	output              LANE1_ALIGN_LINK                                                ,
	input               LANE1_ALIGN_TRIGGER                                             ,
	input               LANE1_CHBOND_START                                              ,
	output  [1:0]       LANE1_CUR_DISP_O                                                ,
	output  [1:0]       LANE1_DEC_ERR_O                                                 ,
	output  [1:0]       LANE1_DISP_ERR_O                                                ,
	input               LANE1_FABRIC_C2I_CLK                                            ,
	input               LANE1_FABRIC_RX_CLK                                             ,
	input               LANE1_FABRIC_TX_CLK                                             ,
	output              LANE1_K_LOCK                                                    ,
	output              LANE1_PCS_RX_O_FABRIC_CLK                                       ,
	input               LANE1_PCS_RX_RST                                                ,
	output              LANE1_PCS_TX_O_FABRIC_CLK                                       ,
	input               LANE1_PCS_TX_RST                                                ,
	output              LANE1_RX_IF_FIFO_AEMPTY                                         ,
	output              LANE1_RX_IF_FIFO_EMPTY                                          ,
	input               LANE1_RX_IF_FIFO_RDEN                                           ,
	output  [5:0]       LANE1_RX_IF_FIFO_RDUSEWD                                        ,
	output              LANE1_TX_IF_FIFO_AFULL                                          ,
	output              LANE1_TX_IF_FIFO_FULL                                           ,
	output  [5:0]       LANE1_TX_IF_FIFO_WRUSEWD                                        ,
	output              LANE2_ALIGN_LINK                                                ,
	input               LANE2_ALIGN_TRIGGER                                             ,
	input               LANE2_CHBOND_START                                              ,
	output  [1:0]       LANE2_CUR_DISP_O                                                ,
	output  [1:0]       LANE2_DEC_ERR_O                                                 ,
	output  [1:0]       LANE2_DISP_ERR_O                                                ,
	input               LANE2_FABRIC_C2I_CLK                                            ,
	input               LANE2_FABRIC_RX_CLK                                             ,
	input               LANE2_FABRIC_TX_CLK                                             ,
	output              LANE2_K_LOCK                                                    ,
	output              LANE2_PCS_RX_O_FABRIC_CLK                                       ,
	input               LANE2_PCS_RX_RST                                                ,
	output              LANE2_PCS_TX_O_FABRIC_CLK                                       ,
	input               LANE2_PCS_TX_RST                                                ,
	output              LANE2_RX_IF_FIFO_AEMPTY                                         ,
	output              LANE2_RX_IF_FIFO_EMPTY                                          ,
	input               LANE2_RX_IF_FIFO_RDEN                                           ,
	output  [5:0]       LANE2_RX_IF_FIFO_RDUSEWD                                        ,
	output              LANE2_TX_IF_FIFO_AFULL                                          ,
	output              LANE2_TX_IF_FIFO_FULL                                           ,
	output  [5:0]       LANE2_TX_IF_FIFO_WRUSEWD                                        ,
	output              LANE3_ALIGN_LINK                                                ,
	input               LANE3_ALIGN_TRIGGER                                             ,
	input               LANE3_CHBOND_START                                              ,
	output  [1:0]       LANE3_CUR_DISP_O                                                ,
	output  [1:0]       LANE3_DEC_ERR_O                                                 ,
	output  [1:0]       LANE3_DISP_ERR_O                                                ,
	input               LANE3_FABRIC_C2I_CLK                                            ,
	input               LANE3_FABRIC_RX_CLK                                             ,
	input               LANE3_FABRIC_TX_CLK                                             ,
	output              LANE3_K_LOCK                                                    ,
	output              LANE3_PCS_RX_O_FABRIC_CLK                                       ,
	input               LANE3_PCS_RX_RST                                                ,
	output              LANE3_PCS_TX_O_FABRIC_CLK                                       ,
	input               LANE3_PCS_TX_RST                                                ,
	output              LANE3_RX_IF_FIFO_AEMPTY                                         ,
	output              LANE3_RX_IF_FIFO_EMPTY                                          ,
	input               LANE3_RX_IF_FIFO_RDEN                                           ,
	output  [5:0]       LANE3_RX_IF_FIFO_RDUSEWD                                        ,
	output              LANE3_TX_IF_FIFO_AFULL                                          ,
	output              LANE3_TX_IF_FIFO_FULL                                           ,
	output  [5:0]       LANE3_TX_IF_FIFO_WRUSEWD                                        ,
	input               LN0_JTAG_ACNODE_ENA_I                                           ,
	input   [1:0]       LN0_JTAG_CM_I                                                   ,
	input               LN0_JTAG_ENA_I                                                  ,
	input               LN0_JTAG_MUXIN_ENA_I                                            ,
	input               LN0_JTAG_MUXIN_I                                                ,
	output              LN0_JTAG_OUT_NC_O                                               ,
	output              LN0_JTAG_OUT_NS_O                                               ,
	output              LN0_JTAG_OUT_PC_O                                               ,
	output              LN0_JTAG_OUT_PS_O                                               ,
	input               LN0_JTAG_VHYSTL_I                                               ,
	input               LN0_RXM_I                                                       ,
	input               LN0_RXP_I                                                       ,
	output              LN0_TXM_O                                                       ,
	output              LN0_TXP_O                                                       ,
	input               LN1_JTAG_ACNODE_ENA_I                                           ,
	input   [1:0]       LN1_JTAG_CM_I                                                   ,
	input               LN1_JTAG_ENA_I                                                  ,
	input               LN1_JTAG_MUXIN_ENA_I                                            ,
	input               LN1_JTAG_MUXIN_I                                                ,
	output              LN1_JTAG_OUT_NC_O                                               ,
	output              LN1_JTAG_OUT_NS_O                                               ,
	output              LN1_JTAG_OUT_PC_O                                               ,
	output              LN1_JTAG_OUT_PS_O                                               ,
	input               LN1_JTAG_VHYSTL_I                                               ,
	input               LN1_RXM_I                                                       ,
	input               LN1_RXP_I                                                       ,
	output              LN1_TXM_O                                                       ,
	output              LN1_TXP_O                                                       ,
	input               LN2_JTAG_ACNODE_ENA_I                                           ,
	input   [1:0]       LN2_JTAG_CM_I                                                   ,
	input               LN2_JTAG_ENA_I                                                  ,
	input               LN2_JTAG_MUXIN_ENA_I                                            ,
	input               LN2_JTAG_MUXIN_I                                                ,
	output              LN2_JTAG_OUT_NC_O                                               ,
	output              LN2_JTAG_OUT_NS_O                                               ,
	output              LN2_JTAG_OUT_PC_O                                               ,
	output              LN2_JTAG_OUT_PS_O                                               ,
	input               LN2_JTAG_VHYSTL_I                                               ,
	input               LN2_RXM_I                                                       ,
	input               LN2_RXP_I                                                       ,
	output              LN2_TXM_O                                                       ,
	output              LN2_TXP_O                                                       ,
	input               LN3_JTAG_ACNODE_ENA_I                                           ,
	input   [1:0]       LN3_JTAG_CM_I                                                   ,
	input               LN3_JTAG_ENA_I                                                  ,
	input               LN3_JTAG_MUXIN_ENA_I                                            ,
	input               LN3_JTAG_MUXIN_I                                                ,
	output              LN3_JTAG_OUT_NC_O                                               ,
	output              LN3_JTAG_OUT_NS_O                                               ,
	output              LN3_JTAG_OUT_PC_O                                               ,
	output              LN3_JTAG_OUT_PS_O                                               ,
	input               LN3_JTAG_VHYSTL_I                                               ,
	input               LN3_RXM_I                                                       ,
	input               LN3_RXP_I                                                       ,
	output              LN3_TXM_O                                                       ,
	output              LN3_TXP_O                                                       ,
	input               PCIE_DIV2_REG                                                   ,
	output  [3:0]       PHY_ACKLOCAL                                                    ,
	output  [71:0]      PHY_ACKLOCALCOE                                                 ,
	output  [23:0]      PHY_EVALDIRCHNG                                                 ,
	output  [31:0]      PHY_EVALFFBFIGUREMERIT                                          ,
	input   [3:0]       PHY_INVALIDREQ                                                  ,
	output  [23:0]      PHY_LOCALFS                                                     ,
	output  [23:0]      PHY_LOCALLF                                                     ,
	input   [3:0]       PHY_REQLOCAL                                                    ,
	input   [15:0]      PHY_REQLOCALIDX                                                 ,
	input   [3:0]       PHY_RXEQEVAL                                                    ,
	input   [11:0]      PHY_RXPREHINT                                                   ,
	input   [71:0]      PHY_TXDEEMPH                                                    ,
	input               PL_BLOCKALIGNCONTROL                                            ,
	output  [3:0]       PL_PHYSTATUS                                                    ,
	input   [1:0]       PL_POWERDOWN                                                    ,
	input   [1:0]       PL_RATE                                                         ,
	output  [63:0]      PL_RXDATA                                                       ,
	output  [7:0]       PL_RXDATAK                                                      ,
	output  [3:0]       PL_RXDATAVALID                                                  ,
	output  [3:0]       PL_RXELECIDLE                                                   ,
	input   [3:0]       PL_RXPOLARITY                                                   ,
	output  [3:0]       PL_RXSTARTBLOCK                                                 ,
	output  [11:0]      PL_RXSTATUS                                                     ,
	output  [7:0]       PL_RXSYNCHEADER                                                 ,
	output  [3:0]       PL_RXVALID                                                      ,
	input   [3:0]       PL_TXCOMPLIANCE                                                 ,
	input   [63:0]      PL_TXDATA                                                       ,
	input   [7:0]       PL_TXDATAK                                                      ,
	input   [3:0]       PL_TXDATAVALID                                                  ,
	input   [3:0]       PL_TXDETECTRX                                                   ,
	input   [3:0]       PL_TXELECIDLE                                                   ,
	input   [2:0]       PL_TXMARGIN                                                     ,
	input   [3:0]       PL_TXSTARTBLOCK                                                 ,
	input               PL_TXSWING                                                      ,
	input   [7:0]       PL_TXSYNCHEADER                                                 ,
	output              PMAC_CMU1_OK_O                                                  ,
	output              PMAC_CMU_OK_O                                                   ,
	input               PMAC_LN_RSTN                                                    ,
	output              QUAD_CLK_O                                                      ,
	input               QUAD_PCIE_CLK                                                   ,
	inout               REFCLK_M_L                                                      ,
	inout               REFCLK_M_R                                                      ,
	inout               REFCLK_P_L                                                      ,
	inout               REFCLK_P_R                                                      ,
	input               REFCLKM_I                                                       ,
	input               REFCLKP_I                                                       ,
	input               REFRES_I                                                        ,
	inout               RXCLK_M_L                                                       ,
	inout               RXCLK_M_R                                                       ,
	inout               RXCLK_P_L                                                       ,
	inout               RXCLK_P_R                                                       ,
	input               SCAN_EN                                                         ,
	input               SCAN_RST                                                        ,
	output  [11:0]      TBUS_DATA_O                                                     ,
	input               TEST_CLK_0_I                                                    ,
	input               TEST_CLK_1_I                                                    ,
	input               TEST_CLK_2_I                                                    ,
	input               TEST_CLK_3_I                                                    ,
	input               TEST_CLK_4_I                                                    ,
	input               TEST_MODE_I                                                     ,
	input               TEST_SE_I                                                       ,
	input   [25:0]      TEST_SI_I                                                       ,
	output  [25:0]      TEST_SO_O                                                       ,
	input   [41:0]      TM_LANE0_GEARBOX_HALF_SPEED_IN                                  ,
	output  [41:0]      TM_LANE0_GEARBOX_HALF_SPEED_OUT                                 ,
	output              TM_LANE0_RX_IF_FIFO_AEMPTY                                      ,
	output              TM_LANE0_RX_IF_FIFO_EMPTY                                       ,
	input               TM_LANE0_RX_IF_FIFO_RDEN                                        ,
	output  [5:0]       TM_LANE0_RX_IF_FIFO_RDUSEWD                                     ,
	output              TM_LANE0_TX_IF_FIFO_AFULL                                       ,
	output              TM_LANE0_TX_IF_FIFO_FULL                                        ,
	output  [5:0]       TM_LANE0_TX_IF_FIFO_WRUSEWD                                     ,
	input   [41:0]      TM_LANE1_GEARBOX_HALF_SPEED_IN                                  ,
	output  [41:0]      TM_LANE1_GEARBOX_HALF_SPEED_OUT                                 ,
	output              TM_LANE1_RX_IF_FIFO_AEMPTY                                      ,
	output              TM_LANE1_RX_IF_FIFO_EMPTY                                       ,
	input               TM_LANE1_RX_IF_FIFO_RDEN                                        ,
	output  [5:0]       TM_LANE1_RX_IF_FIFO_RDUSEWD                                     ,
	output              TM_LANE1_TX_IF_FIFO_AFULL                                       ,
	output              TM_LANE1_TX_IF_FIFO_FULL                                        ,
	output  [5:0]       TM_LANE1_TX_IF_FIFO_WRUSEWD                                     ,
	input   [41:0]      TM_LANE2_GEARBOX_HALF_SPEED_IN                                  ,
	output  [41:0]      TM_LANE2_GEARBOX_HALF_SPEED_OUT                                 ,
	output              TM_LANE2_RX_IF_FIFO_AEMPTY                                      ,
	output              TM_LANE2_RX_IF_FIFO_EMPTY                                       ,
	input               TM_LANE2_RX_IF_FIFO_RDEN                                        ,
	output  [5:0]       TM_LANE2_RX_IF_FIFO_RDUSEWD                                     ,
	output              TM_LANE2_TX_IF_FIFO_AFULL                                       ,
	output              TM_LANE2_TX_IF_FIFO_FULL                                        ,
	output  [5:0]       TM_LANE2_TX_IF_FIFO_WRUSEWD                                     ,
	input   [41:0]      TM_LANE3_GEARBOX_HALF_SPEED_IN                                  ,
	output  [41:0]      TM_LANE3_GEARBOX_HALF_SPEED_OUT                                 ,
	output              TM_LANE3_RX_IF_FIFO_AEMPTY                                      ,
	output              TM_LANE3_RX_IF_FIFO_EMPTY                                       ,
	input               TM_LANE3_RX_IF_FIFO_RDEN                                        ,
	output  [5:0]       TM_LANE3_RX_IF_FIFO_RDUSEWD                                     ,
	output              TM_LANE3_TX_IF_FIFO_AFULL                                       ,
	output              TM_LANE3_TX_IF_FIFO_FULL                                        ,
	output  [5:0]       TM_LANE3_TX_IF_FIFO_WRUSEWD                                     
    )/* synthesis syn_black_box  */;
//End of module defin
//add parameter in csr
parameter           P_CFG_BURN_IN_I_OVR                             =   1'h0;
parameter           P_CFG_BURN_IN_I_VAL                             =   1'h0;
parameter   [3:0]   P_CFG_CHBOND_START                              =   4'h0;
parameter   [1:0]   P_CFG_CK_SOC_DIV_I_OVR                          =   2'h0;
parameter   [1:0]   P_CFG_CK_SOC_DIV_I_VAL                          =   2'h0;
parameter   [1:0]   P_CFG_CLK_LIFE_DIV_I_OVR                        =   2'h0;
parameter   [1:0]   P_CFG_CLK_LIFE_DIV_I_VAL                        =   2'h0;
parameter   [1:0]   P_CFG_CLK_MON_DIV_SEL                           =   2'h0;
parameter   [9:0]   P_CFG_CLK_MON_SEL                               =   10'h0;
parameter           P_CFG_CMU1_IDDQ_I_OVR                           =   1'h0;
parameter           P_CFG_CMU1_IDDQ_I_VAL                           =   1'h0;
parameter           P_CFG_CMU1_PD_I_OVR                             =   1'h0;
parameter           P_CFG_CMU1_PD_I_VAL                             =   1'h0;
parameter           P_CFG_CMU1_RESETN_I_OVR                         =   1'h0;
parameter           P_CFG_CMU1_RESETN_I_VAL                         =   1'h0;
parameter           P_CFG_CMU_IDDQ_I_OVR                            =   1'h0;
parameter           P_CFG_CMU_IDDQ_I_VAL                            =   1'h0;
parameter           P_CFG_CMU_PD_I_OVR                              =   1'h0;
parameter           P_CFG_CMU_PD_I_VAL                              =   1'h0;
parameter           P_CFG_CMU_RESETN_I_OVR                          =   1'h0;
parameter           P_CFG_CMU_RESETN_I_VAL                          =   1'h0;
parameter           P_CFG_DIV2_SEL_CMU1_CK_REF_O                    =   1'h0;
parameter           P_CFG_DIV2_SEL_CMU_CK_REF_O                     =   1'h0;
parameter   [2:0]   P_CFG_FABRIC_CMU0_CLK_SEL                       =   3'h0;
parameter   [2:0]   P_CFG_FABRIC_CMU1_CLK_SEL                       =   3'h0;
parameter   [2:0]   P_CFG_FABRIC_QUAD_CLK_RX_SEL                    =   3'h0;
parameter           P_CFG_GLUE_MAC_INIT_INFO_I_OVR                  =   1'h0;
parameter           P_CFG_GLUE_MAC_INIT_INFO_I_VAL                  =   1'h0;
parameter           P_CFG_HARD_MAC_PATH                             =   1'h1;
parameter           P_CFG_LANE0_PCS_RX_RST_OVR                      =   1'h0;
parameter           P_CFG_LANE0_PCS_RX_RST_VAL                      =   1'h0;
parameter           P_CFG_LANE0_PCS_TX_RST_OVR                      =   1'h0;
parameter           P_CFG_LANE0_PCS_TX_RST_VAL                      =   1'h0;
parameter           P_CFG_LANE1_PCS_RX_RST_OVR                      =   1'h0;
parameter           P_CFG_LANE1_PCS_RX_RST_VAL                      =   1'h0;
parameter           P_CFG_LANE1_PCS_TX_RST_OVR                      =   1'h0;
parameter           P_CFG_LANE1_PCS_TX_RST_VAL                      =   1'h0;
parameter           P_CFG_LANE2_PCS_RX_RST_OVR                      =   1'h0;
parameter           P_CFG_LANE2_PCS_RX_RST_VAL                      =   1'h0;
parameter           P_CFG_LANE2_PCS_TX_RST_OVR                      =   1'h0;
parameter           P_CFG_LANE2_PCS_TX_RST_VAL                      =   1'h0;
parameter           P_CFG_LANE3_PCS_RX_RST_OVR                      =   1'h0;
parameter           P_CFG_LANE3_PCS_RX_RST_VAL                      =   1'h0;
parameter           P_CFG_LANE3_PCS_TX_RST_OVR                      =   1'h0;
parameter           P_CFG_LANE3_PCS_TX_RST_VAL                      =   1'h0;
parameter   [42:0]  P_CFG_LN0_CTRL_I_OVR                            =   43'h0;
parameter   [42:0]  P_CFG_LN0_CTRL_I_VAL                            =   43'h0;
parameter           P_CFG_LN0_FPCS_RXDATA_SRC_OVR                   =   1'h0;
parameter           P_CFG_LN0_FPCS_RXDATA_SRC_VAL                   =   1'h0;
parameter           P_CFG_LN0_GENERIC_DIV_8B10B                     =   1'h0;
parameter           P_CFG_LN0_GENERIC_MODE                          =   1'h0;
parameter           P_CFG_LN0_IDDQ_I_OVR                            =   1'h0;
parameter           P_CFG_LN0_IDDQ_I_VAL                            =   1'h0;
parameter           P_CFG_LN0_JTAG_ACNODE_ENA_I                     =   1'h0;
parameter   [1:0]   P_CFG_LN0_JTAG_CM_I                             =   2'h0;
parameter           P_CFG_LN0_JTAG_ENA_I                            =   1'h0;
parameter           P_CFG_LN0_JTAG_MUXIN_ENA_I                      =   1'h0;
parameter           P_CFG_LN0_JTAG_MUXIN_I                          =   1'h0;
parameter           P_CFG_LN0_JTAG_MUXIN_I_SRC                      =   1'h0;
parameter           P_CFG_LN0_JTAG_VHYSTL_I                         =   1'h0;
parameter   [2:0]   P_CFG_LN0_PD_I_OVR                              =   3'h0;
parameter   [2:0]   P_CFG_LN0_PD_I_VAL                              =   3'h0;
parameter   [1:0]   P_CFG_LN0_RATE_I_OVR                            =   2'h0;
parameter   [1:0]   P_CFG_LN0_RATE_I_VAL                            =   2'h0;
parameter           P_CFG_LN0_RSTN_I_OVR                            =   1'h0;
parameter           P_CFG_LN0_RSTN_I_VAL                            =   1'h0;
parameter           P_CFG_LN0_TXDATA_I_OVR                          =   1'h0;
parameter   [1:0]   P_CFG_LN0_TXDATA_I_VAL                          =   2'h0;
parameter   [42:0]  P_CFG_LN1_CTRL_I_OVR                            =   43'h0;
parameter   [42:0]  P_CFG_LN1_CTRL_I_VAL                            =   43'h0;
parameter           P_CFG_LN1_FPCS_RXDATA_SRC_OVR                   =   1'h0;
parameter           P_CFG_LN1_FPCS_RXDATA_SRC_VAL                   =   1'h0;
parameter           P_CFG_LN1_GENERIC_DIV_8B10B                     =   1'h0;
parameter           P_CFG_LN1_GENERIC_MODE                          =   1'h0;
parameter           P_CFG_LN1_IDDQ_I_OVR                            =   1'h0;
parameter           P_CFG_LN1_IDDQ_I_VAL                            =   1'h0;
parameter           P_CFG_LN1_JTAG_ACNODE_ENA_I                     =   1'h0;
parameter   [1:0]   P_CFG_LN1_JTAG_CM_I                             =   2'h0;
parameter           P_CFG_LN1_JTAG_ENA_I                            =   1'h0;
parameter           P_CFG_LN1_JTAG_MUXIN_ENA_I                      =   1'h0;
parameter           P_CFG_LN1_JTAG_MUXIN_I                          =   1'h0;
parameter           P_CFG_LN1_JTAG_MUXIN_I_SRC                      =   1'h0;
parameter           P_CFG_LN1_JTAG_VHYSTL_I                         =   1'h0;
parameter   [2:0]   P_CFG_LN1_PD_I_OVR                              =   3'h0;
parameter   [2:0]   P_CFG_LN1_PD_I_VAL                              =   3'h0;
parameter   [1:0]   P_CFG_LN1_RATE_I_OVR                            =   2'h0;
parameter   [1:0]   P_CFG_LN1_RATE_I_VAL                            =   2'h0;
parameter           P_CFG_LN1_RSTN_I_OVR                            =   1'h0;
parameter           P_CFG_LN1_RSTN_I_VAL                            =   1'h0;
parameter           P_CFG_LN1_TXDATA_I_OVR                          =   1'h0;
parameter   [1:0]   P_CFG_LN1_TXDATA_I_VAL                          =   2'h0;
parameter   [42:0]  P_CFG_LN2_CTRL_I_OVR                            =   43'h0;
parameter   [42:0]  P_CFG_LN2_CTRL_I_VAL                            =   43'h0;
parameter           P_CFG_LN2_FPCS_RXDATA_SRC_OVR                   =   1'h0;
parameter           P_CFG_LN2_FPCS_RXDATA_SRC_VAL                   =   1'h0;
parameter           P_CFG_LN2_GENERIC_DIV_8B10B                     =   1'h0;
parameter           P_CFG_LN2_GENERIC_MODE                          =   1'h0;
parameter           P_CFG_LN2_IDDQ_I_OVR                            =   1'h0;
parameter           P_CFG_LN2_IDDQ_I_VAL                            =   1'h0;
parameter           P_CFG_LN2_JTAG_ACNODE_ENA_I                     =   1'h0;
parameter   [1:0]   P_CFG_LN2_JTAG_CM_I                             =   2'h0;
parameter           P_CFG_LN2_JTAG_ENA_I                            =   1'h0;
parameter           P_CFG_LN2_JTAG_MUXIN_ENA_I                      =   1'h0;
parameter           P_CFG_LN2_JTAG_MUXIN_I                          =   1'h0;
parameter           P_CFG_LN2_JTAG_MUXIN_I_SRC                      =   1'h0;
parameter           P_CFG_LN2_JTAG_VHYSTL_I                         =   1'h0;
parameter   [2:0]   P_CFG_LN2_PD_I_OVR                              =   3'h0;
parameter   [2:0]   P_CFG_LN2_PD_I_VAL                              =   3'h0;
parameter   [1:0]   P_CFG_LN2_RATE_I_OVR                            =   2'h0;
parameter   [1:0]   P_CFG_LN2_RATE_I_VAL                            =   2'h0;
parameter           P_CFG_LN2_RSTN_I_OVR                            =   1'h0;
parameter           P_CFG_LN2_RSTN_I_VAL                            =   1'h0;
parameter           P_CFG_LN2_TXDATA_I_OVR                          =   1'h0;
parameter   [1:0]   P_CFG_LN2_TXDATA_I_VAL                          =   2'h0;
parameter   [42:0]  P_CFG_LN3_CTRL_I_OVR                            =   43'h0;
parameter   [42:0]  P_CFG_LN3_CTRL_I_VAL                            =   43'h0;
parameter           P_CFG_LN3_FPCS_RXDATA_SRC_OVR                   =   1'h0;
parameter           P_CFG_LN3_FPCS_RXDATA_SRC_VAL                   =   1'h0;
parameter           P_CFG_LN3_GENERIC_DIV_8B10B                     =   1'h0;
parameter           P_CFG_LN3_GENERIC_MODE                          =   1'h0;
parameter           P_CFG_LN3_IDDQ_I_OVR                            =   1'h0;
parameter           P_CFG_LN3_IDDQ_I_VAL                            =   1'h0;
parameter           P_CFG_LN3_JTAG_ACNODE_ENA_I                     =   1'h0;
parameter   [1:0]   P_CFG_LN3_JTAG_CM_I                             =   2'h0;
parameter           P_CFG_LN3_JTAG_ENA_I                            =   1'h0;
parameter           P_CFG_LN3_JTAG_MUXIN_ENA_I                      =   1'h0;
parameter           P_CFG_LN3_JTAG_MUXIN_I                          =   1'h0;
parameter           P_CFG_LN3_JTAG_MUXIN_I_SRC                      =   1'h0;
parameter           P_CFG_LN3_JTAG_VHYSTL_I                         =   1'h0;
parameter   [2:0]   P_CFG_LN3_PD_I_OVR                              =   3'h0;
parameter   [2:0]   P_CFG_LN3_PD_I_VAL                              =   3'h0;
parameter   [1:0]   P_CFG_LN3_RATE_I_OVR                            =   2'h0;
parameter   [1:0]   P_CFG_LN3_RATE_I_VAL                            =   2'h0;
parameter           P_CFG_LN3_RSTN_I_OVR                            =   1'h0;
parameter           P_CFG_LN3_RSTN_I_VAL                            =   1'h0;
parameter           P_CFG_LN3_TXDATA_I_OVR                          =   1'h0;
parameter   [1:0]   P_CFG_LN3_TXDATA_I_VAL                          =   2'h0;
parameter   [3:0]   P_CFG_LN_RSTN_FROM_PMAC                         =   4'h0;
parameter           P_CFG_PD_REFCLK_DETECT_REQ_I_OVR                =   1'h0;
parameter           P_CFG_PD_REFCLK_DETECT_REQ_I_VAL                =   1'h0;
parameter           P_CFG_POR_N_I_OVR                               =   1'h1;
parameter           P_CFG_POR_N_I_VAL                               =   1'h0;
parameter           P_CFG_REFCLK1_INPUT_SEL_I_OVR                   =   1'h0;
parameter   [2:0]   P_CFG_REFCLK1_INPUT_SEL_I_VAL                   =   3'h0;
parameter           P_CFG_REFCLK_DET_OFFSET_I_OVR                   =   1'h0;
parameter   [3:0]   P_CFG_REFCLK_DET_OFFSET_I_VAL                   =   4'h0;
parameter           P_CFG_REFCLK_GATE_I_OVR                         =   1'h0;
parameter           P_CFG_REFCLK_GATE_I_VAL                         =   1'h0;
parameter           P_CFG_REFCLK_INPUT_SEL_I_OVR                    =   1'h0;
parameter   [2:0]   P_CFG_REFCLK_INPUT_SEL_I_VAL                    =   3'h0;
parameter           P_CFG_REFCLK_OE_L_I_OVR                         =   1'h0;
parameter           P_CFG_REFCLK_OE_L_I_VAL                         =   1'h0;
parameter           P_CFG_REFCLK_OE_R_I_OVR                         =   1'h0;
parameter           P_CFG_REFCLK_OE_R_I_VAL                         =   1'h0;
parameter           P_CFG_REFCLK_OUTPUT_SEL_I_OVR                   =   1'h0;
parameter   [3:0]   P_CFG_REFCLK_OUTPUT_SEL_I_VAL                   =   4'h0;
parameter   [31:0]  P_CFG_RESERVED0                                 =   32'h0;
parameter           P_CFG_RXCLK_OE_L_I_OVR                          =   1'h0;
parameter           P_CFG_RXCLK_OE_L_I_VAL                          =   1'h0;
parameter           P_CFG_RXCLK_OE_R_I_OVR                          =   1'h0;
parameter           P_CFG_RXCLK_OE_R_I_VAL                          =   1'h0;
parameter           P_CMU_CLK_SEL                                   =   1'h0;
parameter           P_FPCS_CFG_TX_VLD_OUT_FORCE_ENB                 =   1'h0;
parameter           P_LANE0_CFG_ENABLE_TM                           =   1'h0;
parameter           P_LANE0_CFG_GBD_RST                             =   1'h1;
parameter           P_LANE0_CFG_GBU_RST                             =   1'h1;
parameter           P_LANE0_CFG_PCS_RX_B2C_CLKMUX_SEL               =   1'h0;
parameter   [1:0]   P_LANE0_CFG_PCS_RX_C2I_CLKMUX_SEL               =   2'h0;
parameter           P_LANE0_CFG_PCS_RX_DEC_CLKMUX_SEL               =   1'h0;
parameter           P_LANE0_CFG_PCS_TX_CLKMUX_SEL                   =   1'h0;
parameter   [2:0]   P_LANE0_CFG_PMA_TX_CLKMUX_SEL                   =   3'h0;
parameter           P_LANE0_CFG_RX2TX_LP_EN                         =   1'h0;
parameter           P_LANE0_CFG_RX_ALI_TRI_OVR_B                    =   1'h0;
parameter           P_LANE0_CFG_RX_ALI_TRI_VAL                      =   1'h0;
parameter           P_LANE0_CFG_RX_CHB_STR_SRC_SEL                  =   1'h0;
parameter           P_LANE0_CFG_RX_SIG_DET_OVR                      =   1'h0;
parameter           P_LANE0_CFG_RX_SIG_DET_VAL                      =   1'h0;
parameter           P_LANE0_CFG_RX_VLD_OVR                          =   1'h0;
parameter           P_LANE0_CFG_RX_VLD_VAL                          =   1'h0;
parameter           P_LANE0_CFG_TX2RX_LP_EN                         =   1'h0;
parameter   [1:0]   P_LANE0_CFG_WIDTH_MODE                          =   2'h1;
parameter   [4:0]   P_LANE0_CHBOND_CFG_AEMPTY_DEPTH                 =   5'h3;
parameter   [4:0]   P_LANE0_CHBOND_CFG_AFULL_DEPTH                  =   5'hc;
parameter   [7:0]   P_LANE0_CHBOND_CFG_ALIGN_PATTERN                =   8'h7c;
parameter           P_LANE0_CHBOND_CFG_BYPASS_MODE                  =   1'h0;
parameter   [4:0]   P_LANE0_CHBOND_CFG_MAX_SKEW                     =   5'h4;
parameter   [1:0]   P_LANE0_CHBOND_CFG_MST_SEL                      =   2'h0;
parameter   [4:0]   P_LANE0_CHBOND_CFG_RD_START_DEPTH               =   5'h8;
parameter   [5:0]   P_LANE0_CHBOND_CFG_SAMPLE_RATE                  =   6'h0;
parameter           P_LANE0_CTC_CFG_ADD_MODE                        =   1'h0;
parameter   [4:0]   P_LANE0_CTC_CFG_AEMPTY_DEPTH                    =   5'h3;
parameter   [4:0]   P_LANE0_CTC_CFG_AFULL_DEPTH                     =   5'hc;
parameter           P_LANE0_CTC_CFG_BYPASS_MODE                     =   1'h0;
parameter   [1:0]   P_LANE0_CTC_CFG_MST_SEL                         =   2'h0;
parameter   [4:0]   P_LANE0_CTC_CFG_RD_START_DEPTH                  =   5'h8;
parameter           P_LANE0_CTC_CFG_RM_MODE                         =   1'h0;
parameter   [7:0]   P_LANE0_CTC_CFG_SKIP_PATTERN                    =   8'h1c;
parameter           P_LANE0_DEC_CFG_BYPASS_MODE                     =   1'h0;
parameter           P_LANE0_ENC_CFG_BYPASS_MODE                     =   1'h0;
parameter           P_LANE0_GEARBOX_DOWNSPEED_CFG_BYPASS_MODE       =   1'h0;
parameter           P_LANE0_GEARBOX_DOWNSPEED_CFG_DIV2_SEL          =   1'h0;
parameter           P_LANE0_GEARBOX_DOWNSPEED_CFG_HALF_SEL          =   1'h0;
parameter           P_LANE0_GEARBOX_DOWNSPEED_CFG_SOURCE_CLK_SEL    =   1'h0;
parameter           P_LANE0_GEARBOX_UPSPEED_CFG_BYPASS_MODE         =   1'h0;
parameter           P_LANE0_GEARBOX_UPSPEED_CFG_DIV2_SEL            =   1'h0;
parameter           P_LANE0_GEARBOX_UPSPEED_CFG_HALF_SEL            =   1'h0;
parameter           P_LANE0_GEARBOX_UPSPEED_CFG_SOURCE_CLK_SEL      =   1'h0;
parameter   [3:0]   P_LANE0_OS_CFG_ADD_TOP                          =   4'h8;
parameter   [3:0]   P_LANE0_OS_CFG_AEMPTY_DEPTH                     =   4'h4;
parameter   [3:0]   P_LANE0_OS_CFG_AFULL_DEPTH                      =   4'hc;
parameter           P_LANE0_OS_CFG_BYPASS_MODE                      =   1'h1;
parameter           P_LANE0_OS_CFG_DOWN_SAMPLE0                     =   1'h0;
parameter   [1:0]   P_LANE0_OS_CFG_DOWN_SAMPLE1                     =   2'h0;
parameter   [3:0]   P_LANE0_OS_CFG_FILTER_TOP                       =   4'h8;
parameter           P_LANE0_OS_CFG_LINEAR_MODE                      =   1'h0;
parameter   [3:0]   P_LANE0_OS_CFG_RD_START_DEPTH                   =   4'h8;
parameter           P_LANE0_OS_TX_CFG_BYPASS_MODE                   =   1'h1;
parameter           P_LANE0_PRBS_RX_CFG_BER_MODE_I                  =   1'h0;
parameter   [3:0]   P_LANE0_PRBS_RX_CFG_BYTE_CNT_WIDTH_I            =   4'h0;
parameter           P_LANE0_PRBS_RX_CFG_CHK_PREAM_I                 =   1'h0;
parameter           P_LANE0_PRBS_RX_CFG_DATA_MODE_I                 =   1'h0;
parameter           P_LANE0_PRBS_RX_CFG_EN_I                        =   1'h0;
parameter           P_LANE0_PRBS_RX_CFG_ERR_CLR_I                   =   1'h0;
parameter           P_LANE0_PRBS_RX_CFG_INV_PRBS_I                  =   1'h0;
parameter   [1:0]   P_LANE0_PRBS_RX_CFG_LFSR_I                      =   2'h0;
parameter           P_LANE0_PRBS_RX_CFG_LOAD_UDP_I                  =   1'h0;
parameter   [1:0]   P_LANE0_PRBS_RX_CFG_MUX_SEL_BIST                =   2'h0;
parameter   [1:0]   P_LANE0_PRBS_RX_CFG_PRBS_MODE_I                 =   2'h0;
parameter   [9:0]   P_LANE0_PRBS_RX_CFG_PREAM0_I                    =   10'h0;
parameter   [9:0]   P_LANE0_PRBS_RX_CFG_PREAM1_I                    =   10'h0;
parameter   [39:0]  P_LANE0_PRBS_RX_CFG_UDP_I                       =   40'h0;
parameter           P_LANE0_PRBS_TX_CFG_DATA_MODE_I                 =   1'h0;
parameter           P_LANE0_PRBS_TX_CFG_DIS_HW_ERR_I                =   1'h0;
parameter           P_LANE0_PRBS_TX_CFG_EN_I                        =   1'h0;
parameter           P_LANE0_PRBS_TX_CFG_GEN_ERR_I                   =   1'h0;
parameter           P_LANE0_PRBS_TX_CFG_INV_PRBS_I                  =   1'h0;
parameter   [1:0]   P_LANE0_PRBS_TX_CFG_LFSR_I                      =   2'h0;
parameter           P_LANE0_PRBS_TX_CFG_LOAD_UDP_I                  =   1'h0;
parameter   [1:0]   P_LANE0_PRBS_TX_CFG_MUX_SEL_BIST                =   2'h0;
parameter   [5:0]   P_LANE0_PRBS_TX_CFG_OVER_SAMPLE_I               =   6'h0;
parameter   [1:0]   P_LANE0_PRBS_TX_CFG_PRBS_MODE_I                 =   2'h0;
parameter   [9:0]   P_LANE0_PRBS_TX_CFG_PREAM0_I                    =   10'h0;
parameter   [9:0]   P_LANE0_PRBS_TX_CFG_PREAM1_I                    =   10'h0;
parameter           P_LANE0_PRBS_TX_CFG_SEND_PREAM_I                =   1'h0;
parameter           P_LANE0_PRBS_TX_CFG_TRIG_MODE_I                 =   1'h0;
parameter   [39:0]  P_LANE0_PRBS_TX_CFG_UDP_I                       =   40'h0;
parameter   [4:0]   P_LANE0_RX_IF_CFG_AEMPTY_DEPTH                  =   5'hc;
parameter   [4:0]   P_LANE0_RX_IF_CFG_AFULL_DEPTH                   =   5'h8;
parameter           P_LANE0_RX_IF_CFG_HALF_RATE                     =   1'h0;
parameter           P_LANE0_RX_MANIPULATION_CFG_BIT_INVERT          =   1'h0;
parameter           P_LANE0_RX_MANIPULATION_CFG_BYPASS_IND          =   1'h0;
parameter           P_LANE0_RX_MANIPULATION_CFG_BYTE_INVERT         =   1'h0;
parameter           P_LANE0_RX_MANIPULATION_CFG_POL_INVERT          =   1'h0;
parameter   [4:0]   P_LANE0_RX_MANIPULATION_CFG_SLIP_DISTANCE       =   5'h0;
parameter   [4:0]   P_LANE0_TX_IF_CFG_AEMPTY_DEPTH                  =   5'h4;
parameter   [4:0]   P_LANE0_TX_IF_CFG_AFULL_DEPTH                   =   5'h18;
parameter           P_LANE0_TX_IF_CFG_HALF_RATE                     =   1'h0;
parameter   [1:0]   P_LANE0_TX_IF_CFG_MST_SEL                       =   2'h0;
parameter   [4:0]   P_LANE0_TX_IF_CFG_RD_START_DEPTH                =   5'ha;
parameter   [5:0]   P_LANE0_TX_IF_CFG_SAMPLE_RATE                   =   6'h0;
parameter           P_LANE0_TX_MANIPULATION_CFG_BIT_INVERT          =   1'h0;
parameter           P_LANE0_TX_MANIPULATION_CFG_BYPASS_IND          =   1'h0;
parameter           P_LANE0_TX_MANIPULATION_CFG_BYTE_INVERT         =   1'h0;
parameter           P_LANE0_TX_MANIPULATION_CFG_POL_INVERT          =   1'h0;
parameter   [4:0]   P_LANE0_TX_MANIPULATION_CFG_SLIP_DISTANCE       =   5'h0;
parameter           P_LANE0_WORD_ALIGN_CFG_BYPASS_MODE              =   1'h0;
parameter           P_LANE0_WORD_ALIGN_CFG_DOUBLE_K_MODE            =   1'h0;
parameter   [8:0]   P_LANE0_WORD_ALIGN_CFG_FILTER_TOP               =   9'h10;
parameter   [3:0]   P_LANE0_WORD_ALIGN_CFG_GOOD_DETECT_CNT_TOP      =   4'h3;
parameter   [19:0]  P_LANE0_WORD_ALIGN_CFG_K                        =   20'h17c;
parameter   [19:0]  P_LANE0_WORD_ALIGN_CFG_K_MASK                   =   20'h3ff;
parameter   [3:0]   P_LANE0_WORD_ALIGN_CFG_PRE_LOCK_LEVEL_TOP       =   4'h3;
parameter   [3:0]   P_LANE0_WORD_ALIGN_CFG_PRE_UNLOCK_LEVEL_TOP     =   4'h3;
parameter           P_LANE1_CFG_ENABLE_TM                           =   1'h0;
parameter           P_LANE1_CFG_GBD_RST                             =   1'h1;
parameter           P_LANE1_CFG_GBU_RST                             =   1'h1;
parameter           P_LANE1_CFG_PCS_RX_B2C_CLKMUX_SEL               =   1'h0;
parameter   [1:0]   P_LANE1_CFG_PCS_RX_C2I_CLKMUX_SEL               =   2'h0;
parameter           P_LANE1_CFG_PCS_RX_DEC_CLKMUX_SEL               =   1'h0;
parameter           P_LANE1_CFG_PCS_TX_CLKMUX_SEL                   =   1'h0;
parameter   [2:0]   P_LANE1_CFG_PMA_TX_CLKMUX_SEL                   =   3'h0;
parameter           P_LANE1_CFG_RX2TX_LP_EN                         =   1'h0;
parameter           P_LANE1_CFG_RX_ALI_TRI_OVR_B                    =   1'h0;
parameter           P_LANE1_CFG_RX_ALI_TRI_VAL                      =   1'h0;
parameter           P_LANE1_CFG_RX_CHB_STR_SRC_SEL                  =   1'h0;
parameter           P_LANE1_CFG_RX_SIG_DET_OVR                      =   1'h0;
parameter           P_LANE1_CFG_RX_SIG_DET_VAL                      =   1'h0;
parameter           P_LANE1_CFG_RX_VLD_OVR                          =   1'h0;
parameter           P_LANE1_CFG_RX_VLD_VAL                          =   1'h0;
parameter           P_LANE1_CFG_TX2RX_LP_EN                         =   1'h0;
parameter   [1:0]   P_LANE1_CFG_WIDTH_MODE                          =   2'h1;
parameter   [4:0]   P_LANE1_CHBOND_CFG_AEMPTY_DEPTH                 =   5'h3;
parameter   [4:0]   P_LANE1_CHBOND_CFG_AFULL_DEPTH                  =   5'hc;
parameter   [7:0]   P_LANE1_CHBOND_CFG_ALIGN_PATTERN                =   8'h7c;
parameter           P_LANE1_CHBOND_CFG_BYPASS_MODE                  =   1'h0;
parameter   [4:0]   P_LANE1_CHBOND_CFG_MAX_SKEW                     =   5'h4;
parameter   [1:0]   P_LANE1_CHBOND_CFG_MST_SEL                      =   2'h0;
parameter   [4:0]   P_LANE1_CHBOND_CFG_RD_START_DEPTH               =   5'h8;
parameter   [5:0]   P_LANE1_CHBOND_CFG_SAMPLE_RATE                  =   6'h0;
parameter           P_LANE1_CTC_CFG_ADD_MODE                        =   1'h0;
parameter   [4:0]   P_LANE1_CTC_CFG_AEMPTY_DEPTH                    =   5'h3;
parameter   [4:0]   P_LANE1_CTC_CFG_AFULL_DEPTH                     =   5'hc;
parameter           P_LANE1_CTC_CFG_BYPASS_MODE                     =   1'h0;
parameter   [1:0]   P_LANE1_CTC_CFG_MST_SEL                         =   2'h0;
parameter   [4:0]   P_LANE1_CTC_CFG_RD_START_DEPTH                  =   5'h8;
parameter           P_LANE1_CTC_CFG_RM_MODE                         =   1'h0;
parameter   [7:0]   P_LANE1_CTC_CFG_SKIP_PATTERN                    =   8'h1c;
parameter           P_LANE1_DEC_CFG_BYPASS_MODE                     =   1'h0;
parameter           P_LANE1_ENC_CFG_BYPASS_MODE                     =   1'h0;
parameter           P_LANE1_GEARBOX_DOWNSPEED_CFG_BYPASS_MODE       =   1'h0;
parameter           P_LANE1_GEARBOX_DOWNSPEED_CFG_DIV2_SEL          =   1'h0;
parameter           P_LANE1_GEARBOX_DOWNSPEED_CFG_HALF_SEL          =   1'h0;
parameter           P_LANE1_GEARBOX_DOWNSPEED_CFG_SOURCE_CLK_SEL    =   1'h0;
parameter           P_LANE1_GEARBOX_UPSPEED_CFG_BYPASS_MODE         =   1'h0;
parameter           P_LANE1_GEARBOX_UPSPEED_CFG_DIV2_SEL            =   1'h0;
parameter           P_LANE1_GEARBOX_UPSPEED_CFG_HALF_SEL            =   1'h0;
parameter           P_LANE1_GEARBOX_UPSPEED_CFG_SOURCE_CLK_SEL      =   1'h0;
parameter   [3:0]   P_LANE1_OS_CFG_ADD_TOP                          =   4'h8;
parameter   [3:0]   P_LANE1_OS_CFG_AEMPTY_DEPTH                     =   4'h4;
parameter   [3:0]   P_LANE1_OS_CFG_AFULL_DEPTH                      =   4'hc;
parameter           P_LANE1_OS_CFG_BYPASS_MODE                      =   1'h1;
parameter           P_LANE1_OS_CFG_DOWN_SAMPLE0                     =   1'h0;
parameter   [1:0]   P_LANE1_OS_CFG_DOWN_SAMPLE1                     =   2'h0;
parameter   [3:0]   P_LANE1_OS_CFG_FILTER_TOP                       =   4'h8;
parameter           P_LANE1_OS_CFG_LINEAR_MODE                      =   1'h0;
parameter   [3:0]   P_LANE1_OS_CFG_RD_START_DEPTH                   =   4'h8;
parameter           P_LANE1_OS_TX_CFG_BYPASS_MODE                   =   1'h1;
parameter           P_LANE1_PRBS_RX_CFG_BER_MODE_I                  =   1'h0;
parameter   [3:0]   P_LANE1_PRBS_RX_CFG_BYTE_CNT_WIDTH_I            =   4'h0;
parameter           P_LANE1_PRBS_RX_CFG_CHK_PREAM_I                 =   1'h0;
parameter           P_LANE1_PRBS_RX_CFG_DATA_MODE_I                 =   1'h0;
parameter           P_LANE1_PRBS_RX_CFG_EN_I                        =   1'h0;
parameter           P_LANE1_PRBS_RX_CFG_ERR_CLR_I                   =   1'h0;
parameter           P_LANE1_PRBS_RX_CFG_INV_PRBS_I                  =   1'h0;
parameter   [1:0]   P_LANE1_PRBS_RX_CFG_LFSR_I                      =   2'h0;
parameter           P_LANE1_PRBS_RX_CFG_LOAD_UDP_I                  =   1'h0;
parameter   [1:0]   P_LANE1_PRBS_RX_CFG_MUX_SEL_BIST                =   2'h0;
parameter   [1:0]   P_LANE1_PRBS_RX_CFG_PRBS_MODE_I                 =   2'h0;
parameter   [9:0]   P_LANE1_PRBS_RX_CFG_PREAM0_I                    =   10'h0;
parameter   [9:0]   P_LANE1_PRBS_RX_CFG_PREAM1_I                    =   10'h0;
parameter   [39:0]  P_LANE1_PRBS_RX_CFG_UDP_I                       =   40'h0;
parameter           P_LANE1_PRBS_TX_CFG_DATA_MODE_I                 =   1'h0;
parameter           P_LANE1_PRBS_TX_CFG_DIS_HW_ERR_I                =   1'h0;
parameter           P_LANE1_PRBS_TX_CFG_EN_I                        =   1'h0;
parameter           P_LANE1_PRBS_TX_CFG_GEN_ERR_I                   =   1'h0;
parameter           P_LANE1_PRBS_TX_CFG_INV_PRBS_I                  =   1'h0;
parameter   [1:0]   P_LANE1_PRBS_TX_CFG_LFSR_I                      =   2'h0;
parameter           P_LANE1_PRBS_TX_CFG_LOAD_UDP_I                  =   1'h0;
parameter   [1:0]   P_LANE1_PRBS_TX_CFG_MUX_SEL_BIST                =   2'h0;
parameter   [5:0]   P_LANE1_PRBS_TX_CFG_OVER_SAMPLE_I               =   6'h0;
parameter   [1:0]   P_LANE1_PRBS_TX_CFG_PRBS_MODE_I                 =   2'h0;
parameter   [9:0]   P_LANE1_PRBS_TX_CFG_PREAM0_I                    =   10'h0;
parameter   [9:0]   P_LANE1_PRBS_TX_CFG_PREAM1_I                    =   10'h0;
parameter           P_LANE1_PRBS_TX_CFG_SEND_PREAM_I                =   1'h0;
parameter           P_LANE1_PRBS_TX_CFG_TRIG_MODE_I                 =   1'h0;
parameter   [39:0]  P_LANE1_PRBS_TX_CFG_UDP_I                       =   40'h0;
parameter   [4:0]   P_LANE1_RX_IF_CFG_AEMPTY_DEPTH                  =   5'hc;
parameter   [4:0]   P_LANE1_RX_IF_CFG_AFULL_DEPTH                   =   5'h8;
parameter           P_LANE1_RX_IF_CFG_HALF_RATE                     =   1'h0;
parameter           P_LANE1_RX_MANIPULATION_CFG_BIT_INVERT          =   1'h0;
parameter           P_LANE1_RX_MANIPULATION_CFG_BYPASS_IND          =   1'h0;
parameter           P_LANE1_RX_MANIPULATION_CFG_BYTE_INVERT         =   1'h0;
parameter           P_LANE1_RX_MANIPULATION_CFG_POL_INVERT          =   1'h0;
parameter   [4:0]   P_LANE1_RX_MANIPULATION_CFG_SLIP_DISTANCE       =   5'h0;
parameter   [4:0]   P_LANE1_TX_IF_CFG_AEMPTY_DEPTH                  =   5'h4;
parameter   [4:0]   P_LANE1_TX_IF_CFG_AFULL_DEPTH                   =   5'h18;
parameter           P_LANE1_TX_IF_CFG_HALF_RATE                     =   1'h0;
parameter   [1:0]   P_LANE1_TX_IF_CFG_MST_SEL                       =   2'h0;
parameter   [4:0]   P_LANE1_TX_IF_CFG_RD_START_DEPTH                =   5'ha;
parameter   [5:0]   P_LANE1_TX_IF_CFG_SAMPLE_RATE                   =   6'h0;
parameter           P_LANE1_TX_MANIPULATION_CFG_BIT_INVERT          =   1'h0;
parameter           P_LANE1_TX_MANIPULATION_CFG_BYPASS_IND          =   1'h0;
parameter           P_LANE1_TX_MANIPULATION_CFG_BYTE_INVERT         =   1'h0;
parameter           P_LANE1_TX_MANIPULATION_CFG_POL_INVERT          =   1'h0;
parameter   [4:0]   P_LANE1_TX_MANIPULATION_CFG_SLIP_DISTANCE       =   5'h0;
parameter           P_LANE1_WORD_ALIGN_CFG_BYPASS_MODE              =   1'h0;
parameter           P_LANE1_WORD_ALIGN_CFG_DOUBLE_K_MODE            =   1'h0;
parameter   [8:0]   P_LANE1_WORD_ALIGN_CFG_FILTER_TOP               =   9'h10;
parameter   [3:0]   P_LANE1_WORD_ALIGN_CFG_GOOD_DETECT_CNT_TOP      =   4'h3;
parameter   [19:0]  P_LANE1_WORD_ALIGN_CFG_K                        =   20'h17c;
parameter   [19:0]  P_LANE1_WORD_ALIGN_CFG_K_MASK                   =   20'h3ff;
parameter   [3:0]   P_LANE1_WORD_ALIGN_CFG_PRE_LOCK_LEVEL_TOP       =   4'h3;
parameter   [3:0]   P_LANE1_WORD_ALIGN_CFG_PRE_UNLOCK_LEVEL_TOP     =   4'h3;
parameter           P_LANE2_CFG_ENABLE_TM                           =   1'h0;
parameter           P_LANE2_CFG_GBD_RST                             =   1'h1;
parameter           P_LANE2_CFG_GBU_RST                             =   1'h1;
parameter           P_LANE2_CFG_PCS_RX_B2C_CLKMUX_SEL               =   1'h0;
parameter   [1:0]   P_LANE2_CFG_PCS_RX_C2I_CLKMUX_SEL               =   2'h0;
parameter           P_LANE2_CFG_PCS_RX_DEC_CLKMUX_SEL               =   1'h0;
parameter           P_LANE2_CFG_PCS_TX_CLKMUX_SEL                   =   1'h0;
parameter   [2:0]   P_LANE2_CFG_PMA_TX_CLKMUX_SEL                   =   3'h0;
parameter           P_LANE2_CFG_RX2TX_LP_EN                         =   1'h0;
parameter           P_LANE2_CFG_RX_ALI_TRI_OVR_B                    =   1'h0;
parameter           P_LANE2_CFG_RX_ALI_TRI_VAL                      =   1'h0;
parameter           P_LANE2_CFG_RX_CHB_STR_SRC_SEL                  =   1'h0;
parameter           P_LANE2_CFG_RX_SIG_DET_OVR                      =   1'h0;
parameter           P_LANE2_CFG_RX_SIG_DET_VAL                      =   1'h0;
parameter           P_LANE2_CFG_RX_VLD_OVR                          =   1'h0;
parameter           P_LANE2_CFG_RX_VLD_VAL                          =   1'h0;
parameter           P_LANE2_CFG_TX2RX_LP_EN                         =   1'h0;
parameter   [1:0]   P_LANE2_CFG_WIDTH_MODE                          =   2'h1;
parameter   [4:0]   P_LANE2_CHBOND_CFG_AEMPTY_DEPTH                 =   5'h3;
parameter   [4:0]   P_LANE2_CHBOND_CFG_AFULL_DEPTH                  =   5'hc;
parameter   [7:0]   P_LANE2_CHBOND_CFG_ALIGN_PATTERN                =   8'h7c;
parameter           P_LANE2_CHBOND_CFG_BYPASS_MODE                  =   1'h0;
parameter   [4:0]   P_LANE2_CHBOND_CFG_MAX_SKEW                     =   5'h4;
parameter   [1:0]   P_LANE2_CHBOND_CFG_MST_SEL                      =   2'h0;
parameter   [4:0]   P_LANE2_CHBOND_CFG_RD_START_DEPTH               =   5'h8;
parameter   [5:0]   P_LANE2_CHBOND_CFG_SAMPLE_RATE                  =   6'h0;
parameter           P_LANE2_CTC_CFG_ADD_MODE                        =   1'h0;
parameter   [4:0]   P_LANE2_CTC_CFG_AEMPTY_DEPTH                    =   5'h3;
parameter   [4:0]   P_LANE2_CTC_CFG_AFULL_DEPTH                     =   5'hc;
parameter           P_LANE2_CTC_CFG_BYPASS_MODE                     =   1'h0;
parameter   [1:0]   P_LANE2_CTC_CFG_MST_SEL                         =   2'h0;
parameter   [4:0]   P_LANE2_CTC_CFG_RD_START_DEPTH                  =   5'h8;
parameter           P_LANE2_CTC_CFG_RM_MODE                         =   1'h0;
parameter   [7:0]   P_LANE2_CTC_CFG_SKIP_PATTERN                    =   8'h1c;
parameter           P_LANE2_DEC_CFG_BYPASS_MODE                     =   1'h0;
parameter           P_LANE2_ENC_CFG_BYPASS_MODE                     =   1'h0;
parameter           P_LANE2_GEARBOX_DOWNSPEED_CFG_BYPASS_MODE       =   1'h0;
parameter           P_LANE2_GEARBOX_DOWNSPEED_CFG_DIV2_SEL          =   1'h0;
parameter           P_LANE2_GEARBOX_DOWNSPEED_CFG_HALF_SEL          =   1'h0;
parameter           P_LANE2_GEARBOX_DOWNSPEED_CFG_SOURCE_CLK_SEL    =   1'h0;
parameter           P_LANE2_GEARBOX_UPSPEED_CFG_BYPASS_MODE         =   1'h0;
parameter           P_LANE2_GEARBOX_UPSPEED_CFG_DIV2_SEL            =   1'h0;
parameter           P_LANE2_GEARBOX_UPSPEED_CFG_HALF_SEL            =   1'h0;
parameter           P_LANE2_GEARBOX_UPSPEED_CFG_SOURCE_CLK_SEL      =   1'h0;
parameter   [3:0]   P_LANE2_OS_CFG_ADD_TOP                          =   4'h8;
parameter   [3:0]   P_LANE2_OS_CFG_AEMPTY_DEPTH                     =   4'h4;
parameter   [3:0]   P_LANE2_OS_CFG_AFULL_DEPTH                      =   4'hc;
parameter           P_LANE2_OS_CFG_BYPASS_MODE                      =   1'h1;
parameter           P_LANE2_OS_CFG_DOWN_SAMPLE0                     =   1'h0;
parameter   [1:0]   P_LANE2_OS_CFG_DOWN_SAMPLE1                     =   2'h0;
parameter   [3:0]   P_LANE2_OS_CFG_FILTER_TOP                       =   4'h8;
parameter           P_LANE2_OS_CFG_LINEAR_MODE                      =   1'h0;
parameter   [3:0]   P_LANE2_OS_CFG_RD_START_DEPTH                   =   4'h8;
parameter           P_LANE2_OS_TX_CFG_BYPASS_MODE                   =   1'h1;
parameter           P_LANE2_PRBS_RX_CFG_BER_MODE_I                  =   1'h0;
parameter   [3:0]   P_LANE2_PRBS_RX_CFG_BYTE_CNT_WIDTH_I            =   4'h0;
parameter           P_LANE2_PRBS_RX_CFG_CHK_PREAM_I                 =   1'h0;
parameter           P_LANE2_PRBS_RX_CFG_DATA_MODE_I                 =   1'h0;
parameter           P_LANE2_PRBS_RX_CFG_EN_I                        =   1'h0;
parameter           P_LANE2_PRBS_RX_CFG_ERR_CLR_I                   =   1'h0;
parameter           P_LANE2_PRBS_RX_CFG_INV_PRBS_I                  =   1'h0;
parameter   [1:0]   P_LANE2_PRBS_RX_CFG_LFSR_I                      =   2'h0;
parameter           P_LANE2_PRBS_RX_CFG_LOAD_UDP_I                  =   1'h0;
parameter   [1:0]   P_LANE2_PRBS_RX_CFG_MUX_SEL_BIST                =   2'h0;
parameter   [1:0]   P_LANE2_PRBS_RX_CFG_PRBS_MODE_I                 =   2'h0;
parameter   [9:0]   P_LANE2_PRBS_RX_CFG_PREAM0_I                    =   10'h0;
parameter   [9:0]   P_LANE2_PRBS_RX_CFG_PREAM1_I                    =   10'h0;
parameter   [39:0]  P_LANE2_PRBS_RX_CFG_UDP_I                       =   40'h0;
parameter           P_LANE2_PRBS_TX_CFG_DATA_MODE_I                 =   1'h0;
parameter           P_LANE2_PRBS_TX_CFG_DIS_HW_ERR_I                =   1'h0;
parameter           P_LANE2_PRBS_TX_CFG_EN_I                        =   1'h0;
parameter           P_LANE2_PRBS_TX_CFG_GEN_ERR_I                   =   1'h0;
parameter           P_LANE2_PRBS_TX_CFG_INV_PRBS_I                  =   1'h0;
parameter   [1:0]   P_LANE2_PRBS_TX_CFG_LFSR_I                      =   2'h0;
parameter           P_LANE2_PRBS_TX_CFG_LOAD_UDP_I                  =   1'h0;
parameter   [1:0]   P_LANE2_PRBS_TX_CFG_MUX_SEL_BIST                =   2'h0;
parameter   [5:0]   P_LANE2_PRBS_TX_CFG_OVER_SAMPLE_I               =   6'h0;
parameter   [1:0]   P_LANE2_PRBS_TX_CFG_PRBS_MODE_I                 =   2'h0;
parameter   [9:0]   P_LANE2_PRBS_TX_CFG_PREAM0_I                    =   10'h0;
parameter   [9:0]   P_LANE2_PRBS_TX_CFG_PREAM1_I                    =   10'h0;
parameter           P_LANE2_PRBS_TX_CFG_SEND_PREAM_I                =   1'h0;
parameter           P_LANE2_PRBS_TX_CFG_TRIG_MODE_I                 =   1'h0;
parameter   [39:0]  P_LANE2_PRBS_TX_CFG_UDP_I                       =   40'h0;
parameter   [4:0]   P_LANE2_RX_IF_CFG_AEMPTY_DEPTH                  =   5'hc;
parameter   [4:0]   P_LANE2_RX_IF_CFG_AFULL_DEPTH                   =   5'h8;
parameter           P_LANE2_RX_IF_CFG_HALF_RATE                     =   1'h0;
parameter           P_LANE2_RX_MANIPULATION_CFG_BIT_INVERT          =   1'h0;
parameter           P_LANE2_RX_MANIPULATION_CFG_BYPASS_IND          =   1'h0;
parameter           P_LANE2_RX_MANIPULATION_CFG_BYTE_INVERT         =   1'h0;
parameter           P_LANE2_RX_MANIPULATION_CFG_POL_INVERT          =   1'h0;
parameter   [4:0]   P_LANE2_RX_MANIPULATION_CFG_SLIP_DISTANCE       =   5'h0;
parameter   [4:0]   P_LANE2_TX_IF_CFG_AEMPTY_DEPTH                  =   5'h4;
parameter   [4:0]   P_LANE2_TX_IF_CFG_AFULL_DEPTH                   =   5'h18;
parameter           P_LANE2_TX_IF_CFG_HALF_RATE                     =   1'h0;
parameter   [1:0]   P_LANE2_TX_IF_CFG_MST_SEL                       =   2'h0;
parameter   [4:0]   P_LANE2_TX_IF_CFG_RD_START_DEPTH                =   5'ha;
parameter   [5:0]   P_LANE2_TX_IF_CFG_SAMPLE_RATE                   =   6'h0;
parameter           P_LANE2_TX_MANIPULATION_CFG_BIT_INVERT          =   1'h0;
parameter           P_LANE2_TX_MANIPULATION_CFG_BYPASS_IND          =   1'h0;
parameter           P_LANE2_TX_MANIPULATION_CFG_BYTE_INVERT         =   1'h0;
parameter           P_LANE2_TX_MANIPULATION_CFG_POL_INVERT          =   1'h0;
parameter   [4:0]   P_LANE2_TX_MANIPULATION_CFG_SLIP_DISTANCE       =   5'h0;
parameter           P_LANE2_WORD_ALIGN_CFG_BYPASS_MODE              =   1'h0;
parameter           P_LANE2_WORD_ALIGN_CFG_DOUBLE_K_MODE            =   1'h0;
parameter   [8:0]   P_LANE2_WORD_ALIGN_CFG_FILTER_TOP               =   9'h10;
parameter   [3:0]   P_LANE2_WORD_ALIGN_CFG_GOOD_DETECT_CNT_TOP      =   4'h3;
parameter   [19:0]  P_LANE2_WORD_ALIGN_CFG_K                        =   20'h17c;
parameter   [19:0]  P_LANE2_WORD_ALIGN_CFG_K_MASK                   =   20'h3ff;
parameter   [3:0]   P_LANE2_WORD_ALIGN_CFG_PRE_LOCK_LEVEL_TOP       =   4'h3;
parameter   [3:0]   P_LANE2_WORD_ALIGN_CFG_PRE_UNLOCK_LEVEL_TOP     =   4'h3;
parameter           P_LANE3_CFG_ENABLE_TM                           =   1'h0;
parameter           P_LANE3_CFG_GBD_RST                             =   1'h1;
parameter           P_LANE3_CFG_GBU_RST                             =   1'h1;
parameter           P_LANE3_CFG_PCS_RX_B2C_CLKMUX_SEL               =   1'h0;
parameter   [1:0]   P_LANE3_CFG_PCS_RX_C2I_CLKMUX_SEL               =   2'h0;
parameter           P_LANE3_CFG_PCS_RX_DEC_CLKMUX_SEL               =   1'h0;
parameter           P_LANE3_CFG_PCS_TX_CLKMUX_SEL                   =   1'h0;
parameter   [2:0]   P_LANE3_CFG_PMA_TX_CLKMUX_SEL                   =   3'h0;
parameter           P_LANE3_CFG_RX2TX_LP_EN                         =   1'h0;
parameter           P_LANE3_CFG_RX_ALI_TRI_OVR_B                    =   1'h0;
parameter           P_LANE3_CFG_RX_ALI_TRI_VAL                      =   1'h0;
parameter           P_LANE3_CFG_RX_CHB_STR_SRC_SEL                  =   1'h0;
parameter           P_LANE3_CFG_RX_SIG_DET_OVR                      =   1'h0;
parameter           P_LANE3_CFG_RX_SIG_DET_VAL                      =   1'h0;
parameter           P_LANE3_CFG_RX_VLD_OVR                          =   1'h0;
parameter           P_LANE3_CFG_RX_VLD_VAL                          =   1'h0;
parameter           P_LANE3_CFG_TX2RX_LP_EN                         =   1'h0;
parameter   [1:0]   P_LANE3_CFG_WIDTH_MODE                          =   2'h1;
parameter   [4:0]   P_LANE3_CHBOND_CFG_AEMPTY_DEPTH                 =   5'h3;
parameter   [4:0]   P_LANE3_CHBOND_CFG_AFULL_DEPTH                  =   5'hc;
parameter   [7:0]   P_LANE3_CHBOND_CFG_ALIGN_PATTERN                =   8'h7c;
parameter           P_LANE3_CHBOND_CFG_BYPASS_MODE                  =   1'h0;
parameter   [4:0]   P_LANE3_CHBOND_CFG_MAX_SKEW                     =   5'h4;
parameter   [1:0]   P_LANE3_CHBOND_CFG_MST_SEL                      =   2'h0;
parameter   [4:0]   P_LANE3_CHBOND_CFG_RD_START_DEPTH               =   5'h8;
parameter   [5:0]   P_LANE3_CHBOND_CFG_SAMPLE_RATE                  =   6'h0;
parameter           P_LANE3_CTC_CFG_ADD_MODE                        =   1'h0;
parameter   [4:0]   P_LANE3_CTC_CFG_AEMPTY_DEPTH                    =   5'h3;
parameter   [4:0]   P_LANE3_CTC_CFG_AFULL_DEPTH                     =   5'hc;
parameter           P_LANE3_CTC_CFG_BYPASS_MODE                     =   1'h0;
parameter   [1:0]   P_LANE3_CTC_CFG_MST_SEL                         =   2'h0;
parameter   [4:0]   P_LANE3_CTC_CFG_RD_START_DEPTH                  =   5'h8;
parameter           P_LANE3_CTC_CFG_RM_MODE                         =   1'h0;
parameter   [7:0]   P_LANE3_CTC_CFG_SKIP_PATTERN                    =   8'h1c;
parameter           P_LANE3_DEC_CFG_BYPASS_MODE                     =   1'h0;
parameter           P_LANE3_ENC_CFG_BYPASS_MODE                     =   1'h0;
parameter           P_LANE3_GEARBOX_DOWNSPEED_CFG_BYPASS_MODE       =   1'h0;
parameter           P_LANE3_GEARBOX_DOWNSPEED_CFG_DIV2_SEL          =   1'h0;
parameter           P_LANE3_GEARBOX_DOWNSPEED_CFG_HALF_SEL          =   1'h0;
parameter           P_LANE3_GEARBOX_DOWNSPEED_CFG_SOURCE_CLK_SEL    =   1'h0;
parameter           P_LANE3_GEARBOX_UPSPEED_CFG_BYPASS_MODE         =   1'h0;
parameter           P_LANE3_GEARBOX_UPSPEED_CFG_DIV2_SEL            =   1'h0;
parameter           P_LANE3_GEARBOX_UPSPEED_CFG_HALF_SEL            =   1'h0;
parameter           P_LANE3_GEARBOX_UPSPEED_CFG_SOURCE_CLK_SEL      =   1'h0;
parameter   [3:0]   P_LANE3_OS_CFG_ADD_TOP                          =   4'h8;
parameter   [3:0]   P_LANE3_OS_CFG_AEMPTY_DEPTH                     =   4'h4;
parameter   [3:0]   P_LANE3_OS_CFG_AFULL_DEPTH                      =   4'hc;
parameter           P_LANE3_OS_CFG_BYPASS_MODE                      =   1'h1;
parameter           P_LANE3_OS_CFG_DOWN_SAMPLE0                     =   1'h0;
parameter   [1:0]   P_LANE3_OS_CFG_DOWN_SAMPLE1                     =   2'h0;
parameter   [3:0]   P_LANE3_OS_CFG_FILTER_TOP                       =   4'h8;
parameter           P_LANE3_OS_CFG_LINEAR_MODE                      =   1'h0;
parameter   [3:0]   P_LANE3_OS_CFG_RD_START_DEPTH                   =   4'h8;
parameter           P_LANE3_OS_TX_CFG_BYPASS_MODE                   =   1'h1;
parameter           P_LANE3_PRBS_RX_CFG_BER_MODE_I                  =   1'h0;
parameter   [3:0]   P_LANE3_PRBS_RX_CFG_BYTE_CNT_WIDTH_I            =   4'h0;
parameter           P_LANE3_PRBS_RX_CFG_CHK_PREAM_I                 =   1'h0;
parameter           P_LANE3_PRBS_RX_CFG_DATA_MODE_I                 =   1'h0;
parameter           P_LANE3_PRBS_RX_CFG_EN_I                        =   1'h0;
parameter           P_LANE3_PRBS_RX_CFG_ERR_CLR_I                   =   1'h0;
parameter           P_LANE3_PRBS_RX_CFG_INV_PRBS_I                  =   1'h0;
parameter   [1:0]   P_LANE3_PRBS_RX_CFG_LFSR_I                      =   2'h0;
parameter           P_LANE3_PRBS_RX_CFG_LOAD_UDP_I                  =   1'h0;
parameter   [1:0]   P_LANE3_PRBS_RX_CFG_MUX_SEL_BIST                =   2'h0;
parameter   [1:0]   P_LANE3_PRBS_RX_CFG_PRBS_MODE_I                 =   2'h0;
parameter   [9:0]   P_LANE3_PRBS_RX_CFG_PREAM0_I                    =   10'h0;
parameter   [9:0]   P_LANE3_PRBS_RX_CFG_PREAM1_I                    =   10'h0;
parameter   [39:0]  P_LANE3_PRBS_RX_CFG_UDP_I                       =   40'h0;
parameter           P_LANE3_PRBS_TX_CFG_DATA_MODE_I                 =   1'h0;
parameter           P_LANE3_PRBS_TX_CFG_DIS_HW_ERR_I                =   1'h0;
parameter           P_LANE3_PRBS_TX_CFG_EN_I                        =   1'h0;
parameter           P_LANE3_PRBS_TX_CFG_GEN_ERR_I                   =   1'h0;
parameter           P_LANE3_PRBS_TX_CFG_INV_PRBS_I                  =   1'h0;
parameter   [1:0]   P_LANE3_PRBS_TX_CFG_LFSR_I                      =   2'h0;
parameter           P_LANE3_PRBS_TX_CFG_LOAD_UDP_I                  =   1'h0;
parameter   [1:0]   P_LANE3_PRBS_TX_CFG_MUX_SEL_BIST                =   2'h0;
parameter   [5:0]   P_LANE3_PRBS_TX_CFG_OVER_SAMPLE_I               =   6'h0;
parameter   [1:0]   P_LANE3_PRBS_TX_CFG_PRBS_MODE_I                 =   2'h0;
parameter   [9:0]   P_LANE3_PRBS_TX_CFG_PREAM0_I                    =   10'h0;
parameter   [9:0]   P_LANE3_PRBS_TX_CFG_PREAM1_I                    =   10'h0;
parameter           P_LANE3_PRBS_TX_CFG_SEND_PREAM_I                =   1'h0;
parameter           P_LANE3_PRBS_TX_CFG_TRIG_MODE_I                 =   1'h0;
parameter   [39:0]  P_LANE3_PRBS_TX_CFG_UDP_I                       =   40'h0;
parameter   [4:0]   P_LANE3_RX_IF_CFG_AEMPTY_DEPTH                  =   5'hc;
parameter   [4:0]   P_LANE3_RX_IF_CFG_AFULL_DEPTH                   =   5'h8;
parameter           P_LANE3_RX_IF_CFG_HALF_RATE                     =   1'h0;
parameter           P_LANE3_RX_MANIPULATION_CFG_BIT_INVERT          =   1'h0;
parameter           P_LANE3_RX_MANIPULATION_CFG_BYPASS_IND          =   1'h0;
parameter           P_LANE3_RX_MANIPULATION_CFG_BYTE_INVERT         =   1'h0;
parameter           P_LANE3_RX_MANIPULATION_CFG_POL_INVERT          =   1'h0;
parameter   [4:0]   P_LANE3_RX_MANIPULATION_CFG_SLIP_DISTANCE       =   5'h0;
parameter   [4:0]   P_LANE3_TX_IF_CFG_AEMPTY_DEPTH                  =   5'h4;
parameter   [4:0]   P_LANE3_TX_IF_CFG_AFULL_DEPTH                   =   5'h18;
parameter           P_LANE3_TX_IF_CFG_HALF_RATE                     =   1'h0;
parameter   [1:0]   P_LANE3_TX_IF_CFG_MST_SEL                       =   2'h0;
parameter   [4:0]   P_LANE3_TX_IF_CFG_RD_START_DEPTH                =   5'ha;
parameter   [5:0]   P_LANE3_TX_IF_CFG_SAMPLE_RATE                   =   6'h0;
parameter           P_LANE3_TX_MANIPULATION_CFG_BIT_INVERT          =   1'h0;
parameter           P_LANE3_TX_MANIPULATION_CFG_BYPASS_IND          =   1'h0;
parameter           P_LANE3_TX_MANIPULATION_CFG_BYTE_INVERT         =   1'h0;
parameter           P_LANE3_TX_MANIPULATION_CFG_POL_INVERT          =   1'h0;
parameter   [4:0]   P_LANE3_TX_MANIPULATION_CFG_SLIP_DISTANCE       =   5'h0;
parameter           P_LANE3_WORD_ALIGN_CFG_BYPASS_MODE              =   1'h0;
parameter           P_LANE3_WORD_ALIGN_CFG_DOUBLE_K_MODE            =   1'h0;
parameter   [8:0]   P_LANE3_WORD_ALIGN_CFG_FILTER_TOP               =   9'h10;
parameter   [3:0]   P_LANE3_WORD_ALIGN_CFG_GOOD_DETECT_CNT_TOP      =   4'h3;
parameter   [19:0]  P_LANE3_WORD_ALIGN_CFG_K                        =   20'h17c;
parameter   [19:0]  P_LANE3_WORD_ALIGN_CFG_K_MASK                   =   20'h3ff;
parameter   [3:0]   P_LANE3_WORD_ALIGN_CFG_PRE_LOCK_LEVEL_TOP       =   4'h3;
parameter   [3:0]   P_LANE3_WORD_ALIGN_CFG_PRE_UNLOCK_LEVEL_TOP     =   4'h3;
parameter   [31:0]  P_LN0_CFG_RESERVED0                             =   32'h0;
parameter   [31:0]  P_LN1_CFG_RESERVED0                             =   32'h0;
parameter   [31:0]  P_LN2_CFG_RESERVED0                             =   32'h0;
parameter   [31:0]  P_LN3_CFG_RESERVED0                             =   32'h0;
parameter           P_QUAD_CLK_SEL                                  =   1'h1;
parameter   [1:0]   P_QUAD_PMA_RX_CLK_SEL                           =   2'h0;
//end add parameter in csr
//add parameter in quad
parameter           P_CMU0_AHB_CMU_X0                               =   8'h0;
parameter           P_CMU0_AHB_CMU_X1                               =   8'h0;
parameter           P_CMU0_AHB_CMU_X10                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X100                             =   8'h30;
parameter           P_CMU0_AHB_CMU_X101                             =   8'h16;
parameter           P_CMU0_AHB_CMU_X102                             =   8'h12;
parameter           P_CMU0_AHB_CMU_X103                             =   8'hF0;
parameter           P_CMU0_AHB_CMU_X104                             =   8'h17;
parameter           P_CMU0_AHB_CMU_X105                             =   8'h30;
parameter           P_CMU0_AHB_CMU_X106                             =   8'h8;
parameter           P_CMU0_AHB_CMU_X108                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X109                             =   8'h10;
parameter           P_CMU0_AHB_CMU_X11                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X110                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X111                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X112                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X113                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X114                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X115                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X116                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X117                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X118                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X119                             =   8'h90;
parameter           P_CMU0_AHB_CMU_X12                              =   8'hFF;
parameter           P_CMU0_AHB_CMU_X120                             =   8'h2;
parameter           P_CMU0_AHB_CMU_X121                             =   8'h40;
parameter           P_CMU0_AHB_CMU_X122                             =   8'h19;
parameter           P_CMU0_AHB_CMU_X123                             =   8'h19;
parameter           P_CMU0_AHB_CMU_X124                             =   8'h5;
parameter           P_CMU0_AHB_CMU_X125                             =   8'h92;
parameter           P_CMU0_AHB_CMU_X126                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X127                             =   8'h8;
parameter           P_CMU0_AHB_CMU_X128                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X129                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X13                              =   8'hFF;
parameter           P_CMU0_AHB_CMU_X130                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X131                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X132                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X133                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X134                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X135                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X136                             =   8'h3;
parameter           P_CMU0_AHB_CMU_X137                             =   8'h26;
parameter           P_CMU0_AHB_CMU_X138                             =   8'h39;
parameter           P_CMU0_AHB_CMU_X139                             =   8'h15;
parameter           P_CMU0_AHB_CMU_X14                              =   8'h44;
parameter           P_CMU0_AHB_CMU_X140                             =   8'h2;
parameter           P_CMU0_AHB_CMU_X141                             =   8'hC0;
parameter           P_CMU0_AHB_CMU_X142                             =   8'h63;
parameter           P_CMU0_AHB_CMU_X143                             =   8'hD0;
parameter           P_CMU0_AHB_CMU_X144                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X145                             =   8'h80;
parameter           P_CMU0_AHB_CMU_X146                             =   8'hE0;
parameter           P_CMU0_AHB_CMU_X147                             =   8'hC3;
parameter           P_CMU0_AHB_CMU_X148                             =   8'h5;
parameter           P_CMU0_AHB_CMU_X149                             =   8'h3;
parameter           P_CMU0_AHB_CMU_X15                              =   8'h11;
parameter           P_CMU0_AHB_CMU_X150                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X151                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X152                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X153                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X154                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X16                              =   8'h2;
parameter           P_CMU0_AHB_CMU_X161                             =   8'h88;
parameter           P_CMU0_AHB_CMU_X162                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X163                             =   8'h1E;
parameter           P_CMU0_AHB_CMU_X164                             =   8'hA;
parameter           P_CMU0_AHB_CMU_X165                             =   8'h28;
parameter           P_CMU0_AHB_CMU_X166                             =   8'h19;
parameter           P_CMU0_AHB_CMU_X167                             =   8'hA;
parameter           P_CMU0_AHB_CMU_X168                             =   8'h19;
parameter           P_CMU0_AHB_CMU_X169                             =   8'h7;
parameter           P_CMU0_AHB_CMU_X17                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X170                             =   8'h2D;
parameter           P_CMU0_AHB_CMU_X171                             =   8'h9;
parameter           P_CMU0_AHB_CMU_X172                             =   8'h37;
parameter           P_CMU0_AHB_CMU_X173                             =   8'h18;
parameter           P_CMU0_AHB_CMU_X174                             =   8'h37;
parameter           P_CMU0_AHB_CMU_X175                             =   8'hA;
parameter           P_CMU0_AHB_CMU_X176                             =   8'h41;
parameter           P_CMU0_AHB_CMU_X177                             =   8'hA;
parameter           P_CMU0_AHB_CMU_X178                             =   8'h46;
parameter           P_CMU0_AHB_CMU_X179                             =   8'hC;
parameter           P_CMU0_AHB_CMU_X18                              =   8'h2;
parameter           P_CMU0_AHB_CMU_X180                             =   8'h50;
parameter           P_CMU0_AHB_CMU_X181                             =   8'hB;
parameter           P_CMU0_AHB_CMU_X182                             =   8'h5A;
parameter           P_CMU0_AHB_CMU_X183                             =   8'h80;
parameter           P_CMU0_AHB_CMU_X184                             =   8'hD3;
parameter           P_CMU0_AHB_CMU_X185                             =   8'h23;
parameter           P_CMU0_AHB_CMU_X186                             =   8'h2C;
parameter           P_CMU0_AHB_CMU_X187                             =   8'h9;
parameter           P_CMU0_AHB_CMU_X188                             =   8'h4D;
parameter           P_CMU0_AHB_CMU_X189                             =   8'h11;
parameter           P_CMU0_AHB_CMU_X19                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X190                             =   8'h64;
parameter           P_CMU0_AHB_CMU_X191                             =   8'h9;
parameter           P_CMU0_AHB_CMU_X192                             =   8'h73;
parameter           P_CMU0_AHB_CMU_X193                             =   8'h5;
parameter           P_CMU0_AHB_CMU_X194                             =   8'h7D;
parameter           P_CMU0_AHB_CMU_X195                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X196                             =   8'h80;
parameter           P_CMU0_AHB_CMU_X197                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X198                             =   8'h3;
parameter           P_CMU0_AHB_CMU_X199                             =   8'hFF;
parameter           P_CMU0_AHB_CMU_X2                               =   8'h0;
parameter           P_CMU0_AHB_CMU_X20                              =   8'h1;
parameter           P_CMU0_AHB_CMU_X200                             =   8'h7F;
parameter           P_CMU0_AHB_CMU_X201                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X202                             =   8'hDC;
parameter           P_CMU0_AHB_CMU_X203                             =   8'hFF;
parameter           P_CMU0_AHB_CMU_X204                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X205                             =   8'hC4;
parameter           P_CMU0_AHB_CMU_X206                             =   8'hFF;
parameter           P_CMU0_AHB_CMU_X207                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X208                             =   8'hE4;
parameter           P_CMU0_AHB_CMU_X209                             =   8'h6A;
parameter           P_CMU0_AHB_CMU_X21                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X210                             =   8'h4;
parameter           P_CMU0_AHB_CMU_X211                             =   8'hFF;
parameter           P_CMU0_AHB_CMU_X212                             =   8'h7F;
parameter           P_CMU0_AHB_CMU_X213                             =   8'h4;
parameter           P_CMU0_AHB_CMU_X214                             =   8'h7;
parameter           P_CMU0_AHB_CMU_X215                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X216                             =   8'h7;
parameter           P_CMU0_AHB_CMU_X217                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X218                             =   8'h7;
parameter           P_CMU0_AHB_CMU_X219                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X22                              =   8'h36;
parameter           P_CMU0_AHB_CMU_X220                             =   8'h46;
parameter           P_CMU0_AHB_CMU_X221                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X222                             =   8'h7;
parameter           P_CMU0_AHB_CMU_X223                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X224                             =   8'h2;
parameter           P_CMU0_AHB_CMU_X225                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X226                             =   8'h2;
parameter           P_CMU0_AHB_CMU_X227                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X228                             =   8'h7;
parameter           P_CMU0_AHB_CMU_X229                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X23                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X230                             =   8'h2;
parameter           P_CMU0_AHB_CMU_X231                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X232                             =   8'h2;
parameter           P_CMU0_AHB_CMU_X233                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X234                             =   8'h1A;
parameter           P_CMU0_AHB_CMU_X235                             =   8'h4;
parameter           P_CMU0_AHB_CMU_X236                             =   8'h5E;
parameter           P_CMU0_AHB_CMU_X237                             =   8'h1;
parameter           P_CMU0_AHB_CMU_X238                             =   8'h5E;
parameter           P_CMU0_AHB_CMU_X239                             =   8'h1;
parameter           P_CMU0_AHB_CMU_X24                              =   8'h36;
parameter           P_CMU0_AHB_CMU_X240                             =   8'h46;
parameter           P_CMU0_AHB_CMU_X241                             =   8'h0;
parameter           P_CMU0_AHB_CMU_X242                             =   8'hBC;
parameter           P_CMU0_AHB_CMU_X243                             =   8'h2;
parameter           P_CMU0_AHB_CMU_X244                             =   8'h88;
parameter           P_CMU0_AHB_CMU_X245                             =   8'h13;
parameter           P_CMU0_AHB_CMU_X246                             =   8'hE8;
parameter           P_CMU0_AHB_CMU_X247                             =   8'h3;
parameter           P_CMU0_AHB_CMU_X248                             =   8'hB8;
parameter           P_CMU0_AHB_CMU_X249                             =   8'hB;
parameter           P_CMU0_AHB_CMU_X25                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X250                             =   8'h88;
parameter           P_CMU0_AHB_CMU_X251                             =   8'h13;
parameter           P_CMU0_AHB_CMU_X26                              =   8'h36;
parameter           P_CMU0_AHB_CMU_X27                              =   8'h36;
parameter           P_CMU0_AHB_CMU_X28                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X29                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X30                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X31                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X32                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X33                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X34                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X35                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X36                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X37                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X38                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X39                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X40                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X56                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X57                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X58                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X59                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X6                               =   8'h1;
parameter           P_CMU0_AHB_CMU_X60                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X61                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X62                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X63                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X64                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X65                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X66                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X67                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X68                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X69                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X7                               =   8'h83;
parameter           P_CMU0_AHB_CMU_X70                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X71                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X72                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X73                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X74                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X75                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X76                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X77                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X78                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X79                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X8                               =   8'h7;
parameter           P_CMU0_AHB_CMU_X80                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X81                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X82                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X83                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X84                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X85                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X86                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X87                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X88                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X89                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X9                               =   8'h7F;
parameter           P_CMU0_AHB_CMU_X90                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X91                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X92                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X93                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X94                              =   8'h6;
parameter           P_CMU0_AHB_CMU_X95                              =   8'h97;
parameter           P_CMU0_AHB_CMU_X96                              =   8'hAF;
parameter           P_CMU0_AHB_CMU_X97                              =   8'h10;
parameter           P_CMU0_AHB_CMU_X98                              =   8'h0;
parameter           P_CMU0_AHB_CMU_X99                              =   8'h97;
parameter           P_CMU1_AHB_CMU_X0                               =   8'h0;
parameter           P_CMU1_AHB_CMU_X1                               =   8'h0;
parameter           P_CMU1_AHB_CMU_X10                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X100                             =   8'h30;
parameter           P_CMU1_AHB_CMU_X101                             =   8'h16;
parameter           P_CMU1_AHB_CMU_X102                             =   8'h12;
parameter           P_CMU1_AHB_CMU_X103                             =   8'hF0;
parameter           P_CMU1_AHB_CMU_X104                             =   8'h17;
parameter           P_CMU1_AHB_CMU_X105                             =   8'h30;
parameter           P_CMU1_AHB_CMU_X106                             =   8'h8;
parameter           P_CMU1_AHB_CMU_X108                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X109                             =   8'h10;
parameter           P_CMU1_AHB_CMU_X11                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X110                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X111                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X112                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X113                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X114                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X115                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X116                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X117                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X118                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X119                             =   8'h90;
parameter           P_CMU1_AHB_CMU_X12                              =   8'hFF;
parameter           P_CMU1_AHB_CMU_X120                             =   8'h2;
parameter           P_CMU1_AHB_CMU_X121                             =   8'h40;
parameter           P_CMU1_AHB_CMU_X122                             =   8'h19;
parameter           P_CMU1_AHB_CMU_X123                             =   8'h19;
parameter           P_CMU1_AHB_CMU_X124                             =   8'h5;
parameter           P_CMU1_AHB_CMU_X125                             =   8'h92;
parameter           P_CMU1_AHB_CMU_X126                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X127                             =   8'h8;
parameter           P_CMU1_AHB_CMU_X128                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X129                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X13                              =   8'hFF;
parameter           P_CMU1_AHB_CMU_X130                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X131                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X132                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X133                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X134                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X135                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X136                             =   8'h3;
parameter           P_CMU1_AHB_CMU_X137                             =   8'h26;
parameter           P_CMU1_AHB_CMU_X138                             =   8'h39;
parameter           P_CMU1_AHB_CMU_X139                             =   8'h15;
parameter           P_CMU1_AHB_CMU_X14                              =   8'h44;
parameter           P_CMU1_AHB_CMU_X140                             =   8'h2;
parameter           P_CMU1_AHB_CMU_X141                             =   8'hC0;
parameter           P_CMU1_AHB_CMU_X142                             =   8'h63;
parameter           P_CMU1_AHB_CMU_X143                             =   8'hD0;
parameter           P_CMU1_AHB_CMU_X144                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X145                             =   8'h80;
parameter           P_CMU1_AHB_CMU_X146                             =   8'hE0;
parameter           P_CMU1_AHB_CMU_X147                             =   8'hC3;
parameter           P_CMU1_AHB_CMU_X148                             =   8'h5;
parameter           P_CMU1_AHB_CMU_X149                             =   8'h3;
parameter           P_CMU1_AHB_CMU_X15                              =   8'h11;
parameter           P_CMU1_AHB_CMU_X150                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X151                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X152                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X153                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X154                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X16                              =   8'h2;
parameter           P_CMU1_AHB_CMU_X161                             =   8'h88;
parameter           P_CMU1_AHB_CMU_X162                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X163                             =   8'h1E;
parameter           P_CMU1_AHB_CMU_X164                             =   8'hA;
parameter           P_CMU1_AHB_CMU_X165                             =   8'h28;
parameter           P_CMU1_AHB_CMU_X166                             =   8'h19;
parameter           P_CMU1_AHB_CMU_X167                             =   8'hA;
parameter           P_CMU1_AHB_CMU_X168                             =   8'h19;
parameter           P_CMU1_AHB_CMU_X169                             =   8'h7;
parameter           P_CMU1_AHB_CMU_X17                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X170                             =   8'h2D;
parameter           P_CMU1_AHB_CMU_X171                             =   8'h9;
parameter           P_CMU1_AHB_CMU_X172                             =   8'h37;
parameter           P_CMU1_AHB_CMU_X173                             =   8'h18;
parameter           P_CMU1_AHB_CMU_X174                             =   8'h37;
parameter           P_CMU1_AHB_CMU_X175                             =   8'hA;
parameter           P_CMU1_AHB_CMU_X176                             =   8'h41;
parameter           P_CMU1_AHB_CMU_X177                             =   8'hA;
parameter           P_CMU1_AHB_CMU_X178                             =   8'h46;
parameter           P_CMU1_AHB_CMU_X179                             =   8'hC;
parameter           P_CMU1_AHB_CMU_X18                              =   8'h2;
parameter           P_CMU1_AHB_CMU_X180                             =   8'h50;
parameter           P_CMU1_AHB_CMU_X181                             =   8'hB;
parameter           P_CMU1_AHB_CMU_X182                             =   8'h5A;
parameter           P_CMU1_AHB_CMU_X183                             =   8'h80;
parameter           P_CMU1_AHB_CMU_X184                             =   8'hD3;
parameter           P_CMU1_AHB_CMU_X185                             =   8'h23;
parameter           P_CMU1_AHB_CMU_X186                             =   8'h2C;
parameter           P_CMU1_AHB_CMU_X187                             =   8'h9;
parameter           P_CMU1_AHB_CMU_X188                             =   8'h4D;
parameter           P_CMU1_AHB_CMU_X189                             =   8'h11;
parameter           P_CMU1_AHB_CMU_X19                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X190                             =   8'h64;
parameter           P_CMU1_AHB_CMU_X191                             =   8'h9;
parameter           P_CMU1_AHB_CMU_X192                             =   8'h73;
parameter           P_CMU1_AHB_CMU_X193                             =   8'h5;
parameter           P_CMU1_AHB_CMU_X194                             =   8'h7D;
parameter           P_CMU1_AHB_CMU_X195                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X196                             =   8'h80;
parameter           P_CMU1_AHB_CMU_X197                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X198                             =   8'h3;
parameter           P_CMU1_AHB_CMU_X199                             =   8'hFF;
parameter           P_CMU1_AHB_CMU_X2                               =   8'h0;
parameter           P_CMU1_AHB_CMU_X20                              =   8'h1;
parameter           P_CMU1_AHB_CMU_X200                             =   8'h7F;
parameter           P_CMU1_AHB_CMU_X201                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X202                             =   8'hDC;
parameter           P_CMU1_AHB_CMU_X203                             =   8'hFF;
parameter           P_CMU1_AHB_CMU_X204                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X205                             =   8'hC4;
parameter           P_CMU1_AHB_CMU_X206                             =   8'hFF;
parameter           P_CMU1_AHB_CMU_X207                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X208                             =   8'hE4;
parameter           P_CMU1_AHB_CMU_X209                             =   8'h6A;
parameter           P_CMU1_AHB_CMU_X21                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X210                             =   8'h4;
parameter           P_CMU1_AHB_CMU_X211                             =   8'hFF;
parameter           P_CMU1_AHB_CMU_X212                             =   8'h7F;
parameter           P_CMU1_AHB_CMU_X213                             =   8'h4;
parameter           P_CMU1_AHB_CMU_X214                             =   8'h7;
parameter           P_CMU1_AHB_CMU_X215                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X216                             =   8'h7;
parameter           P_CMU1_AHB_CMU_X217                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X218                             =   8'h7;
parameter           P_CMU1_AHB_CMU_X219                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X22                              =   8'h36;
parameter           P_CMU1_AHB_CMU_X220                             =   8'h46;
parameter           P_CMU1_AHB_CMU_X221                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X222                             =   8'h7;
parameter           P_CMU1_AHB_CMU_X223                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X224                             =   8'h2;
parameter           P_CMU1_AHB_CMU_X225                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X226                             =   8'h2;
parameter           P_CMU1_AHB_CMU_X227                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X228                             =   8'h7;
parameter           P_CMU1_AHB_CMU_X229                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X23                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X230                             =   8'h2;
parameter           P_CMU1_AHB_CMU_X231                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X232                             =   8'h2;
parameter           P_CMU1_AHB_CMU_X233                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X234                             =   8'h1A;
parameter           P_CMU1_AHB_CMU_X235                             =   8'h4;
parameter           P_CMU1_AHB_CMU_X236                             =   8'h5E;
parameter           P_CMU1_AHB_CMU_X237                             =   8'h1;
parameter           P_CMU1_AHB_CMU_X238                             =   8'h5E;
parameter           P_CMU1_AHB_CMU_X239                             =   8'h1;
parameter           P_CMU1_AHB_CMU_X24                              =   8'h36;
parameter           P_CMU1_AHB_CMU_X240                             =   8'h46;
parameter           P_CMU1_AHB_CMU_X241                             =   8'h0;
parameter           P_CMU1_AHB_CMU_X242                             =   8'hBC;
parameter           P_CMU1_AHB_CMU_X243                             =   8'h2;
parameter           P_CMU1_AHB_CMU_X244                             =   8'h88;
parameter           P_CMU1_AHB_CMU_X245                             =   8'h13;
parameter           P_CMU1_AHB_CMU_X246                             =   8'hE8;
parameter           P_CMU1_AHB_CMU_X247                             =   8'h3;
parameter           P_CMU1_AHB_CMU_X248                             =   8'hB8;
parameter           P_CMU1_AHB_CMU_X249                             =   8'hB;
parameter           P_CMU1_AHB_CMU_X25                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X250                             =   8'h88;
parameter           P_CMU1_AHB_CMU_X251                             =   8'h13;
parameter           P_CMU1_AHB_CMU_X26                              =   8'h36;
parameter           P_CMU1_AHB_CMU_X27                              =   8'h36;
parameter           P_CMU1_AHB_CMU_X28                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X29                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X30                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X31                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X32                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X33                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X34                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X35                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X36                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X37                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X38                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X39                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X40                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X56                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X57                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X58                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X59                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X6                               =   8'h1;
parameter           P_CMU1_AHB_CMU_X60                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X61                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X62                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X63                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X64                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X65                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X66                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X67                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X68                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X69                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X7                               =   8'h83;
parameter           P_CMU1_AHB_CMU_X70                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X71                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X72                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X73                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X74                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X75                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X76                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X77                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X78                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X79                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X8                               =   8'h7;
parameter           P_CMU1_AHB_CMU_X80                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X81                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X82                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X83                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X84                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X85                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X86                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X87                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X88                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X89                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X9                               =   8'h7F;
parameter           P_CMU1_AHB_CMU_X90                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X91                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X92                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X93                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X94                              =   8'h6;
parameter           P_CMU1_AHB_CMU_X95                              =   8'h97;
parameter           P_CMU1_AHB_CMU_X96                              =   8'hAF;
parameter           P_CMU1_AHB_CMU_X97                              =   8'h10;
parameter           P_CMU1_AHB_CMU_X98                              =   8'h0;
parameter           P_CMU1_AHB_CMU_X99                              =   8'h97;
parameter           P_LANE0_AHB_LANE_X0                             =   8'h11;
parameter           P_LANE0_AHB_LANE_X1                             =   8'h0;
parameter           P_LANE0_AHB_LANE_X10                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X100                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X101                           =   8'h88;
parameter           P_LANE0_AHB_LANE_X102                           =   8'hA;
parameter           P_LANE0_AHB_LANE_X103                           =   8'h50;
parameter           P_LANE0_AHB_LANE_X104                           =   8'hF;
parameter           P_LANE0_AHB_LANE_X105                           =   8'h25;
parameter           P_LANE0_AHB_LANE_X106                           =   8'hBC;
parameter           P_LANE0_AHB_LANE_X107                           =   8'h88;
parameter           P_LANE0_AHB_LANE_X108                           =   8'h24;
parameter           P_LANE0_AHB_LANE_X109                           =   8'hF0;
parameter           P_LANE0_AHB_LANE_X11                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X110                           =   8'hDF;
parameter           P_LANE0_AHB_LANE_X111                           =   8'h7C;
parameter           P_LANE0_AHB_LANE_X112                           =   8'hB;
parameter           P_LANE0_AHB_LANE_X119                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X12                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X120                           =   8'h1A;
parameter           P_LANE0_AHB_LANE_X121                           =   8'h9;
parameter           P_LANE0_AHB_LANE_X122                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X123                           =   8'hFC;
parameter           P_LANE0_AHB_LANE_X124                           =   8'h7;
parameter           P_LANE0_AHB_LANE_X125                           =   8'h10;
parameter           P_LANE0_AHB_LANE_X126                           =   8'h71;
parameter           P_LANE0_AHB_LANE_X127                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X128                           =   8'h3;
parameter           P_LANE0_AHB_LANE_X129                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X13                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X130                           =   8'h49;
parameter           P_LANE0_AHB_LANE_X131                           =   8'h6D;
parameter           P_LANE0_AHB_LANE_X132                           =   8'h40;
parameter           P_LANE0_AHB_LANE_X133                           =   8'h20;
parameter           P_LANE0_AHB_LANE_X134                           =   8'h20;
parameter           P_LANE0_AHB_LANE_X135                           =   8'h20;
parameter           P_LANE0_AHB_LANE_X136                           =   8'h20;
parameter           P_LANE0_AHB_LANE_X137                           =   8'hA9;
parameter           P_LANE0_AHB_LANE_X138                           =   8'h40;
parameter           P_LANE0_AHB_LANE_X139                           =   8'h20;
parameter           P_LANE0_AHB_LANE_X14                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X140                           =   8'h20;
parameter           P_LANE0_AHB_LANE_X141                           =   8'h20;
parameter           P_LANE0_AHB_LANE_X142                           =   8'h20;
parameter           P_LANE0_AHB_LANE_X143                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X144                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X145                           =   8'hFF;
parameter           P_LANE0_AHB_LANE_X146                           =   8'hC8;
parameter           P_LANE0_AHB_LANE_X147                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X148                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X149                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X15                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X150                           =   8'h8;
parameter           P_LANE0_AHB_LANE_X151                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X152                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X153                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X154                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X155                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X156                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X157                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X158                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X159                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X16                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X160                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X161                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X162                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X163                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X164                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X165                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X166                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X167                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X168                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X169                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X17                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X170                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X171                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X172                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X173                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X174                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X175                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X176                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X177                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X178                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X179                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X18                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X180                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X181                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X182                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X183                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X184                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X185                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X186                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X19                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X2                             =   8'h0;
parameter           P_LANE0_AHB_LANE_X20                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X201                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X202                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X203                           =   8'h40;
parameter           P_LANE0_AHB_LANE_X204                           =   8'h8;
parameter           P_LANE0_AHB_LANE_X205                           =   8'hFF;
parameter           P_LANE0_AHB_LANE_X206                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X207                           =   8'hFF;
parameter           P_LANE0_AHB_LANE_X208                           =   8'h3F;
parameter           P_LANE0_AHB_LANE_X209                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X21                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X210                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X211                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X212                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X213                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X214                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X215                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X216                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X217                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X218                           =   8'h3F;
parameter           P_LANE0_AHB_LANE_X219                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X22                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X220                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X221                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X222                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X223                           =   8'h3F;
parameter           P_LANE0_AHB_LANE_X224                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X225                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X226                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X227                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X228                           =   8'h3F;
parameter           P_LANE0_AHB_LANE_X229                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X23                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X230                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X231                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X232                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X233                           =   8'h3F;
parameter           P_LANE0_AHB_LANE_X234                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X235                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X236                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X237                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X238                           =   8'h3F;
parameter           P_LANE0_AHB_LANE_X239                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X24                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X240                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X241                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X242                           =   8'h1F;
parameter           P_LANE0_AHB_LANE_X243                           =   8'h80;
parameter           P_LANE0_AHB_LANE_X244                           =   8'h80;
parameter           P_LANE0_AHB_LANE_X245                           =   8'h80;
parameter           P_LANE0_AHB_LANE_X246                           =   8'h80;
parameter           P_LANE0_AHB_LANE_X247                           =   8'hFE;
parameter           P_LANE0_AHB_LANE_X248                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X249                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X25                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X250                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X251                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X252                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X253                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X254                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X255                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X256                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X257                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X258                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X259                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X26                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X260                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X261                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X262                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X263                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X264                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X265                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X266                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X267                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X27                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X28                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X29                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X3                             =   8'h0;
parameter           P_LANE0_AHB_LANE_X30                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X301                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X302                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X303                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X304                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X305                           =   8'hC0;
parameter           P_LANE0_AHB_LANE_X306                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X307                           =   8'h28;
parameter           P_LANE0_AHB_LANE_X308                           =   8'h6D;
parameter           P_LANE0_AHB_LANE_X309                           =   8'hF8;
parameter           P_LANE0_AHB_LANE_X31                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X310                           =   8'h2B;
parameter           P_LANE0_AHB_LANE_X311                           =   8'h89;
parameter           P_LANE0_AHB_LANE_X312                           =   8'h32;
parameter           P_LANE0_AHB_LANE_X313                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X314                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X315                           =   8'hD0;
parameter           P_LANE0_AHB_LANE_X316                           =   8'h7;
parameter           P_LANE0_AHB_LANE_X317                           =   8'hC;
parameter           P_LANE0_AHB_LANE_X318                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X319                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X32                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X320                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X321                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X322                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X323                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X324                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X325                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X326                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X327                           =   8'h10;
parameter           P_LANE0_AHB_LANE_X328                           =   8'hF;
parameter           P_LANE0_AHB_LANE_X329                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X33                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X330                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X331                           =   8'h30;
parameter           P_LANE0_AHB_LANE_X332                           =   8'h38;
parameter           P_LANE0_AHB_LANE_X333                           =   8'h68;
parameter           P_LANE0_AHB_LANE_X334                           =   8'h7;
parameter           P_LANE0_AHB_LANE_X335                           =   8'h7;
parameter           P_LANE0_AHB_LANE_X336                           =   8'h7F;
parameter           P_LANE0_AHB_LANE_X337                           =   8'h7;
parameter           P_LANE0_AHB_LANE_X338                           =   8'h7F;
parameter           P_LANE0_AHB_LANE_X339                           =   8'h20;
parameter           P_LANE0_AHB_LANE_X34                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X340                           =   8'h40;
parameter           P_LANE0_AHB_LANE_X341                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X342                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X343                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X344                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X345                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X346                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X347                           =   8'h7;
parameter           P_LANE0_AHB_LANE_X348                           =   8'hFF;
parameter           P_LANE0_AHB_LANE_X349                           =   8'h7;
parameter           P_LANE0_AHB_LANE_X35                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X350                           =   8'hFF;
parameter           P_LANE0_AHB_LANE_X351                           =   8'h3F;
parameter           P_LANE0_AHB_LANE_X352                           =   8'h7F;
parameter           P_LANE0_AHB_LANE_X353                           =   8'h44;
parameter           P_LANE0_AHB_LANE_X354                           =   8'h44;
parameter           P_LANE0_AHB_LANE_X355                           =   8'h44;
parameter           P_LANE0_AHB_LANE_X356                           =   8'h11;
parameter           P_LANE0_AHB_LANE_X357                           =   8'h11;
parameter           P_LANE0_AHB_LANE_X358                           =   8'h11;
parameter           P_LANE0_AHB_LANE_X359                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X36                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X360                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X361                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X362                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X363                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X364                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X365                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X366                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X367                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X368                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X369                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X37                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X370                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X371                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X372                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X373                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X374                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X375                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X376                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X377                           =   8'h50;
parameter           P_LANE0_AHB_LANE_X378                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X379                           =   8'h50;
parameter           P_LANE0_AHB_LANE_X38                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X380                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X381                           =   8'h32;
parameter           P_LANE0_AHB_LANE_X382                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X383                           =   8'h32;
parameter           P_LANE0_AHB_LANE_X384                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X385                           =   8'h64;
parameter           P_LANE0_AHB_LANE_X386                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X387                           =   8'h64;
parameter           P_LANE0_AHB_LANE_X388                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X389                           =   8'h50;
parameter           P_LANE0_AHB_LANE_X39                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X390                           =   8'h50;
parameter           P_LANE0_AHB_LANE_X391                           =   8'h32;
parameter           P_LANE0_AHB_LANE_X392                           =   8'h32;
parameter           P_LANE0_AHB_LANE_X393                           =   8'h64;
parameter           P_LANE0_AHB_LANE_X394                           =   8'h64;
parameter           P_LANE0_AHB_LANE_X395                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X396                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X397                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X398                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X399                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X4                             =   8'h0;
parameter           P_LANE0_AHB_LANE_X40                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X400                           =   8'h1;
parameter           P_LANE0_AHB_LANE_X401                           =   8'hF5;
parameter           P_LANE0_AHB_LANE_X402                           =   8'h3;
parameter           P_LANE0_AHB_LANE_X403                           =   8'h40;
parameter           P_LANE0_AHB_LANE_X404                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X405                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X406                           =   8'hF;
parameter           P_LANE0_AHB_LANE_X407                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X408                           =   8'h3;
parameter           P_LANE0_AHB_LANE_X409                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X41                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X410                           =   8'h3;
parameter           P_LANE0_AHB_LANE_X411                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X412                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X413                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X414                           =   8'h0;
parameter           P_LANE0_AHB_LANE_X42                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X43                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X44                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X45                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X46                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X47                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X48                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X49                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X5                             =   8'h0;
parameter           P_LANE0_AHB_LANE_X50                            =   8'h32;
parameter           P_LANE0_AHB_LANE_X51                            =   8'h50;
parameter           P_LANE0_AHB_LANE_X52                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X53                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X54                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X55                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X56                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X57                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X58                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X59                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X6                             =   8'h0;
parameter           P_LANE0_AHB_LANE_X60                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X61                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X62                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X63                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X64                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X65                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X66                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X67                            =   8'hF8;
parameter           P_LANE0_AHB_LANE_X68                            =   8'h5;
parameter           P_LANE0_AHB_LANE_X69                            =   8'h8C;
parameter           P_LANE0_AHB_LANE_X7                             =   8'h0;
parameter           P_LANE0_AHB_LANE_X70                            =   8'h3C;
parameter           P_LANE0_AHB_LANE_X71                            =   8'h5A;
parameter           P_LANE0_AHB_LANE_X72                            =   8'h60;
parameter           P_LANE0_AHB_LANE_X73                            =   8'h85;
parameter           P_LANE0_AHB_LANE_X74                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X75                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X76                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X77                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X78                            =   8'hC1;
parameter           P_LANE0_AHB_LANE_X79                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X8                             =   8'h0;
parameter           P_LANE0_AHB_LANE_X80                            =   8'h96;
parameter           P_LANE0_AHB_LANE_X81                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X82                            =   8'h52;
parameter           P_LANE0_AHB_LANE_X83                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X84                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X85                            =   8'h10;
parameter           P_LANE0_AHB_LANE_X86                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X87                            =   8'h3C;
parameter           P_LANE0_AHB_LANE_X88                            =   8'h88;
parameter           P_LANE0_AHB_LANE_X89                            =   8'h27;
parameter           P_LANE0_AHB_LANE_X9                             =   8'h0;
parameter           P_LANE0_AHB_LANE_X90                            =   8'hF0;
parameter           P_LANE0_AHB_LANE_X91                            =   8'h8E;
parameter           P_LANE0_AHB_LANE_X92                            =   8'h7D;
parameter           P_LANE0_AHB_LANE_X93                            =   8'h13;
parameter           P_LANE0_AHB_LANE_X94                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X95                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X96                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X97                            =   8'h0;
parameter           P_LANE0_AHB_LANE_X99                            =   8'h3;
parameter           P_LANE1_AHB_LANE_X0                             =   8'h11;
parameter           P_LANE1_AHB_LANE_X1                             =   8'h0;
parameter           P_LANE1_AHB_LANE_X10                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X100                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X101                           =   8'h88;
parameter           P_LANE1_AHB_LANE_X102                           =   8'hA;
parameter           P_LANE1_AHB_LANE_X103                           =   8'h50;
parameter           P_LANE1_AHB_LANE_X104                           =   8'hF;
parameter           P_LANE1_AHB_LANE_X105                           =   8'h25;
parameter           P_LANE1_AHB_LANE_X106                           =   8'hBC;
parameter           P_LANE1_AHB_LANE_X107                           =   8'h88;
parameter           P_LANE1_AHB_LANE_X108                           =   8'h24;
parameter           P_LANE1_AHB_LANE_X109                           =   8'hF0;
parameter           P_LANE1_AHB_LANE_X11                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X110                           =   8'hDF;
parameter           P_LANE1_AHB_LANE_X111                           =   8'h7C;
parameter           P_LANE1_AHB_LANE_X112                           =   8'hB;
parameter           P_LANE1_AHB_LANE_X119                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X12                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X120                           =   8'h1A;
parameter           P_LANE1_AHB_LANE_X121                           =   8'h9;
parameter           P_LANE1_AHB_LANE_X122                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X123                           =   8'hFC;
parameter           P_LANE1_AHB_LANE_X124                           =   8'h7;
parameter           P_LANE1_AHB_LANE_X125                           =   8'h10;
parameter           P_LANE1_AHB_LANE_X126                           =   8'h71;
parameter           P_LANE1_AHB_LANE_X127                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X128                           =   8'h3;
parameter           P_LANE1_AHB_LANE_X129                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X13                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X130                           =   8'h49;
parameter           P_LANE1_AHB_LANE_X131                           =   8'h6D;
parameter           P_LANE1_AHB_LANE_X132                           =   8'h40;
parameter           P_LANE1_AHB_LANE_X133                           =   8'h20;
parameter           P_LANE1_AHB_LANE_X134                           =   8'h20;
parameter           P_LANE1_AHB_LANE_X135                           =   8'h20;
parameter           P_LANE1_AHB_LANE_X136                           =   8'h20;
parameter           P_LANE1_AHB_LANE_X137                           =   8'hA9;
parameter           P_LANE1_AHB_LANE_X138                           =   8'h40;
parameter           P_LANE1_AHB_LANE_X139                           =   8'h20;
parameter           P_LANE1_AHB_LANE_X14                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X140                           =   8'h20;
parameter           P_LANE1_AHB_LANE_X141                           =   8'h20;
parameter           P_LANE1_AHB_LANE_X142                           =   8'h20;
parameter           P_LANE1_AHB_LANE_X143                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X144                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X145                           =   8'hFF;
parameter           P_LANE1_AHB_LANE_X146                           =   8'hC8;
parameter           P_LANE1_AHB_LANE_X147                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X148                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X149                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X15                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X150                           =   8'h8;
parameter           P_LANE1_AHB_LANE_X151                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X152                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X153                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X154                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X155                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X156                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X157                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X158                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X159                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X16                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X160                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X161                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X162                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X163                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X164                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X165                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X166                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X167                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X168                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X169                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X17                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X170                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X171                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X172                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X173                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X174                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X175                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X176                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X177                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X178                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X179                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X18                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X180                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X181                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X182                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X183                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X184                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X185                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X186                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X19                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X2                             =   8'h0;
parameter           P_LANE1_AHB_LANE_X20                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X201                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X202                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X203                           =   8'h40;
parameter           P_LANE1_AHB_LANE_X204                           =   8'h8;
parameter           P_LANE1_AHB_LANE_X205                           =   8'hFF;
parameter           P_LANE1_AHB_LANE_X206                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X207                           =   8'hFF;
parameter           P_LANE1_AHB_LANE_X208                           =   8'h3F;
parameter           P_LANE1_AHB_LANE_X209                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X21                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X210                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X211                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X212                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X213                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X214                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X215                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X216                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X217                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X218                           =   8'h3F;
parameter           P_LANE1_AHB_LANE_X219                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X22                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X220                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X221                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X222                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X223                           =   8'h3F;
parameter           P_LANE1_AHB_LANE_X224                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X225                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X226                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X227                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X228                           =   8'h3F;
parameter           P_LANE1_AHB_LANE_X229                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X23                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X230                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X231                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X232                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X233                           =   8'h3F;
parameter           P_LANE1_AHB_LANE_X234                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X235                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X236                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X237                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X238                           =   8'h3F;
parameter           P_LANE1_AHB_LANE_X239                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X24                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X240                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X241                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X242                           =   8'h1F;
parameter           P_LANE1_AHB_LANE_X243                           =   8'h80;
parameter           P_LANE1_AHB_LANE_X244                           =   8'h80;
parameter           P_LANE1_AHB_LANE_X245                           =   8'h80;
parameter           P_LANE1_AHB_LANE_X246                           =   8'h80;
parameter           P_LANE1_AHB_LANE_X247                           =   8'hFE;
parameter           P_LANE1_AHB_LANE_X248                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X249                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X25                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X250                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X251                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X252                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X253                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X254                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X255                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X256                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X257                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X258                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X259                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X26                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X260                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X261                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X262                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X263                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X264                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X265                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X266                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X267                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X27                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X28                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X29                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X3                             =   8'h0;
parameter           P_LANE1_AHB_LANE_X30                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X301                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X302                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X303                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X304                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X305                           =   8'hC0;
parameter           P_LANE1_AHB_LANE_X306                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X307                           =   8'h28;
parameter           P_LANE1_AHB_LANE_X308                           =   8'h6D;
parameter           P_LANE1_AHB_LANE_X309                           =   8'hF8;
parameter           P_LANE1_AHB_LANE_X31                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X310                           =   8'h2B;
parameter           P_LANE1_AHB_LANE_X311                           =   8'h89;
parameter           P_LANE1_AHB_LANE_X312                           =   8'h32;
parameter           P_LANE1_AHB_LANE_X313                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X314                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X315                           =   8'hD0;
parameter           P_LANE1_AHB_LANE_X316                           =   8'h7;
parameter           P_LANE1_AHB_LANE_X317                           =   8'hC;
parameter           P_LANE1_AHB_LANE_X318                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X319                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X32                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X320                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X321                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X322                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X323                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X324                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X325                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X326                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X327                           =   8'h10;
parameter           P_LANE1_AHB_LANE_X328                           =   8'hF;
parameter           P_LANE1_AHB_LANE_X329                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X33                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X330                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X331                           =   8'h30;
parameter           P_LANE1_AHB_LANE_X332                           =   8'h38;
parameter           P_LANE1_AHB_LANE_X333                           =   8'h68;
parameter           P_LANE1_AHB_LANE_X334                           =   8'h7;
parameter           P_LANE1_AHB_LANE_X335                           =   8'h7;
parameter           P_LANE1_AHB_LANE_X336                           =   8'h7F;
parameter           P_LANE1_AHB_LANE_X337                           =   8'h7;
parameter           P_LANE1_AHB_LANE_X338                           =   8'h7F;
parameter           P_LANE1_AHB_LANE_X339                           =   8'h20;
parameter           P_LANE1_AHB_LANE_X34                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X340                           =   8'h40;
parameter           P_LANE1_AHB_LANE_X341                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X342                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X343                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X344                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X345                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X346                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X347                           =   8'h7;
parameter           P_LANE1_AHB_LANE_X348                           =   8'hFF;
parameter           P_LANE1_AHB_LANE_X349                           =   8'h7;
parameter           P_LANE1_AHB_LANE_X35                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X350                           =   8'hFF;
parameter           P_LANE1_AHB_LANE_X351                           =   8'h3F;
parameter           P_LANE1_AHB_LANE_X352                           =   8'h7F;
parameter           P_LANE1_AHB_LANE_X353                           =   8'h44;
parameter           P_LANE1_AHB_LANE_X354                           =   8'h44;
parameter           P_LANE1_AHB_LANE_X355                           =   8'h44;
parameter           P_LANE1_AHB_LANE_X356                           =   8'h11;
parameter           P_LANE1_AHB_LANE_X357                           =   8'h11;
parameter           P_LANE1_AHB_LANE_X358                           =   8'h11;
parameter           P_LANE1_AHB_LANE_X359                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X36                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X360                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X361                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X362                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X363                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X364                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X365                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X366                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X367                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X368                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X369                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X37                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X370                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X371                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X372                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X373                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X374                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X375                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X376                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X377                           =   8'h50;
parameter           P_LANE1_AHB_LANE_X378                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X379                           =   8'h50;
parameter           P_LANE1_AHB_LANE_X38                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X380                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X381                           =   8'h32;
parameter           P_LANE1_AHB_LANE_X382                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X383                           =   8'h32;
parameter           P_LANE1_AHB_LANE_X384                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X385                           =   8'h64;
parameter           P_LANE1_AHB_LANE_X386                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X387                           =   8'h64;
parameter           P_LANE1_AHB_LANE_X388                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X389                           =   8'h50;
parameter           P_LANE1_AHB_LANE_X39                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X390                           =   8'h50;
parameter           P_LANE1_AHB_LANE_X391                           =   8'h32;
parameter           P_LANE1_AHB_LANE_X392                           =   8'h32;
parameter           P_LANE1_AHB_LANE_X393                           =   8'h64;
parameter           P_LANE1_AHB_LANE_X394                           =   8'h64;
parameter           P_LANE1_AHB_LANE_X395                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X396                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X397                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X398                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X399                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X4                             =   8'h0;
parameter           P_LANE1_AHB_LANE_X40                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X400                           =   8'h1;
parameter           P_LANE1_AHB_LANE_X401                           =   8'hF5;
parameter           P_LANE1_AHB_LANE_X402                           =   8'h3;
parameter           P_LANE1_AHB_LANE_X403                           =   8'h40;
parameter           P_LANE1_AHB_LANE_X404                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X405                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X406                           =   8'hF;
parameter           P_LANE1_AHB_LANE_X407                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X408                           =   8'h3;
parameter           P_LANE1_AHB_LANE_X409                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X41                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X410                           =   8'h3;
parameter           P_LANE1_AHB_LANE_X411                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X412                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X413                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X414                           =   8'h0;
parameter           P_LANE1_AHB_LANE_X42                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X43                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X44                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X45                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X46                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X47                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X48                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X49                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X5                             =   8'h0;
parameter           P_LANE1_AHB_LANE_X50                            =   8'h32;
parameter           P_LANE1_AHB_LANE_X51                            =   8'h50;
parameter           P_LANE1_AHB_LANE_X52                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X53                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X54                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X55                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X56                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X57                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X58                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X59                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X6                             =   8'h0;
parameter           P_LANE1_AHB_LANE_X60                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X61                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X62                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X63                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X64                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X65                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X66                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X67                            =   8'hF8;
parameter           P_LANE1_AHB_LANE_X68                            =   8'h5;
parameter           P_LANE1_AHB_LANE_X69                            =   8'h8C;
parameter           P_LANE1_AHB_LANE_X7                             =   8'h0;
parameter           P_LANE1_AHB_LANE_X70                            =   8'h3C;
parameter           P_LANE1_AHB_LANE_X71                            =   8'h5A;
parameter           P_LANE1_AHB_LANE_X72                            =   8'h60;
parameter           P_LANE1_AHB_LANE_X73                            =   8'h85;
parameter           P_LANE1_AHB_LANE_X74                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X75                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X76                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X77                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X78                            =   8'hC1;
parameter           P_LANE1_AHB_LANE_X79                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X8                             =   8'h0;
parameter           P_LANE1_AHB_LANE_X80                            =   8'h96;
parameter           P_LANE1_AHB_LANE_X81                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X82                            =   8'h52;
parameter           P_LANE1_AHB_LANE_X83                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X84                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X85                            =   8'h10;
parameter           P_LANE1_AHB_LANE_X86                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X87                            =   8'h3C;
parameter           P_LANE1_AHB_LANE_X88                            =   8'h88;
parameter           P_LANE1_AHB_LANE_X89                            =   8'h27;
parameter           P_LANE1_AHB_LANE_X9                             =   8'h0;
parameter           P_LANE1_AHB_LANE_X90                            =   8'hF0;
parameter           P_LANE1_AHB_LANE_X91                            =   8'h8E;
parameter           P_LANE1_AHB_LANE_X92                            =   8'h7D;
parameter           P_LANE1_AHB_LANE_X93                            =   8'h13;
parameter           P_LANE1_AHB_LANE_X94                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X95                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X96                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X97                            =   8'h0;
parameter           P_LANE1_AHB_LANE_X99                            =   8'h3;
parameter           P_LANE2_AHB_LANE_X0                             =   8'h11;
parameter           P_LANE2_AHB_LANE_X1                             =   8'h0;
parameter           P_LANE2_AHB_LANE_X10                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X100                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X101                           =   8'h88;
parameter           P_LANE2_AHB_LANE_X102                           =   8'hA;
parameter           P_LANE2_AHB_LANE_X103                           =   8'h50;
parameter           P_LANE2_AHB_LANE_X104                           =   8'hF;
parameter           P_LANE2_AHB_LANE_X105                           =   8'h25;
parameter           P_LANE2_AHB_LANE_X106                           =   8'hBC;
parameter           P_LANE2_AHB_LANE_X107                           =   8'h88;
parameter           P_LANE2_AHB_LANE_X108                           =   8'h24;
parameter           P_LANE2_AHB_LANE_X109                           =   8'hF0;
parameter           P_LANE2_AHB_LANE_X11                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X110                           =   8'hDF;
parameter           P_LANE2_AHB_LANE_X111                           =   8'h7C;
parameter           P_LANE2_AHB_LANE_X112                           =   8'hB;
parameter           P_LANE2_AHB_LANE_X119                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X12                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X120                           =   8'h1A;
parameter           P_LANE2_AHB_LANE_X121                           =   8'h9;
parameter           P_LANE2_AHB_LANE_X122                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X123                           =   8'hFC;
parameter           P_LANE2_AHB_LANE_X124                           =   8'h7;
parameter           P_LANE2_AHB_LANE_X125                           =   8'h10;
parameter           P_LANE2_AHB_LANE_X126                           =   8'h71;
parameter           P_LANE2_AHB_LANE_X127                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X128                           =   8'h3;
parameter           P_LANE2_AHB_LANE_X129                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X13                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X130                           =   8'h49;
parameter           P_LANE2_AHB_LANE_X131                           =   8'h6D;
parameter           P_LANE2_AHB_LANE_X132                           =   8'h40;
parameter           P_LANE2_AHB_LANE_X133                           =   8'h20;
parameter           P_LANE2_AHB_LANE_X134                           =   8'h20;
parameter           P_LANE2_AHB_LANE_X135                           =   8'h20;
parameter           P_LANE2_AHB_LANE_X136                           =   8'h20;
parameter           P_LANE2_AHB_LANE_X137                           =   8'hA9;
parameter           P_LANE2_AHB_LANE_X138                           =   8'h40;
parameter           P_LANE2_AHB_LANE_X139                           =   8'h20;
parameter           P_LANE2_AHB_LANE_X14                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X140                           =   8'h20;
parameter           P_LANE2_AHB_LANE_X141                           =   8'h20;
parameter           P_LANE2_AHB_LANE_X142                           =   8'h20;
parameter           P_LANE2_AHB_LANE_X143                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X144                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X145                           =   8'hFF;
parameter           P_LANE2_AHB_LANE_X146                           =   8'hC8;
parameter           P_LANE2_AHB_LANE_X147                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X148                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X149                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X15                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X150                           =   8'h8;
parameter           P_LANE2_AHB_LANE_X151                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X152                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X153                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X154                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X155                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X156                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X157                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X158                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X159                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X16                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X160                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X161                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X162                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X163                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X164                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X165                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X166                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X167                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X168                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X169                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X17                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X170                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X171                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X172                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X173                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X174                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X175                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X176                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X177                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X178                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X179                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X18                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X180                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X181                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X182                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X183                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X184                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X185                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X186                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X19                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X2                             =   8'h0;
parameter           P_LANE2_AHB_LANE_X20                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X201                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X202                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X203                           =   8'h40;
parameter           P_LANE2_AHB_LANE_X204                           =   8'h8;
parameter           P_LANE2_AHB_LANE_X205                           =   8'hFF;
parameter           P_LANE2_AHB_LANE_X206                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X207                           =   8'hFF;
parameter           P_LANE2_AHB_LANE_X208                           =   8'h3F;
parameter           P_LANE2_AHB_LANE_X209                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X21                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X210                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X211                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X212                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X213                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X214                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X215                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X216                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X217                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X218                           =   8'h3F;
parameter           P_LANE2_AHB_LANE_X219                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X22                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X220                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X221                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X222                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X223                           =   8'h3F;
parameter           P_LANE2_AHB_LANE_X224                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X225                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X226                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X227                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X228                           =   8'h3F;
parameter           P_LANE2_AHB_LANE_X229                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X23                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X230                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X231                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X232                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X233                           =   8'h3F;
parameter           P_LANE2_AHB_LANE_X234                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X235                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X236                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X237                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X238                           =   8'h3F;
parameter           P_LANE2_AHB_LANE_X239                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X24                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X240                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X241                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X242                           =   8'h1F;
parameter           P_LANE2_AHB_LANE_X243                           =   8'h80;
parameter           P_LANE2_AHB_LANE_X244                           =   8'h80;
parameter           P_LANE2_AHB_LANE_X245                           =   8'h80;
parameter           P_LANE2_AHB_LANE_X246                           =   8'h80;
parameter           P_LANE2_AHB_LANE_X247                           =   8'hFE;
parameter           P_LANE2_AHB_LANE_X248                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X249                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X25                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X250                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X251                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X252                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X253                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X254                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X255                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X256                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X257                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X258                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X259                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X26                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X260                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X261                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X262                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X263                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X264                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X265                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X266                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X267                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X27                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X28                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X29                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X3                             =   8'h0;
parameter           P_LANE2_AHB_LANE_X30                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X301                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X302                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X303                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X304                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X305                           =   8'hC0;
parameter           P_LANE2_AHB_LANE_X306                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X307                           =   8'h28;
parameter           P_LANE2_AHB_LANE_X308                           =   8'h6D;
parameter           P_LANE2_AHB_LANE_X309                           =   8'hF8;
parameter           P_LANE2_AHB_LANE_X31                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X310                           =   8'h2B;
parameter           P_LANE2_AHB_LANE_X311                           =   8'h89;
parameter           P_LANE2_AHB_LANE_X312                           =   8'h32;
parameter           P_LANE2_AHB_LANE_X313                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X314                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X315                           =   8'hD0;
parameter           P_LANE2_AHB_LANE_X316                           =   8'h7;
parameter           P_LANE2_AHB_LANE_X317                           =   8'hC;
parameter           P_LANE2_AHB_LANE_X318                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X319                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X32                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X320                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X321                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X322                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X323                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X324                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X325                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X326                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X327                           =   8'h10;
parameter           P_LANE2_AHB_LANE_X328                           =   8'hF;
parameter           P_LANE2_AHB_LANE_X329                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X33                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X330                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X331                           =   8'h30;
parameter           P_LANE2_AHB_LANE_X332                           =   8'h38;
parameter           P_LANE2_AHB_LANE_X333                           =   8'h68;
parameter           P_LANE2_AHB_LANE_X334                           =   8'h7;
parameter           P_LANE2_AHB_LANE_X335                           =   8'h7;
parameter           P_LANE2_AHB_LANE_X336                           =   8'h7F;
parameter           P_LANE2_AHB_LANE_X337                           =   8'h7;
parameter           P_LANE2_AHB_LANE_X338                           =   8'h7F;
parameter           P_LANE2_AHB_LANE_X339                           =   8'h20;
parameter           P_LANE2_AHB_LANE_X34                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X340                           =   8'h40;
parameter           P_LANE2_AHB_LANE_X341                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X342                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X343                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X344                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X345                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X346                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X347                           =   8'h7;
parameter           P_LANE2_AHB_LANE_X348                           =   8'hFF;
parameter           P_LANE2_AHB_LANE_X349                           =   8'h7;
parameter           P_LANE2_AHB_LANE_X35                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X350                           =   8'hFF;
parameter           P_LANE2_AHB_LANE_X351                           =   8'h3F;
parameter           P_LANE2_AHB_LANE_X352                           =   8'h7F;
parameter           P_LANE2_AHB_LANE_X353                           =   8'h44;
parameter           P_LANE2_AHB_LANE_X354                           =   8'h44;
parameter           P_LANE2_AHB_LANE_X355                           =   8'h44;
parameter           P_LANE2_AHB_LANE_X356                           =   8'h11;
parameter           P_LANE2_AHB_LANE_X357                           =   8'h11;
parameter           P_LANE2_AHB_LANE_X358                           =   8'h11;
parameter           P_LANE2_AHB_LANE_X359                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X36                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X360                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X361                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X362                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X363                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X364                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X365                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X366                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X367                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X368                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X369                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X37                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X370                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X371                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X372                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X373                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X374                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X375                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X376                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X377                           =   8'h50;
parameter           P_LANE2_AHB_LANE_X378                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X379                           =   8'h50;
parameter           P_LANE2_AHB_LANE_X38                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X380                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X381                           =   8'h32;
parameter           P_LANE2_AHB_LANE_X382                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X383                           =   8'h32;
parameter           P_LANE2_AHB_LANE_X384                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X385                           =   8'h64;
parameter           P_LANE2_AHB_LANE_X386                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X387                           =   8'h64;
parameter           P_LANE2_AHB_LANE_X388                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X389                           =   8'h50;
parameter           P_LANE2_AHB_LANE_X39                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X390                           =   8'h50;
parameter           P_LANE2_AHB_LANE_X391                           =   8'h32;
parameter           P_LANE2_AHB_LANE_X392                           =   8'h32;
parameter           P_LANE2_AHB_LANE_X393                           =   8'h64;
parameter           P_LANE2_AHB_LANE_X394                           =   8'h64;
parameter           P_LANE2_AHB_LANE_X395                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X396                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X397                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X398                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X399                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X4                             =   8'h0;
parameter           P_LANE2_AHB_LANE_X40                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X400                           =   8'h1;
parameter           P_LANE2_AHB_LANE_X401                           =   8'hF5;
parameter           P_LANE2_AHB_LANE_X402                           =   8'h3;
parameter           P_LANE2_AHB_LANE_X403                           =   8'h40;
parameter           P_LANE2_AHB_LANE_X404                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X405                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X406                           =   8'hF;
parameter           P_LANE2_AHB_LANE_X407                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X408                           =   8'h3;
parameter           P_LANE2_AHB_LANE_X409                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X41                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X410                           =   8'h3;
parameter           P_LANE2_AHB_LANE_X411                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X412                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X413                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X414                           =   8'h0;
parameter           P_LANE2_AHB_LANE_X42                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X43                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X44                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X45                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X46                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X47                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X48                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X49                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X5                             =   8'h0;
parameter           P_LANE2_AHB_LANE_X50                            =   8'h32;
parameter           P_LANE2_AHB_LANE_X51                            =   8'h50;
parameter           P_LANE2_AHB_LANE_X52                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X53                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X54                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X55                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X56                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X57                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X58                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X59                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X6                             =   8'h0;
parameter           P_LANE2_AHB_LANE_X60                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X61                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X62                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X63                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X64                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X65                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X66                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X67                            =   8'hF8;
parameter           P_LANE2_AHB_LANE_X68                            =   8'h5;
parameter           P_LANE2_AHB_LANE_X69                            =   8'h8C;
parameter           P_LANE2_AHB_LANE_X7                             =   8'h0;
parameter           P_LANE2_AHB_LANE_X70                            =   8'h3C;
parameter           P_LANE2_AHB_LANE_X71                            =   8'h5A;
parameter           P_LANE2_AHB_LANE_X72                            =   8'h60;
parameter           P_LANE2_AHB_LANE_X73                            =   8'h85;
parameter           P_LANE2_AHB_LANE_X74                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X75                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X76                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X77                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X78                            =   8'hC1;
parameter           P_LANE2_AHB_LANE_X79                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X8                             =   8'h0;
parameter           P_LANE2_AHB_LANE_X80                            =   8'h96;
parameter           P_LANE2_AHB_LANE_X81                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X82                            =   8'h52;
parameter           P_LANE2_AHB_LANE_X83                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X84                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X85                            =   8'h10;
parameter           P_LANE2_AHB_LANE_X86                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X87                            =   8'h3C;
parameter           P_LANE2_AHB_LANE_X88                            =   8'h88;
parameter           P_LANE2_AHB_LANE_X89                            =   8'h27;
parameter           P_LANE2_AHB_LANE_X9                             =   8'h0;
parameter           P_LANE2_AHB_LANE_X90                            =   8'hF0;
parameter           P_LANE2_AHB_LANE_X91                            =   8'h8E;
parameter           P_LANE2_AHB_LANE_X92                            =   8'h7D;
parameter           P_LANE2_AHB_LANE_X93                            =   8'h13;
parameter           P_LANE2_AHB_LANE_X94                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X95                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X96                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X97                            =   8'h0;
parameter           P_LANE2_AHB_LANE_X99                            =   8'h3;
parameter           P_LANE3_AHB_LANE_X0                             =   8'h11;
parameter           P_LANE3_AHB_LANE_X1                             =   8'h0;
parameter           P_LANE3_AHB_LANE_X10                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X100                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X101                           =   8'h88;
parameter           P_LANE3_AHB_LANE_X102                           =   8'hA;
parameter           P_LANE3_AHB_LANE_X103                           =   8'h50;
parameter           P_LANE3_AHB_LANE_X104                           =   8'hF;
parameter           P_LANE3_AHB_LANE_X105                           =   8'h25;
parameter           P_LANE3_AHB_LANE_X106                           =   8'hBC;
parameter           P_LANE3_AHB_LANE_X107                           =   8'h88;
parameter           P_LANE3_AHB_LANE_X108                           =   8'h24;
parameter           P_LANE3_AHB_LANE_X109                           =   8'hF0;
parameter           P_LANE3_AHB_LANE_X11                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X110                           =   8'hDF;
parameter           P_LANE3_AHB_LANE_X111                           =   8'h7C;
parameter           P_LANE3_AHB_LANE_X112                           =   8'hB;
parameter           P_LANE3_AHB_LANE_X119                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X12                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X120                           =   8'h1A;
parameter           P_LANE3_AHB_LANE_X121                           =   8'h9;
parameter           P_LANE3_AHB_LANE_X122                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X123                           =   8'hFC;
parameter           P_LANE3_AHB_LANE_X124                           =   8'h7;
parameter           P_LANE3_AHB_LANE_X125                           =   8'h10;
parameter           P_LANE3_AHB_LANE_X126                           =   8'h71;
parameter           P_LANE3_AHB_LANE_X127                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X128                           =   8'h3;
parameter           P_LANE3_AHB_LANE_X129                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X13                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X130                           =   8'h49;
parameter           P_LANE3_AHB_LANE_X131                           =   8'h6D;
parameter           P_LANE3_AHB_LANE_X132                           =   8'h40;
parameter           P_LANE3_AHB_LANE_X133                           =   8'h20;
parameter           P_LANE3_AHB_LANE_X134                           =   8'h20;
parameter           P_LANE3_AHB_LANE_X135                           =   8'h20;
parameter           P_LANE3_AHB_LANE_X136                           =   8'h20;
parameter           P_LANE3_AHB_LANE_X137                           =   8'hA9;
parameter           P_LANE3_AHB_LANE_X138                           =   8'h40;
parameter           P_LANE3_AHB_LANE_X139                           =   8'h20;
parameter           P_LANE3_AHB_LANE_X14                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X140                           =   8'h20;
parameter           P_LANE3_AHB_LANE_X141                           =   8'h20;
parameter           P_LANE3_AHB_LANE_X142                           =   8'h20;
parameter           P_LANE3_AHB_LANE_X143                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X144                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X145                           =   8'hFF;
parameter           P_LANE3_AHB_LANE_X146                           =   8'hC8;
parameter           P_LANE3_AHB_LANE_X147                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X148                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X149                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X15                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X150                           =   8'h8;
parameter           P_LANE3_AHB_LANE_X151                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X152                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X153                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X154                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X155                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X156                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X157                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X158                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X159                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X16                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X160                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X161                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X162                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X163                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X164                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X165                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X166                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X167                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X168                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X169                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X17                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X170                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X171                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X172                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X173                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X174                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X175                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X176                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X177                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X178                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X179                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X18                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X180                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X181                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X182                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X183                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X184                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X185                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X186                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X19                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X2                             =   8'h0;
parameter           P_LANE3_AHB_LANE_X20                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X201                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X202                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X203                           =   8'h40;
parameter           P_LANE3_AHB_LANE_X204                           =   8'h8;
parameter           P_LANE3_AHB_LANE_X205                           =   8'hFF;
parameter           P_LANE3_AHB_LANE_X206                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X207                           =   8'hFF;
parameter           P_LANE3_AHB_LANE_X208                           =   8'h3F;
parameter           P_LANE3_AHB_LANE_X209                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X21                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X210                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X211                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X212                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X213                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X214                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X215                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X216                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X217                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X218                           =   8'h3F;
parameter           P_LANE3_AHB_LANE_X219                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X22                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X220                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X221                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X222                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X223                           =   8'h3F;
parameter           P_LANE3_AHB_LANE_X224                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X225                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X226                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X227                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X228                           =   8'h3F;
parameter           P_LANE3_AHB_LANE_X229                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X23                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X230                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X231                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X232                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X233                           =   8'h3F;
parameter           P_LANE3_AHB_LANE_X234                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X235                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X236                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X237                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X238                           =   8'h3F;
parameter           P_LANE3_AHB_LANE_X239                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X24                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X240                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X241                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X242                           =   8'h1F;
parameter           P_LANE3_AHB_LANE_X243                           =   8'h80;
parameter           P_LANE3_AHB_LANE_X244                           =   8'h80;
parameter           P_LANE3_AHB_LANE_X245                           =   8'h80;
parameter           P_LANE3_AHB_LANE_X246                           =   8'h80;
parameter           P_LANE3_AHB_LANE_X247                           =   8'hFE;
parameter           P_LANE3_AHB_LANE_X248                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X249                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X25                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X250                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X251                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X252                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X253                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X254                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X255                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X256                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X257                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X258                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X259                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X26                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X260                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X261                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X262                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X263                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X264                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X265                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X266                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X267                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X27                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X28                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X29                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X3                             =   8'h0;
parameter           P_LANE3_AHB_LANE_X30                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X301                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X302                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X303                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X304                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X305                           =   8'hC0;
parameter           P_LANE3_AHB_LANE_X306                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X307                           =   8'h28;
parameter           P_LANE3_AHB_LANE_X308                           =   8'h6D;
parameter           P_LANE3_AHB_LANE_X309                           =   8'hF8;
parameter           P_LANE3_AHB_LANE_X31                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X310                           =   8'h2B;
parameter           P_LANE3_AHB_LANE_X311                           =   8'h89;
parameter           P_LANE3_AHB_LANE_X312                           =   8'h32;
parameter           P_LANE3_AHB_LANE_X313                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X314                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X315                           =   8'hD0;
parameter           P_LANE3_AHB_LANE_X316                           =   8'h7;
parameter           P_LANE3_AHB_LANE_X317                           =   8'hC;
parameter           P_LANE3_AHB_LANE_X318                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X319                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X32                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X320                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X321                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X322                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X323                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X324                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X325                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X326                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X327                           =   8'h10;
parameter           P_LANE3_AHB_LANE_X328                           =   8'hF;
parameter           P_LANE3_AHB_LANE_X329                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X33                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X330                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X331                           =   8'h30;
parameter           P_LANE3_AHB_LANE_X332                           =   8'h38;
parameter           P_LANE3_AHB_LANE_X333                           =   8'h68;
parameter           P_LANE3_AHB_LANE_X334                           =   8'h7;
parameter           P_LANE3_AHB_LANE_X335                           =   8'h7;
parameter           P_LANE3_AHB_LANE_X336                           =   8'h7F;
parameter           P_LANE3_AHB_LANE_X337                           =   8'h7;
parameter           P_LANE3_AHB_LANE_X338                           =   8'h7F;
parameter           P_LANE3_AHB_LANE_X339                           =   8'h20;
parameter           P_LANE3_AHB_LANE_X34                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X340                           =   8'h40;
parameter           P_LANE3_AHB_LANE_X341                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X342                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X343                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X344                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X345                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X346                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X347                           =   8'h7;
parameter           P_LANE3_AHB_LANE_X348                           =   8'hFF;
parameter           P_LANE3_AHB_LANE_X349                           =   8'h7;
parameter           P_LANE3_AHB_LANE_X35                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X350                           =   8'hFF;
parameter           P_LANE3_AHB_LANE_X351                           =   8'h3F;
parameter           P_LANE3_AHB_LANE_X352                           =   8'h7F;
parameter           P_LANE3_AHB_LANE_X353                           =   8'h44;
parameter           P_LANE3_AHB_LANE_X354                           =   8'h44;
parameter           P_LANE3_AHB_LANE_X355                           =   8'h44;
parameter           P_LANE3_AHB_LANE_X356                           =   8'h11;
parameter           P_LANE3_AHB_LANE_X357                           =   8'h11;
parameter           P_LANE3_AHB_LANE_X358                           =   8'h11;
parameter           P_LANE3_AHB_LANE_X359                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X36                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X360                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X361                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X362                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X363                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X364                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X365                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X366                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X367                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X368                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X369                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X37                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X370                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X371                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X372                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X373                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X374                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X375                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X376                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X377                           =   8'h50;
parameter           P_LANE3_AHB_LANE_X378                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X379                           =   8'h50;
parameter           P_LANE3_AHB_LANE_X38                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X380                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X381                           =   8'h32;
parameter           P_LANE3_AHB_LANE_X382                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X383                           =   8'h32;
parameter           P_LANE3_AHB_LANE_X384                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X385                           =   8'h64;
parameter           P_LANE3_AHB_LANE_X386                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X387                           =   8'h64;
parameter           P_LANE3_AHB_LANE_X388                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X389                           =   8'h50;
parameter           P_LANE3_AHB_LANE_X39                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X390                           =   8'h50;
parameter           P_LANE3_AHB_LANE_X391                           =   8'h32;
parameter           P_LANE3_AHB_LANE_X392                           =   8'h32;
parameter           P_LANE3_AHB_LANE_X393                           =   8'h64;
parameter           P_LANE3_AHB_LANE_X394                           =   8'h64;
parameter           P_LANE3_AHB_LANE_X395                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X396                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X397                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X398                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X399                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X4                             =   8'h0;
parameter           P_LANE3_AHB_LANE_X40                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X400                           =   8'h1;
parameter           P_LANE3_AHB_LANE_X401                           =   8'hF5;
parameter           P_LANE3_AHB_LANE_X402                           =   8'h3;
parameter           P_LANE3_AHB_LANE_X403                           =   8'h40;
parameter           P_LANE3_AHB_LANE_X404                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X405                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X406                           =   8'hF;
parameter           P_LANE3_AHB_LANE_X407                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X408                           =   8'h3;
parameter           P_LANE3_AHB_LANE_X409                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X41                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X410                           =   8'h3;
parameter           P_LANE3_AHB_LANE_X411                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X412                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X413                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X414                           =   8'h0;
parameter           P_LANE3_AHB_LANE_X42                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X43                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X44                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X45                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X46                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X47                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X48                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X49                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X5                             =   8'h0;
parameter           P_LANE3_AHB_LANE_X50                            =   8'h32;
parameter           P_LANE3_AHB_LANE_X51                            =   8'h50;
parameter           P_LANE3_AHB_LANE_X52                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X53                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X54                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X55                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X56                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X57                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X58                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X59                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X6                             =   8'h0;
parameter           P_LANE3_AHB_LANE_X60                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X61                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X62                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X63                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X64                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X65                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X66                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X67                            =   8'hF8;
parameter           P_LANE3_AHB_LANE_X68                            =   8'h5;
parameter           P_LANE3_AHB_LANE_X69                            =   8'h8C;
parameter           P_LANE3_AHB_LANE_X7                             =   8'h0;
parameter           P_LANE3_AHB_LANE_X70                            =   8'h3C;
parameter           P_LANE3_AHB_LANE_X71                            =   8'h5A;
parameter           P_LANE3_AHB_LANE_X72                            =   8'h60;
parameter           P_LANE3_AHB_LANE_X73                            =   8'h85;
parameter           P_LANE3_AHB_LANE_X74                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X75                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X76                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X77                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X78                            =   8'hC1;
parameter           P_LANE3_AHB_LANE_X79                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X8                             =   8'h0;
parameter           P_LANE3_AHB_LANE_X80                            =   8'h96;
parameter           P_LANE3_AHB_LANE_X81                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X82                            =   8'h52;
parameter           P_LANE3_AHB_LANE_X83                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X84                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X85                            =   8'h10;
parameter           P_LANE3_AHB_LANE_X86                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X87                            =   8'h3C;
parameter           P_LANE3_AHB_LANE_X88                            =   8'h88;
parameter           P_LANE3_AHB_LANE_X89                            =   8'h27;
parameter           P_LANE3_AHB_LANE_X9                             =   8'h0;
parameter           P_LANE3_AHB_LANE_X90                            =   8'hF0;
parameter           P_LANE3_AHB_LANE_X91                            =   8'h8E;
parameter           P_LANE3_AHB_LANE_X92                            =   8'h7D;
parameter           P_LANE3_AHB_LANE_X93                            =   8'h13;
parameter           P_LANE3_AHB_LANE_X94                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X95                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X96                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X97                            =   8'h0;
parameter           P_LANE3_AHB_LANE_X99                            =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X0                           =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X1                           =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X10                          =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X100                         =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X101                         =   8'h87;
parameter           P_CLAN_AHB_COMLANE_X102                         =   8'h8;
parameter           P_CLAN_AHB_COMLANE_X103                         =   8'h8C;
parameter           P_CLAN_AHB_COMLANE_X104                         =   8'h12;
parameter           P_CLAN_AHB_COMLANE_X105                         =   8'h96;
parameter           P_CLAN_AHB_COMLANE_X106                         =   8'h14;
parameter           P_CLAN_AHB_COMLANE_X107                         =   8'hA0;
parameter           P_CLAN_AHB_COMLANE_X108                         =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X109                         =   8'hAA;
parameter           P_CLAN_AHB_COMLANE_X11                          =   8'hFC;
parameter           P_CLAN_AHB_COMLANE_X110                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X111                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X112                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X113                         =   8'hE2;
parameter           P_CLAN_AHB_COMLANE_X114                         =   8'h4;
parameter           P_CLAN_AHB_COMLANE_X115                         =   8'h28;
parameter           P_CLAN_AHB_COMLANE_X116                         =   8'h5;
parameter           P_CLAN_AHB_COMLANE_X117                         =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X118                         =   8'h1E;
parameter           P_CLAN_AHB_COMLANE_X119                         =   8'hB;
parameter           P_CLAN_AHB_COMLANE_X12                          =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X120                         =   8'h28;
parameter           P_CLAN_AHB_COMLANE_X121                         =   8'h12;
parameter           P_CLAN_AHB_COMLANE_X122                         =   8'h3C;
parameter           P_CLAN_AHB_COMLANE_X123                         =   8'h28;
parameter           P_CLAN_AHB_COMLANE_X124                         =   8'h46;
parameter           P_CLAN_AHB_COMLANE_X125                         =   8'hC;
parameter           P_CLAN_AHB_COMLANE_X126                         =   8'h69;
parameter           P_CLAN_AHB_COMLANE_X127                         =   8'hD;
parameter           P_CLAN_AHB_COMLANE_X128                         =   8'h32;
parameter           P_CLAN_AHB_COMLANE_X129                         =   8'h9;
parameter           P_CLAN_AHB_COMLANE_X13                          =   8'hFC;
parameter           P_CLAN_AHB_COMLANE_X130                         =   8'h64;
parameter           P_CLAN_AHB_COMLANE_X131                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X132                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X133                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X134                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X135                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X136                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X137                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X138                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X139                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X14                          =   8'h85;
parameter           P_CLAN_AHB_COMLANE_X140                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X141                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X142                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X143                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X144                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X145                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X146                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X147                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X148                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X149                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X15                          =   8'h57;
parameter           P_CLAN_AHB_COMLANE_X150                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X151                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X152                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X153                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X154                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X155                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X156                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X157                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X158                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X159                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X16                          =   8'h55;
parameter           P_CLAN_AHB_COMLANE_X160                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X161                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X162                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X163                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X164                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X165                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X166                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X167                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X168                         =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X169                         =   8'h21;
parameter           P_CLAN_AHB_COMLANE_X17                          =   8'h55;
parameter           P_CLAN_AHB_COMLANE_X170                         =   8'h5F;
parameter           P_CLAN_AHB_COMLANE_X171                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X172                         =   8'h9F;
parameter           P_CLAN_AHB_COMLANE_X173                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X174                         =   8'h1F;
parameter           P_CLAN_AHB_COMLANE_X175                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X176                         =   8'h37;
parameter           P_CLAN_AHB_COMLANE_X177                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X178                         =   8'h1F;
parameter           P_CLAN_AHB_COMLANE_X179                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X18                          =   8'hA9;
parameter           P_CLAN_AHB_COMLANE_X180                         =   8'hDF;
parameter           P_CLAN_AHB_COMLANE_X181                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X182                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X183                         =   8'hFF;
parameter           P_CLAN_AHB_COMLANE_X184                         =   8'h3F;
parameter           P_CLAN_AHB_COMLANE_X185                         =   8'h2D;
parameter           P_CLAN_AHB_COMLANE_X186                         =   8'h15;
parameter           P_CLAN_AHB_COMLANE_X187                         =   8'h6F;
parameter           P_CLAN_AHB_COMLANE_X188                         =   8'h45;
parameter           P_CLAN_AHB_COMLANE_X189                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X19                          =   8'hAA;
parameter           P_CLAN_AHB_COMLANE_X190                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X191                         =   8'hDF;
parameter           P_CLAN_AHB_COMLANE_X192                         =   8'h8B;
parameter           P_CLAN_AHB_COMLANE_X193                         =   8'h23;
parameter           P_CLAN_AHB_COMLANE_X194                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X195                         =   8'hF;
parameter           P_CLAN_AHB_COMLANE_X196                         =   8'hBA;
parameter           P_CLAN_AHB_COMLANE_X197                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X198                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X199                         =   8'h7;
parameter           P_CLAN_AHB_COMLANE_X2                           =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X20                          =   8'hAA;
parameter           P_CLAN_AHB_COMLANE_X200                         =   8'h7;
parameter           P_CLAN_AHB_COMLANE_X201                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X202                         =   8'h7;
parameter           P_CLAN_AHB_COMLANE_X203                         =   8'h5;
parameter           P_CLAN_AHB_COMLANE_X204                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X205                         =   8'h7;
parameter           P_CLAN_AHB_COMLANE_X206                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X207                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X208                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X209                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X21                          =   8'hAA;
parameter           P_CLAN_AHB_COMLANE_X210                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X211                         =   8'h1B;
parameter           P_CLAN_AHB_COMLANE_X212                         =   8'h7;
parameter           P_CLAN_AHB_COMLANE_X213                         =   8'h5;
parameter           P_CLAN_AHB_COMLANE_X214                         =   8'h10;
parameter           P_CLAN_AHB_COMLANE_X215                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X216                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X217                         =   8'hFF;
parameter           P_CLAN_AHB_COMLANE_X218                         =   8'hFF;
parameter           P_CLAN_AHB_COMLANE_X219                         =   8'hFF;
parameter           P_CLAN_AHB_COMLANE_X22                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X220                         =   8'hF3;
parameter           P_CLAN_AHB_COMLANE_X221                         =   8'hFC;
parameter           P_CLAN_AHB_COMLANE_X222                         =   8'h32;
parameter           P_CLAN_AHB_COMLANE_X223                         =   8'h32;
parameter           P_CLAN_AHB_COMLANE_X224                         =   8'h6;
parameter           P_CLAN_AHB_COMLANE_X225                         =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X226                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X227                         =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X228                         =   8'h55;
parameter           P_CLAN_AHB_COMLANE_X229                         =   8'h55;
parameter           P_CLAN_AHB_COMLANE_X23                          =   8'hBC;
parameter           P_CLAN_AHB_COMLANE_X230                         =   8'h55;
parameter           P_CLAN_AHB_COMLANE_X231                         =   8'h45;
parameter           P_CLAN_AHB_COMLANE_X232                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X233                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X234                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X235                         =   8'h6;
parameter           P_CLAN_AHB_COMLANE_X236                         =   8'h41;
parameter           P_CLAN_AHB_COMLANE_X237                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X238                         =   8'h4A;
parameter           P_CLAN_AHB_COMLANE_X239                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X24                          =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X240                         =   8'h5A;
parameter           P_CLAN_AHB_COMLANE_X241                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X242                         =   8'h52;
parameter           P_CLAN_AHB_COMLANE_X243                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X244                         =   8'h56;
parameter           P_CLAN_AHB_COMLANE_X245                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X246                         =   8'h54;
parameter           P_CLAN_AHB_COMLANE_X247                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X248                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X249                         =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X25                          =   8'h1C;
parameter           P_CLAN_AHB_COMLANE_X250                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X251                         =   8'h1F;
parameter           P_CLAN_AHB_COMLANE_X252                         =   8'h1F;
parameter           P_CLAN_AHB_COMLANE_X253                         =   8'h51;
parameter           P_CLAN_AHB_COMLANE_X254                         =   8'h41;
parameter           P_CLAN_AHB_COMLANE_X255                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X256                         =   8'h40;
parameter           P_CLAN_AHB_COMLANE_X257                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X258                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X259                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X26                          =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X260                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X261                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X263                         =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X264                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X265                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X266                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X267                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X268                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X269                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X270                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X271                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X272                         =   8'h55;
parameter           P_CLAN_AHB_COMLANE_X273                         =   8'h6;
parameter           P_CLAN_AHB_COMLANE_X274                         =   8'h4A;
parameter           P_CLAN_AHB_COMLANE_X275                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X276                         =   8'hA5;
parameter           P_CLAN_AHB_COMLANE_X277                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X278                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X279                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X280                         =   8'h5;
parameter           P_CLAN_AHB_COMLANE_X281                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X282                         =   8'h22;
parameter           P_CLAN_AHB_COMLANE_X283                         =   8'h40;
parameter           P_CLAN_AHB_COMLANE_X284                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X285                         =   8'h8F;
parameter           P_CLAN_AHB_COMLANE_X286                         =   8'h47;
parameter           P_CLAN_AHB_COMLANE_X287                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X288                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X289                         =   8'hEF;
parameter           P_CLAN_AHB_COMLANE_X29                          =   8'h20;
parameter           P_CLAN_AHB_COMLANE_X290                         =   8'h9B;
parameter           P_CLAN_AHB_COMLANE_X291                         =   8'h34;
parameter           P_CLAN_AHB_COMLANE_X292                         =   8'h12;
parameter           P_CLAN_AHB_COMLANE_X293                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X294                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X295                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X296                         =   8'hFF;
parameter           P_CLAN_AHB_COMLANE_X297                         =   8'hFF;
parameter           P_CLAN_AHB_COMLANE_X298                         =   8'h1E;
parameter           P_CLAN_AHB_COMLANE_X299                         =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X3                           =   8'hFF;
parameter           P_CLAN_AHB_COMLANE_X30                          =   8'h3F;
parameter           P_CLAN_AHB_COMLANE_X300                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X301                         =   8'h80;
parameter           P_CLAN_AHB_COMLANE_X302                         =   8'h10;
parameter           P_CLAN_AHB_COMLANE_X303                         =   8'h1F;
parameter           P_CLAN_AHB_COMLANE_X304                         =   8'h28;
parameter           P_CLAN_AHB_COMLANE_X305                         =   8'h28;
parameter           P_CLAN_AHB_COMLANE_X306                         =   8'h5;
parameter           P_CLAN_AHB_COMLANE_X307                         =   8'h5;
parameter           P_CLAN_AHB_COMLANE_X308                         =   8'h50;
parameter           P_CLAN_AHB_COMLANE_X31                          =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X310                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X311                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X312                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X313                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X314                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X315                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X317                         =   8'h1F;
parameter           P_CLAN_AHB_COMLANE_X318                         =   8'h28;
parameter           P_CLAN_AHB_COMLANE_X319                         =   8'h28;
parameter           P_CLAN_AHB_COMLANE_X32                          =   8'hAA;
parameter           P_CLAN_AHB_COMLANE_X320                         =   8'h5;
parameter           P_CLAN_AHB_COMLANE_X321                         =   8'h5;
parameter           P_CLAN_AHB_COMLANE_X322                         =   8'h50;
parameter           P_CLAN_AHB_COMLANE_X324                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X325                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X326                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X327                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X328                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X329                         =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X33                          =   8'h1F;
parameter           P_CLAN_AHB_COMLANE_X330                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X331                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X332                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X333                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X334                         =   8'h80;
parameter           P_CLAN_AHB_COMLANE_X335                         =   8'h80;
parameter           P_CLAN_AHB_COMLANE_X336                         =   8'h80;
parameter           P_CLAN_AHB_COMLANE_X337                         =   8'h80;
parameter           P_CLAN_AHB_COMLANE_X338                         =   8'h3F;
parameter           P_CLAN_AHB_COMLANE_X339                         =   8'h3F;
parameter           P_CLAN_AHB_COMLANE_X34                          =   8'h21;
parameter           P_CLAN_AHB_COMLANE_X340                         =   8'h3F;
parameter           P_CLAN_AHB_COMLANE_X341                         =   8'h20;
parameter           P_CLAN_AHB_COMLANE_X342                         =   8'h20;
parameter           P_CLAN_AHB_COMLANE_X343                         =   8'h20;
parameter           P_CLAN_AHB_COMLANE_X344                         =   8'h55;
parameter           P_CLAN_AHB_COMLANE_X345                         =   8'h55;
parameter           P_CLAN_AHB_COMLANE_X346                         =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X347                         =   8'h7F;
parameter           P_CLAN_AHB_COMLANE_X348                         =   8'h6F;
parameter           P_CLAN_AHB_COMLANE_X349                         =   8'h77;
parameter           P_CLAN_AHB_COMLANE_X35                          =   8'h3F;
parameter           P_CLAN_AHB_COMLANE_X350                         =   8'h7B;
parameter           P_CLAN_AHB_COMLANE_X351                         =   8'h7D;
parameter           P_CLAN_AHB_COMLANE_X352                         =   8'h7E;
parameter           P_CLAN_AHB_COMLANE_X353                         =   8'h6;
parameter           P_CLAN_AHB_COMLANE_X354                         =   8'h6;
parameter           P_CLAN_AHB_COMLANE_X355                         =   8'h66;
parameter           P_CLAN_AHB_COMLANE_X356                         =   8'h66;
parameter           P_CLAN_AHB_COMLANE_X357                         =   8'h66;
parameter           P_CLAN_AHB_COMLANE_X358                         =   8'h88;
parameter           P_CLAN_AHB_COMLANE_X359                         =   8'h44;
parameter           P_CLAN_AHB_COMLANE_X360                         =   8'h44;
parameter           P_CLAN_AHB_COMLANE_X361                         =   8'h14;
parameter           P_CLAN_AHB_COMLANE_X362                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X363                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X364                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X365                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X366                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X367                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X368                         =   8'h14;
parameter           P_CLAN_AHB_COMLANE_X369                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X370                         =   8'h7;
parameter           P_CLAN_AHB_COMLANE_X371                         =   8'h16;
parameter           P_CLAN_AHB_COMLANE_X372                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X373                         =   8'h5;
parameter           P_CLAN_AHB_COMLANE_X374                         =   8'h16;
parameter           P_CLAN_AHB_COMLANE_X375                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X376                         =   8'h5;
parameter           P_CLAN_AHB_COMLANE_X377                         =   8'h18;
parameter           P_CLAN_AHB_COMLANE_X378                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X379                         =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X38                          =   8'h83;
parameter           P_CLAN_AHB_COMLANE_X380                         =   8'h1B;
parameter           P_CLAN_AHB_COMLANE_X381                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X382                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X383                         =   8'h18;
parameter           P_CLAN_AHB_COMLANE_X384                         =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X385                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X386                         =   8'h18;
parameter           P_CLAN_AHB_COMLANE_X387                         =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X388                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X389                         =   8'h12;
parameter           P_CLAN_AHB_COMLANE_X39                          =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X390                         =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X391                         =   8'h6;
parameter           P_CLAN_AHB_COMLANE_X392                         =   8'h14;
parameter           P_CLAN_AHB_COMLANE_X393                         =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X394                         =   8'h4;
parameter           P_CLAN_AHB_COMLANE_X395                         =   8'h17;
parameter           P_CLAN_AHB_COMLANE_X396                         =   8'h4;
parameter           P_CLAN_AHB_COMLANE_X397                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X398                         =   8'h12;
parameter           P_CLAN_AHB_COMLANE_X399                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X4                           =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X40                          =   8'h43;
parameter           P_CLAN_AHB_COMLANE_X400                         =   8'h9;
parameter           P_CLAN_AHB_COMLANE_X401                         =   8'hF0;
parameter           P_CLAN_AHB_COMLANE_X402                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X403                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X404                         =   8'h74;
parameter           P_CLAN_AHB_COMLANE_X405                         =   8'h91;
parameter           P_CLAN_AHB_COMLANE_X406                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X407                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X408                         =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X409                         =   8'h33;
parameter           P_CLAN_AHB_COMLANE_X41                          =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X410                         =   8'h7F;
parameter           P_CLAN_AHB_COMLANE_X411                         =   8'h6F;
parameter           P_CLAN_AHB_COMLANE_X412                         =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X413                         =   8'h13;
parameter           P_CLAN_AHB_COMLANE_X414                         =   8'h10;
parameter           P_CLAN_AHB_COMLANE_X415                         =   8'hC;
parameter           P_CLAN_AHB_COMLANE_X416                         =   8'hD;
parameter           P_CLAN_AHB_COMLANE_X417                         =   8'h8A;
parameter           P_CLAN_AHB_COMLANE_X418                         =   8'h10;
parameter           P_CLAN_AHB_COMLANE_X419                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X42                          =   8'h1;
parameter           P_CLAN_AHB_COMLANE_X420                         =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X421                         =   8'h77;
parameter           P_CLAN_AHB_COMLANE_X422                         =   8'hFF;
parameter           P_CLAN_AHB_COMLANE_X423                         =   8'hFF;
parameter           P_CLAN_AHB_COMLANE_X424                         =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X425                         =   8'h77;
parameter           P_CLAN_AHB_COMLANE_X426                         =   8'hF8;
parameter           P_CLAN_AHB_COMLANE_X427                         =   8'h6D;
parameter           P_CLAN_AHB_COMLANE_X428                         =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X429                         =   8'h13;
parameter           P_CLAN_AHB_COMLANE_X43                          =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X430                         =   8'h10;
parameter           P_CLAN_AHB_COMLANE_X431                         =   8'hC;
parameter           P_CLAN_AHB_COMLANE_X432                         =   8'hD;
parameter           P_CLAN_AHB_COMLANE_X433                         =   8'h8A;
parameter           P_CLAN_AHB_COMLANE_X434                         =   8'h10;
parameter           P_CLAN_AHB_COMLANE_X435                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X436                         =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X437                         =   8'h33;
parameter           P_CLAN_AHB_COMLANE_X438                         =   8'h7F;
parameter           P_CLAN_AHB_COMLANE_X439                         =   8'h6F;
parameter           P_CLAN_AHB_COMLANE_X44                          =   8'h42;
parameter           P_CLAN_AHB_COMLANE_X440                         =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X441                         =   8'h13;
parameter           P_CLAN_AHB_COMLANE_X442                         =   8'h10;
parameter           P_CLAN_AHB_COMLANE_X443                         =   8'h2C;
parameter           P_CLAN_AHB_COMLANE_X444                         =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X445                         =   8'h33;
parameter           P_CLAN_AHB_COMLANE_X446                         =   8'h7D;
parameter           P_CLAN_AHB_COMLANE_X447                         =   8'h3D;
parameter           P_CLAN_AHB_COMLANE_X448                         =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X449                         =   8'h33;
parameter           P_CLAN_AHB_COMLANE_X45                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X450                         =   8'h7F;
parameter           P_CLAN_AHB_COMLANE_X451                         =   8'hFF;
parameter           P_CLAN_AHB_COMLANE_X452                         =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X453                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X454                         =   8'h14;
parameter           P_CLAN_AHB_COMLANE_X455                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X456                         =   8'h32;
parameter           P_CLAN_AHB_COMLANE_X457                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X458                         =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X459                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X46                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X460                         =   8'hA7;
parameter           P_CLAN_AHB_COMLANE_X461                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X462                         =   8'hA7;
parameter           P_CLAN_AHB_COMLANE_X463                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X464                         =   8'h20;
parameter           P_CLAN_AHB_COMLANE_X465                         =   8'h3;
parameter           P_CLAN_AHB_COMLANE_X466                         =   8'h1D;
parameter           P_CLAN_AHB_COMLANE_X467                         =   8'h9;
parameter           P_CLAN_AHB_COMLANE_X468                         =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X469                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X47                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X470                         =   8'h14;
parameter           P_CLAN_AHB_COMLANE_X471                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X472                         =   8'h14;
parameter           P_CLAN_AHB_COMLANE_X473                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X474                         =   8'hD0;
parameter           P_CLAN_AHB_COMLANE_X475                         =   8'h7;
parameter           P_CLAN_AHB_COMLANE_X476                         =   8'hD0;
parameter           P_CLAN_AHB_COMLANE_X477                         =   8'h7;
parameter           P_CLAN_AHB_COMLANE_X478                         =   8'h32;
parameter           P_CLAN_AHB_COMLANE_X479                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X48                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X480                         =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X481                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X482                         =   8'hA7;
parameter           P_CLAN_AHB_COMLANE_X483                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X484                         =   8'hA7;
parameter           P_CLAN_AHB_COMLANE_X485                         =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X486                         =   8'hD0;
parameter           P_CLAN_AHB_COMLANE_X487                         =   8'h7;
parameter           P_CLAN_AHB_COMLANE_X488                         =   8'h58;
parameter           P_CLAN_AHB_COMLANE_X489                         =   8'h1B;
parameter           P_CLAN_AHB_COMLANE_X49                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X490                         =   8'h58;
parameter           P_CLAN_AHB_COMLANE_X491                         =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X492                         =   8'h9E;
parameter           P_CLAN_AHB_COMLANE_X493                         =   8'h7;
parameter           P_CLAN_AHB_COMLANE_X494                         =   8'h6;
parameter           P_CLAN_AHB_COMLANE_X495                         =   8'h5F;
parameter           P_CLAN_AHB_COMLANE_X496                         =   8'h6;
parameter           P_CLAN_AHB_COMLANE_X497                         =   8'h73;
parameter           P_CLAN_AHB_COMLANE_X498                         =   8'h6;
parameter           P_CLAN_AHB_COMLANE_X499                         =   8'h78;
parameter           P_CLAN_AHB_COMLANE_X5                           =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X50                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X500                         =   8'h8;
parameter           P_CLAN_AHB_COMLANE_X501                         =   8'h7D;
parameter           P_CLAN_AHB_COMLANE_X502                         =   8'h10;
parameter           P_CLAN_AHB_COMLANE_X503                         =   8'h82;
parameter           P_CLAN_AHB_COMLANE_X504                         =   8'hC;
parameter           P_CLAN_AHB_COMLANE_X505                         =   8'hB3;
parameter           P_CLAN_AHB_COMLANE_X51                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X52                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X53                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X54                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X55                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X56                          =   8'h2E;
parameter           P_CLAN_AHB_COMLANE_X57                          =   8'h2E;
parameter           P_CLAN_AHB_COMLANE_X58                          =   8'h16;
parameter           P_CLAN_AHB_COMLANE_X59                          =   8'h16;
parameter           P_CLAN_AHB_COMLANE_X6                           =   8'h83;
parameter           P_CLAN_AHB_COMLANE_X60                          =   8'h16;
parameter           P_CLAN_AHB_COMLANE_X61                          =   8'h16;
parameter           P_CLAN_AHB_COMLANE_X62                          =   8'h14;
parameter           P_CLAN_AHB_COMLANE_X63                          =   8'h14;
parameter           P_CLAN_AHB_COMLANE_X64                          =   8'h46;
parameter           P_CLAN_AHB_COMLANE_X65                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X66                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X67                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X68                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X69                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X7                           =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X70                          =   8'hF4;
parameter           P_CLAN_AHB_COMLANE_X71                          =   8'h81;
parameter           P_CLAN_AHB_COMLANE_X72                          =   8'hAB;
parameter           P_CLAN_AHB_COMLANE_X73                          =   8'h8C;
parameter           P_CLAN_AHB_COMLANE_X74                          =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X75                          =   8'h0;
parameter           P_CLAN_AHB_COMLANE_X76                          =   8'h2B;
parameter           P_CLAN_AHB_COMLANE_X77                          =   8'h5;
parameter           P_CLAN_AHB_COMLANE_X78                          =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X79                          =   8'h1E;
parameter           P_CLAN_AHB_COMLANE_X8                           =   8'h33;
parameter           P_CLAN_AHB_COMLANE_X80                          =   8'h14;
parameter           P_CLAN_AHB_COMLANE_X81                          =   8'h23;
parameter           P_CLAN_AHB_COMLANE_X82                          =   8'h1E;
parameter           P_CLAN_AHB_COMLANE_X83                          =   8'h2D;
parameter           P_CLAN_AHB_COMLANE_X84                          =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X85                          =   8'h3C;
parameter           P_CLAN_AHB_COMLANE_X86                          =   8'hB;
parameter           P_CLAN_AHB_COMLANE_X87                          =   8'h41;
parameter           P_CLAN_AHB_COMLANE_X88                          =   8'h8E;
parameter           P_CLAN_AHB_COMLANE_X89                          =   8'h46;
parameter           P_CLAN_AHB_COMLANE_X9                           =   8'hE1;
parameter           P_CLAN_AHB_COMLANE_X90                          =   8'hA;
parameter           P_CLAN_AHB_COMLANE_X91                          =   8'h5F;
parameter           P_CLAN_AHB_COMLANE_X92                          =   8'h14;
parameter           P_CLAN_AHB_COMLANE_X93                          =   8'h64;
parameter           P_CLAN_AHB_COMLANE_X94                          =   8'h2;
parameter           P_CLAN_AHB_COMLANE_X95                          =   8'h6E;
parameter           P_CLAN_AHB_COMLANE_X96                          =   8'h6;
parameter           P_CLAN_AHB_COMLANE_X97                          =   8'h73;
parameter           P_CLAN_AHB_COMLANE_X98                          =   8'hE;
parameter           P_CLAN_AHB_COMLANE_X99                          =   8'h7D;
parameter           P_QUAD_CORRD                                    =   "Q0";
//end add parameter in quad


endmodule

//
//GTR6_UPAR
module GTR6_UPAR(
    input                              TL_CLKP                                     ,
    input                              UPAR_RST                                     ,
    input                              UPAR_WREN_S                                  ,
    input     [23:0]                   UPAR_ADDR_S                                  ,
    input     [31:0]                   UPAR_WRDATA_S                                ,
    input                              UPAR_RDEN_S                                  ,
    input     [7:0]                    UPAR_STRB_S                                  ,
    input                              UPAR_BUS_WIDTH_S                             ,
    output    [31:0]                   UPAR_RDDATA_S                                ,
    output                             UPAR_RDVLD_S                                 ,
    output                             UPAR_READY_S                                 ,
    input                              SPI_CLK                                      ,
    output                             SPI_MOSI                                     ,
    input                              SPI_MISO                                     ,
    input                              SPI_SS                                       ,

	output                             TL_CLKP_I                                    ,
	output                             SCAN_EN_O                                    ,
//ds upar common
	output                             DS_STAT_CLK      ,
	output                             DS_UPAR_RST      ,
	output                             DS_UPAR_CLK      ,

//apb port
    output      [19-1:0]				APB_PADDR0,
    output                              APB_PENABLE0,
    output                              APB_PWRITE0,
    output      [31:0]                  APB_PWDATA0,
    output      [3:0]                   APB_PSTRB0,
    input       [31:0]                  APB_PRDATA0,
    input                               APB_PREADY0,

    output      [19-1:0]				APB_PADDR1,
    output                              APB_PENABLE1,
    output                              APB_PWRITE1,
    output      [31:0]                  APB_PWDATA1,
    output      [3:0]                   APB_PSTRB1,
    input       [31:0]                  APB_PRDATA1,
    input                               APB_PREADY1,

    output      [19-1:0]				APB_PADDR2,
    output                              APB_PENABLE2,
    output                              APB_PWRITE2,
    output      [31:0]                  APB_PWDATA2,
    output      [3:0]                   APB_PSTRB2,
    input       [31:0]                  APB_PRDATA2,
    input                               APB_PREADY2,

    output      [19-1:0]				APB_PADDR3,
    output                              APB_PENABLE3,
    output                              APB_PWRITE3,
    output      [31:0]                  APB_PWDATA3,
    output      [3:0]                   APB_PSTRB3,
    input       [31:0]                  APB_PRDATA3,
    input                               APB_PREADY3,

    output      [19-1:0]				APB_PADDR4,
    output                              APB_PENABLE4,
    output                              APB_PWRITE4,
    output      [31:0]                  APB_PWDATA4,
    output      [3:0]                   APB_PSTRB4,
    input       [31:0]                  APB_PRDATA4,
    input                               APB_PREADY4,

    output      [19-1:0]				APB_PADDR5,
    output                              APB_PENABLE5,
    output                              APB_PWRITE5,
    output      [31:0]                  APB_PWDATA5,
    output      [3:0]                   APB_PSTRB5,
    input       [31:0]                  APB_PRDATA5,
    input                               APB_PREADY5,

    output      [19-1:0]				APB_PADDR6,
    output                              APB_PENABLE6,
    output                              APB_PWRITE6,
    output      [31:0]                  APB_PWDATA6,
    output      [3:0]                   APB_PSTRB6,
    input       [31:0]                  APB_PRDATA6,
    input                               APB_PREADY6,

    output     [19-1:0]				    APB_PADDR7,
    output                              APB_PENABLE7,
    output                              APB_PWRITE7,
    output     [31:0]                   APB_PWDATA7,
    output     [3:0]                    APB_PSTRB7,
    input      [31:0]                   APB_PRDATA7,
    input                               APB_PREADY7,


//ahb port

    input      [7:0]                    Q0_AHB_RDATA,
    input                               Q0_AHB_READY,
    output                              Q0_AHB_SEL,
    output                              Q0_AHB_WRITE,
    output     [7:0]                    Q0_AHB_WDATA,
    output     [7:0]                    Q0_AHB_WMASK,
    output     [13-1:0]					Q0_AHB_ADDR,

    input      [7:0]                    Q1_AHB_RDATA,
    input                               Q1_AHB_READY,
    output                              Q1_AHB_SEL,
    output                              Q1_AHB_WRITE,
    output     [7:0]                    Q1_AHB_WDATA,
    output     [7:0]                    Q1_AHB_WMASK,
    output     [13-1:0]					Q1_AHB_ADDR,

    input      [7:0]                    Q2_AHB_RDATA,
    input                               Q2_AHB_READY,
    output                              Q2_AHB_SEL,
    output                              Q2_AHB_WRITE,
    output     [7:0]                    Q2_AHB_WDATA,
    output     [7:0]                    Q2_AHB_WMASK,
    output     [13-1:0]					Q2_AHB_ADDR,


	output             PMAC_UPAR_SEL       ,
	output     [23:0]  PMAC_UPAR_ADDR      ,
	output     [31:0]  PMAC_UPAR_WRDATA    ,
	input      [31:0]  PMAC_UPAR_RDDATA    ,
	output             PMAC_UPAR_WREN      ,
	output             PMAC_UPAR_RDEN      ,
	input              PMAC_UPAR_READY     ,
	input              PMAC_UPAR_RDVLD     ,

	output             TEST_UPAR_SEL       ,
	output     [23:0]  TEST_UPAR_ADDR      ,
	output     [31:0]  TEST_UPAR_WRDATA    ,
	input      [31:0]  TEST_UPAR_RDDATA    ,
	output             TEST_UPAR_WREN      ,
	output             TEST_UPAR_RDEN      ,
	input              TEST_UPAR_READY     ,
	input              TEST_UPAR_RDVLD     ,

	output             Q0_UPAR_SEL       ,
	output     [23:0]  Q0_UPAR_ADDR      ,
	output     [31:0]  Q0_UPAR_WRDATA    ,
	input      [31:0]  Q0_UPAR_RDDATA    ,
	output             Q0_UPAR_WREN      ,
	output             Q0_UPAR_RDEN      ,
	input              Q0_UPAR_READY     ,
	input              Q0_UPAR_RDVLD     ,

	output             Q1_UPAR_SEL       ,
	output     [23:0]  Q1_UPAR_ADDR      ,
	output     [31:0]  Q1_UPAR_WRDATA    ,
	input      [31:0]  Q1_UPAR_RDDATA    ,
	output             Q1_UPAR_WREN      ,
	output             Q1_UPAR_RDEN      ,
	input              Q1_UPAR_READY     ,
	input              Q1_UPAR_RDVLD     ,

	output             Q2_UPAR_SEL       ,
	output     [23:0]  Q2_UPAR_ADDR      ,
	output     [31:0]  Q2_UPAR_WRDATA    ,
	input      [31:0]  Q2_UPAR_RDDATA    ,
	output             Q2_UPAR_WREN      ,
	output             Q2_UPAR_RDEN      ,
	input              Q2_UPAR_READY     ,
	input              Q2_UPAR_RDVLD
)/* synthesis syn_black_box  */;

endmodule


