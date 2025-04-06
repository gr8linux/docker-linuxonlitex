
-- ===========Oooo==========================================Oooo========
-- =  Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
-- =                     All rights reserved.
-- =====================================================================
--
--  __      __      __
--  \ \    /  \    / /   [File name   ] prim_syn.vhd
--   \ \  / /\ \  / /    [Description ] GW5AT hardcore VHDL functional synthesis library
--    \ \/ /  \ \/ /     [Timestamp   ] Tue April 14 11:00:30 2020
--     \  /    \  /      [version     ] 1.0
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
------------------------------GSR---------------------------------------

COMPONENT GSR 
    PORT (
        GSRI : in std_logic
    );
end COMPONENT;

	attribute syn_black_box of GSR : Component is true;
    attribute syn_noprune of GSR : Component is true;


---------------------------------IDDR--------------------------
COMPONENT IDDR 
    GENERIC (
	    Q0_INIT : bit := '0';
	    Q1_INIT : bit := '0'
    );	
    PORT (
	    Q0 : OUT std_logic;
	    Q1 : OUT std_logic;	
	    D : IN std_logic;
	    CLK: IN std_logic
    );	
end COMPONENT;
	attribute syn_black_box of IDDR : Component is true;

---------------------------------IDDRC---------------------------
COMPONENT IDDRC 
    GENERIC ( 
	    Q0_INIT : bit := '0';
	    Q1_INIT : bit := '0'
    );	
    PORT (
	    Q0 : OUT std_logic;
	    Q1 : OUT std_logic;	
	    D : IN std_logic;
	    CLEAR: IN std_logic;	
	    CLK: IN std_logic
    );	
end COMPONENT;
	attribute syn_black_box of IDDRC : Component is true;

----------------------------IDDR_MEM------------------------------------
COMPONENT IDDR_MEM 
	GENERIC (
		GSREN : string := "false";
		LSREN  : string := "true"
	);
	PORT (
		Q0 : out std_logic;	
		Q1 : out std_logic;	
		D : in std_logic;
		ICLK : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		WADDR : in std_logic_vector(2 downto 0);
	   	RADDR : in std_logic_vector(2 downto 0)
	);
end COMPONENT;
	attribute syn_black_box of IDDR_MEM : Component is true;

-------------------------------ODDR----------------------
COMPONENT ODDR 
    GENERIC ( 
        TXCLK_POL : bit := '0'; --'0':Rising edge output; '1':Falling edge output        
        CONSTANT INIT : std_logic := '0' 
    );	
    PORT ( 
	    Q0 : OUT std_logic;	
	    Q1 : OUT std_logic;	
	    D0 : IN std_logic;
	    D1 : IN std_logic;
	    TX : IN std_logic;
	    CLK : IN std_logic
    );	
end COMPONENT;
	attribute syn_black_box of ODDR : Component is true;

-------------------------------ODDRC----------------------
COMPONENT ODDRC 
    GENERIC ( 
        TXCLK_POL : bit := '0'; --'0':Rising edge output; '1':Falling edge output
        CONSTANT INIT : std_logic := '0'
    );
    PORT (
	    Q0 : OUT std_logic;
	    Q1 : OUT std_logic;
	    D0 : IN std_logic;
	    D1 : IN std_logic;
	    TX : IN std_logic;
	    CLK : IN std_logic;
	    CLEAR : IN std_logic
    );	
end COMPONENT;
	attribute syn_black_box of ODDRC : Component is true;

----------------------------ODDR_MEM------------------------------------
COMPONENT ODDR_MEM 
    GENERIC(
		GSREN : string := "false";
		LSREN  : string := "true";
        TXCLK_POL : bit := '0'; --'0':Rising edge output; '1':Falling edge output
        TCLK_SOURCE : string := "DQSW"
    );
    PORT (
		 Q0 : out std_logic;	
		 Q1 : out std_logic;	
		 TCLK : in std_logic;
		 PCLK : in std_logic;
		 RESET : in std_logic;
		 D0 : in std_logic;
		 D1 : in std_logic;
		 TX : in std_logic
    );
