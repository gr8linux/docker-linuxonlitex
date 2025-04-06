`include "define.v"
module ae250_exp(
	CLKX,
	CLK,

	LED1,
	LED2,
	LED3,
	LED4,

	KEY1,
	KEY2,
	KEY3,
	KEY4,

	SW1,
	SW2,
	SW3,
	SW4,
//FPGA-JTAG-----|---FTDI UART
	JTAG_TDI,//RXD
	JTAG_TDO,//RTSn
	JTAG_TMS,//CTSn
	JTAG_TCK,//TXD

	SPI_CS,
	SPI_CLK,
	SPI_MISO,
	SPI_MOSI,

	J11_1,
	J11_2,
	J11_5,
	J11_6,
	J11_9,
	J11_10,
	J11_13,
	J11_14,
	J11_17,
	J11_18,

	J10_1,
	J10_2,
	J10_5,
	J10_6,
	J10_9,
	J10_10,
	J10_13,
	J10_14,
	J10_17,
	J10_18,
//mother card  | daught card
	J4_5,   //J6_1
	J4_6,   //NC
	J4_7,   //J6_3
	J4_8,   //J6_2
	J4_9,   //J5_4
	J4_10,  //J6_4
	J4_11,  //J5_1
	J4_12,  //J5_3
	J4_13,  //J8_7
	J4_14,   //J8_8
	J4_15,  //J8_5
	J4_16,  //J8_6
	J4_17,  //J8_3
	J4_18,  //J8_4
	J4_19,  //J8_2
	J4_20,  //J8_1
	J4_21,  //J9_10
	J4_22,  //J9_9
	J4_23,  //J9_8
	J4_24,  //J9_7
	J4_25,  //J9_6
	J4_26,  //J9_5
	J4_27,  //J9_2
	J4_28,  //J9_1
//mother card  | daught card
	J3_3,   //trstn
	J3_4,   //NC
	J3_5,   //tdi
	J3_6,   //NC
	J3_7,   //tms
	J3_8,   //extFlash_sspi2_sio3/holdn
	J3_9,   //tck
	J3_10,  //extFlash_spi2_mosi/sio1
	J3_11,  //NC
	J3_12,  //extFlash_spi2_sclk
	J3_13,  //tdo
	J3_14,  //extFlash_spi2_miso/sio0
	J3_15,  //srstn
	J3_16,  //extFlash_spi2_cs
	J3_17,  //NC
	J3_18   //extFlash_sspi2_sio2/WPn

);

input   CLKX;
input   CLK;

output  LED1;
output  LED2;
output  LED3;
output  LED4;

input   KEY1;
input   KEY2;
input   KEY3;
input   KEY4;

input   SW1;
input   SW2;
input   SW3;
input   SW4;
//FPGA-JTAG-----|---FTDI UART
inout   JTAG_TDI;//RXD
inout   JTAG_TDO;//RTSn
inout   JTAG_TMS;//CTSn
inout   JTAG_TCK;//TXD

inout   SPI_CS;
inout   SPI_CLK;
inout   SPI_MISO;
inout   SPI_MOSI;

inout   J11_1;
inout   J11_2;
inout   J11_5;
inout   J11_6;
inout   J11_9;
inout   J11_10;
inout   J11_13;
inout   J11_14;
inout   J11_17;
inout   J11_18;

inout   J10_1;
inout   J10_2;
inout   J10_5;
inout   J10_6;
inout   J10_9;
inout   J10_10;
inout   J10_13;
inout   J10_14;
inout   J10_17;
inout   J10_18;
//mother card  | daught card
output   J4_5;   //J6_1
inout   J4_6;   //NC
inout   J4_7;   //J6_3
inout   J4_8;   //J6_2
inout   J4_9;   //J5_4
inout   J4_10;  //J6_4
inout   J4_11;  //J5_1
inout   J4_12;  //J5_3
inout   J4_13;  //J8_7
inout   J4_14;   //J8_8
inout   J4_15;  //J8_5
inout   J4_16;  //J8_6
inout   J4_17;  //J8_3
inout   J4_18;  //J8_4
inout   J4_19;  //J8_2
inout   J4_20;  //J8_1
inout   J4_21;  //J9_10
inout   J4_22;  //J9_9
inout   J4_23;  //J9_8
inout   J4_24;  //J9_7
inout   J4_25;  //J9_6
inout   J4_26;  //J9_5
inout   J4_27;  //J9_2
inout   J4_28;  //J9_1
//mother card  | daught card
inout   J3_3;   //trstn
inout   J3_4;   //NC
inout   J3_5;   //tdi
inout   J3_6;   //NC
inout   J3_7;   //tms
inout   J3_8;   //extFlash_sspi2_sio3/holdn
inout   J3_9;   //tck
inout   J3_10;  //extFlash_spi2_mosi/sio1
inout   J3_11;  //NC
inout   J3_12;  //extFlash_spi2_sclk
inout   J3_13;  //tdo
inout   J3_14;  //extFlash_spi2_miso/sio0
inout   J3_15;  //srstn
inout   J3_16;  //extFlash_spi2_cs
inout   J3_17;  //NC
inout   J3_18;  //extFlash_sspi2_sio2/WPn



wire    hwRstn=KEY1;
wire    por =KEY1;
wire    sysClk;
wire    rtcClk;

RiscV_AE250_Top iChip (

        .X_om           (),
        .X_pd_pwr_off   (),
        .X_aopd_por_b   (por),
        .X_mpd_pwr_off  (),
        .X_osclin       (rtcClk),
        .X_osclio       (),
        .X_rtc_wakeup   (),
        .X_wakeup_in    (1'b0),
        .X_tck          (J3_9),
`ifdef AE250_INOUT_SUPPORT
		.X_oschin       (sysClk),
		.X_oschio       (),
        .X_hw_rstn      (hwRstn),
        .X_por_b        (por),
    `ifndef AE250_JTAG_TWOWIRE
	    .X_tms          (J3_7),
        .X_tdi          (J3_5),
	    .X_tdo          (J3_13),
	    .X_trst         (J3_3),
    `endif
    `ifdef AE250_SPI1_SUPPORT
        .X_spi1_clk (),
    	.X_spi1_csn (),
    	.X_spi1_miso (),
    	.X_spi1_mosi (),
        `ifdef ATCSPI200_1_QUADSPI_SUPPORT
	    .X_spi1_holdn (),
	    .X_spi1_wpn (),
        `endif
    `endif
    `ifdef AE250_SPI2_SUPPORT
        .X_spi2_clk (),
    	.X_spi2_csn (),
    	.X_spi2_miso (),
    	.X_spi2_mosi (),
        `ifdef ATCSPI200_2_QUADSPI_SUPPORT
	    .X_spi2_holdn (),
	    .X_spi2_wpn (),
        `endif
    `endif
    `ifdef AE250_SPI3_SUPPORT
        .X_spi3_clk (),
    	.X_spi3_csn (),
    	.X_spi3_miso (),
    	.X_spi3_mosi (),
        `ifdef ATCSPI200_3_QUADSPI_SUPPORT
	    .X_spi3_holdn (),
	    .X_spi3_wpn (),
        `endif
    `endif
    `ifdef AE250_SPI4_SUPPORT
        .X_spi4_clk (),
    	.X_spi4_csn (),
    	.X_spi4_miso (),
    	.X_spi4_mosi (),
        `ifdef ATCSPI200_4_QUADSPI_SUPPORT
	    .X_spi4_holdn (),
	    .X_spi4_wpn (),
        `endif
    `endif
    `ifdef AE250_I2C_1_SUPPORT
        .X_i2c1_scl (),
	    .X_i2c1_sda (),
    `endif
    `ifdef AE250_I2C_2_SUPPORT
        .X_i2c2_scl (),
	    .X_i2c2_sda (),
    `endif
    `ifdef AE250_I2C_3_SUPPORT
        .X_i2c3_scl (),
	    .X_i2c3_sda (),
    `endif
    `ifdef AE250_I2C_4_SUPPORT
        .X_i2c4_scl (),
	    .X_i2c4_sda (),
    `endif
    `ifdef AE250_UART1_SUPPORT
	    .X_uart1_ctsn (),
	    .X_uart1_rtsn (),
        .X_uart1_dcdn (),
	    .X_uart1_dsrn (),
	    .X_uart1_dtrn (),
	    .X_uart1_out1n (),
	    .X_uart1_out2n (),
	    .X_uart1_rin (),
	    .X_uart1_rxd (),
	    .X_uart1_txd (),
    `endif
    `ifdef AE250_UART2_SUPPORT
	    .X_uart2_ctsn (),
	    .X_uart2_rtsn (),
        .X_uart2_dcdn (),
	    .X_uart2_dsrn (),
	    .X_uart2_dtrn (),
	    .X_uart2_out1n (),
	    .X_uart2_out2n (),
	    .X_uart2_rin (),
	    .X_uart2_rxd (),
	    .X_uart2_txd (),
    `endif
    `ifdef AE250_UART3_SUPPORT
	    .X_uart3_ctsn (),
	    .X_uart3_rtsn (),
        .X_uart3_dcdn (),
	    .X_uart3_dsrn (),
	    .X_uart3_dtrn (),
	    .X_uart3_out1n (),
	    .X_uart3_out2n (),
	    .X_uart3_rin (),
	    .X_uart3_rxd (),
	    .X_uart3_txd (),
    `endif
    `ifdef AE250_UART4_SUPPORT
	    .X_uart4_ctsn (),
	    .X_uart4_rtsn (),
        .X_uart4_dcdn (),
	    .X_uart4_dsrn (),
	    .X_uart4_dtrn (),
	    .X_uart4_out1n (),
	    .X_uart4_out2n (),
	    .X_uart4_rin (),
	    .X_uart4_rxd (),
	    .X_uart4_txd (),
    `endif
    `ifdef AE250_PIT1_SUPPORT
        .X_pit1_pwm_ch0 (),
        `ifdef ATCPIT100_1_CH1_SUPPORT
	    .X_pit1_pwm_ch1 (),
        `endif
        `ifdef ATCPIT100_1_CH2_SUPPORT
	    .X_pit1_pwm_ch2 (),
        `endif
        `ifdef ATCPIT100_1_CH3_SUPPORT
	    .X_pit1_pwm_ch3 (),
        `endif
    `endif
    `ifdef AE250_PIT2_SUPPORT
        .X_pit2_pwm_ch0 (),
        `ifdef ATCPIT100_2_CH1_SUPPORT
	    .X_pit2_pwm_ch1 (),
        `endif
        `ifdef ATCPIT100_2_CH2_SUPPORT
	    .X_pit2_pwm_ch2 (),
        `endif
        `ifdef ATCPIT100_2_CH3_SUPPORT
	    .X_pit2_pwm_ch3 (),
        `endif
    `endif
    `ifdef AE250_GPIO_SUPPORT
        .X_gpio (),
        .gpio_pullup (),
        .gpio_pulldown (),
    `endif
