
// ===========Oooo==========================================Oooo========
// =  Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// =====================================================================
//
//  __      __      __
//  \ \    /  \    / /   [File name   ] prim_syn.v
//   \ \  / /\ \  / /    [Description ] GW1N hardcore verilog functional synthesis library
//    \ \/ /  \ \/ /     [Timestamp   ] Wed September 30 11:00:30 2020
//     \  /    \  /      [version     ] 1.5
//      \/      \/       
//
// ===========Oooo==========================================Oooo========



`timescale 1ns / 1ps

//BANDGAP
module BANDGAP( BGEN ) /* synthesis syn_black_box syn_noprune=1 */;
input BGEN;

endmodule

//CLKDIV2
module CLKDIV2(CLKOUT, HCLKIN, RESETN) /* synthesis syn_black_box  */;

parameter GSREN = "false"; //"false", "true"

input HCLKIN, RESETN;
output CLKOUT;

endmodule

//DCC,DutyCycleCorrection
module DCC(CLKOUT, CLKIN) /* synthesis syn_black_box  */;
output CLKOUT;
input CLKIN;

parameter DCC_EN = 1'b1; //1'b1: enable dcc; 1'b0: disable dcc
parameter FCLKIN = 50.0;//frequency of the clkin(M)

endmodule

//DHCENC
module DHCENC (CLKOUT, CLKOUTN, CLKIN, CE) /* synthesis syn_black_box  */;
input CLKIN, CE;
output CLKOUT, CLKOUTN;

endmodule

//EMCU,Enhanced MCU,used for 1ns-4c
module EMCU (

  input            FCLK,                      // Free running clock
  input            PORESETN,                  // Power on reset
  input            SYSRESETN,                 // System reset
  input            RTCSRCCLK,                 // Used to generate RTC clock
  output  [15:0]   IOEXPOUTPUTO,              // 
  output  [15:0]   IOEXPOUTPUTENO,            // 
  input   [15:0]   IOEXPINPUTI,               // 
  output           UART0TXDO,                 // 
  output           UART1TXDO,                 // 
  output           UART0BAUDTICK,             //
  output           UART1BAUDTICK,             //
  input            UART0RXDI,                 // 
  input            UART1RXDI,                 //
  output           INTMONITOR,                //
  // ----------------------------------------------------------------------------
  // AHB2SRAM<0..3> Interfaces
  // ----------------------------------------------------------------------------
  output             MTXHRESETN,            // SRAM/Flash Chip reset
  output  [12:0]     SRAM0ADDR,             // SRAM address
  output  [3:0]      SRAM0WREN,             // SRAM Byte write enable
  output  [31:0]     SRAM0WDATA,            // SRAM Write data
  output             SRAM0CS,               // SRAM Chip select
  input   [31:0]     SRAM0RDATA,            // SRAM Read data bus
  // ----------------------------------------------------------------------------
  // AHB Target Expansion ports
  // ----------------------------------------------------------------------------
  //  amba.com/AMBA3/AHBLite/r2p0_0, TARGFLASH0, master
  output              TARGFLASH0HSEL,         // TARGFLASH0, HSELx,
  output  [28:0]      TARGFLASH0HADDR,        // TARGFLASH0, HADDR,
  output   [1:0]      TARGFLASH0HTRANS,       // TARGFLASH0, HTRANS,
  output   [2:0]      TARGFLASH0HSIZE,        // TARGFLASH0, HSIZE,
  output   [2:0]      TARGFLASH0HBURST,       // TARGFLASH0, HBURST,
  output              TARGFLASH0HREADYMUX,    // TARGFLASH0, HREADYOUT,
  input   [31:0]      TARGFLASH0HRDATA,       // TARGFLASH0, HRDATA,
  input    [2:0]      TARGFLASH0HRUSER,       // TARGFLASH0, HRUSER, Tie to 3'b0
  input               TARGFLASH0HRESP,        // TARGFLASH0, HRESP
  input               TARGFLASH0EXRESP,       // TARGFLASH0, EXRESP;  Tie to 1'b0
  input               TARGFLASH0HREADYOUT,    // TARGFLASH0, EXRESP
  //  amba.com/AMBA3/AHBLite/r2p0_0, TARGEXP0, master
  output              TARGEXP0HSEL,           // TARGEXP0, HSELx,
  output  [31:0]      TARGEXP0HADDR,          // TARGEXP0, HADDR,
  output   [1:0]      TARGEXP0HTRANS,         // TARGEXP0, HTRANS,
  output              TARGEXP0HWRITE,         // TARGEXP0, HWRITE,
  output   [2:0]      TARGEXP0HSIZE,          // TARGEXP0, HSIZE,
  output   [2:0]      TARGEXP0HBURST,         // TARGEXP0, HBURST,
  output   [3:0]      TARGEXP0HPROT,          // TARGEXP0, HPROT,
  output   [1:0]      TARGEXP0MEMATTR,
  output              TARGEXP0EXREQ,
  output   [3:0]      TARGEXP0HMASTER,
  output  [31:0]      TARGEXP0HWDATA,         // TARGEXP0, HWDATA,
  output              TARGEXP0HMASTLOCK,      // TARGEXP0, HMASTLOCK,
  output              TARGEXP0HREADYMUX,      // TARGEXP0, HREADYOUT,
  output              TARGEXP0HAUSER,         // TARGEXP0, HAUSER,
  output   [3:0]      TARGEXP0HWUSER,         // TARGEXP0, HWUSER,
  input   [31:0]      TARGEXP0HRDATA,         // TARGEXP0, HRDATA,
  input               TARGEXP0HREADYOUT,      // TARGEXP0, HREADY,
  input               TARGEXP0HRESP,          // TARGEXP0, HRESP,
  input               TARGEXP0EXRESP,
  input    [2:0]      TARGEXP0HRUSER,         // TARGEXP0, HRUSER,
  // ----------------------------------------------------------------------------
  // AHB Initiator Expansion ports
  // ----------------------------------------------------------------------------
  output  [31:0]      INITEXP0HRDATA,         // INITEXP0, HRDATA,
  output              INITEXP0HREADY,         // INITEXP0, HREADY,
  output              INITEXP0HRESP,          // INITEXP0, HRESP,
  output              INITEXP0EXRESP,
  output  [2:0]       INITEXP0HRUSER,         // INITEXP0, HRUSER,
  input               INITEXP0HSEL,           // INITEXP0, HSELx,
  input   [31:0]      INITEXP0HADDR,          // INITEXP0, HADDR,
  input    [1:0]      INITEXP0HTRANS,         // INITEXP0, HTRANS,
  input               INITEXP0HWRITE,         // INITEXP0, HWRITE,
  input    [2:0]      INITEXP0HSIZE,          // INITEXP0, HSIZE,
  input    [2:0]      INITEXP0HBURST,         // INITEXP0, HBURST,
  input    [3:0]      INITEXP0HPROT,          // INITEXP0, HPROT,
  input    [1:0]      INITEXP0MEMATTR,
  input               INITEXP0EXREQ,
  input    [3:0]      INITEXP0HMASTER,
  input   [31:0]      INITEXP0HWDATA,         // INITEXP0, HWDATA,
  input               INITEXP0HMASTLOCK,      // INITEXP0, HMASTLOCK,
  input               INITEXP0HAUSER,         // INITEXP0, HAUSER,
  input    [3:0]      INITEXP0HWUSER,         // INITEXP0, HWUSER,
  //  amba.com/AMBA4/APB4/r0p0_0, APBTARGEXP2, master
  output  [3:0]       APBTARGEXP2PSTRB,       // APBTARGEXP2, PSTRB,
  output  [2:0]       APBTARGEXP2PPROT,       // APBTARGEXP2, PPROT,
  output              APBTARGEXP2PSEL,        // APBTARGEXP2, PSELx,
  output              APBTARGEXP2PENABLE,     // APBTARGEXP2, PENABLE,
  output  [11:0]      APBTARGEXP2PADDR,       // APBTARGEXP2, PADDR,
  output              APBTARGEXP2PWRITE,      // APBTARGEXP2, PWRITE,
  output  [31:0]      APBTARGEXP2PWDATA,      // APBTARGEXP2, PWDATA,
  input    [31:0]     APBTARGEXP2PRDATA,      // APBTARGEXP2, PRDATA,
  input               APBTARGEXP2PREADY,      // APBTARGEXP2, PREADY,
  input               APBTARGEXP2PSLVERR,     // APBTARGEXP2, PSLVERR,
  // CPU Control, Status and Configuration
  // ----------------------------------------------------------------------------
  // CSS configuration inputs
  // ----------------------------------------------------------------------------
  input   [3:0]       MTXREMAP,               // Configration bits. MTXREMAP = 4'b1111
  // ----------------------------------------------------------------------------
  // Interrupts
  // ----------------------------------------------------------------------------
  //JTAG + SW Debug access clock reset
  // JTAG + SW Debug access functional signals
  output               DAPTDO,                // Debug TDO
  output               DAPJTAGNSW,            // JTAG or Serial-Wire selection JTAG mode(1) or SW mode(0)
  output               DAPNTDOEN,             // TDO output pad control signal
  input                DAPSWDITMS,            // Debug TMS
  input                DAPTDI,                // Debug TDI
  input                DAPNTRST,              // Test reset
  input                DAPSWCLKTCK,           // Test clock / SWCLK
  //TRACE Interface functional signals
  output  [3:0]        TPIUTRACEDATA,         // Output data. A system might not connect all the bits of
  output               TPIUTRACECLK,          // Output clock, used by the TPA to sample the other pins
  input   [4:0]        GPINT,                 // 5 more interrupts input 
  input                FLASHERR,              // Output clock, used by the TPA to sample the other pins
  input                FLASHINT               // Output clock, used by the TPA to sample the other pins

 ) /* synthesis syn_black_box  */;

endmodule

//FLASH64K with sleep mode for gw1nz_1
module FLASH64K (DOUT, DIN, XADR, YADR, XE, YE, SE, ERASE, PROG, NVSTR, SLEEP) /* synthesis syn_black_box  */;
input[4:0]XADR;
input[5:0]YADR;
input XE,YE,SE;
input ERASE,PROG,NVSTR;
input SLEEP;
input [31:0] DIN;
output [31:0] DOUT;

endmodule

//FLASH64K for gw1nz_1
module FLASH64KZ (DOUT, DIN, XADR, YADR, XE, YE, SE, ERASE, PROG, NVSTR) /* synthesis syn_black_box  */;
input[4:0]XADR;
input[5:0]YADR;
input XE,YE,SE;
input ERASE,PROG,NVSTR;
input [31:0] DIN;
output [31:0] DOUT;

endmodule

//I3C
module I3C (
	AAC,        //assert ACK clear
	AAO,        //assert ACK output
	AAS,        //assert ACK set
	ACC,        //assert continuity clear
	ACKHS,      //ACK high period divider
	ACKLS,      //ACK low period divider
	ACO,        //assert continuity output
	ACS,        //assert continuity set
	ADDRS,      //set dynamic address
	CE,         //clock enable
	CLK,        //clock input
	CMC,        //current master set
	CMO,        //current master output
	CMS,        //current master set
	DI,         //data input
	DO,         //unbuffered data output
	DOBUF,      //buffered data output
	LGYC,       //legacy mode clear
	LGYO,       //legacy mode output
	LGYS,       //enter legacy mode set
	PARITYERROR,//indicater of parit bit error
	RECVDHS,    //set receiving data high period divider
	RECVDLS,    //set receiving data low period divider
	RESET,      //asyn.reset, active high  
	SCLI,       //scl input
	SCLO,       //scl output
	SCLOEN,     //scl output enable, active low
	SCLPULLO,   //scl pull-up output
	SCLPULLOEN, //scl pull-up output enable, active low
	SDAI,       //sda input
	SDAO,       //sda output
	SDAOEN,     //sda output enable, active low
	SDAPULLO,   //sda pull-up output
	SDAPULLOEN, //sda pull-up output enable, active low
	SENDAHS,    //set sending address high period divider
	SENDALS,    //set sending address low period divider
	SENDDHS,    //set sending data high period divider
	SENDDLS,    //set sending data low period divider
	SIC,        //system interrupt clear
	SIO,        //system interrupt output
	STRTC,      //start celar
	STRTO,      //start output
	STRTS,      //start set
	STATE,      //state output
	STRTHDS,    //set start hold time
	STOPC,      //stop clear
	STOPO,      //stop output
	STOPS,      //stop set
	
	STOPSUS,     //set stop setup time
	STOPHDS      //set stop hold time

) /* synthesis syn_black_box  */;

parameter ADDRESS = 7'b0000000;

input 	LGYS, CMS, ACS, AAS, STOPS, STRTS;
output 	LGYO, CMO, ACO, AAO, SIO, STOPO, STRTO;
input 	LGYC, CMC, ACC, AAC, SIC, STOPC, STRTC;

input	STRTHDS, SENDAHS, SENDALS, ACKHS;
input	ACKLS, STOPSUS, STOPHDS, SENDDHS;
input	SENDDLS, RECVDHS, RECVDLS, ADDRS;

output	PARITYERROR;
input 	[7:0] DI;
output 	[7:0] DOBUF;
output 	[7:0] DO;
output 	[7:0] STATE;

input	SDAI, SCLI;
output	SDAO, SCLO;
output	SDAOEN, SCLOEN;

output	SDAPULLO, SCLPULLO;
output	SDAPULLOEN, SCLPULLOEN;

input 	CE, RESET, CLK;


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

//IODELAYC
module IODELAYC (DO, DAO, DF, DI, SDTAP, VALUE, SETN, DAADJ, DASEL) /* synthesis syn_black_box  */;

parameter C_STATIC_DLY = 0; //integer,0~127
parameter DYN_DA_SEL = "false"; //false:DA_SEL; true:DASEL
parameter DA_SEL = 2'b00;

input DI;
input  SDTAP;
input  SETN;
input  VALUE;
input [1:0] DASEL;
input [1:0] DAADJ;

output DF;
output DO;
output DAO;

endmodule


//PLLVR,PLL with regulator
module PLLVR (CLKOUT, CLKOUTP, CLKOUTD, CLKOUTD3, LOCK, CLKIN, CLKFB, FBDSEL, IDSEL, ODSEL, DUTYDA, PSDA, FDLY, RESET, RESET_P, VREN) /* synthesis syn_black_box  */;
input CLKIN;
input CLKFB;
input RESET;
input RESET_P;
input [5:0] FBDSEL;
input [5:0] IDSEL;
input [5:0] ODSEL;
input [3:0] PSDA,FDLY;
input [3:0] DUTYDA;
input VREN; //regulator enable

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
parameter DEVICE = "GW1NS-4";//"GW1NS-4","GW1NS-4C","GW1NSR-4","GW1NSER-4C","GW1NSR-4C"

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
parameter DEVICE = "GW1N-4";//"GW1N-1","GW1N-4","GW1N-9","GW1NR-4","GW1NR-9","GW1N-4B","GW1NR-4B","GW1NS-2","GW1NS-2C","GW1NZ-1","GW1NSR-2","GW1NSR-2C","GW1N-1S","GW1NSE-2C","GW1NRF-4B","GW1N-9C","GW1NR-9C","GW1N-4D","GW1NR-4D"

endmodule


//SPMI
module SPMI (
	CLK	,
	CLKEXT,
	CE	,
	RESETN	,
	ENEXT,
	LOCRESET,
	PA	,
	SA	,
	CA	,
	ADDRI	,
	DATAI	,
	ADDRO	,
	DATAO	,
	STATE	,
	CMD	,
	SDATA,
	SCLK
) /* synthesis syn_black_box black_box_pad_pin = "CLKEXT, ENEXT, SDATA, SCLK" syn_noprune = 1 */;

parameter FUNCTION_CTRL = 7'b0000000; 
parameter MSID_CLKSEL = 7'b0000000;//M_S_ID & CLK_FROM_EXT_SEL
parameter RESPOND_DELAY = 4'b0000;
parameter SCLK_NORMAL_PERIOD = 7'b0000000;
parameter SCLK_LOW_PERIOD = 7'b0000000;
parameter CLK_FREQ = 7'b0000000;
parameter SHUTDOWN_BY_ENABLE = 1'b0; //1'b0:enable spmi, only 1'b0

//dedicated multiplex pin
input	CLKEXT, ENEXT;
inout	SDATA, 	SCLK;

//
input 	CLK, CE, RESETN, LOCRESET;
input 	PA, SA, CA;
input	[3:0] 	ADDRI;
input	[7:0] 	DATAI;

output 	[3:0] 	ADDRO;
output 	[7:0] 	DATAO;
output 	[15:0] 	STATE;
output	[3:0]	CMD;

endmodule

//MIPI_OBUF_A
module MIPI_OBUF_A (O, OB, I, IB, IL, MODESEL)/* synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin = "O, OB" */;
output O, OB;
input  I, IB, IL, MODESEL;

bufif1  (O, I, MODESEL); //HS mode
notif1  (OB, I, MODESEL);

bufif0  (O, IL, MODESEL); //LP mode
bufif0  (OB, IB, MODESEL);

endmodule


//IODELAYB
module IODELAYB (DO, DAO, DF, DI, SDTAP, VALUE, SETN, DAADJ)/* synthesis syn_black_box  */;

parameter C_STATIC_DLY = 0; //integer,0~127
parameter DELAY_MUX = 2'b00; //2'b00:dmux_o=DI; 2'b01:#100ps dmux_o=DI;2'b10:dmux_o=dlyout_mid;2'b11:dmux_o=DO
parameter DA_SEL = 2'b00;//DELAY_MUX:2/3->DA_SEL:0/1; DELAY_MUX:0/1->DA_SEL:0/2/3.

input DI;
input  SDTAP;
input  SETN;
input  VALUE;
input [1:0] DAADJ;

output DF;
output DO;
output DAO;

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

//OSCO,for gw1n-2
//Fosc = 250M/FREQ_DIV
module OSCO (OSCOUT, OSCEN)/* synthesis syn_black_box  */;
parameter  FREQ_DIV = 100; // 2~128,only even num
parameter  REGULATOR_EN = 1'b0;  //1'b0, Powered by VCC!; 1’b1: Powered by regulator（only UV/LV）.
output OSCOUT;
input OSCEN;

endmodule

//DCCG,DutyCycleCorrection for gw1n-2
module DCCG(CLKOUT, CLKIN)/* synthesis syn_black_box  */;
output CLKOUT;
input CLKIN;

parameter DCC_MODE = 2'b00; //2'b0x: Buffered; 2'b10: +80ps; 2'b11: -80ps;
parameter FCLKIN = 50.0;//frequency of the clkin(M)

endmodule

//FLASH256K with sleep mode
module FLASH256KA (DOUT, DIN, XADR, YADR, XE, YE, SE, ERASE, PROG, NVSTR, SLEEP)/* synthesis syn_black_box  */;
input[6:0]XADR;
input[5:0]YADR;
input XE,YE,SE;
input ERASE,PROG,NVSTR;
input SLEEP;
input [31:0] DIN;
output reg [31:0] DOUT;

endmodule

//MIPI_DPHY_RX
module MIPI_DPHY_RX (D0LN_HSRXD, D1LN_HSRXD, D2LN_HSRXD, D3LN_HSRXD, D0LN_HSRXD_VLD, D1LN_HSRXD_VLD, D2LN_HSRXD_VLD, D3LN_HSRXD_VLD, DI_LPRX0_N, DI_LPRX0_P, DI_LPRX1_N, DI_LPRX1_P, DI_LPRX2_N, DI_LPRX2_P, DI_LPRX3_N, DI_LPRX3_P, DI_LPRXCK_N, DI_LPRXCK_P, RX_CLK_O, DESKEW_ERROR, CK_N, CK_P, RX0_N, RX0_P, RX1_N, RX1_P, RX2_N, RX2_P, RX3_N, RX3_P, LPRX_EN_CK, LPRX_EN_D0, LPRX_EN_D1, LPRX_EN_D2, LPRX_EN_D3, HSRX_ODTEN_CK, HSRX_ODTEN_D0,  HSRX_ODTEN_D1, HSRX_ODTEN_D2, HSRX_ODTEN_D3, D0LN_HSRX_DREN,  D1LN_HSRX_DREN, D2LN_HSRX_DREN, D3LN_HSRX_DREN, HSRX_EN_CK, DESKEW_REQ, HS_8BIT_MODE, RX_CLK_1X, RX_INVERT, LALIGN_EN, WALIGN_BY, DO_LPTX0_N, DO_LPTX0_P, DO_LPTX1_N, DO_LPTX1_P, DO_LPTX2_N, DO_LPTX2_P, DO_LPTX3_N, DO_LPTX3_P, DO_LPTXCK_N, DO_LPTXCK_P, LPTX_EN_CK, LPTX_EN_D0, LPTX_EN_D1, LPTX_EN_D2, LPTX_EN_D3, BYTE_LENDIAN, HSRX_STOP, LPRX_ULP_LN0, LPRX_ULP_LN1, LPRX_ULP_LN2, LPRX_ULP_LN3, LPRX_ULP_CK, PWRON, RESET, DESKEW_LNSEL, DESKEW_MTH, DESKEW_OWVAL, DRST_N, ONE_BYTE0_MATCH, WORD_LENDIAN, FIFO_RD_STD)/* synthesis syn_black_box black_box_pad_pin = "CK_N, CK_P, RX0_N, RX0_P, RX1_N, RX1_P, RX2_N, RX2_P, RX3_N, RX3_P" */;
output [15:0] D0LN_HSRXD, D1LN_HSRXD, D2LN_HSRXD, D3LN_HSRXD;//data lane HS data output to fabric     
output D0LN_HSRXD_VLD,D1LN_HSRXD_VLD,D2LN_HSRXD_VLD,D3LN_HSRXD_VLD;//data lane HS data output valid to fabric
output DI_LPRX0_N, DI_LPRX0_P, DI_LPRX1_N, DI_LPRX1_P, DI_LPRX2_N, DI_LPRX2_P, DI_LPRX3_N, DI_LPRX3_P;//Data Lane Complement/True Pad LPRX input
output DI_LPRXCK_N, DI_LPRXCK_P;
output RX_CLK_O;          //HSRX Clock output 
output DESKEW_ERROR;      //4 data lane deskew result error report

inout  CK_N, CK_P, RX0_N, RX0_P, RX1_N, RX1_P, RX2_N, RX2_P, RX3_N, RX3_P;

input LPRX_EN_CK, LPRX_EN_D0, LPRX_EN_D1, LPRX_EN_D2, LPRX_EN_D3;//CK/Data LPRX enabled
input HSRX_ODTEN_CK, HSRX_ODTEN_D0,  HSRX_ODTEN_D1, HSRX_ODTEN_D2, HSRX_ODTEN_D3;//CK/Data Lane HSRX ODT enabled
input D0LN_HSRX_DREN,  D1LN_HSRX_DREN, D2LN_HSRX_DREN, D3LN_HSRX_DREN;//Data Lane HSRX driver enabled
input HSRX_EN_CK;         //CK Lane: 1'b1 HSRX enabled

input HS_8BIT_MODE;       //Selection of data width to Fabric
input RX_CLK_1X;          //1X clock from fabric, max 93.75MHz@1.5Gbps
input RX_INVERT;          //data polarity selection
input LALIGN_EN;          //lane aligner enable
input WALIGN_BY;          //word aligner bypass

input DO_LPTX0_N, DO_LPTX0_P, DO_LPTX1_N, DO_LPTX1_P, DO_LPTX2_N, DO_LPTX2_P, DO_LPTX3_N, DO_LPTX3_P;// Complement/True Pad LPTX output
input DO_LPTXCK_N, DO_LPTXCK_P;
input LPTX_EN_CK, LPTX_EN_D0, LPTX_EN_D1, LPTX_EN_D2, LPTX_EN_D3;//1'b1 LPTX enabled

input BYTE_LENDIAN;       //bit data Littlendian/Bigendian of 8bit
input HSRX_STOP;          //HSRX Clock Stop Signal for synchronization
input LPRX_ULP_LN0, LPRX_ULP_LN1, LPRX_ULP_LN2, LPRX_ULP_LN3, LPRX_ULP_CK;//Data/CK Lane LPRX ULP Control: 1'b1 enable

input PWRON;              //PowerOn Control: 1'b1: HSRX on; 1'b0: HSRX off to standby in low power state
input RESET;              //Reset signal: 1'b1: reset all; 
input [2:0] DESKEW_LNSEL; //selection of lane to config delay overwrite value and make lane in deskew delay overwrite mode
input [7:0] DESKEW_MTH;   //counter threathold for searching one edge
input [6:0] DESKEW_OWVAL; //
input DESKEW_REQ;         //deskew function request to all data lanes
input DRST_N;             //digital reset, active low
input ONE_BYTE0_MATCH;    //byte count match in word aligner
input WORD_LENDIAN;       //data little/big endian of dual word(16bit, 8bit/word). Not used in 8bit data output mode
input [2:0] FIFO_RD_STD;  //FIFO read threadhold; Can only be 1 in 8bit mode.


parameter ALIGN_BYTE = 8'b10111000;//KEY for word aligner and lane aligner
parameter MIPI_LANE0_EN = 1'b0;// 1'b1, Lane0 on; 
parameter MIPI_LANE1_EN = 1'b0;// 1'b1, Lane1 on; 
parameter MIPI_LANE2_EN = 1'b0;// 1'b1, Lane2 on;  
parameter MIPI_LANE3_EN = 1'b0;// 1'b1, Lane3 on;  
parameter MIPI_CK_EN = 1'b1;//CK Lane Select: 1'b1 CK Lane on
parameter SYNC_CLK_SEL = 1'b1;//select clock source for HS lane output data:0,select fabric input clock rx_clk_1x; 1,select output clock RX_CLK_O

endmodule

// CLKDIVG
module CLKDIVG(CLKOUT, CALIB, CLKIN, RESETN) /* synthesis syn_black_box  */; 

input CLKIN;
input RESETN;
input CALIB;
output CLKOUT;

parameter DIV_MODE = "2"; //"2", "3.5", "4", "5", "8"
parameter GSREN = "false"; //"false", "true"

endmodule