end COMPONENT;
	attribute syn_black_box of ODDR_MEM : Component is true;

-----------------------------------------IDES4-------------------------------
COMPONENT IDES4 
	GENERIC (
		GSREN : string := "false";
		LSREN  : string := "true"
	);
	PORT (
		D : IN std_logic;
		CALIB : IN std_logic;
		RESET : IN std_logic;
		FCLK : IN std_logic;
		PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic
	);
end COMPONENT;
	attribute syn_black_box of IDES4 : Component is true;

--------------------------IDES4_MEM----------------------------------
COMPONENT IDES4_MEM 
	generic(
		GSREN : string := "false";
		LSREN  : string := "true"
	);
	PORT(
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		ICLK,FCLK,PCLK : IN std_logic;
		WADDR : IN std_logic_vector(2 downto 0);
		RADDR : IN std_logic_vector(2 downto 0);
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic
	 );
end COMPONENT;
	attribute syn_black_box of IDES4_MEM : Component is true;

------------------------------------IVIDEO-------------------------------
COMPONENT IVIDEO 
    GENERIC (
		GSREN : string := "false";
		LSREN  : string := "true"
    );
    PORT (
		D : IN std_logic;
		RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK : IN std_logic;
		PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic
    );
end COMPONENT;
	attribute syn_black_box of IVIDEO : Component is true;

-----------------------------------IDES8-------------------------------------
COMPONENT IDES8 
    GENERIC (
	    GSREN : string := "false";
		LSREN  : string := "true"
    );
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic
    );
end COMPONENT;
	attribute syn_black_box of IDES8 : Component is true;

-------------------------IDES8_MEM----------------------------
COMPONENT IDES8_MEM 
    GENERIC (
	    GSREN : string := "false";
		LSREN  : string := "true"
    );
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,ICLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
		WADDR : in std_logic_vector(2 downto 0);
		RADDR : in std_logic_vector(2 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of IDES8_MEM : Component is true;

--------------------------------------IDES10----------------------------------
COMPONENT IDES10 
    GENERIC (
	    GSREN : string := "false";
		LSREN  : string := "true"
    );
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
		Q8 : OUT std_logic;
		Q9 : OUT std_logic
    );
end COMPONENT;
	attribute syn_black_box of IDES10 : Component is true;

-----------------------------------IDES16-------------------------------------
COMPONENT IDES16
    GENERIC (
	    GSREN : string := "false";
		LSREN : string := "true"
    );
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
        Q8 : OUT std_logic;
		Q9 : OUT std_logic;
		Q10 : OUT std_logic;
		Q11 : OUT std_logic;
		Q12 : OUT std_logic;
		Q13 : OUT std_logic;
		Q14 : OUT std_logic;
		Q15 : OUT std_logic
    );
end COMPONENT;
	attribute syn_black_box of IDES16 : Component is true;

-------------------------OSER4------------------------------
COMPONENT OSER4 
	GENERIC (
		GSREN : string := "false";
		LSREN : string := "true";
        HWL : string := "false"; --"true"; "false"
        TXCLK_POL : bit := '0' --'0':Rising edge output; '1':Falling edge output
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		TX0 : in std_logic;
		TX1 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic
	);
end COMPONENT;
	attribute syn_black_box of OSER4 : Component is true;

-----------------OSER4_MEM--------------------------------
COMPONENT OSER4_MEM 
	GENERIC (
		GSREN : string := "false";
		LSREN : string := "true";
		HWL : string := "false";
        TXCLK_POL : bit := '0';--'0':Rising edge output; '1':Falling edge output
        TCLK_SOURCE : string := "DQSW"    
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		TX0 : in std_logic;
		TX1 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		TCLK : in std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic
	);
end COMPONENT;
	attribute syn_black_box of OSER4_MEM : Component is true;

--------------------OVIDEO----------------------------------
COMPONENT OVIDEO 
	GENERIC(
		GSREN : string := "false";
		LSREN : string := "true"
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		D4 : in std_logic;
		D5 : in std_logic;
		D6 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		Q : OUT std_logic
	);
