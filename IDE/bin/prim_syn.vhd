
-- ===========Oooo==========================================Oooo========
-- =  Copyright (C)2014-2024 Gowin Semiconductor Technology Co.,Ltd.
-- =                     All rights reserved.
-- =====================================================================
--
--  __      __      __
--  \ \    /  \    / /   [File name   ] prim_sim.vhd
--   \ \  / /\ \  / /    [Description ] GW1N VHDL functional simulation library
--    \ \/ /  \ \/ /     [Timestamp   ] Tue NoVember 5 11:00:30 2019
--     \  /    \  /      [version     ] 1.9.3
--      \/      \/       
--
-- ===========Oooo==========================================Oooo========


---------------------------package global------------------------------
library ieee;
use ieee.std_logic_1164.all;

package glb is
	signal GSRO : std_logic := '1';
end glb;

package body glb is
end glb;

------------------------------GSR---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity GSR is
    PORT (
         GSRI : in std_logic
    );
end GSR;


--------------------------LUT1------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT1 is
    GENERIC ( INIT : bit_vector := X"0" );
    PORT (
	 F : out std_logic;
         I0 : in std_logic
    );
end LUT1;

--------------------------LUT2 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT2 is
    GENERIC ( INIT : bit_vector := X"0" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic
    );
end LUT2;


--------------------------LUT3------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT3 is
    GENERIC ( INIT : bit_vector := X"00" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic;
   	 I2 : in std_logic
    );
end LUT3;

  
--------------------------LUT4 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT4 is
    GENERIC ( INIT : bit_vector := X"0000" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic;
   	 I2 : in std_logic;
   	 I3 : in std_logic
    );
end LUT4;


--------------------------LUT5 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity LUT5 is
    GENERIC ( INIT : bit_vector := X"00000000" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic;
   	 I2 : in std_logic;
   	 I3 : in std_logic;
   	 I4 : in std_logic
    );
end LUT5;


--------------------------LUT6 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity LUT6 is
    GENERIC ( INIT : bit_vector := X"0000000000000000" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic;
   	 I2 : in std_logic;
   	 I3 : in std_logic;
   	 I4 : in std_logic;
   	 I5 : in std_logic
    );
end LUT6;


--------------------------LUT7 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity LUT7 is
    GENERIC ( INIT : bit_vector := X"00000000000000000000000000000000" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic;
   	 I2 : in std_logic;
   	 I3 : in std_logic;
   	 I4 : in std_logic;
    	 I5 : in std_logic;
   	 I6 : in std_logic
    );
end LUT7;


--------------------------LUT8 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity LUT8 is
    GENERIC ( INIT : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic;
   	 I2 : in std_logic;
   	 I3 : in std_logic;
   	 I4 : in std_logic;
   	 I5 : in std_logic;
   	 I6 : in std_logic;
   	 I7 : in std_logic
    );
end LUT8;
--------------------------MUX2------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2;

--------------------------MUX2_LUT5------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_LUT5 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_LUT5;

--------------------------MUX2_LUT6------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_LUT6 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_LUT6;

--------------------------MUX2_LUT7------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_LUT7 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_LUT7;

--------------------------MUX2_LUT8------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_LUT8 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_LUT8;

--------------------------MUX2_MUX8------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_MUX8 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_MUX8;

--------------------------MUX2_MUX16------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_MUX16 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_MUX16;

--------------------------MUX2_MUX32------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_MUX32 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 S0 : in std_logic;
	 O : out std_logic
    );
end MUX2_MUX32;


--------------------------MUX4------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX4 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 I2 : in std_logic; 
	 I3 : in std_logic;
	 S0 : in std_logic;
	 S1 : in std_logic;
	 O : out std_logic
    );
end MUX4;


--------------------------MUX8------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX8 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 I2 : in std_logic; 
	 I3 : in std_logic;
	 I4 : in std_logic;
	 I5 : in std_logic;
	 I6 : in std_logic;
	 I7 : in std_logic;
	 S0 : in std_logic;
	 S1 : in std_logic;
	 S2 : in std_logic;
	 O : out std_logic
    );
end MUX8;


--------------------------MUX16-----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX16 is 
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 I2 : in std_logic; 
	 I3 : in std_logic;
	 I4 : in std_logic;
	 I5 : in std_logic;
	 I6 : in std_logic;
	 I7 : in std_logic;
	 I8 : in std_logic;
	 I9 : in std_logic;
	 I10 : in std_logic;
	 I11 : in std_logic;
	 I12 : in std_logic;
	 I13 : in std_logic;
	 I14 : in std_logic;
	 I15 : in std_logic;
	 S0 : in std_logic;
	 S1 : in std_logic;
	 S2 : in std_logic;
	 S3 : in std_logic;
	 O : out std_logic
    );
end MUX16;


--------------------------MUX32-----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX32 is 
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 I2 : in std_logic; 
	 I3 : in std_logic;
	 I4 : in std_logic;
	 I5 : in std_logic;
	 I6 : in std_logic;
	 I7 : in std_logic;
	 I8 : in std_logic;
	 I9 : in std_logic;
	 I10 : in std_logic;
	 I11 : in std_logic;
	 I12 : in std_logic;
	 I13 : in std_logic;
	 I14 : in std_logic;
	 I15 : in std_logic;
	 I16 : in std_logic;
	 I17 : in std_logic;
	 I18 : in std_logic;
	 I19 : in std_logic;
	 I20 : in std_logic;
	 I21 : in std_logic;
	 I22 : in std_logic;
	 I23:  in std_logic;
	 I24 : in std_logic;
	 I25 : in std_logic;
	 I26 : in std_logic;
	 I27 : in std_logic;
	 I28 : in std_logic;
	 I29 : in std_logic;
	 I30 : in std_logic;
	 I31 : in std_logic; 
	 S0 : in std_logic;
	 S1 : in std_logic;
	 S2 : in std_logic;
	 S3 : in std_logic;
	 S4 : in std_logic;
	 O : out std_logic
    );
end MUX32;


--------------------------ALU-------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    GENERIC (  
	     ALU_MODE : INTEGER := 0
    );	
    PORT (
	 SUM : OUT std_logic;
	 COUT : OUT std_logic;	
	 I0 : IN std_logic;
	 I1: IN std_logic;
	 I3: IN std_logic;
	 CIN: IN std_logic
    );	
end ALU;


----------------------------DFF ------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFF is
    GENERIC ( INIT : bit := '0');	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFF;


---------------------------DFFE ---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CE : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFE;


-------------------------DFFS ---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFS is
    GENERIC ( INIT: bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 SET : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFS;


----------------------------DFFSE--------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFSE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 SET : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFSE;


------------------------DFFR ----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFR is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 RESET : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFR;


---------------------------DFFRE -------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFRE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 RESET : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFRE;


----------------------------DFFP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFP is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 PRESET: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFP;


--------------------------DFFPE ---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFPE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 PRESET : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFPE;


-----------------------------DFFC --------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFC is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFC;


-----------------------------DFFCE -------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFCE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFCE;


--------------------------DFFN ------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFN is
    GENERIC ( INIT : bit := '0');	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFN;



------------------DFFNE ---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CE : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNE;


-------------------------DFFNS ---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNS is
    GENERIC ( INIT: bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 SET : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNS;


----------------------------DFFNSE--------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNSE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 SET : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNSE;


-----------------------------DFFNR----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNR is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 RESET : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNR;


---------------------------DFFNRE -------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNRE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 RESET : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNRE;


----------------------------DFFNP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNP is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 PRESET: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNP;


--------------------------DFFNPE ---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNPE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 PRESET : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNPE;


-----------------------------DFFNC --------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNC is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNC;


-----------------------------DFFNCE -------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFNCE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;
	 CE: IN std_logic;	
	 CLK : IN std_logic
    );	
end DFFNCE;


--------------------------------DL ------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DL is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;	
	 G : IN std_logic
    );	
end DL;


-------------------------DLE-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CE: IN std_logic;	
	 G : IN std_logic
    );	
end DLE;


-----------------------------DLC ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLC is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;	
	 G : IN std_logic
    );	
end DLC;


-----------------------------DLCE ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLCE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;	
	 G : IN std_logic;
	 CE: IN std_logic
    );	
end DLCE;


-----------------------------DLP ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLP is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : std_logic;
	 PRESET : IN std_logic;	
	 G: IN std_logic
    );	
end DLP;


-----------------------------DLPE ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLPE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 PRESET : IN std_logic;	
	 G : IN std_logic;
	 CE: IN std_logic
    );	
end DLPE;


------------------------DLN ------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLN is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;	
	 G : IN std_logic
    );	
end DLN;


-----------------------------DLNE-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLNE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CE: IN std_logic;	
	 G : IN std_logic
    );	
end DLNE;


-----------------------------DLNC ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLNC is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;	
	 G : IN std_logic
    );	
end DLNC;