`else
		    .T_hw_rstn (hwRstn),
		    .T_por_b (por),
            .T_osch (sysClk),
		    .pin_tms_in (),
		    .pin_tms_out (),
		    .pin_tms_out_en (),
		    .pin_trst_in (),
		    .pin_trst_out (),
		    .pin_trst_out_en (),
		    .pin_tdi_in (),
		    .pin_tdi_out (),
		    .pin_tdi_out_en (),
		    .pin_tdo_in (),
		    .pin_tdo_out (),
		    .pin_tdo_out_en (),

    `ifdef AE250_SPI1_SUPPORT
    		.spi1_clk_in (),
    		.spi1_csn_in (),
    		.spi1_miso_in (),
    		.spi1_mosi_in (),
    		.spi1_clk_out (),
    		.spi1_clk_oe (),
    		.spi1_csn_out (),
    		.spi1_csn_oe (),
    		.spi1_miso_out (),
    		.spi1_miso_oe (),
    		.spi1_mosi_out (),
    		.spi1_mosi_oe (),
            `ifdef ATCSPI200_1_QUADSPI_SUPPORT
            .spi1_holdn_in (),
    		.spi1_wpn_in (),
    		.spi1_holdn_out (),
    		.spi1_holdn_oe (),
    		.spi1_wpn_out (),
    		.spi1_wpn_oe (),
            `endif
    `endif
    `ifdef AE250_SPI2_SUPPORT
    		.spi2_clk_in (),
    		.spi2_csn_in (),
    		.spi2_miso_in (),
    		.spi2_mosi_in (),
    		.spi2_clk_out (),
    		.spi2_clk_oe (),
    		.spi2_csn_out (),
    		.spi2_csn_oe (),
    		.spi2_miso_out (),
    		.spi2_miso_oe (),
    		.spi2_mosi_out (),
    		.spi2_mosi_oe (),
            `ifdef ATCSPI200_2_QUADSPI_SUPPORT
            .spi2_holdn_in (),
    		.spi2_wpn_in (),
    		.spi2_holdn_out (),
    		.spi2_holdn_oe (),
    		.spi2_wpn_out (),
    		.spi2_wpn_oe (),
            `endif
    `endif
    `ifdef AE250_SPI3_SUPPORT
    		.spi3_clk_in (),
    		.spi3_csn_in (),
    		.spi3_miso_in (),
    		.spi3_mosi_in (),
    		.spi3_clk_out (),
    		.spi3_clk_oe (),
    		.spi3_csn_out (),
    		.spi3_csn_oe (),
    		.spi3_miso_out (),
    		.spi3_miso_oe (),
    		.spi3_mosi_out (),
    		.spi3_mosi_oe (),
            `ifdef ATCSPI200_3_QUADSPI_SUPPORT
    		.spi3_holdn_in (),
    		.spi3_wpn_in (),
    		.spi3_holdn_out (),
    		.spi3_holdn_oe (),
    		.spi3_wpn_out (),
    		.spi3_wpn_oe (),
            `endif
    `endif
    `ifdef AE250_SPI4_SUPPORT
            .spi4_clk_in (),
    		.spi4_csn_in (),
    		.spi4_miso_in (),
    		.spi4_mosi_in (),
    		.spi4_clk_out (),
    		.spi4_clk_oe (),
    		.spi4_csn_out (),
    		.spi4_csn_oe (),
    		.spi4_miso_out (),
    		.spi4_miso_oe (),
    		.spi4_mosi_out (),
    		.spi4_mosi_oe (),
            `ifdef ATCSPI200_4_QUADSPI_SUPPORT
    		.spi4_holdn_in (),
    		.spi4_wpn_in (),
    		.spi4_holdn_out (),
    		.spi4_holdn_oe (),
    		.spi4_wpn_out (),
    		.spi4_wpn_oe (),
            `endif
    `endif
    `ifdef AE250_I2C_1_SUPPORT
    		.i2c1_scl_in (),
    		.i2c1_sda_in (),
    		.i2c1_scl (),
    		.i2c1_sda (),
    `endif
    `ifdef AE250_I2C_2_SUPPORT
    		.i2c2_scl_in (),
    		.i2c2_sda_in (),
    		.i2c2_scl (),
    		.i2c2_sda (),
    `endif
    `ifdef AE250_I2C_3_SUPPORT
            .i2c3_scl_in (),
    		.i2c3_sda_in (),
    		.i2c3_scl (),
    		.i2c3_sda (),
    `endif
    `ifdef AE250_I2C_4_SUPPORT
    		.i2c4_scl_in (),
    		.i2c4_sda_in (),
    		.i2c4_scl (),
    		.i2c4_sda (),
    `endif
    `ifdef AE250_UART1_SUPPORT          
    		.uart1_txd (),
    		.uart1_rtsn (),
    		.uart1_rxd (),
    		.uart1_ctsn (),
    		.uart1_dsrn (),
    		.uart1_dcdn (),
    		.uart1_rin (),
    		.uart1_dtrn (),
    		.uart1_out1n (),
    		.uart1_out2n (),
    `endif
    `ifdef AE250_UART2_SUPPORT  
    		.uart2_txd (),
    		.uart2_rtsn (),
    		.uart2_rxd (),
    		.uart2_ctsn (),
    		.uart2_dcdn (),
    		.uart2_dsrn (),
    		.uart2_rin (),
    		.uart2_dtrn (),
    		.uart2_out1n (),
    		.uart2_out2n (),
    `endif
    `ifdef AE250_UART3_SUPPORT  
    		.uart3_txd (),
    		.uart3_rtsn (),
    		.uart3_rxd (),
    		.uart3_ctsn (),
    		.uart3_dcdn (),
    		.uart3_dsrn (),
    		.uart3_rin (),
    		.uart3_dtrn (),
    		.uart3_out1n (),
    		.uart3_out2n (),
    `endif
    `ifdef AE250_UART4_SUPPORT  
    		.uart4_txd (),
    		.uart4_rtsn (),
    		.uart4_rxd (),
    		.uart4_ctsn (),
    		.uart4_dcdn (),
    		.uart4_dsrn (),
    		.uart4_rin (),
    		.uart4_dtrn (),
    		.uart4_out1n (),
    		.uart4_out2n (),
    `endif
    `ifdef AE250_PIT1_SUPPORT
            .pit1_ch0_pwm (),
    		.pit1_ch0_pwmoe (),
        `ifdef ATCPIT100_1_CH1_SUPPORT
    		.pit1_ch1_pwm (),
    		.pit1_ch1_pwmoe (),
        `endif
        `ifdef ATCPIT100_1_CH2_SUPPORT
    		.pit1_ch2_pwm (),
    		.pit1_ch2_pwmoe (),
        `endif
        `ifdef ATCPIT100_1_CH3_SUPPORT
    		.pit1_ch3_pwm (),
    		.pit1_ch3_pwmoe (),
        `endif
    `endif
    `ifdef AE250_PIT2_SUPPORT
            .pit2_ch0_pwm (),
    		.pit2_ch0_pwmoe (),
        `ifdef ATCPIT100_2_CH1_SUPPORT
    		.pit2_ch1_pwm (),
    		.pit2_ch1_pwmoe (),
        `endif
        `ifdef ATCPIT100_2_CH2_SUPPORT
    		.pit2_ch2_pwm (),
    		.pit2_ch2_pwmoe (),
        `endif
        `ifdef ATCPIT100_2_CH3_SUPPORT
    		.pit2_ch3_pwm (),
    		.pit2_ch3_pwmoe (),
        `endif
    `endif
    `ifdef AE250_GPIO_SUPPORT
    		.gpio_in (),
    		.gpio_oe (),
    		.gpio_out (),
    		.gpio_pulldown (),
    		.gpio_pullup (),
    `endif
`endif
`ifdef AE250_AHB_EXT 
        .hclk_o (),
        .hresetn_o (),
`endif
`ifdef AE250_MATRIX_EXTMST1
        .exthm1_haddr (),
        .exthm1_hburst (),
        .exthm1_hprot (),
        .exthm1_hrdata (),
        .exthm1_hready (),
        .exthm1_hresp (),
        .exthm1_hsize (),
        .exthm1_htrans (),
        .exthm1_hwrite (),
        .exthm1_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST2
        .exthm2_haddr (),
        .exthm2_hburst (),
        .exthm2_hprot (),
        .exthm2_hrdata (),
        .exthm2_hready (),
        .exthm2_hresp (),
        .exthm2_hsize (),
        .exthm2_htrans (),
        .exthm2_hwrite (),
        .exthm2_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST3
        .exthm3_haddr (),
        .exthm3_hburst (),
        .exthm3_hprot (),
        .exthm3_hrdata (),
        .exthm3_hready (),
        .exthm3_hresp (),
        .exthm3_hsize (),
        .exthm3_htrans (),
        .exthm3_hwrite (),
        .exthm3_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST4
        .exthm4_haddr (),
        .exthm4_hburst (),
        .exthm4_hprot (),
        .exthm4_hrdata (),
        .exthm4_hready (),
        .exthm4_hresp (),
        .exthm4_hsize (),
        .exthm4_htrans (),
        .exthm4_hwrite (),
        .exthm4_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST5
        .exthm5_haddr (),
        .exthm5_hburst (),
        .exthm5_hprot (),
        .exthm5_hrdata (),
        .exthm5_hready (),
        .exthm5_hresp (),
        .exthm5_hsize (),
        .exthm5_htrans (),
        .exthm5_hwrite (),
        .exthm5_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST6
        .exthm6_haddr (),
        .exthm6_hburst (),
        .exthm6_hprot (),
        .exthm6_hrdata (),
        .exthm6_hready (),
        .exthm6_hresp (),
        .exthm6_hsize (),
        .exthm6_htrans (),
        .exthm6_hwrite (),
        .exthm6_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST7
        .exthm7_haddr (),
        .exthm7_hburst (),
        .exthm7_hprot (),
        .exthm7_hrdata (),
        .exthm7_hready (),
        .exthm7_hresp (),
        .exthm7_hsize (),
        .exthm7_htrans (),
        .exthm7_hwrite (),
        .exthm7_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST8
        .exthm8_haddr (),
        .exthm8_hburst (),
        .exthm8_hprot (),
        .exthm8_hrdata (),
        .exthm8_hready (),
        .exthm8_hresp (),
        .exthm8_hsize (),
        .exthm8_htrans (),
        .exthm8_hwrite (),
        .exthm8_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST9
        .exthm9_haddr (),
        .exthm9_hburst (),
        .exthm9_hprot (),
        .exthm9_hrdata (),
        .exthm9_hready (),
        .exthm9_hresp (),
        .exthm9_hsize (),
        .exthm9_htrans (),
        .exthm9_hwrite (),
        .exthm9_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST10
        .exthm10_haddr (),
        .exthm10_hburst (),
        .exthm10_hprot (),
        .exthm10_hrdata (),
        .exthm10_hready (),
        .exthm10_hresp (),
        .exthm10_hsize (),
        .exthm10_htrans (),
        .exthm10_hwrite (),
        .exthm10_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST11
        .exthm11_haddr (),
        .exthm11_hburst (),
        .exthm11_hprot (),
        .exthm11_hrdata (),
        .exthm11_hready (),
        .exthm11_hresp (),
        .exthm11_hsize (),
        .exthm11_htrans (),
        .exthm11_hwrite (),
        .exthm11_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST12
        .exthm12_haddr (),
        .exthm12_hburst (),
        .exthm12_hprot (),
        .exthm12_hrdata (),
        .exthm12_hready (),
        .exthm12_hresp (),
        .exthm12_hsize (),
        .exthm12_htrans (),
        .exthm12_hwrite (),
        .exthm12_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST13
        .exthm13_haddr (),
        .exthm13_hburst (),
        .exthm13_hprot (),
        .exthm13_hrdata (),
        .exthm13_hready (),
        .exthm13_hresp (),
        .exthm13_hsize (),
        .exthm13_htrans (),
        .exthm13_hwrite (),
        .exthm13_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST14
        .exthm14_haddr (),
        .exthm14_hburst (),
        .exthm14_hprot (),
        .exthm14_hrdata (),
        .exthm14_hready (),
        .exthm14_hresp (),
        .exthm14_hsize (),
        .exthm14_htrans (),
        .exthm14_hwrite (),
        .exthm14_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTMST15
        .exthm15_haddr (),
        .exthm15_hburst (),
        .exthm15_hprot (),
        .exthm15_hrdata (),
        .exthm15_hready (),
        .exthm15_hresp (),
        .exthm15_hsize (),
        .exthm15_htrans (),
        .exthm15_hwrite (),
        .exthm15_hwdata (),
`endif
`ifdef AE250_MATRIX_EXTSLV2
        .exths2_hrdata (),
        .exths2_hready (),
        .exths2_hresp (),
        .exths2_hreadyout (),
        .exths2_haddr (),
        .exths2_hburst (),
        .exths2_hprot (),
        .exths2_hsel (),
        .exths2_hsize (),
        .exths2_htrans (),
        .exths2_hwdata (),
        .exths2_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV3
        .exths3_hrdata (),
        .exths3_hready (),
        .exths3_hresp (),
        .exths3_hreadyout (),
        .exths3_haddr (),
        .exths3_hburst (),
        .exths3_hprot (),
        .exths3_hsel (),
        .exths3_hsize (),
        .exths3_htrans (),
        .exths3_hwdata (),
        .exths3_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV4
        .exths4_hrdata (),
        .exths4_hready (),
        .exths4_hresp (),
        .exths4_hreadyout (),
        .exths4_haddr (),
        .exths4_hburst (),
        .exths4_hprot (),
        .exths4_hsel (),
        .exths4_hsize (),
        .exths4_htrans (),
        .exths4_hwdata (),
        .exths4_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV5
        .exths5_hrdata (),
        .exths5_hready (),
        .exths5_hresp (),
        .exths5_hreadyout (),
        .exths5_haddr (),
        .exths5_hburst (),
        .exths5_hprot (),
        .exths5_hsel (),
        .exths5_hsize (),
        .exths5_htrans (),
        .exths5_hwdata (),
        .exths5_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV6
        .exths6_hrdata (),
        .exths6_hready (),
        .exths6_hresp (),
        .exths6_hreadyout (),
        .exths6_haddr (),
        .exths6_hburst (),
        .exths6_hprot (),
        .exths6_hsel (),
        .exths6_hsize (),
        .exths6_htrans (),
        .exths6_hwdata (),
        .exths6_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV7
        .exths7_hrdata (),
        .exths7_hready (),
        .exths7_hresp (),
        .exths7_hreadyout (),
        .exths7_haddr (),
        .exths7_hburst (),
        .exths7_hprot (),
        .exths7_hsel (),
        .exths7_hsize (),
        .exths7_htrans (),
        .exths7_hwdata (),
        .exths7_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV8
        .exths8_hrdata (),
        .exths8_hready (),
        .exths8_hresp (),
        .exths8_hreadyout (),
        .exths8_haddr (),
        .exths8_hburst (),
        .exths8_hprot (),
        .exths8_hsel (),
        .exths8_hsize (),
        .exths8_htrans (),
        .exths8_hwdata (),
        .exths8_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV9
        .exths9_hrdata (),
        .exths9_hready (),
        .exths9_hresp (),
        .exths9_hreadyout (),
        .exths9_haddr (),
        .exths9_hburst (),
        .exths9_hprot (),
        .exths9_hsel (),
        .exths9_hsize (),
        .exths9_htrans (),
        .exths9_hwdata (),
        .exths9_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV10
        .exths10_hrdata (),
        .exths10_hready (),
        .exths10_hresp (),
        .exths10_hreadyout (),
        .exths10_haddr (),
        .exths10_hburst (),
        .exths10_hprot (),
        .exths10_hsel (),
        .exths10_hsize (),
        .exths10_htrans (),
        .exths10_hwdata (),
        .exths10_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV11
        .exths11_hrdata (),
        .exths11_hready (),
        .exths11_hresp (),
        .exths11_hreadyout (),
        .exths11_haddr (),
        .exths11_hburst (),
        .exths11_hprot (),
        .exths11_hsel (),
        .exths11_hsize (),
        .exths11_htrans (),
        .exths11_hwdata (),
        .exths11_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV12
        .exths12_hrdata (),
        .exths12_hready (),
        .exths12_hresp (),
        .exths12_hreadyout (),
        .exths12_haddr (),
        .exths12_hburst (),
        .exths12_hprot (),
        .exths12_hsel (),
        .exths12_hsize (),
        .exths12_htrans (),
        .exths12_hwdata (),
        .exths12_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV13
        .exths13_hrdata (),
        .exths13_hready (),
        .exths13_hresp (),
        .exths13_hreadyout (),
        .exths13_haddr (),
        .exths13_hburst (),
        .exths13_hprot (),
        .exths13_hsel (),
        .exths13_hsize (),
        .exths13_htrans (),
        .exths13_hwdata (),
        .exths13_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV14
        .exths14_hrdata (),
        .exths14_hready (),
        .exths14_hresp (),
        .exths14_hreadyout (),
        .exths14_haddr (),
        .exths14_hburst (),
        .exths14_hprot (),
        .exths14_hsel (),
        .exths14_hsize (),
        .exths14_htrans (),
        .exths14_hwdata (),
        .exths14_hwrite (),
`endif
`ifdef AE250_MATRIX_EXTSLV15
        .exths15_hrdata (),
        .exths15_hready (),
        .exths15_hresp (),
        .exths15_hreadyout (),
        .exths15_haddr (),
        .exths15_hburst (),
        .exths15_hprot (),
        .exths15_hsel (),
        .exths15_hsize (),
        .exths15_htrans (),
        .exths15_hwdata (),
        .exths15_hwrite (),
`endif

