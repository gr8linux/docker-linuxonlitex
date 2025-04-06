
-- ===========Oooo==========================================Oooo========
-- =  Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
-- =                     All rights reserved.
-- =====================================================================
--
--  __      __      __
--  \ \    /  \    / /   [File name   ] prim_syn.vhd
--   \ \  / /\ \  / /    [Description ] GW1N hardcore VHDL functional synthesis library
--    \ \/ /  \ \/ /     [Timestamp   ] Wed September 30 11:00:30 2020
--     \  /    \  /      [version     ] 1.5
--      \/      \/       
--
-- ===========Oooo==========================================Oooo========


---------------------------package global------------------------------

LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

PACKAGE components IS 
   attribute syn_black_box: boolean ;
   attribute syn_black_box of Components : package is true;
   attribute black_box_pad_pin: string;
   attribute syn_noprune : boolean;
   attribute xc_map: string;
   attribute xc_map of Components : package is "lut"; 	

------------------------------BANDGAP---------------------------------------
COMPONENT BANDGAP 
    PORT (
        BGEN : in std_logic
    );
end COMPONENT;
	attribute syn_black_box of BANDGAP : Component is true;
    attribute syn_noprune : boolean;
    attribute syn_noprune of BANDGAP : component is true;
    
------------------------------CLKDIV2---------------------------------------
COMPONENT CLKDIV2 
    GENERIC (
	    GSREN : STRING := "false" -- "false", "true"
    );	
    PORT (
	    HCLKIN : IN std_logic;
	    RESETN : IN std_logic;
	    CLKOUT : OUT std_logic
    );	
end COMPONENT;
	attribute syn_black_box of CLKDIV2 : Component is true;

------------------------------DCC---------------------------------------
COMPONENT DCC 
    GENERIC (
	    DCC_EN : bit := '1';  --'1':enable dcc; '0': disable dcc
        FCLKIN : REAL := 50.0 --frequency of the clkin(M)
    );	
    PORT (
	    CLKOUT: OUT STD_LOGIC;
        CLKIN : IN STD_LOGIC
    );	
end COMPONENT;
	attribute syn_black_box of DCC : Component is true;

------------------------------DHCENC---------------------------------------
COMPONENT DHCENC 
    GENERIC (
	    DCC_EN : bit := '1';  --'1':enable dcc; '0': disable dcc
        FCLKIN : REAL := 50.0 --frequency of the clkin(M)
    );	
    PORT (
	    CLKOUT: OUT STD_LOGIC;
        CLKIN : IN STD_LOGIC
    );	
end COMPONENT;
	attribute syn_black_box of DHCENC : Component is true;