-----------------------------DLNCE ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLNCE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 CLEAR : IN std_logic;	
	 G : IN std_logic;
	 CE: IN std_logic
    );	
end DLNCE;


-----------------------------DLNP ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLNP is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : std_logic;
	 PRESET : IN std_logic;	
	 G: IN std_logic
    );	
end DLNP;

-----------------------------DLNPE ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLNPE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	 Q : OUT std_logic;	
	 D : IN std_logic;
	 PRESET : IN std_logic;	
	 G : IN std_logic;
	 CE: IN std_logic
    );	
end DLNPE;
-----------------------------DLCEA ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLCEA is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	    Q : OUT std_logic;	
	    D : IN std_logic;
	    CLEAR : IN std_logic;	
	    G : IN std_logic;
	    GE: IN std_logic
    );	
end DLCEA;
-----------------------------DLPEA ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLPEA is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	    Q : OUT std_logic;	
	    D : IN std_logic;
	    PRESET : IN std_logic;	
	    G : IN std_logic;
	    GE: IN std_logic
    );	
end DLPEA;

----------------------IBUF-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IBUF is
    PORT (
    	 O : OUT std_logic;
    	 I : IN std_logic
    );
end IBUF;


------------------------------OBUF---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OBUF is
    PORT (
    	 O : OUT std_logic;
    	 I : IN std_logic
    );
end OBUF;


------------------------------------TBUF---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TBUF is
    PORT (
    	 O : OUT std_logic;
    	 I : IN std_logic;
    	 OEN : IN std_logic
    );
end TBUF;


----------------------------IOBUF--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IOBUF is
    PORT (
    	O  : OUT   std_logic;
    	IO : INOUT std_logic;
     	I  : IN    std_logic;
	    OEN : IN    std_logic
    );
end IOBUF;


---------------------------------IDDR--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity IDDR is
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
end IDDR;


---------------------------------IDDRC---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity IDDRC is
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
end IDDRC;

----------------------------IDDR_MEM------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity IDDR_MEM is
	GENERIC (
		GSREN : string := "false";
		LSREN : string := "true"
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
end IDDR_MEM;


-------------------------------ODDR----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity ODDR is
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
end ODDR;


-------------------------------ODDRC----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity ODDRC is
    GENERIC (
        TXCLK_POL : bit := '0'; --'0':Rising edge output; '1':Falling edge output
        CONSTANT INIT : std_logic := '0'
    );	
    PORT (
	    Q0 : OUT std_logic;
	    Q1 : OUT std_logic;
	    D0 : IN std_logic;
	    D1: IN std_logic;
	    TX: IN std_logic;
	    CLK : IN std_logic;
	    CLEAR: IN std_logic
    );
end ODDRC;

----------------------------ODDR_MEM------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity ODDR_MEM is
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
end ODDR_MEM;


-----------------------------------------IDES4-------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity IDES4 is
	GENERIC (
		GSREN : string := "false";
		LSREN : string := "true"
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
		Q3 : OUT std_logic
	);
end IDES4;

--------------------------IDES4_MEM----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES4_MEM is
	generic(
		GSREN : string := "false";
		LSREN : string := "true"
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
end IDES4_MEM;


------------------------------------IVIDEO-------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IVIDEO is
    GENERIC (
		GSREN : string := "false";
		LSREN : string := "true"
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
end IVIDEO;


-----------------------------------IDES8-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES8 is
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
		Q7 : OUT std_logic
    );
end IDES8;

-------------------------IDES8_MEM----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES8_MEM is
    GENERIC (
	    GSREN : string := "false";
		LSREN : string := "true"
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
end IDES8_MEM;


--------------------------------------IDES10----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES10 is
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
		Q9 : OUT std_logic
    );
end IDES10;


-----------------------------------IDES16-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES16 is
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
end IDES16;


-------------------------OSER4------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity OSER4 is
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
end OSER4;

-----------------OSER4_MEM--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity OSER4_MEM is
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
end OSER4_MEM;


--------------------OVIDEO----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OVIDEO is
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
end OVIDEO;


--------------------OSER8-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OSER8 is
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
end OSER8;

-----------------OSER8_MEM--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OSER8_MEM is
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
end OSER8_MEM;



--------------------OSER10-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OSER10 is
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
end OSER10;


--------------------OSER16-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OSER16 is
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
end OSER16;


--------------------IODELAY-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IODELAY is
	GENERIC (  C_STATIC_DLY : integer := 0); -- 0~127
	PORT (
		DI : IN std_logic;
		SDTAP : IN std_logic;
		SETN : IN std_logic;
		VALUE : IN std_logic;
		DO : OUT std_logic;
		DF : OUT std_logic
	);
end IODELAY;



--------------------IEM----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IEM is
	GENERIC(
		WINSIZE : string := "SMALL";
		GSREN : string := "false";
		LSREN : string := "true"
	);
	PORT (
		D : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		MCLK: in std_logic;
		LAG : out std_logic;
		LEAD : out std_logic
	);
end IEM;


--------------------------------RAM16S1--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16S1 is
    GENERIC ( INIT_0 : bit_vector(15 downto 0) := X"0000" );
    PORT (
		DO : out std_logic;
		CLK : in std_logic;
		WRE : in std_logic;
		AD : in std_logic_vector(3 downto 0);
		DI : in std_logic
    );
end RAM16S1;


--------------------------------RAM16S2--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16S2 is
    GENERIC ( INIT_0 : bit_vector(15 downto 0) := X"0000";
	          INIT_1 : bit_vector(15 downto 0) := X"0000" 
            );
    PORT (
		DO : out std_logic_vector(1 downto 0);
		CLK : in std_logic;
		WRE : in std_logic;
		AD : in std_logic_vector(3 downto 0);
		DI : in std_logic_vector(1 downto 0)
    );
end RAM16S2;


--------------------------------RAM16S4--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16S4 is
    GENERIC( INIT_0 : bit_vector(15 downto 0) := X"0000";
	         INIT_1 : bit_vector(15 downto 0) := X"0000";
	         INIT_2 : bit_vector(15 downto 0) := X"0000";
             INIT_3 : bit_vector(15 downto 0) := X"0000"
           );
    PORT (
		DO : out std_logic_vector(3 downto 0); 
		CLK : in std_logic;
		WRE : in std_logic;
		AD : in std_logic_vector(3 downto 0);
		DI : in std_logic_vector(3 downto 0)
    );
end RAM16S4;


--------------------------------RAM16SDP1--------------------------

library IEEE;  
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16SDP1 is
    GENERIC( INIT_0 : bit_vector(15 downto 0) := X"0000" );
    PORT (
		DO : out std_logic;
		CLK : in std_logic;
		WRE : in std_logic;
		WAD : in std_logic_vector(3 downto 0);
		RAD : in std_logic_vector(3 downto 0);
		DI : in std_logic
    );
end RAM16SDP1;


--------------------------------RAM16SDP2--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16SDP2 is
    GENERIC ( INIT_0 : bit_vector(15 downto 0) := X"0000";
	          INIT_1 : bit_vector(15 downto 0) := X"0000"
            );
    PORT (
	    DO : out std_logic_vector(1 downto 0);
	    CLK : in std_logic;
	    WRE : in std_logic;
	    WAD : in std_logic_vector(3 downto 0);
	    RAD : in std_logic_vector(3 downto 0);
	    DI : in std_logic_vector(1 downto 0)
    );
end RAM16SDP2;


--------------------------------RAM16SDP4--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16SDP4 is
    GENERIC ( INIT_0 : bit_vector(15 downto 0) := X"0000";
              INIT_1 : bit_vector(15 downto 0) := X"0000";
              INIT_2 : bit_vector(15 downto 0) := X"0000";
              INIT_3 : bit_vector(15 downto 0) := X"0000"
            );
    PORT (
		DO : out std_logic_vector(3 downto 0);
		CLK : in std_logic;
		WRE : in std_logic;
		WAD : in std_logic_vector(3 downto 0);
		RAD : in std_logic_vector(3 downto 0);
		DI : in std_logic_vector(3 downto 0)
    );
end RAM16SDP4;


--------------------------------ROM16-----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity ROM16 is
    GENERIC ( INIT_0 : bit_vector(15 downto 0) := X"0000" );
    PORT (
 	    DO : out std_logic;
	    AD : in std_logic_vector(3 downto 0)
    );
end ROM16;



-----------------------ROM----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is
    GENERIC ( 
	    BIT_WIDTH : integer :=1; -- 1, 2, 4, 8, 16, 32	
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
    	BLK_SEL : bit_vector := "000"; 
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"        
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLK, CE,OCE,RESET,WRE : in std_logic;
    	BLKSEL : in std_logic_vector(2 downto 0);
	    AD : in std_logic_vector(13 downto 0)
    );
end ROM;


------------------------------ROMX9 ---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROMX9 is
    GENERIC ( 
    	BIT_WIDTH : integer :=9; -- 9, 18, 36
   	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
    	BLK_SEL : bit_vector := "000"; 
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
        INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"     

    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLK, CE,OCE,RESET,WRE : in std_logic;
    	BLKSEL : in std_logic_vector(2 downto 0);
	    AD : in std_logic_vector(13 downto 0)
    );
end ROMX9;


-------------------SP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SP is
    GENERIC (
	    BIT_WIDTH : integer :=32; -- 1, 2, 4, 8, 16, 32
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    WRITE_MODE : bit_vector := "01"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"    
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLK, CE,OCE,RESET,WRE : in std_logic;
	    AD : in std_logic_vector(13 downto 0);
        BLKSEL : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(31 downto 0)
    );
end SP;


----------------------------SPX9---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SPX9 is
    GENERIC ( 
	    BIT_WIDTH : integer :=9;
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    WRITE_MODE : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    BLK_SEL : bit_vector := "000"; 
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"    
    
    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLK, CE,OCE,RESET,WRE : in std_logic;
	    AD : in std_logic_vector(13 downto 0);
	    DI : in std_logic_vector(35 downto 0);
        BLKSEL : std_logic_vector(2 downto 0) 
	 
    );
end SPX9;


----------------------------------SDP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SDP is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    BIT_WIDTH_1 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"    
    
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLKA,CLKB, CEA,CEB,OCE,RESETA,RESETB,WREA,WREB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
        BLKSEL : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(31 downto 0)
    );
end SDP;


----------------------------------SDPX9---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SDPX9 is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18, 36
	    BIT_WIDTH_1 : integer :=18; -- 9, 18, 36
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC,ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"      
    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLKA,CLKB, CEA,CEB,OCE,RESETA,RESETB,WREA,WREB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
    	BLKSEL : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(35 downto 0)
    );
