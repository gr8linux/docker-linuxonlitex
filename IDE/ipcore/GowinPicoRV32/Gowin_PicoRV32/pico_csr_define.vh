
/************************************************************
add by xuqingsong
definition of csr addresses
************************************************************/

parameter [11:0] CSR_CYCLE        = 12'hc00;
parameter [11:0] CSR_TIME         = 12'hc01;
parameter [11:0] CSR_INSTRET      = 12'hc02;

parameter [11:0] CSR_CYCLEH       = 12'hc80;
parameter [11:0] CSR_TIMEH        = 12'hc81;
parameter [11:0] CSR_INSTRETH     = 12'hc82;

parameter [11:0] CSR_DCSR         = 12'h7b0;
parameter [11:0] CSR_DPC          = 12'h7b1;
parameter [11:0] CSR_DSCRATCH     = 12'h7b2;

parameter [11:0] CSR_MVENDORID    = 12'hf11;
parameter [11:0] CSR_MARCHID      = 12'hf12;
parameter [11:0] CSR_MIMPID       = 12'hf13;
parameter [11:0] CSR_MHARTID      = 12'hf14;

parameter [11:0] CSR_MSTATUS      = 12'h300;
parameter [11:0] CSR_MISA         = 12'h301;
parameter [11:0] CSR_MIE          = 12'h304;
parameter [11:0] CSR_MTVEC        = 12'h305;

parameter [11:0] CSR_MSCRATCH     = 12'h340;
parameter [11:0] CSR_MEPC         = 12'h341;
parameter [11:0] CSR_MCAUSE       = 12'h342;
parameter [11:0] CSR_MTVAL        = 12'h343;
parameter [11:0] CSR_MIP          = 12'h344;