------------------------------EMCU---------------------------------------
COMPONENT EMCU
    PORT(
        FCLK : IN std_logic;
        PORESETN : IN std_logic;
        SYSRESETN : IN std_logic;
        RTCSRCCLK : IN std_logic;
        IOEXPOUTPUTO : OUT std_logic_vector(15 downto 0);
        IOEXPOUTPUTENO : OUT std_logic_vector(15 downto 0);
        IOEXPINPUTI : IN std_logic_vector(15 downto 0);
        UART0TXDO : OUT std_logic;
        UART1TXDO : OUT std_logic;
        UART0BAUDTICK : OUT std_logic;
        UART1BAUDTICK : OUT std_logic;
        UART0RXDI : IN std_logic;
        UART1RXDI : IN std_logic;
        INTMONITOR : OUT std_logic;
        MTXHRESETN : OUT std_logic;
        SRAM0ADDR : OUT std_logic_vector(12 downto 0);
        SRAM0WREN : OUT std_logic_vector(3 downto 0);
        SRAM0WDATA : OUT std_logic_vector(31 downto 0);
        SRAM0CS : OUT std_logic;
        SRAM0RDATA : in std_logic_vector(31 downto 0);

        TARGFLASH0HSEL : OUT std_logic;
        TARGFLASH0HADDR : OUT std_logic_vector(28 downto 0);
        TARGFLASH0HTRANS : OUT std_logic_vector(1 downto 0);
        TARGFLASH0HSIZE : OUT std_logic_vector(2 downto 0);
        TARGFLASH0HBURST : OUT std_logic_vector(2 downto 0);
        TARGFLASH0HREADYMUX : OUT std_logic;
        TARGFLASH0HRDATA : IN std_logic_vector(31 downto 0);
        TARGFLASH0HRUSER : IN std_logic_vector(2 downto 0);
        TARGFLASH0HRESP : IN std_logic;
        TARGFLASH0EXRESP : IN std_logic;
        TARGFLASH0HREADYOUT : IN std_logic;

        TARGEXP0HSEL : OUT std_logic;
        TARGEXP0HADDR : OUT std_logic_vector(31 downto 0);
        TARGEXP0HTRANS : OUT std_logic_vector(1 downto 0);
        TARGEXP0HWRITE : OUT std_logic;
        TARGEXP0HSIZE : OUT std_logic_vector(2 downto 0);
        TARGEXP0HBURST : OUT std_logic_vector(2 downto 0);
        TARGEXP0HPROT : OUT std_logic_vector(3 downto 0);
        TARGEXP0MEMATTR : OUT std_logic_vector(1 downto 0);
        TARGEXP0EXREQ : OUT std_logic;
        TARGEXP0HMASTER : OUT std_logic_vector(3 downto 0);
        TARGEXP0HWDATA : OUT std_logic_vector(31 downto 0);
        TARGEXP0HMASTLOCK : OUT std_logic;
        TARGEXP0HREADYMUX : OUT std_logic;
        TARGEXP0HAUSER : OUT std_logic;
        TARGEXP0HWUSER : OUT std_logic_vector(3 downto 0);
        TARGEXP0HRDATA : IN std_logic_vector(31 downto 0);
        TARGEXP0HREADYOUT : IN std_logic;
        TARGEXP0HRESP : IN std_logic;
        TARGEXP0EXRESP : IN std_logic;
        TARGEXP0HRUSER : IN std_logic_vector(2 downto 0);

        INITEXP0HRDATA : OUT std_logic_vector(31 downto 0);
        INITEXP0HREADY : OUT std_logic;
        INITEXP0HRESP : OUT std_logic;
        INITEXP0EXRESP : OUT std_logic;
        INITEXP0HRUSER : OUT std_logic_vector(2 downto 0);
        INITEXP0HSEL : IN std_logic;
        INITEXP0HADDR : IN std_logic_vector(31 downto 0);
        INITEXP0HTRANS : IN std_logic_vector(1 downto 0);
        INITEXP0HWRITE : IN std_logic;
        INITEXP0HSIZE : IN std_logic_vector(2 downto 0);
        INITEXP0HBURST : IN std_logic_vector(2 downto 0);
        INITEXP0HPROT : IN std_logic_vector(3 downto 0);
        INITEXP0MEMATTR : IN std_logic_vector(1 downto 0);
        INITEXP0EXREQ : IN std_logic;
        INITEXP0HMASTER : IN std_logic_vector(3 downto 0);
        INITEXP0HWDATA : IN std_logic_vector(31 downto 0);
        INITEXP0HMASTLOCK : IN std_logic;
        INITEXP0HAUSER : IN std_logic;
        INITEXP0HWUSER : IN std_logic_vector(3 downto 0);

        APBTARGEXP2PSTRB : OUT std_logic_vector(3 downto 0);
        APBTARGEXP2PPROT : OUT std_logic_vector(2 downto 0);
        APBTARGEXP2PSEL : OUT std_logic;
        APBTARGEXP2PENABLE : OUT std_logic;
        APBTARGEXP2PADDR : OUT std_logic_vector(11 downto 0);
        APBTARGEXP2PWRITE : OUT std_logic;
        APBTARGEXP2PWDATA : OUT std_logic_vector(31 downto 0);
        APBTARGEXP2PRDATA : IN std_logic_vector(31 downto 0);
        APBTARGEXP2PREADY : IN std_logic;
        APBTARGEXP2PSLVERR : IN std_logic;

        MTXREMAP : IN std_logic_vector(3 downto 0);

        DAPTDO : OUT std_logic;
        DAPJTAGNSW : OUT std_logic;
        DAPNTDOEN : OUT std_logic;
        DAPSWDITMS : IN std_logic;
        DAPTDI : IN std_logic;
        DAPNTRST : IN std_logic;
        DAPSWCLKTCK : IN std_logic;

        TPIUTRACEDATA : OUT std_logic_vector(3 downto 0);
        TPIUTRACECLK : OUT std_logic;
        GPINT : IN std_logic_vector(4 downto 0);
        FLASHERR : IN std_logic;
        FLASHINT : IN std_logic
     );