end SDPX9;


----------------------------DP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DP is
    GENERIC (
		BIT_WIDTH_0 : integer :=16; -- 1, 2, 4, 8, 16
		BIT_WIDTH_1 : integer :=16; -- 1, 2, 4, 8, 16
		READ_MODE0 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
		READ_MODE1 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
		WRITE_MODE0 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
		WRITE_MODE1 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
		INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
    );
    PORT (
		DOA,DOB : out std_logic_vector(15 downto 0):=conv_std_logic_vector(0,16);
		CLKA,CLKB, CEA,CEB,OCEA,OCEB,RESETA,RESETB,WREA,WREB : in std_logic;
		ADA,ADB : in std_logic_vector(13 downto 0);
    	BLKSEL : in std_logic_vector(2 downto 0);
		DIA,DIB : in std_logic_vector(15 downto 0)
    );
end DP;


----------------------------DPX9---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DPX9 is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18
	    BIT_WIDTH_1 : integer :=18; -- 9, 18
	    READ_MODE0 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    READ_MODE1 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    WRITE_MODE0 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    WRITE_MODE1 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
        BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"     
    );
    PORT (
	    DOA,DOB : out std_logic_vector(17 downto 0):=conv_std_logic_vector(0,18);
	    CLKA,CLKB, CEA,CEB,OCEA,OCEB,RESETA,RESETB,WREA,WREB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
	    DIA : in std_logic_vector(17 downto 0);
        BLKSEL : in std_logic_vector(2 downto 0);
	    DIB : in std_logic_vector(17 downto 0)
    );
end DPX9;


----------------------------------rSDP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rSDP is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    BIT_WIDTH_1 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"    
    
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLKA,CLKB, CEA,CEB,OCE,RESETA,RESETB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
        BLKSEL : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(31 downto 0)
    );
end rSDP;


----------------------------------rSDPX9---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rSDPX9 is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18, 36
	    BIT_WIDTH_1 : integer :=18; -- 9, 18, 36
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC,ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"      
    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLKA,CLKB, CEA,CEB,OCE,RESETA,RESETB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
    	BLKSEL : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(35 downto 0)
    );
end rSDPX9;


-----------------------rROM----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rROM is
    GENERIC ( 
	    BIT_WIDTH : integer :=1; -- 1, 2, 4, 8, 16, 32	
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
    	BLK_SEL : bit_vector := "000"; 
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"        
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLK, CE,OCE,RESET : in std_logic;
    	BLKSEL : in std_logic_vector(2 downto 0);
	    AD : in std_logic_vector(13 downto 0)
    );
end rROM;


------------------------------rROMX9 ---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rROMX9 is
    GENERIC ( 
    	BIT_WIDTH : integer :=9; -- 9, 18, 36
   	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
    	BLK_SEL : bit_vector := "000"; 
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
        INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"     

    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLK, CE,OCE,RESET : in std_logic;
    	BLKSEL : in std_logic_vector(2 downto 0);
	    AD : in std_logic_vector(13 downto 0)
    );
end rROMX9;


-----------------------pROM----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pROM is
    GENERIC ( 
	    BIT_WIDTH : integer :=1; -- 1, 2, 4, 8, 16, 32	
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"        
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLK, CE,OCE,RESET : in std_logic;
	    AD : in std_logic_vector(13 downto 0)
    );
end pROM;


------------------------------pROMX9 ---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pROMX9 is
    GENERIC ( 
    	BIT_WIDTH : integer :=9; -- 9, 18, 36
   	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
        INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"     

    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLK, CE,OCE,RESET : in std_logic;
	    AD : in std_logic_vector(13 downto 0)
    );
end pROMX9;


----------------------------------SDPB---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SDPB is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    BIT_WIDTH_1 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL_0 : bit_vector := "000";
	    BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"    
    
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLKA,CLKB, CEA,CEB,OCE,RESETA,RESETB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
        BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(31 downto 0)
    );
end SDPB;


----------------------------------SDPX9B---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SDPX9B is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18, 36
	    BIT_WIDTH_1 : integer :=18; -- 9, 18, 36
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL_0 : bit_vector := "000";
	    BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC,ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"      
    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLKA,CLKB, CEA,CEB,OCE,RESETA,RESETB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
    	BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(35 downto 0)
    );
end SDPX9B;


----------------------------DPB---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DPB is
    GENERIC (
		BIT_WIDTH_0 : integer :=16; -- 1, 2, 4, 8, 16
		BIT_WIDTH_1 : integer :=16; -- 1, 2, 4, 8, 16
		READ_MODE0 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
		READ_MODE1 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
		WRITE_MODE0 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
		WRITE_MODE1 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    BLK_SEL_0 : bit_vector := "000";
	    BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
		INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
    );
    PORT (
		DOA,DOB : out std_logic_vector(15 downto 0):=conv_std_logic_vector(0,16);
		CLKA,CLKB, CEA,CEB,OCEA,OCEB,RESETA,RESETB,WREA,WREB : in std_logic;
		ADA,ADB : in std_logic_vector(13 downto 0);
    	BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
		DIA,DIB : in std_logic_vector(15 downto 0)
    );
end DPB;


----------------------------DPX9B---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DPX9B is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18
	    BIT_WIDTH_1 : integer :=18; -- 9, 18
	    READ_MODE0 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    READ_MODE1 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    WRITE_MODE0 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    WRITE_MODE1 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
        BLK_SEL_0 : bit_vector := "000";
        BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"     
    );
    PORT (
	    DOA,DOB : out std_logic_vector(17 downto 0):=conv_std_logic_vector(0,18);
	    CLKA,CLKB, CEA,CEB,OCEA,OCEB,RESETA,RESETB,WREA,WREB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
	    DIA : in std_logic_vector(17 downto 0);
        BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
	    DIB : in std_logic_vector(17 downto 0)
    );
end DPX9B;



---------------------BUFG---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BUFG is
  PORT(
    	O : out std_logic;
    	I : in std_logic
    );
end BUFG;


-----------------BUFS--------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BUFS is
    PORT (
         O : out std_logic;
         I : in std_logic
    );
end BUFS;


----------------------GND-----------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GND is
    PORT (
    	 G : out std_logic
    );
end GND;


---------------------VCC------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VCC is
    PORT (
    	 V : out std_logic
    );
end VCC;


---------------------OSC------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OSC IS
GENERIC (
    FREQ_DIV : integer := 100;  --2~128,only even num
    DEVICE : string := "GW1N-4"--GW1N-4,GW1N-6,GW1N-9,GW1NR-4,GW1NR-9,GW1N-2B,GW1N-4B,GW1NR-4B,GW1N-6ES,GW1N-9ES,GW1NR-9ES,GW1NRF-4B
);
PORT (
    OSCOUT: OUT STD_LOGIC
);
END OSC;
 

---------------------OSCH------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OSCH IS
GENERIC (
    FREQ_DIV : integer := 96  --2~128,only even num
);
PORT (
    OSCOUT: OUT STD_LOGIC
);
END OSCH;


---------------------OSCZ------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OSCZ IS
GENERIC (
    FREQ_DIV : integer := 100;  --2~128,only even num
    S_RATE : STRING := ""   --"SLOW","FAST";GW1NS4 device,FAST: C7 
);
PORT (
    OSCOUT: OUT STD_LOGIC;
    OSCEN : IN STD_LOGIC
);
END OSCZ;