end COMPONENT;
	attribute syn_black_box of OVIDEO : Component is true;

--------------------OSER8-----------------------------------
COMPONENT OSER8 
    GENERIC (
    	GSREN : string := "false";
    	LSREN : string := "true";
        HWL : string := "false";
        TXCLK_POL : bit := '0' --'0':Rising edge output; '1':Falling edge output
    );
    PORT (
       	D0 : in std_logic;
       	D1 : in std_logic;
       	D2 : in std_logic;
       	D3 : in std_logic;
       	D4 : in std_logic;
      	D5 : in std_logic;
       	D6 : in std_logic;
       	D7 : in std_logic;
       	TX0 : in std_logic;
    	TX1 : in std_logic;
	    TX2 : in std_logic;
	    TX3 : in std_logic;
	    PCLK : in std_logic;
	    RESET : in std_logic;
	    FCLK : in std_logic;
       	Q0 : OUT std_logic;
       	Q1 : OUT std_logic
    );
end COMPONENT;
	attribute syn_black_box of OSER8 : Component is true;

-----------------OSER8_MEM--------------------------------
COMPONENT OSER8_MEM 
	GENERIC(
		GSREN : string := "false";
		LSREN : string := "true";
		HWL : string := "false";
        TXCLK_POL : bit := '0';
        TCLK_SOURCE : string := "DQSW"
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		D4 : in std_logic;
		D5 : in std_logic;
		D6 : in std_logic;
		D7 : in std_logic;
		TX0 : in std_logic;
		TX1 : in std_logic;
		TX2 : in std_logic;
		TX3 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		TCLK : in std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic
	);
end COMPONENT;
	attribute syn_black_box of OSER8_MEM : Component is true;

--------------------OSER10-----------------------------------
COMPONENT OSER10 
	GENERIC (
		GSREN : string := "false";
		LSREN : string := "true"
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		D4 : in std_logic;
		D5 : in std_logic;
		D6 : in std_logic;
		D7 : in std_logic;
		D8 : in std_logic;
		D9 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		Q : OUT std_logic
	);
end COMPONENT;
	attribute syn_black_box of OSER10 : Component is true;

--------------------OSER16-----------------------------------
COMPONENT OSER16 
	GENERIC (
		GSREN : string := "false";
		LSREN : string := "true"
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		D4 : in std_logic;
		D5 : in std_logic;
		D6 : in std_logic;
		D7 : in std_logic;
		D8 : in std_logic;
		D9 : in std_logic;
        D10 : in std_logic;
		D11 : in std_logic;
		D12 : in std_logic;
		D13 : in std_logic;
		D14 : in std_logic;
		D15 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		Q : OUT std_logic
	);
end COMPONENT;
	attribute syn_black_box of OSER16 : Component is true;

--------------------IODELAY-----------------------------------

COMPONENT IODELAY 
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
	attribute syn_black_box of IODELAY : Component is true;

--------------------IEM----------------------------------
COMPONENT IEM 
	GENERIC(
		WINSIZE : string := "SMALL";
		GSREN : string := "false";
		LSREN  : string := "true"
	);
	PORT (
		D : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		MCLK: in std_logic;
		LAG : out std_logic;
		LEAD : out std_logic
	);
end COMPONENT;
	attribute syn_black_box of IEM : Component is true;

--------------------------------CLKDIV--------------------------
COMPONENT CLKDIV
    GENERIC(
	     DIV_MODE : STRING := "2"; -- "2", "3.5", "4", "5", "8"
	     GSREN : STRING := "false" -- "false", "true"
	    );
    PORT(
         HCLKIN : IN std_logic;
	     RESETN : IN std_logic;
	     CALIB : In std_logic;
	     CLKOUT : OUT std_logic
        );
end COMPONENT;
	attribute syn_black_box of CLKDIV : Component is true;

--------------------------------DHCEN-------------------------------------
COMPONENT DHCEN
    PORT (
	 CLKOUT : OUT std_logic;	
	 CE : IN std_logic;	
	 CLKIN : IN std_logic
    );	
end COMPONENT;
	attribute syn_black_box of DHCEN : Component is true;    