`ifdef AE250_APB_EXTSLV
        .pclk_o (),
        .presetn_o (),
        .pprot (),
	    .pstrb (),
	    .paddr (),
	    .penable (),
	    .pwrite (),
	    .pwdata (),
`endif
`ifdef AE250_APB_EXTSLV2
        .extps2_psel (),
        .extps2_prdata (),
        .extps2_pready (),
        .extps2_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV3
        .extps3_psel (),
        .extps3_prdata (),
        .extps3_pready (),
        .extps3_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV4
        .extps4_psel (),
        .extps4_prdata (),
        .extps4_pready (),
        .extps4_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV5
        .extps5_psel (),
        .extps5_prdata (),
        .extps5_pready (),
        .extps5_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV6
        .extps6_psel (),
        .extps6_prdata (),
        .extps6_pready (),
        .extps6_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV7
        .extps7_psel (),
        .extps7_prdata (),
        .extps7_pready (),
        .extps7_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV8
        .extps8_psel (),
        .extps8_prdata (),
        .extps8_pready (),
        .extps8_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV9
        .extps9_psel (),
        .extps9_prdata (),
        .extps9_pready (),
        .extps9_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV10
        .extps10_psel (),
        .extps10_prdata (),
        .extps10_pready (),
        .extps10_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV11
        .extps11_psel (),
        .extps11_prdata (),
        .extps11_pready (),
        .extps11_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV12
        .extps12_psel (),
        .extps12_prdata (),
        .extps12_pready (),
        .extps12_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV13
        .extps13_psel (),
        .extps13_prdata (),
        .extps13_pready (),
        .extps13_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV14
        .extps14_psel (),
        .extps14_prdata (),
        .extps14_pready (),
        .extps14_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV15
        .extps15_psel (),
        .extps15_prdata (),
        .extps15_pready (),
        .extps15_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV16
        .extps16_psel (),
        .extps16_prdata (),
        .extps16_pready (),
        .extps16_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV17
        .extps17_psel (),
        .extps17_prdata (),
        .extps17_pready (),
        .extps17_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV18
        .extps18_psel (),
        .extps18_prdata (),
        .extps18_pready (),
        .extps18_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV19
        .extps19_psel (),
        .extps19_prdata (),
        .extps19_pready (),
        .extps19_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV20
        .extps20_psel (),
        .extps20_prdata (),
        .extps20_pready (),
        .extps20_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV21
        .extps21_psel (),
        .extps21_prdata (),
        .extps21_pready (),
        .extps21_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV22
        .extps22_psel (),
        .extps22_prdata (),
        .extps22_pready (),
        .extps22_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV23
        .extps23_psel (),
        .extps23_prdata (),
        .extps23_pready (),
        .extps23_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV24
        .extps24_psel (),
        .extps24_prdata (),
        .extps24_pready (),
        .extps24_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV25
        .extps25_psel (),
        .extps25_prdata (),
        .extps25_pready (),
        .extps25_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV26
        .extps26_psel (),
        .extps26_prdata (),
        .extps26_pready (),
        .extps26_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV27
        .extps27_psel (),
        .extps27_prdata (),
        .extps27_pready (),
        .extps27_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV28
        .extps28_psel (),
        .extps28_prdata (),
        .extps28_pready (),
        .extps28_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV29
        .extps29_psel (),
        .extps29_prdata (),
        .extps29_pready (),
        .extps29_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV30
        .extps30_psel (),
        .extps30_prdata (),
        .extps30_pready (),
        .extps30_pslverr (),
`endif
`ifdef AE250_APB_EXTSLV31
        .extps31_psel (),
        .extps31_prdata (),
        .extps31_pready (),
        .extps31_pslverr (),
`endif
`ifdef AE250_DMAC_SUPPORT
    `ifdef AE250_DMA_EXTREQ_SUPPORT
        .dma_ack_ext (),
        .dma_req_ext (),
    `endif
`endif
        .ext_int_src ()


);