-----------------INV---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INV is
    PORT (
    	 O : OUT std_logic;
    	 I : IN std_logic
    );
end INV;



-----------------TLVDS_IBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity TLVDS_IBUF is
    PORT(
        O : OUT std_logic;
        I : IN std_logic;
        IB : IN std_logic
        );
end TLVDS_IBUF;



-----------------TLVDS_OBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TLVDS_OBUF is
    PORT(
        O : OUT std_logic;
        OB : OUT std_logic;
        I : IN std_logic
        );
end TLVDS_OBUF;


-----------------TLVDS_TBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TLVDS_TBUF is
    PORT (
    	 O  : OUT   std_logic;
    	 OB : OUT std_logic;
     	 I  : IN    std_logic;
	     OEN : IN    std_logic
    );
end TLVDS_TBUF;



-----------------TLVDS_IOBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TLVDS_IOBUF is
    PORT (
    	O  : OUT   std_logic;
    	IOB : INOUT std_logic;
        IO : INOUT std_logic;
     	I  : IN    std_logic;
	    OEN : IN    std_logic
    );
end TLVDS_IOBUF;


-----------------ELVDS_IBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ELVDS_IBUF is
    PORT(
        O : OUT std_logic;
        I : IN std_logic;
        IB : IN std_logic
        );
end ELVDS_IBUF;



-----------------ELVDS_OBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ELVDS_OBUF is
    PORT(
        O : OUT std_logic;
        OB : OUT std_logic;
        I : IN std_logic
        );
end ELVDS_OBUF;


-----------------ELVDS_TBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ELVDS_TBUF is
    PORT (
    	 O  : OUT   std_logic;
    	 OB : OUT std_logic;
     	 I  : IN    std_logic;
	     OEN : IN    std_logic
    );
end ELVDS_TBUF;



-----------------ELVDS_IOBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ELVDS_IOBUF is
    PORT (
    	O  : OUT   std_logic;
    	IOB : INOUT std_logic;
        IO : INOUT std_logic;
     	I  : IN    std_logic;
	    OEN : IN    std_logic
    );
end ELVDS_IOBUF;


------------------------MIPI_IBUF------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPI_IBUF is
    PORT (
         OH, OL, OB : OUT std_logic;
         IO, IOB : INOUT std_logic;
         I, IB : IN std_logic;
         OEN, OENB, HSREN : IN std_logic
    );
end MIPI_IBUF;


------------------------MIPI_IBUF_HS------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPI_IBUF_HS is
    PORT (
         OH : OUT std_logic;
         I : IN std_logic;
         IB : IN std_logic
    );
end MIPI_IBUF_HS;


----------------------MIPI_IBUF_LP-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPI_IBUF_LP is
    PORT (
    	 OL : OUT std_logic;
    	 OB : OUT std_logic;
    	 IB : IN std_logic;
    	 I : IN std_logic
    );
end MIPI_IBUF_LP;


------------------------MIPI_OBUF---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPI_OBUF is
    PORT (
         O : OUT std_logic;
         OB : OUT std_logic;
         I : IN std_logic;
         IB : IN std_logic;
         MODESEL : IN std_logic
    );
end MIPI_OBUF;


----------------------------I3C_IOBUF--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity I3C_IOBUF is
    PORT (
    	O  : OUT   std_logic;
    	IO : INOUT std_logic;
     	I  : IN    std_logic;
	    MODESEL : IN    std_logic
    );
end I3C_IOBUF;


--------------PADD18---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity PADD18 is
	generic(
		AREG : bit := '0';-- '0': bypass mode; '1': registered mode
		BREG : bit := '0'; 
		SOREG : bit := '0';
		ADD_SUB : bit := '0';
        PADD_RESET_MODE : string := "SYNC"; -- SYNC,ASYNC
        BSEL_MODE : bit := '1' -- "1": shift, "0": parallel input B.
	);

	port(
		A : in std_logic_vector(17 downto 0);
		B : in std_logic_vector(17 downto 0);
		ASEL : in std_logic;
		CE,CLK,RESET : in std_logic;
		SI,SBI : in std_logic_vector(17 downto 0);
		SO,SBO : out std_logic_vector(17 downto 0);
		DOUT : out std_logic_vector(17 downto 0)
	);
end PADD18;


-----------------PADD9---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity PADD9 is
	generic(
		AREG : bit := '0';-- '0': bypass mode; '1': registered mode
		BREG : bit := '0'; 
		SOREG : bit := '0';
		ADD_SUB : bit := '0';
        PADD_RESET_MODE : string := "SYNC"; -- SYNC,ASYNC
        BSEL_MODE : bit := '1' -- "1": shift, "0": parallel input B.
	);

	port(
		A : in std_logic_vector(8 downto 0);
		B : in std_logic_vector(8 downto 0);
		ASEL : in std_logic;
		CE,CLK,RESET : in std_logic;
		SI,SBI : in std_logic_vector(8 downto 0);
		SO,SBO : out std_logic_vector(8 downto 0);
		DOUT : out std_logic_vector(8 downto 0)
	);
end PADD9;



-----------------MULT9X9---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULT9X9 is
	generic(
		AREG :  bit := '0'; --  '0': bypass mode; '1': registered mode
		BREG :  bit := '0';
		OUT_REG :  bit := '0';
		PIPE_REG :  bit := '0';
		ASIGN_REG :  bit := '0';
		BSIGN_REG :  bit := '0';
        SOA_REG :  bit := '0'; 
		MULT_RESET_MODE : string := "SYNC" -- SYNC, ASYNC
	);

	port (
		A,SIA : in std_logic_vector(8 downto 0);
		B,SIB : in std_logic_vector(8 downto 0);
		ASIGN, BSIGN : in std_logic;
        ASEL,BSEL : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		DOUT : out std_logic_vector(17 downto 0);
        SOA,SOB : out std_logic_vector(8 downto 0)
	);
end MULT9X9;


-----------------MULT18X18---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULT18X18 is
	generic(
		AREG :  bit := '0'; --  '0': bypass mode; '1': registered mode
		BREG :  bit := '0';
		OUT_REG :  bit := '0';
		PIPE_REG :  bit := '0';
		ASIGN_REG :  bit := '0';
		BSIGN_REG :  bit := '0';
        SOA_REG :  bit := '0';
		MULT_RESET_MODE : string := "SYNC" -- SYNC, ASYNC
	);

	port (
		A,SIA : in std_logic_vector(17 downto 0);
		B,SIB : in std_logic_vector(17 downto 0);
		ASIGN, BSIGN : in std_logic;
        ASEL,BSEL : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		DOUT : out std_logic_vector(35 downto 0);
        SOA,SOB : out std_logic_vector(17 downto 0)
	);
end MULT18X18;


-----------------MULT36X36---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULT36X36 is
	generic(
		AREG :  bit := '0'; --  '0': bypass mode; '1': registered mode
		BREG :  bit := '0';
		OUT0_REG :  bit := '0';
		OUT1_REG :  bit := '0';
		PIPE_REG :  bit := '0';
		ASIGN_REG :  bit := '0';
		BSIGN_REG :  bit := '0';
		MULT_RESET_MODE : string := "SYNC" -- SYNC, ASYNC
	);

	port (
		A : in std_logic_vector(35 downto 0);
		B : in std_logic_vector(35 downto 0);
		ASIGN, BSIGN : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		DOUT : out std_logic_vector(71 downto 0)
	);
end MULT36X36;



-----------------MULTALU36X18---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULTALU36X18 is
	generic(
		AREG :  bit := '0'; --  '0': bypass mode; '1': registered mode
		BREG :  bit := '0';
		CREG :  bit := '0';
		OUT_REG :  bit := '0';
		PIPE_REG :  bit := '0';
		ASIGN_REG :  bit := '0';
		BSIGN_REG :  bit := '0';
        ACCLOAD_REG0 : bit := '0';
        ACCLOAD_REG1 : bit := '0';
        MULTALU36X18_MODE : integer := 0;--0:36x18 +/- C; 1:ACC/0 + 36x18; 2: 36x18 + CASI
        C_ADD_SUB : bit := '0';-- '0': add;  '1': sub
		MULT_RESET_MODE : string := "SYNC" -- SYNC, ASYNC
	);
    
	port (
		A : in std_logic_vector(17 downto 0);
		B : in std_logic_vector(35 downto 0);
		C : in std_logic_vector(53 downto 0);
		ASIGN, BSIGN, ACCLOAD : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		CASI : in std_logic_vector(54 downto 0);
		DOUT : out std_logic_vector(53 downto 0);
		CASO : out std_logic_vector(54 downto 0)
	);
end MULTALU36X18;