end COMPONENT;
	attribute syn_black_box of EMCU : Component is true;

------------------------------FLASH64K---------------------------------------
COMPONENT FLASH64K
    PORT(
        XADR : IN std_logic_vector(4 downto 0);
        YADR : IN std_logic_vector(5 downto 0);
        XE,YE,SE:IN std_logic;
        DIN : IN std_logic_vector(31 downto 0);
        ERASE,PROG,NVSTR: IN std_logic;
        SLEEP : IN std_logic;
        DOUT : OUT std_logic_vector(31 downto 0)
     );
end COMPONENT;
	attribute syn_black_box of FLASH64K : Component is true;

------------------------------FLASH64KZ---------------------------------------
COMPONENT FLASH64KZ
    PORT(
        XADR : IN std_logic_vector(4 downto 0);
        YADR : IN std_logic_vector(5 downto 0);
        XE,YE,SE:IN std_logic;
        DIN : IN std_logic_vector(31 downto 0);
        ERASE,PROG,NVSTR: IN std_logic;
        DOUT : OUT std_logic_vector(31 downto 0)
     );
end COMPONENT;
	attribute syn_black_box of FLASH64KZ : Component is true;

------------------------------I3C---------------------------------------
COMPONENT I3C 
    GENERIC (
		ADDRESS : bit_vector := "0000000"
    );	
    PORT (
	    LGYS, CMS, ACS, AAS, STOPS, STRTS : in std_logic;
		LGYO, CMO, ACO, AAO, SIO, STOPO, STRTO : out std_logic;
		LGYC, CMC, ACC, AAC, SIC, STOPC, STRTC : in std_logic;
		STRTHDS, SENDAHS, SENDALS, ACKHS : in std_logic;
		ACKLS, STOPSUS, STOPHDS, SENDDHS : in std_logic;
		SENDDLS, RECVDHS, RECVDLS, ADDRS : in std_logic;
		PARITYERROR : out std_logic;
		DI : in std_logic_vector(7 downto 0);
		DOBUF : out std_logic_vector(7 downto 0);
		DO : out std_logic_vector(7 downto 0);
		STATE : out std_logic_vector(7 downto 0);
		SDAI, SCLI : in std_logic;
		SDAO, SCLO : out std_logic;
		SDAOEN, SCLOEN : out std_logic;
		SDAPULLO, SCLPULLO : out std_logic;
		SDAPULLOEN, SCLPULLOEN : out std_logic;
		CE, RESET, CLK : in std_logic
    );	
end COMPONENT;
	attribute syn_black_box of I3C : Component is true;

--------------------IODELAYA-----------------------------------
COMPONENT IODELAYA
	GENERIC (  
        C_STATIC_DLY : integer := 0 -- 0~127
    ); 
    PORT (
		DI : IN std_logic;
		SDTAP : IN std_logic;
		SETN : IN std_logic;
		VALUE : IN std_logic;
		DO : OUT std_logic;
		DF : OUT std_logic
	);
end COMPONENT;
	attribute syn_black_box of IODELAYA : Component is true;

--------------------IODELAYC-----------------------------------
COMPONENT IODELAYC
	GENERIC (  
        C_STATIC_DLY : integer := 0;-- 0~127
        DYN_DA_SEL : STRING := "false";--false:DA_SEL; true:DASEL
        DA_SEL : bit_vector := "00"
    ); 
    PORT (
		DI : IN std_logic;
		SDTAP : IN std_logic;
		SETN : IN std_logic;
		VALUE : IN std_logic;
        DASEL : IN std_logic_vector(1 downto 0);
        DAADJ : IN std_logic_vector(1 downto 0);
		DO : OUT std_logic;
        DAO : OUT std_logic;
		DF : OUT std_logic
	);
end COMPONENT;
	attribute syn_black_box of IODELAYC : Component is true;