GW_PLL iPll2sysClk(
	.clkout		(sysClk), 	//10MHz
	.lock		(lock), 	//output lock
	.clkoutd	(rtcClk), 	//78125Hz
	.clkin		(CLK) 		//
);


assign J3_15 = hwRstn;

endmodule














/****************************************************************
========Oooo=========================================Oooo========
=     Copyright ©2015-2018 Gowin Semiconductor Corporation.     =
=                     All rights reserved.                      =
========Oooo=========================================Oooo========

<File Title>: IP file
<gwModGen version>: 1.8.0.01beta
<Series, Device, Package, Speed>: GW2A, GW2A-18, PBGA256
<Created Time>: Tue Oct 30 16:23:53 2018
****************************************************************/

module GW_PLL (clkout, lock, clkoutd, clkoutd3, clkin);

output clkout;
output lock;
output clkoutd;
output clkoutd3;
input clkin;

wire clkoutp_o;
wire gw_gnd;

assign gw_gnd = 1'b0;

PLL pll_inst (
    .CLKOUT(clkout),
    .LOCK(lock),
    .CLKOUTP(clkoutp_o),
    .CLKOUTD(clkoutd),
    .CLKOUTD3(clkoutd3),
    .RESET(gw_gnd),
    .RESET_P(gw_gnd),
    .RESET_I(gw_gnd),
    .RESET_S(gw_gnd),
    .CLKIN(clkin),
    .CLKFB(gw_gnd),
    .FBDSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .IDSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .ODSEL({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .PSDA({gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .DUTYDA({gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .FDLY({gw_gnd,gw_gnd,gw_gnd,gw_gnd})
);

defparam pll_inst.FCLKIN = "50";
defparam pll_inst.DYN_IDIV_SEL = "false";
defparam pll_inst.IDIV_SEL = 4;
defparam pll_inst.DYN_FBDIV_SEL = "false";
defparam pll_inst.FBDIV_SEL = 0;
defparam pll_inst.DYN_ODIV_SEL = "false";
defparam pll_inst.ODIV_SEL = 128;
defparam pll_inst.PSDA_SEL = "0000";
defparam pll_inst.DYN_DA_EN = "false";
defparam pll_inst.DUTYDA_SEL = "1000";
defparam pll_inst.CLKOUT_FT_DIR = 1'b1;
defparam pll_inst.CLKOUTP_FT_DIR = 1'b1;
defparam pll_inst.CLKOUT_DLY_STEP = 0;
defparam pll_inst.CLKOUTP_DLY_STEP = 0;
defparam pll_inst.CLKFB_SEL = "internal";
defparam pll_inst.CLKOUT_BYPASS = "false";
defparam pll_inst.CLKOUTP_BYPASS = "false";
defparam pll_inst.CLKOUTD_BYPASS = "false";
defparam pll_inst.DYN_SDIV_SEL = 128;
defparam pll_inst.CLKOUTD_SRC = "CLKOUT";
defparam pll_inst.CLKOUTD3_SRC = "CLKOUT";
defparam pll_inst.DEVICE = "GW2A-18";

endmodule //GW_PLL