-----------------MULTADDALU18X18---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULTADDALU18X18 is
	generic(
		A0REG : bit := '0';-- '0': bypass mode; '1': registered mode
		B0REG : bit := '0'; 
		A1REG : bit := '0';
		B1REG : bit := '0';
		CREG : bit := '0';
		OUT_REG : bit := '0';
		PIPE0_REG : bit := '0';
		PIPE1_REG : bit := '0';
		ASIGN0_REG : bit := '0';
		BSIGN0_REG : bit := '0';
		ASIGN1_REG : bit := '0';
		BSIGN1_REG : bit := '0';
		ACCLOAD_REG0 : bit := '0';
		ACCLOAD_REG1 : bit := '0';
        SOA_REG : bit := '0';
		B_ADD_SUB : bit := '0';  -- '0': add; '1': sub
		C_ADD_SUB : bit := '0';
		MULTADDALU18X18_MODE : integer := 0;--0:18x18 +/- 18x18 +/- C;  1: ACC/0 + 18x18 +/- 18x18; 2:18x18 +/- 18x18 + CASI
		MULT_RESET_MODE : string := "SYNC" -- SYNC, ASYNC
	);

	port (
		A0,A1 : in std_logic_vector(17 downto 0);
		B0,B1 : in std_logic_vector(17 downto 0);
		SIA,SIB : in std_logic_vector(17 downto 0);
		C : in std_logic_vector(53 downto 0);
        ASIGN,BSIGN : in std_logic_vector(1 downto 0);
        ASEL,BSEL : in std_logic_vector(1 downto 0);
        CASI : in std_logic_vector(54 downto 0);
        ACCLOAD : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		DOUT : out std_logic_vector(53 downto 0);
        SOA,SOB : out std_logic_vector(17 downto 0);
		CASO : out std_logic_vector(54 downto 0)
	);
end MULTADDALU18X18;



-----------------MULTALU18X18---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULTALU18X18 is
	generic(
		AREG : bit := '0';-- '0': bypass mode; '1': registered mode
		BREG : bit := '0'; 
		CREG : bit := '0';
		DREG : bit := '0';
        OUT_REG : bit := '0';
		PIPE_REG : bit := '0';
		ASIGN_REG : bit := '0';
		BSIGN_REG : bit := '0';
		DSIGN_REG : bit := '0';
		ACCLOAD_REG0 : bit := '0';
		ACCLOAD_REG1 : bit := '0';
		B_ADD_SUB : bit := '0';  -- '0': add; '1': sub
		C_ADD_SUB : bit := '0';
		MULTALU18X18_MODE : integer := 0;--0:ACC/0 +/- 18x18 +/- C; 1:ACC/0 +/- 18x18 + CASI; 2: 18x18 +/- D + CASI;
		MULT_RESET_MODE : string := "SYNC" -- SYNC, ASYNC
	);

	port (
		A : in std_logic_vector(17 downto 0);
		B : in std_logic_vector(17 downto 0);
		C, D : in std_logic_vector(53 downto 0);
        ASIGN, BSIGN : in std_logic;
        CASI : in std_logic_vector(54 downto 0);
        ACCLOAD,DSIGN : in std_logic;
		CE : in std_logic;
		CLK : in std_logic;
		RESET : in std_logic;
		DOUT : out std_logic_vector(53 downto 0);
		CASO : out std_logic_vector(54 downto 0)
	);
end MULTALU18X18;


------------------------------ALU54D---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity ALU54D is
    generic(
	    AREG : bit := '0'; --'0': bypass mode; '1': registered mode
        BREG : bit := '0';
	    ASIGN_REG : bit := '0';
	    BSIGN_REG : bit := '0';
	    ACCLOAD_REG : bit := '0';
	    OUT_REG : bit := '0';
	    B_ADD_SUB : bit := '0';--'0':add; '1':sub
	    C_ADD_SUB : bit := '0';
        ALUD_MODE : integer := 0;--0:ACC/0 +/- B +/- A; 1:ACC/0 +/- B + CASI; 2:A +/- B + CASI;
		ALU_RESET_MODE : string := "SYNC" --SYNC, ASYNC
);
    port (
	    A : in std_logic_vector (53 downto 0);
	    B : in std_logic_vector (53 downto 0);
	    CE : in std_logic;
	    CLK : in std_logic;
	    RESET : in std_logic;
	    ASIGN,BSIGN : in std_logic;
	    ACCLOAD : in std_logic;
	    CASI : in std_logic_vector (54 downto 0);
	    DOUT : out std_logic_vector (53 downto 0);
	    CASO : out std_logic_vector (54 downto 0)
    );
end ALU54D;



------------------------------PLL---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity PLL is
    GENERIC(
             FCLKIN : STRING := "100.0"; --frequency of the clkin(M)
             DEVICE : STRING := "GW1N-2"; --"GW1N-1","GW1N-2","GW1N-4","GW1N-6","GW1N-9","GW1NR-4","GW1NR-9","GW1N-2B","GW1N-4B","GW1NR-4B","GW1N-6ES","GW1N-9ES","GW1NR-9ES","GW1NS-2","GW1NS-2C","GW1NZ-1","GW1NSR-2C","GW1N-1S","GW1NSE-2C","GW1NRF-4B"
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
             RESET_I :in std_logic:='0';
             RESET_S : in std_logic :='0';
             PSDA,FDLY : In std_logic_vector(3 downto 0);
             DUTYDA : In std_logic_vector(3 downto 0);
             LOCK : OUT std_logic;
             CLKOUT : OUT std_logic;
             CLKOUTD : out std_logic;
             CLKOUTP : out std_logic;
             CLKOUTD3 : out std_logic
        );
end PLL;




------------------------------CLKDIV---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity CLKDIV is
    GENERIC(
	     DIV_MODE : STRING := "2"; -- "2", "3.5", "4", "5", "8"("8",Only supported in gw1n-6k/9k,gw1ns-2k,gw1n-1s)
	     GSREN : STRING := "false" -- "false", "true"
    );
    PORT(
         HCLKIN : IN std_logic;
	     RESETN : IN std_logic;
	     CALIB : In std_logic;
	     CLKOUT : OUT std_logic
    );
end CLKDIV;


----------------------------DHCEN ------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DHCEN is
    PORT (
	 CLKOUT : OUT std_logic;	
	 CE : IN std_logic;	
	 CLKIN : IN std_logic
    );
end DHCEN;