--------------------------------PLLVR--------------------------
COMPONENT PLLVR
    GENERIC(
         FCLKIN : STRING := "100.0"; --frequency of the clkin(M)
         DEVICE : STRING := "GW1NS-4"; --"GW1NS-4","GW1NS-4C","GW1NSR-4","GW1NSER-4C","GW1NSR-4C"
         DYN_IDIV_SEL : STRING := "false";--true:IDSEL; false:IDIV_SEL
         IDIV_SEL : integer := 0;--Input divider IDIV, 0:1,1:2...63:64.  1~64
         DYN_FBDIV_SEL : STRING := "false";
         FBDIV_SEL : integer := 0;--Feedback divider FBDIV,  0:1,1:2...63:64. 1~64
         DYN_ODIV_SEL : STRING := "false";--true:ODSEL; false:ODIV_SEL
         ODIV_SEL : integer := 8;--2/4/8/16/32/48/64/80/96/112/128
         PSDA_SEL : STRING := "0000";--
         DYN_DA_EN : STRING := "false";--true:PSDA or DUTYDA or FDA; false: DA_SEL
         DUTYDA_SEL : STRING := "1000";--
         CLKOUT_FT_DIR : bit := '1'; -- CLKOUT fine tuning direction. '1' only
         CLKOUTP_FT_DIR : bit := '1'; -- '1' only
         CLKOUT_DLY_STEP : integer := 0; -- 0,1,2,4
         CLKOUTP_DLY_STEP : integer := 0; -- 0,1,2

         CLKOUTD3_SRC : STRING := "CLKOUT";--select div3 output, CLKOUTP or CLKOUT
         CLKFB_SEL : STRING := "internal"; --"internal", "external"
         CLKOUT_BYPASS : STRING := "false";
         CLKOUTP_BYPASS : STRING := "false";
         CLKOUTD_BYPASS : STRING := "false";
         CLKOUTD_SRC : STRING := "CLKOUT";--select div output,  CLKOUTP or CLKOUT
         DYN_SDIV_SEL : integer := 2 -- 2~128,only even num
	);
    PORT(
         CLKIN : IN std_logic;
         CLKFB : IN std_logic:='0';
         IDSEL : In std_logic_vector(5 downto 0);
         FBDSEL : In std_logic_vector(5 downto 0);
         ODSEL : In std_logic_vector(5 downto 0);
         RESET : in std_logic:='0';
         RESET_P : in std_logic:='0';
         PSDA,FDLY : In std_logic_vector(3 downto 0);
         DUTYDA : In std_logic_vector(3 downto 0);
         VREN : in std_logic;
         LOCK : OUT std_logic;
         CLKOUT : OUT std_logic;
         CLKOUTD : out std_logic;
         CLKOUTP : out std_logic;
         CLKOUTD3 : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of PLLVR : Component is true;

------------------------------rPLL---------------------------------------
COMPONENT rPLL
    GENERIC(
         FCLKIN : STRING := "100.0"; --frequency of the clkin(M)
         DEVICE : STRING := "GW1N-4"; --"GW1N-1","GW1N-1S","GW1N-4","GW1N-4B","GW1N-4D","GW1N-9","GW1N-9C","GW1NR-1","GW1NR-4","GW1NR-4B","GW1NR-4D","GW1NR-9","GW1NR-9C","GW1NS-2","GW1NS-2C","GW1NZ-1","GW1NZ-1C","GW1NSR-2","GW1NSR-2C","GW1NSE-2C","GW1NRF-4B"
         DYN_IDIV_SEL : STRING := "false";--true:IDSEL; false:IDIV_SEL
         IDIV_SEL : integer := 0;--Input divider IDIV, 0:1,1:2...63:64.  1~64
         DYN_FBDIV_SEL : STRING := "false";
         FBDIV_SEL : integer := 0;--Feedback divider FBDIV,  0:1,1:2...63:64. 1~64
         DYN_ODIV_SEL : STRING := "false";--true:ODSEL; false:ODIV_SEL
         ODIV_SEL : integer := 8;--2/4/8/16/32/48/64/80/96/112/128
         PSDA_SEL : STRING := "0000";--
         DYN_DA_EN : STRING := "false";--true:PSDA or DUTYDA or FDA; false: DA_SEL
         DUTYDA_SEL : STRING := "1000";--
         CLKOUT_FT_DIR : bit := '1'; -- CLKOUT fine tuning direction. '1' only
         CLKOUTP_FT_DIR : bit := '1'; -- '1' only
         CLKOUT_DLY_STEP : integer := 0; -- 0,1,2,4
         CLKOUTP_DLY_STEP : integer := 0; -- 0,1,2

         CLKOUTD3_SRC : STRING := "CLKOUT";--select div3 output, CLKOUTP or CLKOUT
         CLKFB_SEL : STRING := "internal"; --"internal", "external"
         CLKOUT_BYPASS : STRING := "false";
         CLKOUTP_BYPASS : STRING := "false";
         CLKOUTD_BYPASS : STRING := "false";
         CLKOUTD_SRC : STRING := "CLKOUT";--select div output,  CLKOUTP or CLKOUT
         DYN_SDIV_SEL : integer := 2 -- 2~128,only even num
	);
    PORT(
         CLKIN : IN std_logic;
         CLKFB : IN std_logic:='0';
         IDSEL : In std_logic_vector(5 downto 0);
         FBDSEL : In std_logic_vector(5 downto 0);
         ODSEL : In std_logic_vector(5 downto 0);
         RESET : in std_logic:='0';
         RESET_P : in std_logic:='0';
         PSDA,FDLY : In std_logic_vector(3 downto 0);
         DUTYDA : In std_logic_vector(3 downto 0);
         LOCK : OUT std_logic;
         CLKOUT : OUT std_logic;
         CLKOUTD : out std_logic;
         CLKOUTP : out std_logic;
         CLKOUTD3 : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of rPLL : Component is true;



------------------------------SPMI---------------------------------------
COMPONENT SPMI
    GENERIC(
        FUNCTION_CTRL : bit_vector := B"0000000"; 
        MSID_CLKSEL : bit_vector := B"0000000"; 
        RESPOND_DELAY : bit_vector := B"0000"; 
        SCLK_NORMAL_PERIOD : bit_vector := B"0000000"; 
        SCLK_LOW_PERIOD : bit_vector := B"0000000"; 
        CLK_FREQ : bit_vector := B"0000000"; 
        SHUTDOWN_BY_ENABLE : bit := '0' 
    );
    PORT(
        ADDRO : OUT std_logic_vector(3 downto 0);
        DATAO : OUT std_logic_vector(7 downto 0);
        STATE : OUT std_logic_vector(15 downto 0);
        CMD : OUT std_logic_vector(3 downto 0);
        
        CLKEXT, ENEXT : IN std_logic;
        SDATA : INOUT std_logic;
        SCLK : INOUT std_logic;

        CLK, CE, RESETN, LOCRESET : IN std_logic;
        PA, SA, CA : IN std_logic;
        ADDRI : IN std_logic_vector(3 downto 0);
        DATAI : IN std_logic_vector(7 downto 0)
     );
end COMPONENT;
	attribute syn_black_box of SPMI : Component is true;
    attribute black_box_pad_pin of SPMI : Component is "CLKEXT, ENEXT, SDATA, SCLK";


------------------------MIPI_OBUF_A---------------------------------------
COMPONENT MIPI_OBUF_A is
    PORT (
         O : OUT std_logic;
         OB : OUT std_logic;
         I : IN std_logic;
         IB : IN std_logic;
         IL : IN std_logic;
         MODESEL : IN std_logic
    );
end COMPONENT;
	attribute syn_black_box of MIPI_OBUF_A : Component is true;
    attribute black_box_pad_pin of MIPI_OBUF_A : Component is "O, OB";

--------------------IODELAYB-----------------------------------
COMPONENT IODELAYB is
    GENERIC (  
        C_STATIC_DLY : integer := 0;-- 0~127
        DELAY_MUX : bit_vector := "00"; --00:dmux_o=DI; 01:#100ps dmux_o=DI;10:dmux_o=dlyout_mid;11:dmux_o=DO
        DA_SEL : bit_vector := "00" --DELAY_MUX:2/3->DA_SEL:0/1; DELAY_MUX:0/1->DA_SEL:0/2/3.

    );
	PORT (
		DI : IN std_logic;
		SDTAP : IN std_logic;
		SETN : IN std_logic;
		VALUE : IN std_logic;
        DAADJ : IN std_logic_vector(1 downto 0);
		DO : OUT std_logic;
        DAO : OUT std_logic;
		DF : OUT std_logic
	);
end COMPONENT;
	attribute syn_black_box of IODELAYB : Component is true;

------------------------------PLLO---------------------------------------
COMPONENT PLLO is
    GENERIC(
        FCLKIN : STRING := "100.0"; --frequency of the clkin(M)
        DYN_IDIV_SEL : STRING := "FALSE"; --TRUE:IDSEL; FALSE:IDIV_SEL
        IDIV_SEL : integer := 0; --Input divider IDIV, 0:1,1:2...63:64.  1~64
        DYN_FBDIV_SEL : STRING := "FALSE";
        FBDIV_SEL : integer := 0; --Feedback divider FBDIV,  0:1,1:2...63:64. 1~64
        
        DYN_ODIVA_SEL : STRING := "FALSE"; --TRUE:ODSELA, FALSE:ODIVA_SEL
        ODIVA_SEL : integer := 6; --1~128,integer
        DYN_ODIVB_SEL : STRING := "FALSE"; --TRUE:ODSELB, FALSE:ODIVB_SEL
        ODIVB_SEL : integer := 6; --1~128,integer
        DYN_ODIVC_SEL : STRING := "FALSE"; --TRUE:ODSELC, FALSE:ODIVC_SEL
        ODIVC_SEL : integer := 6; --1~128,integer
        DYN_ODIVD_SEL : STRING := "FALSE"; --TRUE:ODSELD, FALSE:ODIVD_SEL
        ODIVD_SEL : integer := 6; --1~128,integer
      
        CLKOUTA_EN : STRING := "TRUE"; --"TRUE","FALSE"
        CLKOUTB_EN : STRING := "TRUE"; --"TRUE","FALSE"
        CLKOUTC_EN : STRING := "TRUE"; --"TRUE","FALSE"
        CLKOUTD_EN : STRING := "TRUE"; --"TRUE","FALSE"
        
        DYN_DTA_SEL : STRING := "FALSE"; --TRUE:DTA; FALSE:CLKOUTA_DT_DIR & CLKOUTA_DT_STEP
        DYN_DTB_SEL : STRING := "FALSE"; --TRUE:DTB; FALSE:CLKOUTB_DT_DIR & CLKOUTB_DT_STEP
        CLKOUTA_DT_DIR : bit := '1'; -- CLKOUTA dutycycle adjust direction. '1': + ; '0': -
        CLKOUTB_DT_DIR : bit := '1'; -- CLKOUTB dutycycle adjust direction. '1': + ; '0': -
        CLKOUTA_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step
        CLKOUTB_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step

        CLKA_IN_SEL  : bit_vector := "00"; --DIVA input source select. 0x:from VCO;11:from CLKIN
        CLKA_OUT_SEL : bit := '0'; --CLKOUTA output select. 0:DIVA output; 1:CLKIN
        CLKB_IN_SEL  : bit_vector := "00"; --DIVB input source select. 0x:from VCO;10:from CLKCAS_A;11:from CLKIN
        CLKB_OUT_SEL : bit := '0'; --CLKOUTB output select. 0:DIVB output; 1:CLKIN
        CLKC_IN_SEL  : bit_vector := "00"; --DIVC input source select. 0x:from VCO;10:from CLKCAS_B;11:from CLKIN
        CLKC_OUT_SEL : bit := '0'; --CLKOUTC output select. 0:DIVC output; 1:CLKIN
        CLKD_IN_SEL  : bit_vector := "00"; --DIVD input source select. 0x:from VCO;10:from CLKCAS_C;11:from CLKIN
        CLKD_OUT_SEL : bit := '0'; --CLKOUTD output select. 0:DIVD output; 1:CLKIN

        CLKFB_SEL : STRING := "INTERNAL"; -- "INTERNAL", "EXTERNAL";

        DYN_DPA_EN : STRING := "FALSE"; --dynamic phaseshift adjustment Enable."TRUE","FALSE"

        DYN_PSB_SEL : STRING := "FALSE"; --"TRUE": select dynamic dpa signal for phase shift B(DYN_DPA_EN="TRUE"); "FALSE":select PSB_COARSE & PSB_FINE as the static control signal for phase shift B
        DYN_PSC_SEL : STRING := "FALSE"; --"TRUE": select dynamic dpa signal for phase shift C(DYN_DPA_EN="TRUE"); "FALSE":select PSC_COARSE & PSC_FINE as the static control signal for phase shift C
        DYN_PSD_SEL : STRING := "FALSE"; --"TRUE": select dynamic dpa signal for phase shift D(DYN_DPA_EN="TRUE"); "FALSE":select PSD_COARSE & PSD_FINE as the static control signal for phase shift D

        PSB_COARSE : integer := 0; --0~127       
        PSB_FINE : integer := 0; --0~7
        PSC_COARSE : integer := 0; --0~127        
        PSC_FINE : integer := 0; --0~7
        PSD_COARSE : integer := 0; --0~127        
        PSD_FINE : integer := 0; --0~7

        DTMS_ENB : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odivb=2~128; "TRUE":set PSB_COARSE & PSB_FINE as duty edge when DYN_DPA_EN="TRUE" for case odivb=2~128
        DTMS_ENC : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odivc=2~128; "TRUE":set PSC_COARSE & PSC_FINE as duty edge when DYN_DPA_EN="TRUE" for case odivc=2~128
        DTMS_END : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odivd=2~128; "TRUE":set PSD_COARSE & PSD_FINE as duty edge when DYN_DPA_EN="TRUE" for case odivd=2~128

        RESET_I_EN : STRING := "FALSE"; --"TRUE","FALSE". Enable RESET_I through the dedicated signal from ciu.
        RESET_S_EN : STRING := "FALSE"; --"TRUE","FALSE". Enable RESET_S through the dedicated signal from ciu.

        DYN_ICP_SEL : STRING := "FALSE"; --TRUE:ICPSEL; FALSE:ICP_SEL
        ICP_SEL : std_logic_vector(4 downto 0) := "XXXXX";
        DYN_RES_SEL : STRING := "FALSE"; --TRUE:LPFRES; FALSE:LPR_REF
        LPR_REF : std_logic_vector(6 downto 0) := "XXXXXXX"
	);
    PORT(
        CLKIN : IN std_logic;
        CLKFB : IN std_logic:='0';
        RESET,RESET_P : IN std_logic:='0';
        RESET_I,RESET_S : IN std_logic:='0';
        IDSEL,FBDSEL : IN std_logic_vector(5 downto 0);
        ODSELA, ODSELB, ODSELC, ODSELD : IN std_logic_vector(6 downto 0);
        DTA, DTB : IN std_logic_vector(3 downto 0);
        ICPSEL : IN std_logic_vector(4 downto 0);
        LPFRES : IN std_logic_vector(2 downto 0);
        PSSEL : IN std_logic_vector(1 downto 0);
        PSDIR,PSPULSE : IN std_logic;
        ENCLKA,ENCLKB,ENCLKC,ENCLKD : IN std_logic;
        LOCK : OUT std_logic;
        CLKOUTA : OUT std_logic;
        CLKOUTB : OUT std_logic;
        CLKOUTC : OUT std_logic;
        CLKOUTD : OUT std_logic
    );
end COMPONENT;
	attribute syn_black_box of PLLO : Component is true;

---------------------OSCO------------------------
COMPONENT OSCO is
    GENERIC (
        FREQ_DIV : integer := 100;  --2~128,only even num
        REGULATOR_EN : bit := '0'--'0':Powered by VCC!; ’1': Powered by regulator（only UV/LV）
    );
    PORT (
        OSCOUT: OUT STD_LOGIC;
        OSCEN : IN STD_LOGIC
    );
end COMPONENT;
	attribute syn_black_box of OSCO : Component is true;

---------------------DCCG------------------------
COMPONENT DCCG is
    GENERIC (
        DCC_MODE : bit_vector := "00";  --"0x": Buffered; "10": +80ps; "11": -80ps;
        FCLKIN : REAL := 50.0 --frequency of the clkin(M)
    );
    PORT (
        CLKOUT: OUT STD_LOGIC;
        CLKIN : IN STD_LOGIC
    );
end COMPONENT;
	attribute syn_black_box of DCCG : Component is true;

---------------------FLASH256KA------------------------
COMPONENT FLASH256KA is
    PORT(
        XADR : IN std_logic_vector(6 downto 0);
        YADR : IN std_logic_vector(5 downto 0);
        XE,YE,SE:IN std_logic;
        DIN : IN std_logic_vector(31 downto 0);
        ERASE,PROG,NVSTR: IN std_logic;
        SLEEP : IN std_logic;
        DOUT : OUT std_logic_vector(31 downto 0)
     );
end COMPONENT;
	attribute syn_black_box of FLASH256KA : Component is true;

---------------------MIPI_DPHY_RX------------------------
COMPONENT MIPI_DPHY_RX is
    GENERIC(
        ALIGN_BYTE : bit_vector := "10111000";
        MIPI_LANE0_EN  : bit := '0';
        MIPI_LANE1_EN  : bit := '0';
        MIPI_LANE2_EN  : bit := '0';
        MIPI_LANE3_EN  : bit := '0';
        MIPI_CK_EN  : bit := '1';
        SYNC_CLK_SEL : bit := '1'
    );
    PORT(
        D0LN_HSRXD, D1LN_HSRXD, D2LN_HSRXD, D3LN_HSRXD : OUT std_logic_vector(15 downto 0);
        D0LN_HSRXD_VLD,D1LN_HSRXD_VLD,D2LN_HSRXD_VLD,D3LN_HSRXD_VLD : OUT std_logic;
        DI_LPRX0_N, DI_LPRX0_P, DI_LPRX1_N, DI_LPRX1_P, DI_LPRX2_N, DI_LPRX2_P, DI_LPRX3_N, DI_LPRX3_P : OUT std_logic;
        DI_LPRXCK_N, DI_LPRXCK_P : OUT std_logic;
        RX_CLK_O : OUT std_logic;
        DESKEW_ERROR : OUT std_logic;
        CK_N, CK_P, RX0_N, RX0_P, RX1_N, RX1_P, RX2_N, RX2_P, RX3_N, RX3_P : INOUT std_logic;
        LPRX_EN_CK, LPRX_EN_D0, LPRX_EN_D1, LPRX_EN_D2, LPRX_EN_D3 : IN std_logic;
        HSRX_ODTEN_CK, HSRX_ODTEN_D0,  HSRX_ODTEN_D1, HSRX_ODTEN_D2, HSRX_ODTEN_D3 : IN std_logic;
        D0LN_HSRX_DREN,  D1LN_HSRX_DREN, D2LN_HSRX_DREN, D3LN_HSRX_DREN : IN std_logic;
        HSRX_EN_CK : IN std_logic;
        DESKEW_REQ : IN std_logic;
        HS_8BIT_MODE : IN std_logic;
        RX_CLK_1X : IN std_logic;
        RX_INVERT : IN std_logic;
        LALIGN_EN : IN std_logic;
        WALIGN_BY : IN std_logic;
        DO_LPTX0_N, DO_LPTX0_P, DO_LPTX1_N, DO_LPTX1_P, DO_LPTX2_N, DO_LPTX2_P, DO_LPTX3_N, DO_LPTX3_P : IN std_logic;
        DO_LPTXCK_N, DO_LPTXCK_P : IN std_logic;
        LPTX_EN_CK, LPTX_EN_D0, LPTX_EN_D1, LPTX_EN_D2, LPTX_EN_D3 : IN std_logic;
        BYTE_LENDIAN : IN std_logic;
        HSRX_STOP : IN std_logic;
        LPRX_ULP_LN0, LPRX_ULP_LN1, LPRX_ULP_LN2, LPRX_ULP_LN3, LPRX_ULP_CK : IN std_logic;
        PWRON,RESET : IN std_logic;
        DESKEW_LNSEL : IN std_logic_vector(2 downto 0);
        DESKEW_MTH : IN std_logic_vector(7 downto 0);
        DESKEW_OWVAL : IN std_logic_vector(6 downto 0);
        DRST_N : IN std_logic;
        FIFO_RD_STD : IN std_logic_vector(2 downto 0);
        ONE_BYTE0_MATCH : IN std_logic; 
        WORD_LENDIAN : IN std_logic        
    );
end COMPONENT;
	attribute syn_black_box of MIPI_DPHY_RX : Component is true;
    attribute black_box_pad_pin of MIPI_DPHY_RX : Component is "CK_N, CK_P, RX0_N, RX0_P, RX1_N, RX1_P, RX2_N, RX2_P, RX3_N, RX3_P";

--------------------------------CLKDIVG--------------------------
COMPONENT CLKDIVG
    GENERIC(
	     DIV_MODE : STRING := "2"; -- "2", "3.5", "4", "5", "8"
	     GSREN : STRING := "false" -- "false", "true"
	    );
    PORT(
         CLKIN : IN std_logic;
	     RESETN : IN std_logic;
	     CALIB : In std_logic;
	     CLKOUT : OUT std_logic
        );
end COMPONENT;
	attribute syn_black_box of CLKDIVG : Component is true;




end components;    
    