-----------------DQS---------------------------------
COMPONENT DQS
    GENERIC(
	    FIFO_MODE_SEL : bit := '0';-- FIFO mode select: '0',DDR memory mode;'1': GDDR mode
		RD_PNTR : bit_vector := "000";--FIFO read pointer setting
		DQS_MODE : string := "X1"; -- "X1","X2_DDR2","X2_DDR3","X4","X2_DDR3_EXT"
        HWL : string := "false";--"true"; "false"
    	GSREN : string := "false" --false, true
	);
    PORT(
        DQSIN,PCLK,FCLK,RESET : in std_logic;
		READ : in std_logic_vector(3 downto 0);
		RCLKSEL : in std_logic_vector(2 downto 0);
		DLLSTEP,WSTEP : in std_logic_vector(7 downto 0);
		RLOADN, RMOVE, RDIR, HOLD : in std_logic;
        WLOADN, WMOVE, WDIR : in std_logic;
        DQSR90, DQSW0, DQSW270 : out std_logic;
		RPOINT, WPOINT : out std_logic_vector(2 downto 0);
		RVALID,RBURST, RFLAG, WFLAG : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of DQS : Component is true;

-----------------DLL---------------------------------
COMPONENT DLL
    GENERIC(
        DLL_FORCE : integer := 0;--1: force lock and code; 0: code/lock generated from DLL loop
        DIV_SEL : bit := '1';--0,normal lock mode; 1,fast lock mode
	    CODESCAL : STRING := "000";--001 010 011 100 101 110 111
        SCAL_EN : STRING := "true"--true,false
    );
    PORT(
        CLKIN:IN std_logic:='0';
        STOP: In std_logic:='0';
        RESET : In std_logic:='0';
        UPDNCNTL : In std_logic:='0';
        LOCK : OUT std_logic;
        STEP : OUT std_logic_vector(7 downto 0)
     );
end COMPONENT;
	attribute syn_black_box of DLL : Component is true;

------------------------------DLLDLY---------------------------------------
COMPONENT DLLDLY
    GENERIC(
        DLL_INSEL : bit := '0'; --'0':bypass mode, '1': use dll_delay cell
        DLY_SIGN : bit := '0'; -- '0':'+',  '1': '-'
        DLY_ADJ : integer := 0 --0~255, dly_sign=0 :dly_adj; dly_sign=1: -256+dly_adj
    );
    PORT(
        DLLSTEP : IN std_logic_vector(7 downto 0);
        CLKIN:IN std_logic;
        DIR,LOADN,MOVE: In std_logic;
        CLKOUT : OUT std_logic;
        FLAG : OUT std_logic
     );
end COMPONENT;
	attribute syn_black_box of DLLDLY : Component is true;

------------------OSCG----------------------------

COMPONENT OSCG 
    GENERIC (
        FREQ_DIV : integer := 100  --2~128,only even num
    );
    PORT (
	    OSCOUT : out std_logic;
        OSCEN : IN STD_LOGIC
    );
end COMPONENT;
	attribute syn_black_box of OSCG : Component is true;

    
--------------------------------DCS-------------------------------------
COMPONENT DCS
    GENERIC (
		DCS_MODE : string := "RISING"   --CLK0,CLK1,CLK2,CLK3,GND,VCC,RISING,FALLING,CLK0_GND,CLK0_VCC,CLK1_GND,CLK1_VCC,CLK2_GND,CLK2_VCC,CLK3_GND,CLK3_VCC
	);
	PORT (
		CLK0 : IN std_logic;
		CLK1 : IN std_logic;
		CLK2 : IN std_logic;
		CLK3 : IN std_logic;
		CLKSEL : IN std_logic_vector(3 downto 0);
		SELFORCE : IN std_logic;
		CLKOUT : OUT std_logic
	);
end COMPONENT;
	attribute syn_black_box of DCS : Component is true;    

--------------------------------DQCE-------------------------------------
COMPONENT DQCE
    PORT (
	 CLKOUT : OUT std_logic;	
	 CE : IN std_logic;	
	 CLKIN : IN std_logic
    );	
end COMPONENT;
	attribute syn_black_box of DQCE : Component is true;    
   
--------------------------------PLLG-------------------------------------
COMPONENT PLLG
    GENERIC(
        FCLKIN : STRING := "100.0"; --frequency of the clkin(M)
        DYN_IDIV_SEL : STRING := "FALSE";--TRUE:IDSEL; FALSE:IDIV_SEL
        IDIV_SEL : integer := 0;--Input divider IDIV, 0:1,1:2...63:64.  1~64
        DYN_FBDIV_SEL : STRING := "FALSE";
        FBDIV_SEL : integer := 0;--Feedback divider FBDIV,  0:1,1:2...63:64. 1~64
        DYN_FBODIV_SEL : STRING := "FALSE";--TRUE:FBODSEL, FBODSEL_FRAC; FALSE:FBODIV_SEL, FBODIV_FRAC_SEL
        FBODIV_SEL : integer := 8; --2~128,integer
        FBODIV_FRAC_SEL : integer := 0; --0~7,integer,step=1/8
        DYN_ODIV0_SEL : STRING := "FALSE";--TRUE:ODSEL0, ODSEL0_FRAC; FALSE:ODIV0_SEL, ODIV0_FRAC_SEL
        ODIV0_SEL : integer := 8;--2~128,integer
        ODIV0_FRAC_SEL : integer := 0;--0~7,integer,step=1/8
        DYN_ODIV1_SEL : STRING := "FALSE";--TRUE:ODSEL1; FALSE:ODIV1_SEL
        ODIV1_SEL : integer := 8;--2~128,integer
        DYN_ODIV2_SEL : STRING := "FALSE";--TRUE:ODSEL2; FALSE:ODIV2_SEL
        ODIV2_SEL : integer := 8;--2~128,integer
        DYN_ODIV3_SEL : STRING := "FALSE";--TRUE:ODSEL3; FALSE:ODIV3_SEL
        ODIV3_SEL : integer := 8;--2~128,integer
        DYN_ODIV4_SEL : STRING := "FALSE";--TRUE:ODSEL4; FALSE:ODIV4_SEL
        ODIV4_SEL : integer := 8;--2~128,integer
        DYN_ODIV5_SEL : STRING := "FALSE";--TRUE:ODSEL5; FALSE:ODIV5_SEL
        ODIV5_SEL : integer := 8;--2~128,integer
        
        DYN_FB_EN : STRING := "FALSE";--TRUE:PSFB; FALSE:PSFB_SEL
        PSFB_SEL : integer := 0;--0~127,integer        
        FPSFB_SEL : integer := 0;--0~7,integer,step=1/8
        DYN_PD0_EN : STRING := "FALSE";--TRUE:PS0, FPS0, DUTY0, FDUTY0; FALSE: PS0_SEL, FPS0_SEL, DUTY0_SEL, FDUTY0_SEL
        PS0_SEL : integer := 0;--0~127,integer
        FPS0_SEL : integer := 0;--0~7,integer,step=1/8
        DUTY0_SEL : integer := 4;--0~127,integer
        FDUTY0_SEL : integer := 0;--0~7,integer,step=1/8
        DYN_PD1_EN : STRING := "FALSE";--TRUE:PS1, FPS1, DUTY1, FDUTY1; FALSE: PS1_SEL, FPS1_SEL, DUTY1_SEL, FDUTY1_SEL
        PS1_SEL : integer := 0;--0~127,integer
        FPS1_SEL : integer := 0;--0~7,integer,step=1/8
        DUTY1_SEL : integer := 4;--0~127,integer
        FDUTY1_SEL : integer := 0;--0~7,integer,step=1/8
        DYN_PD2_EN : STRING := "FALSE";--TRUE:PS2, FPS2, DUTY2, FDUTY2; FALSE: PS2_SEL, FPS2_SEL, DUTY2_SEL, FDUTY2_SEL
        PS2_SEL : integer := 0;--0~127,integer
        FPS2_SEL : integer := 0;--0~7,integer,step=1/8
        DUTY2_SEL : integer := 4;--0~127,integer
        FDUTY2_SEL : integer := 0;--0~7,integer,step=1/8
        DYN_PD3_EN : STRING := "FALSE";--TRUE:PS3, FPS3, DUTY3, FDUTY3; FALSE: PS3_SEL, FPS3_SEL, DUTY3_SEL, FDUTY3_SEL
        PS3_SEL : integer := 0;--0~127,integer
        FPS3_SEL : integer := 0;--0~7,integer,step=1/8
        DUTY3_SEL : integer := 4;--0~127,integer
        FDUTY3_SEL : integer := 0;--0~7,integer,step=1/8
        DYN_PD4_EN : STRING := "FALSE";--TRUE:PS4, FPS4, DUTY4, FDUTY4; FALSE: PS4_SEL, FPS4_SEL, DUTY4_SEL, FDUTY4_SEL
        PS4_SEL : integer := 0;--0~127,integer
        FPS4_SEL : integer := 0;--0~7,integer,step=1/8
        DUTY4_SEL : integer := 4;--0~127,integer
        FDUTY4_SEL : integer := 0;--0~7,integer,step=1/8
        DYN_PD5_EN : STRING := "FALSE";--TRUE:PS5, FPS5, DUTY5, FDUTY5; FALSE: PS5_SEL, FSP5_SEL, DUTY5_SEL, FDUTY5_SEL
        PS5_SEL : integer := 0;--0~127,integer
        FPS5_SEL : integer := 0;--0~7,integer,step=1/8
        DUTY5_SEL : integer := 4;--0~127,integer
        FDUTY5_SEL : integer := 0;--0~7,integer,step=1/8
        
        CLKFB_SEL : STRING := "CLKFBOUT"; --"CLKFBOUT", "CLKOUT0","CLKOUT1","CLKOUT2","CLKOUT3","CLKOUT4","CLKOUT5"
        CLKOUT4_CASCADE_SEL : bit := '0';--0: select vco as input; 1: select C5 as odiv4 input
        CLKOUT0_BYPASS : STRING := "FALSE";--"TRUE"; "FALSE"
        CLKOUT1_BYPASS : STRING := "FALSE";
        CLKOUT2_BYPASS : STRING := "FALSE";
        CLKOUT3_BYPASS : STRING := "FALSE";
        CLKOUT4_BYPASS : STRING := "FALSE";
        CLKOUT5_BYPASS : STRING := "FALSE"
	);
    PORT(
        CLKIN : IN std_logic;
        CLKFB : IN std_logic:='0';
        RESET,PLLPWD : IN std_logic:='0';
        IDSEL,FBDSEL : IN std_logic_vector(5 downto 0);
        FBODSEL, ODSEL0, ODSEL1, ODSEL2, ODSEL3, ODSEL4, ODSEL5 : IN std_logic_vector(6 downto 0);
        FBODSEL_FRAC, ODSEL0_FRAC : IN std_logic_vector(2 downto 0);
        PSFB, PS0, PS1, PS2, PS3, PS4, PS5 : IN std_logic_vector(6 downto 0);
        FPSFB, FPS0, FPS1, FPS2, FPS3, FPS4, FPS5 : IN std_logic_vector(2 downto 0);
        DUTY0, DUTY1, DUTY2, DUTY3, DUTY4, DUTY5 : IN std_logic_vector(6 downto 0);
        FDUTY0, FDUTY1, FDUTY2, FDUTY3, FDUTY4, FDUTY5 : IN std_logic_vector(2 downto 0);
        LOCK : OUT std_logic;
        CLKFBOUT, CLKFBOUTN : OUT std_logic;
        CLKOUT0, CLKOUT0N : OUT std_logic;
        CLKOUT1, CLKOUT1N : OUT std_logic;
        CLKOUT2, CLKOUT2N : OUT std_logic;
        CLKOUT3, CLKOUT3N : OUT std_logic;
        CLKOUT4 : OUT std_logic;
        CLKOUT5 : OUT std_logic
    );
end COMPONENT;
	attribute syn_black_box of PLLG : Component is true;    
   


    
end components;    
    
