
-- ===========Oooo==========================================Oooo========
-- =  Copyright (C) 2014-2021 Gowin Semiconductor Technology Co.,Ltd.
-- =                     All rights reserved.
-- =====================================================================
--
--  __      __      __
--  \ \    /  \    / /   [File name   ] prim_syn.vhd
--   \ \  / /\ \  / /    [Description ] GW2A hardcore VHDL functional synthesis library
--    \ \/ /  \ \/ /     [Timestamp   ] Fri January 22 11:00:30 2020
--     \  /    \  /      [version     ] 1.2
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

------------------------------rPLL---------------------------------------
COMPONENT rPLL
    GENERIC(
         FCLKIN : STRING := "100.0"; --frequency of the clkin(M)
         DEVICE : STRING := "GW2A-18"; --"GW2A-18","GW2A-55","GW2AR-18","GW2A-55C","GW2A-18C","GW2AR-18C","GW2ANR-18C","GW2AN-55C"
         DYN_IDIV_SEL : STRING := "false"; --true:IDSEL; false:IDIV_SEL
         IDIV_SEL : integer := 0; --Input divider IDIV, 0:1,1:2...63:64.  1~64
         DYN_FBDIV_SEL : STRING := "false";
         FBDIV_SEL : integer := 0; --Feedback divider FBDIV,  0:1,1:2...63:64. 1~64
         DYN_ODIV_SEL : STRING := "false"; --true:ODSEL; false:ODIV_SEL
         ODIV_SEL : integer := 8; --2/4/8/16/32/48/64/80/96/112/128
         PSDA_SEL : STRING := "0000"; --
         DYN_DA_EN : STRING := "false"; --true:PSDA or DUTYDA or FDA; false: DA_SEL
         DUTYDA_SEL : STRING := "1000"; --
         CLKOUT_FT_DIR : bit := '1'; -- CLKOUT fine tuning direction. '1' only
         CLKOUTP_FT_DIR : bit := '1'; -- '1' only
         CLKOUT_DLY_STEP : integer := 0; -- 0,1,2,4
         CLKOUTP_DLY_STEP : integer := 0; -- 0,1,2

         CLKOUTD3_SRC : STRING := "CLKOUT"; --select div3 output, CLKOUTP or CLKOUT
         CLKFB_SEL : STRING := "internal"; --"internal", "external"
         CLKOUT_BYPASS : STRING := "false";
         CLKOUTP_BYPASS : STRING := "false";
         CLKOUTD_BYPASS : STRING := "false";
         CLKOUTD_SRC : STRING := "CLKOUT"; --select div output,  CLKOUTP or CLKOUT
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

----------------------IBUF_R-------------------------------------
COMPONENT IBUF_R
    PORT (
    	 O : OUT std_logic;
    	 I : IN std_logic;
         RTEN : IN std_logic
    );
end COMPONENT;
	attribute syn_black_box of IBUF_R : Component is true;
    attribute black_box_pad_pin of IBUF_R : Component is "I";

-----------------ELVDS_IBUF_R---------------------------------
COMPONENT ELVDS_IBUF_R
    PORT(
        O : OUT std_logic;
        I : IN std_logic;
        IB : IN std_logic;
        RTEN : IN std_logic
        );
end COMPONENT;
    attribute syn_black_box of ELVDS_IBUF_R : Component is true;
    attribute black_box_pad_pin of ELVDS_IBUF_R : Component is "I, IB";

----------------------------IOBUF_R--------------------------------
COMPONENT IOBUF_R
    PORT (
    	O  : OUT   std_logic;
    	IO : INOUT std_logic;
     	I  : IN    std_logic;
        RTEN : IN std_logic;
	    OEN : IN    std_logic
    );
end COMPONENT;
	attribute syn_black_box of IOBUF_R : Component is true;
    attribute black_box_pad_pin of IOBUF_R : Component is "IO";

-----------------ELVDS_IOBUF_R---------------------------------
COMPONENT ELVDS_IOBUF_R
    PORT (
    	 O  : OUT   std_logic;
    	 IOB : INOUT std_logic;
         IO : INOUT std_logic;
     	 I  : IN    std_logic;
         RTEN : IN std_logic;
	     OEN : IN    std_logic
    );
end COMPONENT;
    attribute syn_black_box of ELVDS_IOBUF_R : Component is true;
    attribute black_box_pad_pin of ELVDS_IOBUF_R : Component is "IO, IOB";

------------------OSCW----------------------------
COMPONENT OSCW 
    GENERIC (
        FREQ_DIV : integer := 80 --2~128,only even num
    );
    PORT (
	    OSCOUT : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of OSCW : Component is true;

------------------OTP----------------------------
COMPONENT OTP
    PORT (
    	 DOUT : OUT std_logic;
    	 CSB : IN std_logic;
    	 SCLK : IN std_logic
    );
end COMPONENT;
    attribute syn_black_box of OTP : Component is true;

------------------SAMB----------------------------
COMPONENT SAMB
    PORT (
    	 SPIAD : IN std_logic_vector(23 downto 0);
    	 LOADN_SPIAD : IN std_logic
    );
end COMPONENT;
    attribute syn_black_box of SAMB : Component is true;
    attribute syn_noprune : boolean;
    attribute syn_noprune of SAMB : component is true;

------------------------------CLKDIVG---------------------------------------
COMPONENT CLKDIVG
    GENERIC(
	     DIV_MODE : STRING := "2"; -- "2", "3.5", "4", "5"
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

------------------------MIPI_IBUF------------------------------------
COMPONENT MIPI_IBUF
    PORT (
         OH, OL, OB : OUT std_logic;
         IO, IOB : INOUT std_logic;
         I, IB : IN std_logic;
         OEN, OENB, HSREN : IN std_logic
    );
end COMPONENT;
    attribute syn_black_box of MIPI_IBUF : Component is true;
    attribute black_box_pad_pin of MIPI_IBUF : Component is "IO, IOB";

----------------------------I3C_IOBUF--------------------------------

COMPONENT I3C_IOBUF 
    PORT (
    	O  : OUT   std_logic;
    	IO : INOUT std_logic;
     	I  : IN    std_logic;
	    MODESEL : IN    std_logic
    );
end COMPONENT;
	attribute syn_black_box of I3C_IOBUF : Component is true;
    attribute black_box_pad_pin of I3C_IOBUF : Component is "IO";




end components;    