------------------------------DLL---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity DLL is
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
end DLL;
-----------------DQS---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity DQS is
	generic(
		FIFO_MODE_SEL : bit := '0';-- FIFO mode select: '0',DDR memory mode;'1': GDDR mode
		RD_PNTR : bit_vector := "000";--FIFO read pointer setting
		DQS_MODE : string := "X1"; -- "X1","X2_DDR2","X2_DDR3","X4","X2_DDR3_EXT"
        HWL : string := "false";--"true"; "false"
		GSREN : string := "false" --false, true
	);

	port (
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
end DQS;




------------------------------DLLDLY---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity DLLDLY is
    GENERIC(
        DLL_INSEL : bit := '1'; --'0':bypass mode, '1': use dll_delay cell
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
end DLLDLY;



------------------------------FLASH96K---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FLASH96K is
    PORT(
        RA,CA,PA : IN std_logic_vector(5 downto 0);
        MODE : IN std_logic_vector(3 downto 0);
        ACLK,PW,RESET,PE,OE:IN std_logic;
        SEQ,RMODE,WMODE : IN std_logic_vector(1 downto 0);
        RBYTESEL,WBYTESEL : IN std_logic_vector(1 downto 0);
        DIN : IN std_logic_vector(31 downto 0);
        DOUT : OUT std_logic_vector(31 downto 0)
     );
end FLASH96K;



------------------------------FLASH96KZ---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FLASH96KZ is
    PORT(
        XADR : IN std_logic_vector(5 downto 0);
        YADR : IN std_logic_vector(5 downto 0);
        XE,YE,SE:IN std_logic;
        DIN : IN std_logic_vector(31 downto 0);
        ERASE,PROG,NVSTR: IN std_logic;
        DOUT : OUT std_logic_vector(31 downto 0)
     );
end FLASH96KZ;


------------------------------FLASH256K---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FLASH256K is
    PORT(
        XADR : IN std_logic_vector(6 downto 0);
        YADR : IN std_logic_vector(5 downto 0);
        XE,YE,SE:IN std_logic;
        DIN : IN std_logic_vector(31 downto 0);
        ERASE,PROG,NVSTR: IN std_logic;
        DOUT : OUT std_logic_vector(31 downto 0)
     );
end FLASH256K;



------------------------------FLASH608K---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FLASH608K is
    PORT(
        XADR : IN std_logic_vector(8 downto 0);
        YADR : IN std_logic_vector(5 downto 0);
        XE,YE,SE:IN std_logic;
        DIN : IN std_logic_vector(31 downto 0);
        ERASE,PROG,NVSTR: IN std_logic;
        DOUT : OUT std_logic_vector(31 downto 0)
     );
end FLASH608K;



------------------------------DCS---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DCS is
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
end DCS;


----------------------------DQCE ------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DQCE is
    PORT (
	 CLKOUT : OUT std_logic;	
	 CE : IN std_logic;	
	 CLKIN : IN std_logic
    );	
end DQCE;


----------------------------FLASH128K------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FLASH128K is
    PORT(
        ADDR : IN std_logic_vector(14 downto 0);
        DIN : IN std_logic_vector(31 downto 0);
        CS,AE,OE : IN std_logic;
        PCLK : IN std_logic;
        PROG,SERA,MASE :IN std_logic;
        IFREN,RESETN,NVSTR: IN std_logic;
        DOUT : OUT std_logic_vector(31 downto 0);
        TBIT : OUT std_logic
    );
end FLASH128K;


------------------------------MCU---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity MCU is
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
        TARGFLASH0HWRITE : OUT std_logic;
        TARGFLASH0HSIZE : OUT std_logic_vector(2 downto 0);
        TARGFLASH0HBURST : OUT std_logic_vector(2 downto 0);
        TARGFLASH0HPROT : OUT std_logic_vector(3 downto 0);
        TARGFLASH0MEMATTR : OUT std_logic_vector(1 downto 0);
        TARGFLASH0EXREQ : OUT std_logic;
        TARGFLASH0HMASTER : OUT std_logic_vector(3 downto 0);
        TARGFLASH0HWDATA : OUT std_logic_vector(31 downto 0);
        TARGFLASH0HMASTLOCK : OUT std_logic;
        TARGFLASH0HREADYMUX : OUT std_logic;
        TARGFLASH0HAUSER : OUT std_logic;
        TARGFLASH0HWUSER : OUT std_logic_vector(3 downto 0);
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

        DAPSWDO : OUT std_logic;
        DAPSWDOEN : OUT std_logic;
        DAPTDO : OUT std_logic;
        DAPJTAGNSW : OUT std_logic;
        DAPNTDOEN : OUT std_logic;
        DAPSWDITMS : IN std_logic;
        DAPTDI : IN std_logic;
        DAPNTRST : IN std_logic;
        DAPSWCLKTCK : IN std_logic;

        TPIUTRACEDATA : OUT std_logic_vector(3 downto 0);
        TPIUTRACESWO : OUT std_logic;
        TPIUTRACECLK : OUT std_logic;
        FLASHERR : IN std_logic;
        FLASHINT : IN std_logic
     );
end MCU;


------------------------------USB20_PHY---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity USB20_PHY is
    GENERIC(
             DATABUS16_8 : bit := '0'; --Selects between 8 and 16 bit data transfers
             ADP_PRBEN : bit := '0'; --Enables/disables the ADP Probe comparator
             TEST_MODE : bit_vector := X"00000";--used for testing and debugging purpose
             HSDRV1 : bit := '0'; --High speed drive adjustment. Please connect to 0 for normal operation
             HSDRV0 : bit := '0';
             CLK_SEL : bit := '0';--Clock source selection signal. 0 to select external clock provided by the crystal connected on XIN, XOUT. 1 to select internal clock provided on INTCLK port
             M : bit_vector := X"0000";--M divider input data bits
             N : bit_vector := X"101000";--N divider input data bits
             C : bit_vector := X"01";--Control charge pump current input data bits, it supports from 30uA (00) to 60uA (11)
             FOC_LOCK : bit := '0'--0: LOCK is generated by PLL lock detector. 1: LOCK is always high(always lock)

    	      );
    PORT(
        DATAOUT : OUT std_logic_vector(15 downto 0);
        TXREADY : OUT std_logic;
        RXACTIVE : OUT std_logic;
        RXVLD : OUT std_logic;
        RXVLDH : OUT std_logic;
        CLK : OUT std_logic;
        RXERROR : OUT std_logic;
        LINESTATE : OUT std_logic_vector(1 downto 0);
        DP : INOUT std_logic;
        DM : INOUT std_logic;
        DATAIN : IN std_logic_vector(15 downto 0);
        TXVLD : IN std_logic;
        TXVLDH : IN std_logic;
        RESET : IN std_logic;
        SUSPENDM : IN std_logic;
        XCVRSEL : IN std_logic_vector(1 downto 0);
        TERMSEL : IN std_logic;
        OPMODE : IN std_logic_vector(1 downto 0);

        HOSTDIS : OUT std_logic;
        IDDIG : OUT std_logic;
        ADPPRB : OUT std_logic;
        ADPSNS : OUT std_logic;
        SESSVLD : OUT std_logic;
        VBUSVLD : OUT std_logic;
        RXDP : OUT std_logic;
        RXDM : OUT std_logic;
        RXRCV : OUT std_logic;
        IDPULLUP : IN std_logic;
        DPPD : IN std_logic;
        DMPD : IN std_logic;
        CHARGVBUS : IN std_logic;
        DISCHARGVBUS : IN std_logic;
        TXBITSTUFFEN : IN std_logic;
        TXBITSTUFFENH : IN std_logic;
        TXENN : IN std_logic;
        TXDAT : IN std_logic;
        TXSE0 : IN std_logic;
        FSLSSERIAL : IN std_logic;
        LBKERR : OUT std_logic;
        CLKRDY : OUT std_logic;
        INTCLK : IN std_logic;
        ID : INOUT std_logic;
        VBUS : INOUT std_logic;
        REXT : INOUT std_logic;
        XIN : IN std_logic;
        XOUT : INOUT std_logic;
        CLK480PAD : OUT std_logic;
        TEST : IN std_logic;
        SCANOUT1 : OUT std_logic;
        SCANOUT2 : OUT std_logic;
        SCANOUT3 : OUT std_logic;
        SCANOUT4 : OUT std_logic;
        SCANOUT5 : OUT std_logic;
        SCANOUT6 : OUT std_logic;
        SCANCLK : IN std_logic;
        SCANEN : IN std_logic;
        SCANMODE : IN std_logic;
        TRESETN : IN std_logic;
        SCANIN1 : IN std_logic;
        SCANIN2 : IN std_logic;
        SCANIN3 : IN std_logic;
        SCANIN4 : IN std_logic;
        SCANIN5 : IN std_logic;
        SCANIN6 : IN std_logic

     );
end USB20_PHY;



------------------------------FLASH256K---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FLASH256K is
    PORT(
        XADR : IN std_logic_vector(6 downto 0);
        YADR : IN std_logic_vector(5 downto 0);
        XE,YE,SE:IN std_logic;
        DIN : IN std_logic_vector(31 downto 0);
        ERASE,PROG,NVSTR: IN std_logic;
        DOUT : OUT std_logic_vector(31 downto 0)
     );
end FLASH256K;

----------------------------DHCENC ------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DHCENC is
    PORT (
	 CLKOUT : OUT std_logic;	
	 CLKOUTN : OUT std_logic;	
	 CE : IN std_logic;	
	 CLKIN : IN std_logic
    );
end DHCENC;

--------------------IODELAYC-----------------------------------
library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IODELAYC is
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
end IODELAYC;

---------------------DCC------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

ENTITY DCC IS
    GENERIC (
        DCC_EN : bit := '1';  --'1':enable dcc; '0': disable dcc
        FCLKIN : REAL := 50.0 --frequency of the clkin(M)
    );
    PORT (
        CLKOUT: OUT STD_LOGIC;
        CLKIN : IN STD_LOGIC
    );
END DCC;

------------------------------BANDGAP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BANDGAP is
    PORT (
         BGEN : in std_logic
    );
end BANDGAP;
------------------------------CLKDIV2---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity CLKDIV2 is
    GENERIC(
	     GSREN : STRING := "false" -- "false", "true"
    );
    PORT(
         HCLKIN : IN std_logic;
	     RESETN : IN std_logic;
	     CLKOUT : OUT std_logic
    );
end CLKDIV2;
------------------------------EMCU---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity EMCU is
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
end EMCU;
------------------------------FLASH64K---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FLASH64K is
    PORT(
        XADR : IN std_logic_vector(4 downto 0);
        YADR : IN std_logic_vector(5 downto 0);
        XE,YE,SE:IN std_logic;
        DIN : IN std_logic_vector(31 downto 0);
        ERASE,PROG,NVSTR: IN std_logic;
        SLEEP : IN std_logic;
        DOUT : OUT std_logic_vector(31 downto 0)
     );
end FLASH64K;
------------------------------FLASH64KZ---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FLASH64KZ is
    PORT(
        XADR : IN std_logic_vector(4 downto 0);
        YADR : IN std_logic_vector(5 downto 0);
        XE,YE,SE:IN std_logic;
        DIN : IN std_logic_vector(31 downto 0);
        ERASE,PROG,NVSTR: IN std_logic;
        DOUT : OUT std_logic_vector(31 downto 0)
     );
end FLASH64KZ;
--------------I3C---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity I3C is
	generic(
		ADDRESS : bit_vector := "0000000"
	);

	port(
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
end I3C;
--------------------IODELAYA-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IODELAYA is
	GENERIC (  C_STATIC_DLY : integer := 0); -- 0~127
	PORT (
		DI : IN std_logic;
		SDTAP : IN std_logic;
		SETN : IN std_logic;
		VALUE : IN std_logic;
		DO : OUT std_logic;
		DF : OUT std_logic
	);
end IODELAYA;
------------------------MIPI_IBUF_D------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPI_IBUF_D is
    PORT (
         OH, OL, OB : OUT std_logic;
         IO, IOB : INOUT std_logic;
         I, IB : IN std_logic;
         OEN, OENB, HSREN : IN std_logic
    );
end MIPI_IBUF_D;
------------------------------PLLVR---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity PLLVR is
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
end PLLVR;
------------------------------rPLL---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity rPLL is
    GENERIC(
             FCLKIN : STRING := "100.0"; --frequency of the clkin(M)
             DEVICE : STRING := "GW1N-4"; --"GW1N-1","GW1N-4","GW1N-9","GW1NR-4","GW1NR-9","GW1N-4B","GW1NR-4B","GW1NS-2","GW1NS-2C","GW1NZ-1","GW1NSR-2","GW1NSR-2C","GW1N-1S","GW1NSE-2C","GW1NRF-4B","GW2A-18","GW2A-55","GW2AR-18","GW2A-55C","GW2A-18C","GW2AR-18C","GW1N-9C","GW1NR-9C"
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
end rPLL;
------------------------------SPMI_DEBUG_GOWIN---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity SPMI_DEBUG_GOWIN is
    GENERIC(
             FUNCTION_CTRL : bit_vector := B"0000000"; 
             MSID_CLKSEL : bit_vector := B"0000000"; 
             RESPOND_DELAY : bit_vector := B"0000"; 
             SCLK_NORMAL_PERIOD : bit_vector := B"0000000"; 
             CLK_FREQ : bit_vector := B"0000000"; 
             SHUTDOWN_BY_ENABLE : bit := '0'; 
   
             DEBUG_SETTING : bit_vector := B"0000000000000000000000000000000000000000000000000"
    	      );
    PORT(
        ADDRO : OUT std_logic_vector(3 downto 0);
        DATAO : OUT std_logic_vector(7 downto 0);
        STATE : OUT std_logic_vector(15 downto 0);
        CMD : OUT std_logic_vector(3 downto 0);
        DEBUG : OUT std_logic_vector(10 downto 0);
        
        CLKEXT, ENEXT : IN std_logic;
        SDATA : INOUT std_logic;
        SCLK : INOUT std_logic;

        CLK, CE, RESETN, LOCRESET : IN std_logic;
        PA, SA, CA : IN std_logic;
        ADDRI : IN std_logic_vector(3 downto 0);
        DATAI : IN std_logic_vector(7 downto 0)
     );
end SPMI_DEBUG_GOWIN;
------------------------------SPMI---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity SPMI is
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
end SPMI;

------------------------MIPI_OBUF_A---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPI_OBUF_A is
    PORT (
         O : OUT std_logic;
         OB : OUT std_logic;
         I : IN std_logic;
         IB : IN std_logic;
         IL : IN std_logic;
         MODESEL : IN std_logic
    );
end MIPI_OBUF_A;
--------------------IODELAYB-----------------------------------
library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IODELAYB is
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
end IODELAYB;

---------------------OSCO------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OSCO IS
GENERIC (
    FREQ_DIV : integer := 100;  --2~128,only even num
    REGULATOR_EN : bit := '0'--'0':Powered by VCC!; ’1': Powered by regulator（only UV/LV）
);
PORT (
    OSCOUT: OUT STD_LOGIC;
    OSCEN : IN STD_LOGIC
);
END OSCO;
------------------------------PLLO---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all; 

entity PLLO is
    GENERIC(
        FCLKIN : STRING := "100.0"; --frequency of the clkin(M)
        DYN_IDIV_SEL : STRING := "FALSE";--TRUE:IDSEL; FALSE:IDIV_SEL
        IDIV_SEL : integer := 0;--Input divider IDIV, 0:1,1:2...63:64.  1~64
        DYN_FBDIV_SEL : STRING := "FALSE";
        FBDIV_SEL : integer := 0;--Feedback divider FBDIV,  0:1,1:2...63:64. 1~64
        
        DYN_ODIVA_SEL : STRING := "FALSE";--TRUE:ODSELA, FALSE:ODIVA_SEL
        ODIVA_SEL : integer := 6; --1~128,integer
        DYN_ODIVB_SEL : STRING := "FALSE";--TRUE:ODSELB, FALSE:ODIVB_SEL
        ODIVB_SEL : integer := 6;--1~128,integer
        DYN_ODIVC_SEL : STRING := "FALSE";--TRUE:ODSELC, FALSE:ODIVC_SEL
        ODIVC_SEL : integer := 6;--1~128,integer
        DYN_ODIVD_SEL : STRING := "FALSE";--TRUE:ODSELD, FALSE:ODIVD_SEL
        ODIVD_SEL : integer := 6;--1~128,integer
      
        CLKOUTA_EN : STRING := "TRUE";--"TRUE","FALSE"
        CLKOUTB_EN : STRING := "TRUE";--"TRUE","FALSE"
        CLKOUTC_EN : STRING := "TRUE";--"TRUE","FALSE"
        CLKOUTD_EN : STRING := "TRUE";--"TRUE","FALSE"
        
        DYN_DTA_SEL : STRING := "FALSE";--TRUE:DTA; FALSE:CLKOUTA_DT_DIR & CLKOUTA_DT_STEP
        DYN_DTB_SEL : STRING := "FALSE";--TRUE:DTB; FALSE:CLKOUTB_DT_DIR & CLKOUTB_DT_STEP
        CLKOUTA_DT_DIR : bit := '1'; -- CLKOUTA dutycycle adjust direction. '1': + ; '0': -
        CLKOUTB_DT_DIR : bit := '1'; -- CLKOUTB dutycycle adjust direction. '1': + ; '0': -
        CLKOUTA_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step
        CLKOUTB_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step

        CLKA_IN_SEL  : bit_vector := "00";--DIVA input source select. 0x:from VCO;11:from CLKIN
        CLKA_OUT_SEL : bit := '0';--CLKOUTA output select. 0:DIVA output; 1:CLKIN
        CLKB_IN_SEL  : bit_vector := "00";--DIVB input source select. 0x:from VCO;10:from CLKCAS_A;11:from CLKIN
        CLKB_OUT_SEL : bit := '0';--CLKOUTB output select. 0:DIVB output; 1:CLKIN
        CLKC_IN_SEL  : bit_vector := "00";--DIVC input source select. 0x:from VCO;10:from CLKCAS_B;11:from CLKIN
        CLKC_OUT_SEL : bit := '0';--CLKOUTC output select. 0:DIVC output; 1:CLKIN
        CLKD_IN_SEL  : bit_vector := "00";--DIVD input source select. 0x:from VCO;10:from CLKCAS_C;11:from CLKIN
        CLKD_OUT_SEL : bit := '0';--CLKOUTD output select. 0:DIVD output; 1:CLKIN

        CLKFB_SEL : STRING := "INTERNAL"; -- "INTERNAL", "EXTERNAL";

        DYN_DPA_EN : STRING := "FALSE";--dynamic phaseshift adjustment Enable."TRUE","FALSE"

        DYN_PSB_SEL : STRING := "FALSE";--"TRUE": select dynamic dpa signal for phase shift B(DYN_DPA_EN="TRUE"); "FALSE":select PSB_COARSE & PSB_FINE as the static control signal for phase shift B
        DYN_PSC_SEL : STRING := "FALSE";--"TRUE": select dynamic dpa signal for phase shift C(DYN_DPA_EN="TRUE"); "FALSE":select PSC_COARSE & PSC_FINE as the static control signal for phase shift C
        DYN_PSD_SEL : STRING := "FALSE";--"TRUE": select dynamic dpa signal for phase shift D(DYN_DPA_EN="TRUE"); "FALSE":select PSD_COARSE & PSD_FINE as the static control signal for phase shift D

        PSB_COARSE : integer := 1;--1~128       
        PSB_FINE : integer := 0;--0~7
        PSC_COARSE : integer := 1;--1~128        
        PSC_FINE : integer := 0;--0~7
        PSD_COARSE : integer := 1;--1~128        
        PSD_FINE : integer := 0;--0~7

        DTMS_ENB : STRING := "FALSE";--"FALSE":fixed 50% duty cycle for case odivb=2~128; "TRUE":set PSB_COARSE & PSB_FINE as duty edge when DYN_DPA_EN="TRUE" for case odivb=2~128
        DTMS_ENC : STRING := "FALSE";--"FALSE":fixed 50% duty cycle for case odivc=2~128; "TRUE":set PSC_COARSE & PSC_FINE as duty edge when DYN_DPA_EN="TRUE" for case odivc=2~128
        DTMS_END : STRING := "FALSE";--"FALSE":fixed 50% duty cycle for case odivd=2~128; "TRUE":set PSD_COARSE & PSD_FINE as duty edge when DYN_DPA_EN="TRUE" for case odivd=2~128

        RESET_I_EN : STRING := "FALSE";--"TRUE","FALSE". Enable RESET_I through the dedicated signal from ciu.
        RESET_S_EN : STRING := "FALSE";--"TRUE","FALSE". Enable RESET_S through the dedicated signal from ciu.

        DYN_ICP_SEL : STRING := "FALSE";--TRUE:ICPSEL; FALSE:ICP_SEL
        ICP_SEL : std_logic_vector(4 downto 0) := "XXXXX";
        DYN_RES_SEL : STRING := "FALSE";--TRUE:LPFRES; FALSE:LPR_REF
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
end PLLO;


-----------------ELVDS_IBUF_MIPI---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ELVDS_IBUF_MIPI is
    PORT(
        OH : OUT std_logic;
        OL : OUT std_logic;
        I : IN std_logic;
        IB : IN std_logic
        );
end ELVDS_IBUF_MIPI;

----------------------IBUF_R-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IBUF_R is
    PORT (
    	O : OUT std_logic;
    	I : IN std_logic;
        RTEN : IN std_logic
        
    );
end IBUF_R;

-----------------ELVDS_IBUF_R---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ELVDS_IBUF_R is
    PORT(
        O : OUT std_logic;
        I : IN std_logic;
        IB : IN std_logic;
        RTEN : IN std_logic
    );
end ELVDS_IBUF_R;

----------------------------IOBUF_R--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IOBUF_R is
    PORT (
    	O  : OUT   std_logic;
    	IO : INOUT std_logic;
     	I  : IN    std_logic;
        RTEN  : IN    std_logic;
	    OEN : IN    std_logic
    );
end IOBUF_R;

-----------------ELVDS_IOBUF_R---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ELVDS_IOBUF_R is
    PORT (
    	O  : OUT std_logic;
    	IOB : INOUT std_logic;
        IO : INOUT std_logic;
     	I  : IN std_logic;
        RTEN : IN std_logic;
	    OEN : IN  std_logic
    );
end ELVDS_IOBUF_R;

---------------------DCCA------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

ENTITY DCCG IS
    GENERIC (
        DCC_MODE : bit_vector := "00";  --"0x": Buffered; "10": +80ps; "11": -80ps;
        FCLKIN : REAL := 50.0 --frequency of the clkin(M)
    );
    PORT (
        CLKOUT: OUT STD_LOGIC;
        CLKIN : IN STD_LOGIC
    );
END DCCG;

------------------------------FLASH96KA---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FLASH96KA is
    PORT(
        XADR : IN std_logic_vector(5 downto 0);
        YADR : IN std_logic_vector(5 downto 0);
        XE,YE,SE:IN std_logic;
        DIN : IN std_logic_vector(31 downto 0);
        ERASE,PROG,NVSTR: IN std_logic;
        SLEEP : IN std_logic;
        DOUT : OUT std_logic_vector(31 downto 0)
     );
end FLASH96KA;

------------------------------MIPI_DPHY_RX---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all; 

entity MIPI_DPHY_RX is
    GENERIC(
        ALIGN_BYTE : bit_vector := "00011101";
        --DESKEW_HALF_OPENING : bit_vector := "01101";
        --DESKEW_M : bit_vector := "101";
        --EN_CLKB1X : bit := '1';
        --EQ_NBIAS_LANE0 : bit_vector := "1100";
        --EQ_NBIAS_LANE1 : bit_vector := "1100";
        --EQ_NBIAS_LANE2 : bit_vector := "1100";
        --EQ_NBIAS_LANE3 : bit_vector := "1100";
        --EQ_NBIAS_CK : bit_vector := "1100";
        --EQ_PBIAS_LANE0 : bit_vector := "0100";
        --EQ_PBIAS_LANE1 : bit_vector := "0100";
        --EQ_PBIAS_LANE2 : bit_vector := "0100";
        --EQ_PBIAS_LANE3 : bit_vector := "0100";
        --EQ_PBIAS_CK : bit_vector := "0100";
        --EQ_SDC_LANE0 : bit_vector := "00";
        --EQ_SD_LANE0 : bit_vector := "011";
        --EQ_SDC_LANE1 : bit_vector := "00";
        --EQ_SD_LANE1 : bit_vector := "011";
        --EQ_SDC_LANE2 : bit_vector := "00";
        --EQ_SD_LANE2 : bit_vector := "011";
        --EQ_SDC_LANE3 : bit_vector := "00";
        --EQ_SD_LANE3 : bit_vector := "011";
        --EQ_SDC_CK : bit_vector := "00";
        --EQ_SD_CK : bit_vector := "011";
        --EQ_ZLD_LANE0 : bit_vector := "0011";
        --EQ_ZLD_LANE1 : bit_vector := "0011";
        --EQ_ZLD_LANE2 : bit_vector := "0011";
        --EQ_ZLD_LANE3 : bit_vector := "0011";
        --EQ_ZLD_CK : bit_vector := "0011";
        --HSRX_DUTY_SNK_LANE0  : bit_vector := "1000";
        --HSRX_DUTY_SNK_LANE1  : bit_vector := "1000";
        --HSRX_DUTY_SNK_LANE2  : bit_vector := "1000";
        --HSRX_DUTY_SNK_LANE3  : bit_vector := "1000";
        --HSRX_DUTY_SNK_CK  : bit_vector := "1000";
        --HSRX_EQ_EN_LANE0  : bit := '1';
        --HSRX_EQ_EN_LANE1  : bit := '1';
        --HSRX_EQ_EN_LANE2  : bit := '1';
        --HSRX_EQ_EN_LANE3  : bit := '1';
        --HSRX_EQ_EN_CK  : bit := '1';
        MIPI_LANE0_EN  : bit := '0';
        MIPI_LANE1_EN  : bit := '0';
        MIPI_LANE2_EN  : bit := '0';
        MIPI_LANE3_EN  : bit := '0';
        MIPI_CK_EN  : bit := '1';
        --HSRX_ODT_EN  : bit := '1';
        --HSRX_IBIAS : bit_vector := "0011";
        --LPRX_EN  : bit := '1';
        --LPRX_HYST_EN  : bit := '1';
        --LPTX_EN  : bit := '1';
        --LPRX_ULP  : bit := '1';
        --SYNC_CLK_SEL : bit := '0';
        --HSRX_STOP_EN : bit := '0';
        --HYST_NCTL : bit_vector := "01";
        --HYST_PCTL : bit_vector := "01";
        --RX_ODT_TRIM_LANE0 : bit_vector := "0111";
        --RX_ODT_TRIM_LANE1 : bit_vector := "0111";
        --RX_ODT_TRIM_LANE2 : bit_vector := "0111";
        --RX_ODT_TRIM_LANE3 : bit_vector := "0111";
        --RX_ODT_TRIM_CK : bit_vector := "0111";
        --LPTX_ODA : bit := '0';
		SYNC_CLK_SEL : bit := '0'
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
    
end MIPI_DPHY_RX;

------------------------------CLKDIVG---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity CLKDIVG is
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
end CLKDIVG;

------------------OSCW----------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OSCW IS
GENERIC (
    FREQ_DIV : integer := 80  --2~128,only even num
);
PORT (
    OSCOUT: OUT STD_LOGIC
);
END OSCW;

------------------OTP----------------------------
LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity OTP is
    PORT (
    	 DOUT : OUT std_logic;
    	 CSB : IN std_logic;
    	 SCLK : IN std_logic
    );
end OTP;

------------------SAMB----------------------------
LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SAMB is
    PORT (
    	 SPIAD : IN std_logic_vector(23 downto 0);
    	 LOADN_SPIAD : IN std_logic
    );
end SAMB;

------------------------------PWRGRD---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PWRGRD is
    PORT (
         PDEN : in std_logic
    );
end PWRGRD;

------------------------------TLVDS_OEN_BK---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TLVDS_OEN_BK is
    GENERIC(
	     OEN_BANK : STRING := "0" -- "0", "3", "4", "5"
    );
    PORT (
         OEN : in std_logic
    );
end TLVDS_OEN_BK;

-------------------------------------------------------------------
-- below entity are not primitvie, for black box in synthesising
-------------------------------------------------------------------

--------------------------activeFlash -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity activeFlash is
    PORT (
   	 O_active_flash_ready : out std_logic;
   	 I_active_flash_holdn : in std_logic;
   	 I_active_flash_sclk : in std_logic
    );
attribute syn_gowin_black_box : boolean;
attribute syn_gowin_black_box of activeFlash : entity is true;
attribute syn_noprune : integer;
attribute syn_noprune of activeFlash: entity is 1;
end activeFlash;
