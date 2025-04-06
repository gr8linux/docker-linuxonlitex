`include "define.v"
`include "static_macro_define.v"
module `MODULE_NAME(
        X_om,
        X_pd_pwr_off,
        X_aopd_por_b,
        X_mpd_pwr_off,
        X_osclin,
        X_osclio,
        X_rtc_wakeup,
        X_wakeup_in,
        X_tck,
`ifdef AE250_INOUT_SUPPORT
		X_oschin,
		X_oschio,
        X_hw_rstn,
        X_por_b,
    `ifndef AE250_JTAG_TWOWIRE
	    X_tms,
        X_tdi,
	    X_tdo,
	    X_trst,
    `endif
    `ifdef AE250_SPI1_SUPPORT
        X_spi1_clk,
    	X_spi1_csn,
    	X_spi1_miso,
    	X_spi1_mosi,
        `ifdef ATCSPI200_1_QUADSPI_SUPPORT
	    X_spi1_holdn,
	    X_spi1_wpn,
        `endif
    `endif
    `ifdef AE250_SPI2_SUPPORT
        X_spi2_clk,
    	X_spi2_csn,
    	X_spi2_miso,
    	X_spi2_mosi,
        `ifdef ATCSPI200_2_QUADSPI_SUPPORT
	    X_spi2_holdn,
	    X_spi2_wpn,
        `endif
    `endif
    `ifdef AE250_SPI3_SUPPORT
        X_spi3_clk,
    	X_spi3_csn,
    	X_spi3_miso,
    	X_spi3_mosi,
        `ifdef ATCSPI200_3_QUADSPI_SUPPORT
	    X_spi3_holdn,
	    X_spi3_wpn,
        `endif
    `endif
    `ifdef AE250_SPI4_SUPPORT
        X_spi4_clk,
    	X_spi4_csn,
    	X_spi4_miso,
    	X_spi4_mosi,
        `ifdef ATCSPI200_4_QUADSPI_SUPPORT
	    X_spi4_holdn,
	    X_spi4_wpn,
        `endif
    `endif
    `ifdef AE250_I2C_1_SUPPORT
        X_i2c1_scl,
	    X_i2c1_sda,
    `endif
    `ifdef AE250_I2C_2_SUPPORT
        X_i2c2_scl,
	    X_i2c2_sda,
    `endif
    `ifdef AE250_I2C_3_SUPPORT
        X_i2c3_scl,
	    X_i2c3_sda,
    `endif
    `ifdef AE250_I2C_4_SUPPORT
        X_i2c4_scl,
	    X_i2c4_sda,
    `endif
    `ifdef AE250_UART1_SUPPORT
	    X_uart1_ctsn,
	    X_uart1_rtsn,
        X_uart1_dcdn,
	    X_uart1_dsrn,
	    X_uart1_dtrn,
	    X_uart1_out1n,
	    X_uart1_out2n,
	    X_uart1_rin,
	    X_uart1_rxd,
	    X_uart1_txd,
    `endif
    `ifdef AE250_UART2_SUPPORT
	    X_uart2_ctsn,
	    X_uart2_rtsn,
        X_uart2_dcdn,
	    X_uart2_dsrn,
	    X_uart2_dtrn,
	    X_uart2_out1n,
	    X_uart2_out2n,
	    X_uart2_rin,
	    X_uart2_rxd,
	    X_uart2_txd,
    `endif
    `ifdef AE250_UART3_SUPPORT
	    X_uart3_ctsn,
	    X_uart3_rtsn,
        X_uart3_dcdn,
	    X_uart3_dsrn,
	    X_uart3_dtrn,
	    X_uart3_out1n,
	    X_uart3_out2n,
	    X_uart3_rin,
	    X_uart3_rxd,
	    X_uart3_txd,
    `endif
    `ifdef AE250_UART4_SUPPORT
	    X_uart4_ctsn,
	    X_uart4_rtsn,
        X_uart4_dcdn,
	    X_uart4_dsrn,
	    X_uart4_dtrn,
	    X_uart4_out1n,
	    X_uart4_out2n,
	    X_uart4_rin,
	    X_uart4_rxd,
	    X_uart4_txd,
    `endif
    `ifdef AE250_PIT1_SUPPORT
        X_pit1_pwm_ch0,
        `ifdef ATCPIT100_1_CH1_SUPPORT
	    X_pit1_pwm_ch1,
        `endif
        `ifdef ATCPIT100_1_CH2_SUPPORT
	    X_pit1_pwm_ch2,
        `endif
        `ifdef ATCPIT100_1_CH3_SUPPORT
	    X_pit1_pwm_ch3,
        `endif
    `endif
    `ifdef AE250_PIT2_SUPPORT
        X_pit2_pwm_ch0,
        `ifdef ATCPIT100_2_CH1_SUPPORT
	    X_pit2_pwm_ch1,
        `endif
        `ifdef ATCPIT100_2_CH2_SUPPORT
	    X_pit2_pwm_ch2,
        `endif
        `ifdef ATCPIT100_2_CH3_SUPPORT
	    X_pit2_pwm_ch3,
        `endif
    `endif
    `ifdef AE250_GPIO_SUPPORT
        X_gpio,
        gpio_pullup,
        gpio_pulldown,
    `endif
`else
		    T_hw_rstn,
		    T_por_b,
            T_osch,
		    pin_tms_in,
		    pin_tms_out,
		    pin_tms_out_en,
		    pin_trst_in,
		    pin_trst_out,
		    pin_trst_out_en,
		    pin_tdi_in,
		    pin_tdi_out,
		    pin_tdi_out_en,
		    pin_tdo_in,
		    pin_tdo_out,
		    pin_tdo_out_en,

    `ifdef AE250_SPI1_SUPPORT
    		spi1_clk_in,
    		spi1_csn_in,
    		spi1_miso_in,
    		spi1_mosi_in,
    		spi1_clk_out,
    		spi1_clk_oe,
    		spi1_csn_out,
    		spi1_csn_oe,
    		spi1_miso_out,
    		spi1_miso_oe,
    		spi1_mosi_out,
    		spi1_mosi_oe,
            `ifdef ATCSPI200_1_QUADSPI_SUPPORT
            spi1_holdn_in,
    		spi1_wpn_in,
    		spi1_holdn_out,
    		spi1_holdn_oe,
    		spi1_wpn_out,
    		spi1_wpn_oe,
            `endif
    `endif
    `ifdef AE250_SPI2_SUPPORT
    		spi2_clk_in,
    		spi2_csn_in,
    		spi2_miso_in,
    		spi2_mosi_in,
    		spi2_clk_out,
    		spi2_clk_oe,
    		spi2_csn_out,
    		spi2_csn_oe,
    		spi2_miso_out,
    		spi2_miso_oe,
    		spi2_mosi_out,
    		spi2_mosi_oe,
            `ifdef ATCSPI200_2_QUADSPI_SUPPORT
            spi2_holdn_in,
    		spi2_wpn_in,
    		spi2_holdn_out,
    		spi2_holdn_oe,
    		spi2_wpn_out,
    		spi2_wpn_oe,
            `endif
    `endif
    `ifdef AE250_SPI3_SUPPORT
    		spi3_clk_in,
    		spi3_csn_in,
    		spi3_miso_in,
    		spi3_mosi_in,
    		spi3_clk_out,
    		spi3_clk_oe,
    		spi3_csn_out,
    		spi3_csn_oe,
    		spi3_miso_out,
    		spi3_miso_oe,
    		spi3_mosi_out,
    		spi3_mosi_oe,
            `ifdef ATCSPI200_3_QUADSPI_SUPPORT
    		spi3_holdn_in,
    		spi3_wpn_in,
    		spi3_holdn_out,
    		spi3_holdn_oe,
    		spi3_wpn_out,
    		spi3_wpn_oe,
            `endif
    `endif
    `ifdef AE250_SPI4_SUPPORT
            spi4_clk_in,
    		spi4_csn_in,
    		spi4_miso_in,
    		spi4_mosi_in,
    		spi4_clk_out,
    		spi4_clk_oe,
    		spi4_csn_out,
    		spi4_csn_oe,
    		spi4_miso_out,
    		spi4_miso_oe,
    		spi4_mosi_out,
    		spi4_mosi_oe,
            `ifdef ATCSPI200_4_QUADSPI_SUPPORT
    		spi4_holdn_in,
    		spi4_wpn_in,
    		spi4_holdn_out,
    		spi4_holdn_oe,
    		spi4_wpn_out,
    		spi4_wpn_oe,
            `endif
    `endif
    `ifdef AE250_I2C_1_SUPPORT
    		i2c1_scl_in,
    		i2c1_sda_in,
    		i2c1_scl,
    		i2c1_sda,
    `endif
    `ifdef AE250_I2C_2_SUPPORT
    		i2c2_scl_in,
    		i2c2_sda_in,
    		i2c2_scl,
    		i2c2_sda,
    `endif
    `ifdef AE250_I2C_3_SUPPORT
            i2c3_scl_in,
    		i2c3_sda_in,
    		i2c3_scl,
    		i2c3_sda,
    `endif
    `ifdef AE250_I2C_4_SUPPORT
    		i2c4_scl_in,
    		i2c4_sda_in,
    		i2c4_scl,
    		i2c4_sda,
    `endif
    `ifdef AE250_UART1_SUPPORT          
    		uart1_txd,
    		uart1_rtsn,
    		uart1_rxd,
    		uart1_ctsn,
    		uart1_dsrn,
    		uart1_dcdn,
    		uart1_rin,
    		uart1_dtrn,
    		uart1_out1n,
    		uart1_out2n,
    `endif
    `ifdef AE250_UART2_SUPPORT  
    		uart2_txd,
    		uart2_rtsn,
    		uart2_rxd,
    		uart2_ctsn,
    		uart2_dcdn,
    		uart2_dsrn,
    		uart2_rin,
    		uart2_dtrn,
    		uart2_out1n,
    		uart2_out2n,
    `endif
    `ifdef AE250_UART3_SUPPORT  
    		uart3_txd,
    		uart3_rtsn,
    		uart3_rxd,
    		uart3_ctsn,
    		uart3_dcdn,
    		uart3_dsrn,
    		uart3_rin,
    		uart3_dtrn,
    		uart3_out1n,
    		uart3_out2n,
    `endif
    `ifdef AE250_UART4_SUPPORT  
    		uart4_txd,
    		uart4_rtsn,
    		uart4_rxd,
    		uart4_ctsn,
    		uart4_dcdn,
    		uart4_dsrn,
    		uart4_rin,
    		uart4_dtrn,
    		uart4_out1n,
    		uart4_out2n,
    `endif
    `ifdef AE250_PIT1_SUPPORT
            pit1_ch0_pwm,
    		pit1_ch0_pwmoe,
        `ifdef ATCPIT100_1_CH1_SUPPORT
    		pit1_ch1_pwm,
    		pit1_ch1_pwmoe,
        `endif
        `ifdef ATCPIT100_1_CH2_SUPPORT
    		pit1_ch2_pwm,
    		pit1_ch2_pwmoe,
        `endif
        `ifdef ATCPIT100_1_CH3_SUPPORT
    		pit1_ch3_pwm,
    		pit1_ch3_pwmoe,
        `endif
    `endif
    `ifdef AE250_PIT2_SUPPORT
            pit2_ch0_pwm,
    		pit2_ch0_pwmoe,
        `ifdef ATCPIT100_2_CH1_SUPPORT
    		pit2_ch1_pwm,
    		pit2_ch1_pwmoe,
        `endif
        `ifdef ATCPIT100_2_CH2_SUPPORT
    		pit2_ch2_pwm,
    		pit2_ch2_pwmoe,
        `endif
        `ifdef ATCPIT100_2_CH3_SUPPORT
    		pit2_ch3_pwm,
    		pit2_ch3_pwmoe,
        `endif
    `endif
    `ifdef AE250_GPIO_SUPPORT
    		gpio_in,
    		gpio_oe,
    		gpio_out,
    		gpio_pulldown,
    		gpio_pullup,
    `endif
`endif
`ifdef AE250_AHB_EXT
        hclk_o,
        hresetn_o,
`endif
`ifdef AE250_MATRIX_EXTMST1
        exthm1_haddr,
        exthm1_hburst,
        exthm1_hprot,
        exthm1_hrdata,
        exthm1_hready,
        exthm1_hresp,
        exthm1_hsize,
        exthm1_htrans,
        exthm1_hwrite,
        exthm1_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST2
        exthm2_haddr,
        exthm2_hburst,
        exthm2_hprot,
        exthm2_hrdata,
        exthm2_hready,
        exthm2_hresp,
        exthm2_hsize,
        exthm2_htrans,
        exthm2_hwrite,
        exthm2_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST3
        exthm3_haddr,
        exthm3_hburst,
        exthm3_hprot,
        exthm3_hrdata,
        exthm3_hready,
        exthm3_hresp,
        exthm3_hsize,
        exthm3_htrans,
        exthm3_hwrite,
        exthm3_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST4
        exthm4_haddr,
        exthm4_hburst,
        exthm4_hprot,
        exthm4_hrdata,
        exthm4_hready,
        exthm4_hresp,
        exthm4_hsize,
        exthm4_htrans,
        exthm4_hwrite,
        exthm4_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST5
        exthm5_haddr,
        exthm5_hburst,
        exthm5_hprot,
        exthm5_hrdata,
        exthm5_hready,
        exthm5_hresp,
        exthm5_hsize,
        exthm5_htrans,
        exthm5_hwrite,
        exthm5_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST6
        exthm6_haddr,
        exthm6_hburst,
        exthm6_hprot,
        exthm6_hrdata,
        exthm6_hready,
        exthm6_hresp,
        exthm6_hsize,
        exthm6_htrans,
        exthm6_hwrite,
        exthm6_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST7
        exthm7_haddr,
        exthm7_hburst,
        exthm7_hprot,
        exthm7_hrdata,
        exthm7_hready,
        exthm7_hresp,
        exthm7_hsize,
        exthm7_htrans,
        exthm7_hwrite,
        exthm7_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST8
        exthm8_haddr,
        exthm8_hburst,
        exthm8_hprot,
        exthm8_hrdata,
        exthm8_hready,
        exthm8_hresp,
        exthm8_hsize,
        exthm8_htrans,
        exthm8_hwrite,
        exthm8_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST9
        exthm9_haddr,
        exthm9_hburst,
        exthm9_hprot,
        exthm9_hrdata,
        exthm9_hready,
        exthm9_hresp,
        exthm9_hsize,
        exthm9_htrans,
        exthm9_hwrite,
        exthm9_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST10
        exthm10_haddr,
        exthm10_hburst,
        exthm10_hprot,
        exthm10_hrdata,
        exthm10_hready,
        exthm10_hresp,
        exthm10_hsize,
        exthm10_htrans,
        exthm10_hwrite,
        exthm10_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST11
        exthm11_haddr,
        exthm11_hburst,
        exthm11_hprot,
        exthm11_hrdata,
        exthm11_hready,
        exthm11_hresp,
        exthm11_hsize,
        exthm11_htrans,
        exthm11_hwrite,
        exthm11_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST12
        exthm12_haddr,
        exthm12_hburst,
        exthm12_hprot,
        exthm12_hrdata,
        exthm12_hready,
        exthm12_hresp,
        exthm12_hsize,
        exthm12_htrans,
        exthm12_hwrite,
        exthm12_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST13
        exthm13_haddr,
        exthm13_hburst,
        exthm13_hprot,
        exthm13_hrdata,
        exthm13_hready,
        exthm13_hresp,
        exthm13_hsize,
        exthm13_htrans,
        exthm13_hwrite,
        exthm13_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST14
        exthm14_haddr,
        exthm14_hburst,
        exthm14_hprot,
        exthm14_hrdata,
        exthm14_hready,
        exthm14_hresp,
        exthm14_hsize,
        exthm14_htrans,
        exthm14_hwrite,
        exthm14_hwdata,
`endif
`ifdef AE250_MATRIX_EXTMST15
        exthm15_haddr,
        exthm15_hburst,
        exthm15_hprot,
        exthm15_hrdata,
        exthm15_hready,
        exthm15_hresp,
        exthm15_hsize,
        exthm15_htrans,
        exthm15_hwrite,
        exthm15_hwdata,
`endif
`ifdef AE250_MATRIX_EXTSLV2
        exths2_hrdata,
        exths2_hready,
        exths2_hresp,
        exths2_hreadyout,
        exths2_haddr,
        exths2_hburst,
        exths2_hprot,
        exths2_hsel,
        exths2_hsize,
        exths2_htrans,
        exths2_hwdata,
        exths2_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV3
        exths3_hrdata,
        exths3_hready,
        exths3_hresp,
        exths3_hreadyout,
        exths3_haddr,
        exths3_hburst,
        exths3_hprot,
        exths3_hsel,
        exths3_hsize,
        exths3_htrans,
        exths3_hwdata,
        exths3_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV4
        exths4_hrdata,
        exths4_hready,
        exths4_hresp,
        exths4_hreadyout,
        exths4_haddr,
        exths4_hburst,
        exths4_hprot,
        exths4_hsel,
        exths4_hsize,
        exths4_htrans,
        exths4_hwdata,
        exths4_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV5
        exths5_hrdata,
        exths5_hready,
        exths5_hresp,
        exths5_hreadyout,
        exths5_haddr,
        exths5_hburst,
        exths5_hprot,
        exths5_hsel,
        exths5_hsize,
        exths5_htrans,
        exths5_hwdata,
        exths5_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV6
        exths6_hrdata,
        exths6_hready,
        exths6_hresp,
        exths6_hreadyout,
        exths6_haddr,
        exths6_hburst,
        exths6_hprot,
        exths6_hsel,
        exths6_hsize,
        exths6_htrans,
        exths6_hwdata,
        exths6_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV7
        exths7_hrdata,
        exths7_hready,
        exths7_hresp,
        exths7_hreadyout,
        exths7_haddr,
        exths7_hburst,
        exths7_hprot,
        exths7_hsel,
        exths7_hsize,
        exths7_htrans,
        exths7_hwdata,
        exths7_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV8
        exths8_hrdata,
        exths8_hready,
        exths8_hresp,
        exths8_hreadyout,
        exths8_haddr,
        exths8_hburst,
        exths8_hprot,
        exths8_hsel,
        exths8_hsize,
        exths8_htrans,
        exths8_hwdata,
        exths8_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV9
        exths9_hrdata,
        exths9_hready,
        exths9_hresp,
        exths9_hreadyout,
        exths9_haddr,
        exths9_hburst,
        exths9_hprot,
        exths9_hsel,
        exths9_hsize,
        exths9_htrans,
        exths9_hwdata,
        exths9_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV10
        exths10_hrdata,
        exths10_hready,
        exths10_hresp,
        exths10_hreadyout,
        exths10_haddr,
        exths10_hburst,
        exths10_hprot,
        exths10_hsel,
        exths10_hsize,
        exths10_htrans,
        exths10_hwdata,
        exths10_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV11
        exths11_hrdata,
        exths11_hready,
        exths11_hresp,
        exths11_hreadyout,
        exths11_haddr,
        exths11_hburst,
        exths11_hprot,
        exths11_hsel,
        exths11_hsize,
        exths11_htrans,
        exths11_hwdata,
        exths11_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV12
        exths12_hrdata,
        exths12_hready,
        exths12_hresp,
        exths12_hreadyout,
        exths12_haddr,
        exths12_hburst,
        exths12_hprot,
        exths12_hsel,
        exths12_hsize,
        exths12_htrans,
        exths12_hwdata,
        exths12_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV13
        exths13_hrdata,
        exths13_hready,
        exths13_hresp,
        exths13_hreadyout,
        exths13_haddr,
        exths13_hburst,
        exths13_hprot,
        exths13_hsel,
        exths13_hsize,
        exths13_htrans,
        exths13_hwdata,
        exths13_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV14
        exths14_hrdata,
        exths14_hready,
        exths14_hresp,
        exths14_hreadyout,
        exths14_haddr,
        exths14_hburst,
        exths14_hprot,
        exths14_hsel,
        exths14_hsize,
        exths14_htrans,
        exths14_hwdata,
        exths14_hwrite,
`endif
`ifdef AE250_MATRIX_EXTSLV15
        exths15_hrdata,
        exths15_hready,
        exths15_hresp,
        exths15_hreadyout,
        exths15_haddr,
        exths15_hburst,
        exths15_hprot,
        exths15_hsel,
        exths15_hsize,
        exths15_htrans,
        exths15_hwdata,
        exths15_hwrite,
`endif

`ifdef AE250_APB_EXTSLV
        pclk_o,
        presetn_o,
        pprot,
	    pstrb,
	    paddr,
	    penable,
	    pwrite,
	    pwdata,
`endif
`ifdef AE250_APB_EXTSLV2
        extps2_psel,
        extps2_prdata,
        extps2_pready,
        extps2_pslverr,
`endif
`ifdef AE250_APB_EXTSLV3
        extps3_psel,
        extps3_prdata,
        extps3_pready,
        extps3_pslverr,
`endif
`ifdef AE250_APB_EXTSLV4
        extps4_psel,
        extps4_prdata,
        extps4_pready,
        extps4_pslverr,
`endif
`ifdef AE250_APB_EXTSLV5
        extps5_psel,
        extps5_prdata,
        extps5_pready,
        extps5_pslverr,
`endif
`ifdef AE250_APB_EXTSLV6
        extps6_psel,
        extps6_prdata,
        extps6_pready,
        extps6_pslverr,
`endif
`ifdef AE250_APB_EXTSLV7
        extps7_psel,
        extps7_prdata,
        extps7_pready,
        extps7_pslverr,
`endif
`ifdef AE250_APB_EXTSLV8
        extps8_psel,
        extps8_prdata,
        extps8_pready,
        extps8_pslverr,
`endif
`ifdef AE250_APB_EXTSLV9
        extps9_psel,
        extps9_prdata,
        extps9_pready,
        extps9_pslverr,
`endif
`ifdef AE250_APB_EXTSLV10
        extps10_psel,
        extps10_prdata,
        extps10_pready,
        extps10_pslverr,
`endif
`ifdef AE250_APB_EXTSLV11
        extps11_psel,
        extps11_prdata,
        extps11_pready,
        extps11_pslverr,
`endif
`ifdef AE250_APB_EXTSLV12
        extps12_psel,
        extps12_prdata,
        extps12_pready,
        extps12_pslverr,
`endif
`ifdef AE250_APB_EXTSLV13
        extps13_psel,
        extps13_prdata,
        extps13_pready,
        extps13_pslverr,
`endif
`ifdef AE250_APB_EXTSLV14
        extps14_psel,
        extps14_prdata,
        extps14_pready,
        extps14_pslverr,
`endif
`ifdef AE250_APB_EXTSLV15
        extps15_psel,
        extps15_prdata,
        extps15_pready,
        extps15_pslverr,
`endif
`ifdef AE250_APB_EXTSLV16
        extps16_psel,
        extps16_prdata,
        extps16_pready,
        extps16_pslverr,
`endif
`ifdef AE250_APB_EXTSLV17
        extps17_psel,
        extps17_prdata,
        extps17_pready,
        extps17_pslverr,
`endif
`ifdef AE250_APB_EXTSLV18
        extps18_psel,
        extps18_prdata,
        extps18_pready,
        extps18_pslverr,
`endif
`ifdef AE250_APB_EXTSLV19
        extps19_psel,
        extps19_prdata,
        extps19_pready,
        extps19_pslverr,
`endif
`ifdef AE250_APB_EXTSLV20
        extps20_psel,
        extps20_prdata,
        extps20_pready,
        extps20_pslverr,
`endif
`ifdef AE250_APB_EXTSLV21
        extps21_psel,
        extps21_prdata,
        extps21_pready,
        extps21_pslverr,
`endif
`ifdef AE250_APB_EXTSLV22
        extps22_psel,
        extps22_prdata,
        extps22_pready,
        extps22_pslverr,
`endif
`ifdef AE250_APB_EXTSLV23
        extps23_psel,
        extps23_prdata,
        extps23_pready,
        extps23_pslverr,
`endif
`ifdef AE250_APB_EXTSLV24
        extps24_psel,
        extps24_prdata,
        extps24_pready,
        extps24_pslverr,
`endif
`ifdef AE250_APB_EXTSLV25
        extps25_psel,
        extps25_prdata,
        extps25_pready,
        extps25_pslverr,
`endif
`ifdef AE250_APB_EXTSLV26
        extps26_psel,
        extps26_prdata,
        extps26_pready,
        extps26_pslverr,
`endif
`ifdef AE250_APB_EXTSLV27
        extps27_psel,
        extps27_prdata,
        extps27_pready,
        extps27_pslverr,
`endif
`ifdef AE250_APB_EXTSLV28
        extps28_psel,
        extps28_prdata,
        extps28_pready,
        extps28_pslverr,
`endif
`ifdef AE250_APB_EXTSLV29
        extps29_psel,
        extps29_prdata,
        extps29_pready,
        extps29_pslverr,
`endif
`ifdef AE250_APB_EXTSLV30
        extps30_psel,
        extps30_prdata,
        extps30_pready,
        extps30_pslverr,
`endif
`ifdef AE250_APB_EXTSLV31
        extps31_psel,
        extps31_prdata,
        extps31_pready,
        extps31_pslverr,
`endif
`ifdef AE250_DMAC_SUPPORT
    `ifdef AE250_DMA_EXTREQ_SUPPORT
        dma_ack_ext,
        dma_req_ext,
    `endif
`endif
        ext_int_src
);
//**********************************************************************
// --- Parameter
//**********************************************************************

//**********************************************************************
// --- In/Out Port
//**********************************************************************

input       X_om;
output      X_pd_pwr_off;
input       X_aopd_por_b;
output      X_mpd_pwr_off;
input       X_osclin;
output      X_osclio;
output      X_rtc_wakeup;
input       X_wakeup_in;
input       X_tck;
`ifdef AE250_INOUT_SUPPORT
inout       X_hw_rstn;
inout       X_por_b;
input		X_oschin;
output      X_oschio;
    `ifndef AE250_JTAG_TWOWIRE
    inout       	  X_tms;
    inout             X_tdi;
    inout             X_tdo;
    inout             X_trst;
    `endif
    `ifdef AE250_SPI1_SUPPORT
    inout              X_spi1_clk;
    inout              X_spi1_csn;
    inout              X_spi1_miso;
    inout              X_spi1_mosi;
   `ifdef ATCSPI200_1_QUADSPI_SUPPORT
    inout              X_spi1_holdn;
    inout              X_spi1_wpn;
    `endif
    `endif
    `ifdef AE250_SPI2_SUPPORT
    inout              X_spi2_clk;
    inout              X_spi2_csn;
    inout              X_spi2_miso;
    inout              X_spi2_mosi;
    `ifdef ATCSPI200_2_QUADSPI_SUPPORT
    inout              X_spi2_holdn;
    inout              X_spi2_wpn;
    `endif
    `endif
    `ifdef AE250_SPI3_SUPPORT
    inout              X_spi3_clk;
    inout              X_spi3_csn;
    inout              X_spi3_miso;
    inout              X_spi3_mosi;
    `ifdef ATCSPI200_3_QUADSPI_SUPPORT
    inout              X_spi3_holdn;
    inout              X_spi3_wpn;
    `endif
    `endif
    `ifdef AE250_SPI4_SUPPORT
    inout              X_spi4_clk;
    inout              X_spi4_csn;
    inout              X_spi4_miso;
    inout              X_spi4_mosi;
    `ifdef ATCSPI200_4_QUADSPI_SUPPORT
    inout              X_spi4_holdn;
    inout              X_spi4_wpn;
    `endif
    `endif
    `ifdef AE250_I2C_1_SUPPORT
    inout              X_i2c1_scl;
    inout              X_i2c1_sda;
    `endif
    `ifdef AE250_I2C_2_SUPPORT
    inout              X_i2c2_scl;
    inout              X_i2c2_sda;
    `endif
    `ifdef AE250_I2C_3_SUPPORT
    inout              X_i2c3_scl;
    inout              X_i2c3_sda;
    `endif
    `ifdef AE250_I2C_4_SUPPORT
    inout              X_i2c4_scl;
    inout              X_i2c4_sda;
    `endif
    `ifdef AE250_UART1_SUPPORT
    input              X_uart1_ctsn;
    output             X_uart1_rtsn;
    input              X_uart1_dcdn;
    input              X_uart1_dsrn;
    output             X_uart1_dtrn;
    output             X_uart1_out1n;
    output             X_uart1_out2n;
    input              X_uart1_rin;
    input              X_uart1_rxd;
    output             X_uart1_txd;
    `endif
    `ifdef AE250_UART2_SUPPORT
    input              X_uart2_ctsn;
    output             X_uart2_rtsn;
    input              X_uart2_dcdn;
    input              X_uart2_dsrn;
    output             X_uart2_dtrn;
    output             X_uart2_out1n;
    output             X_uart2_out2n;
    input              X_uart2_rin;
    input              X_uart2_rxd;
    output             X_uart2_txd;
    `endif
    `ifdef AE250_UART3_SUPPORT
    input              X_uart3_ctsn;
    output             X_uart3_rtsn;
    input              X_uart3_dcdn;
    input              X_uart3_dsrn;
    output             X_uart3_dtrn;
    output             X_uart3_out1n;
    output             X_uart3_out2n;
    input              X_uart3_rin;
    input              X_uart3_rxd;
    output             X_uart3_txd;
    `endif
    `ifdef AE250_UART4_SUPPORT
    input              X_uart4_ctsn;
    output             X_uart4_rtsn;
    input              X_uart4_dcdn;
    input              X_uart4_dsrn;
    output             X_uart4_dtrn;
    output             X_uart4_out1n;
    output             X_uart4_out2n;
    input              X_uart4_rin;
    input              X_uart4_rxd;
    output             X_uart4_txd;
    `endif
    `ifdef AE250_PIT1_SUPPORT
    output             X_pit1_pwm_ch0;
    `ifdef ATCPIT100_1_CH1_SUPPORT
	output             X_pit1_pwm_ch1;
    `endif
    `ifdef ATCPIT100_1_CH2_SUPPORT
	output             X_pit1_pwm_ch2;
    `endif
    `ifdef ATCPIT100_1_CH3_SUPPORT
	output             X_pit1_pwm_ch3;
    `endif
    `endif
    `ifdef AE250_PIT2_SUPPORT
    output             X_pit2_pwm_ch0;
    `ifdef ATCPIT100_2_CH1_SUPPORT
	output             X_pit2_pwm_ch1;
    `endif
    `ifdef ATCPIT100_2_CH2_SUPPORT
	output              X_pit2_pwm_ch2;
    `endif
    `ifdef ATCPIT100_2_CH3_SUPPORT
	output              X_pit2_pwm_ch3;
    `endif
    `endif
    `ifdef AE250_GPIO_SUPPORT
    inout  [31:0]      X_gpio;
    output [31:0]      gpio_pullup;
    output [31:0]      gpio_pulldown;
    `endif
`else
    input		T_hw_rstn;
    input		T_por_b;
    input       T_osch;

    input       pin_tdi_in;
    output      pin_tdi_out;
    output      pin_tdi_out_en;
    input       pin_tdo_in;
    output      pin_tdo_out;
    output      pin_tdo_out_en;
    input       pin_tms_in;
    output      pin_tms_out;
    output      pin_tms_out_en;
    input       pin_trst_in;
    output      pin_trst_out;
    output      pin_trst_out_en;
    `ifdef AE250_SPI1_SUPPORT
    input		spi1_clk_in;
    input		spi1_csn_in;
    input		spi1_miso_in;
    input		spi1_mosi_in;
    output		spi1_clk_out;
    output		spi1_clk_oe;
    output		spi1_csn_out;
    output		spi1_csn_oe;
    output		spi1_miso_out;
    output		spi1_miso_oe;
    output		spi1_mosi_out;
    output		spi1_mosi_oe;
    `ifdef ATCSPI200_1_QUADSPI_SUPPORT
    input		spi1_holdn_in;
    input		spi1_wpn_in;
    output      spi1_holdn_out;
    output		spi1_holdn_oe;
    output		spi1_wpn_out;
    output		spi1_wpn_oe;
    `endif
    `endif
    `ifdef AE250_SPI2_SUPPORT
    input		spi2_clk_in;
    input		spi2_csn_in;
    input		spi2_miso_in;
    input		spi2_mosi_in;
    output		spi2_clk_out;
    output		spi2_clk_oe;
    output		spi2_csn_out;
    output		spi2_csn_oe;
    output		spi2_miso_out;
    output		spi2_miso_oe;
    output		spi2_mosi_out;
    output		spi2_mosi_oe;
    `ifdef ATCSPI200_2_QUADSPI_SUPPORT
    input		spi2_holdn_in;
    input		spi2_wpn_in;
    output      spi2_holdn_out;
    output		spi2_holdn_oe;
    output		spi2_wpn_out;
    output		spi2_wpn_oe;
    `endif
    `endif
    `ifdef AE250_SPI3_SUPPORT
    input		spi3_clk_in;
    input		spi3_csn_in;
    input		spi3_miso_in;
    input		spi3_mosi_in;
    output		spi3_clk_out;
    output		spi3_clk_oe;
    output		spi3_csn_out;
    output		spi3_csn_oe;
    output		spi3_miso_out;
    output		spi3_miso_oe;
    output		spi3_mosi_out;
    output		spi3_mosi_oe;
    `ifdef ATCSPI200_3_QUADSPI_SUPPORT
    input		spi3_holdn_in;
    input		spi3_wpn_in;
    output      spi3_holdn_out;
    output		spi3_holdn_oe;
    output		spi3_wpn_out;
    output		spi3_wpn_oe;
    `endif
    `endif
    `ifdef AE250_SPI4_SUPPORT
    input		spi4_clk_in;
    input		spi4_csn_in;
    input		spi4_miso_in;
    input		spi4_mosi_in;
    output		spi4_clk_out;
    output		spi4_clk_oe;
    output		spi4_csn_out;
    output		spi4_csn_oe;
    output		spi4_miso_out;
    output		spi4_miso_oe;
    output		spi4_mosi_out;
    output		spi4_mosi_oe;
    `ifdef ATCSPI200_4_QUADSPI_SUPPORT
    input		spi4_holdn_in;
    input		spi4_wpn_in;
    output      spi4_holdn_out;
    output		spi4_holdn_oe;
    output		spi4_wpn_out;
    output		spi4_wpn_oe;
    `endif
    `endif
    `ifdef AE250_I2C_1_SUPPORT
    input		i2c1_scl_in;
    input		i2c1_sda_in;
    output		i2c1_scl;
    output		i2c1_sda;
    `endif
    `ifdef AE250_I2C_2_SUPPORT
    input		i2c2_scl_in;
    input		i2c2_sda_in;
    output		i2c2_scl;
    output		i2c2_sda;
    `endif
    `ifdef AE250_I2C_3_SUPPORT
    input		i2c3_scl_in;
    input		i2c3_sda_in;
    output		i2c3_scl;
    output		i2c3_sda;
    `endif
    `ifdef AE250_I2C_4_SUPPORT
    input		i2c4_scl_in;
    input		i2c4_sda_in;
    output		i2c4_scl;
    output		i2c4_sda;
    `endif
    `ifdef AE250_UART1_SUPPORT
    output		uart1_txd;
    output		uart1_rtsn;
    input		uart1_rxd;
    input		uart1_ctsn;
    input       uart1_dsrn;
    input       uart1_dcdn;
    input       uart1_rin;
    output      uart1_dtrn;
    output      uart1_out1n;
    output      uart1_out2n;
    `endif
    `ifdef AE250_UART2_SUPPORT
    output		uart2_txd;
    output		uart2_rtsn;
    input		uart2_rxd;
    input		uart2_ctsn;
    input       uart2_dcdn;
    input       uart2_dsrn;
    input       uart2_rin;
    output      uart2_dtrn;
    output      uart2_out1n;
    output      uart2_out2n;
    `endif
    `ifdef AE250_UART3_SUPPORT
    output		uart3_txd;
    output		uart3_rtsn;
    input		uart3_rxd;
    input		uart3_ctsn;
    input       uart3_dcdn;
    input       uart3_dsrn;
    input       uart3_rin;
    output      uart3_dtrn;
    output      uart3_out1n;
    output      uart3_out2n;
    `endif
    `ifdef AE250_UART4_SUPPORT 
    output		uart4_txd;
    output		uart4_rtsn;
    input		uart4_rxd;
    input		uart4_ctsn;
    input       uart4_dcdn;
    input       uart4_dsrn;
    input       uart4_rin;
    output      uart4_dtrn;
    output      uart4_out1n;
    output      uart4_out2n;
    `endif
    `ifdef AE250_PIT1_SUPPORT
    output      pit1_ch0_pwm;
    output      pit1_ch0_pwmoe;
    `ifdef ATCPIT100_1_CH1_SUPPORT
    output      pit1_ch1_pwm;
    output      pit1_ch1_pwmoe;
    `endif
    `ifdef ATCPIT100_1_CH2_SUPPORT
    output      pit1_ch2_pwm;
    output      pit1_ch2_pwmoe;
    `endif
    `ifdef ATCPIT100_1_CH3_SUPPORT
    output      pit1_ch3_pwm;
    output      pit1_ch3_pwmoe;
    `endif
    `endif
    `ifdef AE250_PIT2_SUPPORT
    output      pit2_ch0_pwm;
    output      pit2_ch0_pwmoe;
    `ifdef ATCPIT100_2_CH1_SUPPORT
    output      pit2_ch1_pwm;
    output      pit2_ch1_pwmoe;
    `endif
    `ifdef ATCPIT100_2_CH2_SUPPORT
    output      pit2_ch2_pwm;
    output      pit2_ch2_pwmoe;
    `endif
    `ifdef ATCPIT100_2_CH3_SUPPORT
    output      pit2_ch3_pwm;
    output      pit2_ch3_pwmoe;
    `endif
    `endif
    `ifdef AE250_GPIO_SUPPORT
    input  [31:0] gpio_in;
    output [31:0] gpio_oe;
    output [31:0] gpio_out;
    output [31:0] gpio_pulldown;
    output [31:0] gpio_pullup;
    `endif
`endif
`ifdef AE250_AHB_EXT
output          hclk_o;
output          hresetn_o;
`endif
`ifdef AE250_MATRIX_EXTMST1
input      [31:0] exthm1_haddr;
input       [2:0] exthm1_hburst;
input       [3:0] exthm1_hprot;
output     [31:0] exthm1_hrdata;
output            exthm1_hready;
output      [1:0] exthm1_hresp;
input       [2:0] exthm1_hsize;
input       [1:0] exthm1_htrans;
input             exthm1_hwrite;
input      [31:0] exthm1_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST2
input      [31:0] exthm2_haddr;
input       [2:0] exthm2_hburst;
input       [3:0] exthm2_hprot;
output     [31:0] exthm2_hrdata;
output            exthm2_hready;
output      [1:0] exthm2_hresp;
input       [2:0] exthm2_hsize;
input       [1:0] exthm2_htrans;
input             exthm2_hwrite;
input      [31:0] exthm2_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST3
input      [31:0] exthm3_haddr;
input       [2:0] exthm3_hburst;
input       [3:0] exthm3_hprot;
output     [31:0] exthm3_hrdata;
output            exthm3_hready;
output      [1:0] exthm3_hresp;
input       [2:0] exthm3_hsize;
input       [1:0] exthm3_htrans;
input             exthm3_hwrite;
input      [31:0] exthm3_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST4
input      [31:0] exthm4_haddr;
input       [2:0] exthm4_hburst;
input       [3:0] exthm4_hprot;
output     [31:0] exthm4_hrdata;
output            exthm4_hready;
output      [1:0] exthm4_hresp;
input       [2:0] exthm4_hsize;
input       [1:0] exthm4_htrans;
input             exthm4_hwrite;
input      [31:0] exthm4_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST5
input      [31:0] exthm5_haddr;
input       [2:0] exthm5_hburst;
input       [3:0] exthm5_hprot;
output     [31:0] exthm5_hrdata;
output            exthm5_hready;
output      [1:0] exthm5_hresp;
input       [2:0] exthm5_hsize;
input       [1:0] exthm5_htrans;
input             exthm5_hwrite;
input      [31:0] exthm5_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST6
input      [31:0] exthm6_haddr;
input       [2:0] exthm6_hburst;
input       [3:0] exthm6_hprot;
output     [31:0] exthm6_hrdata;
output            exthm6_hready;
output      [1:0] exthm6_hresp;
input       [2:0] exthm6_hsize;
input       [1:0] exthm6_htrans;
input             exthm6_hwrite;
input      [31:0] exthm6_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST7
input      [31:0] exthm7_haddr;
input       [2:0] exthm7_hburst;
input       [3:0] exthm7_hprot;
output     [31:0] exthm7_hrdata;
output            exthm7_hready;
output      [1:0] exthm7_hresp;
input       [2:0] exthm7_hsize;
input       [1:0] exthm7_htrans;
input             exthm7_hwrite;
input      [31:0] exthm7_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST8
input      [31:0] exthm8_haddr;
input       [2:0] exthm8_hburst;
input       [3:0] exthm8_hprot;
output     [31:0] exthm8_hrdata;
output            exthm8_hready;
output      [1:0] exthm8_hresp;
input       [2:0] exthm8_hsize;
input       [1:0] exthm8_htrans;
input             exthm8_hwrite;
input      [31:0] exthm8_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST9
input      [31:0] exthm9_haddr;
input       [2:0] exthm9_hburst;
input       [3:0] exthm9_hprot;
output     [31:0] exthm9_hrdata;
output            exthm9_hready;
output      [1:0] exthm9_hresp;
input       [2:0] exthm9_hsize;
input       [1:0] exthm9_htrans;
input             exthm9_hwrite;
input      [31:0] exthm9_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST10
input      [31:0] exthm10_haddr;
input       [2:0] exthm10_hburst;
input       [3:0] exthm10_hprot;
output     [31:0] exthm10_hrdata;
output            exthm10_hready;
output      [1:0] exthm10_hresp;
input       [2:0] exthm10_hsize;
input       [1:0] exthm10_htrans;
input             exthm10_hwrite;
input      [31:0] exthm10_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST11
input      [31:0] exthm11_haddr;
input       [2:0] exthm11_hburst;
input       [3:0] exthm11_hprot;
output     [31:0] exthm11_hrdata;
output            exthm11_hready;
output      [1:0] exthm11_hresp;
input       [2:0] exthm11_hsize;
input       [1:0] exthm11_htrans;
input             exthm11_hwrite;
input      [31:0] exthm11_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST12
input      [31:0] exthm12_haddr;
input       [2:0] exthm12_hburst;
input       [3:0] exthm12_hprot;
output     [31:0] exthm12_hrdata;
output            exthm12_hready;
output      [1:0] exthm12_hresp;
input       [2:0] exthm12_hsize;
input       [1:0] exthm12_htrans;
input             exthm12_hwrite;
input      [31:0] exthm12_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST13
input      [31:0] exthm13_haddr;
input       [2:0] exthm13_hburst;
input       [3:0] exthm13_hprot;
output     [31:0] exthm13_hrdata;
output            exthm13_hready;
output      [1:0] exthm13_hresp;
input       [2:0] exthm13_hsize;
input       [1:0] exthm13_htrans;
input             exthm13_hwrite;
input      [31:0] exthm13_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST14
input      [31:0] exthm14_haddr;
input       [2:0] exthm14_hburst;
input       [3:0] exthm14_hprot;
output     [31:0] exthm14_hrdata;
output            exthm14_hready;
output      [1:0] exthm14_hresp;
input       [2:0] exthm14_hsize;
input       [1:0] exthm14_htrans;
input             exthm14_hwrite;
input      [31:0] exthm14_hwdata;
`endif
`ifdef AE250_MATRIX_EXTMST15
input      [31:0] exthm15_haddr;
input       [2:0] exthm15_hburst;
input       [3:0] exthm15_hprot;
output     [31:0] exthm15_hrdata;
output            exthm15_hready;
output      [1:0] exthm15_hresp;
input       [2:0] exthm15_hsize;
input       [1:0] exthm15_htrans;
input             exthm15_hwrite;
input      [31:0] exthm15_hwdata;
`endif
`ifdef AE250_MATRIX_EXTSLV2
input      [31:0] exths2_hrdata;
input             exths2_hready;
input       [1:0] exths2_hresp;
output            exths2_hreadyout;
output     [31:0] exths2_haddr;
output      [2:0] exths2_hburst;
output      [3:0] exths2_hprot;
output            exths2_hsel;
output      [2:0] exths2_hsize;
output      [1:0] exths2_htrans;
output     [31:0] exths2_hwdata;
output            exths2_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV3
input      [31:0] exths3_hrdata;
input             exths3_hready;
input       [1:0] exths3_hresp;
output            exths3_hreadyout;
output     [31:0] exths3_haddr;
output      [2:0] exths3_hburst;
output      [3:0] exths3_hprot;
output            exths3_hsel;
output      [2:0] exths3_hsize;
output      [1:0] exths3_htrans;
output     [31:0] exths3_hwdata;
output            exths3_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV4
input      [31:0] exths4_hrdata;
input             exths4_hready;
input       [1:0] exths4_hresp;
output            exths4_hreadyout;
output     [31:0] exths4_haddr;
output      [2:0] exths4_hburst;
output      [3:0] exths4_hprot;
output            exths4_hsel;
output      [2:0] exths4_hsize;
output      [1:0] exths4_htrans;
output     [31:0] exths4_hwdata;
output            exths4_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV5
input      [31:0] exths5_hrdata;
input             exths5_hready;
input       [1:0] exths5_hresp;
output            exths5_hreadyout;
output     [31:0] exths5_haddr;
output      [2:0] exths5_hburst;
output      [3:0] exths5_hprot;
output            exths5_hsel;
output      [2:0] exths5_hsize;
output      [1:0] exths5_htrans;
output     [31:0] exths5_hwdata;
output            exths5_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV6
input      [31:0] exths6_hrdata;
input             exths6_hready;
input       [1:0] exths6_hresp;
output            exths6_hreadyout;
output     [31:0] exths6_haddr;
output      [2:0] exths6_hburst;
output      [3:0] exths6_hprot;
output            exths6_hsel;
output      [2:0] exths6_hsize;
output      [1:0] exths6_htrans;
output     [31:0] exths6_hwdata;
output            exths6_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV7
input      [31:0] exths7_hrdata;
input             exths7_hready;
input       [1:0] exths7_hresp;
output            exths7_hreadyout;
output     [31:0] exths7_haddr;
output      [2:0] exths7_hburst;
output      [3:0] exths7_hprot;
output            exths7_hsel;
output      [2:0] exths7_hsize;
output      [1:0] exths7_htrans;
output     [31:0] exths7_hwdata;
output            exths7_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV8
input      [31:0] exths8_hrdata;
input             exths8_hready;
input       [1:0] exths8_hresp;
output            exths8_hreadyout;
output     [31:0] exths8_haddr;
output      [2:0] exths8_hburst;
output      [3:0] exths8_hprot;
output            exths8_hsel;
output      [2:0] exths8_hsize;
output      [1:0] exths8_htrans;
output     [31:0] exths8_hwdata;
output            exths8_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV9
input      [31:0] exths9_hrdata;
input             exths9_hready;
input       [1:0] exths9_hresp;
output            exths9_hreadyout;
output     [31:0] exths9_haddr;
output      [2:0] exths9_hburst;
output      [3:0] exths9_hprot;
output            exths9_hsel;
output      [2:0] exths9_hsize;
output      [1:0] exths9_htrans;
output     [31:0] exths9_hwdata;
output            exths9_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV10
input      [31:0] exths10_hrdata;
input             exths10_hready;
input       [1:0] exths10_hresp;
output            exths10_hreadyout;
output     [31:0] exths10_haddr;
output      [2:0] exths10_hburst;
output      [3:0] exths10_hprot;
output            exths10_hsel;
output      [2:0] exths10_hsize;
output      [1:0] exths10_htrans;
output     [31:0] exths10_hwdata;
output            exths10_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV11
input      [31:0] exths11_hrdata;
input             exths11_hready;
input       [1:0] exths11_hresp;
output            exths11_hreadyout;
output     [31:0] exths11_haddr;
output      [2:0] exths11_hburst;
output      [3:0] exths11_hprot;
output            exths11_hsel;
output      [2:0] exths11_hsize;
output      [1:0] exths11_htrans;
output     [31:0] exths11_hwdata;
output            exths11_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV12
input      [31:0] exths12_hrdata;
input             exths12_hready;
input       [1:0] exths12_hresp;
output            exths12_hreadyout;
output     [31:0] exths12_haddr;
output      [2:0] exths12_hburst;
output      [3:0] exths12_hprot;
output            exths12_hsel;
output      [2:0] exths12_hsize;
output      [1:0] exths12_htrans;
output     [31:0] exths12_hwdata;
output            exths12_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV13
input      [31:0] exths13_hrdata;
input             exths13_hready;
input       [1:0] exths13_hresp;
output            exths13_hreadyout;
output     [31:0] exths13_haddr;
output      [2:0] exths13_hburst;
output      [3:0] exths13_hprot;
output            exths13_hsel;
output      [2:0] exths13_hsize;
output      [1:0] exths13_htrans;
output     [31:0] exths13_hwdata;
output            exths13_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV14
input      [31:0] exths14_hrdata;
input             exths14_hready;
input       [1:0] exths14_hresp;
output            exths14_hreadyout;
output     [31:0] exths14_haddr;
output      [2:0] exths14_hburst;
output      [3:0] exths14_hprot;
output            exths14_hsel;
output      [2:0] exths14_hsize;
output      [1:0] exths14_htrans;
output     [31:0] exths14_hwdata;
output            exths14_hwrite;
`endif
`ifdef AE250_MATRIX_EXTSLV15
input      [31:0] exths15_hrdata;
input             exths15_hready;
input       [1:0] exths15_hresp;
output            exths15_hreadyout;
output     [31:0] exths15_haddr;
output      [2:0] exths15_hburst;
output      [3:0] exths15_hprot;
output            exths15_hsel;
output      [2:0] exths15_hsize;
output      [1:0] exths15_htrans;
output     [31:0] exths15_hwdata;
output            exths15_hwrite;
`endif

`ifdef AE250_APB_EXTSLV
output          pclk_o;
output          presetn_o;
output      [2:0] pprot;
output      [3:0] pstrb;
output     [31:0] paddr;
output       	  penable;
output       	  pwrite;
output	   [31:0] pwdata;
`endif
`ifdef AE250_APB_EXTSLV2
output	          extps2_psel;
input 	   [31:0] extps2_prdata;
input 	          extps2_pready;
input 	          extps2_pslverr;
`endif
`ifdef AE250_APB_EXTSLV3
output	          extps3_psel;
input 	   [31:0] extps3_prdata;
input 	          extps3_pready;
input 	          extps3_pslverr;
`endif
`ifdef AE250_APB_EXTSLV4
output	          extps4_psel;
input 	   [31:0] extps4_prdata;
input 	          extps4_pready;
input 	          extps4_pslverr;
`endif
`ifdef AE250_APB_EXTSLV5
output	          extps5_psel;
input 	   [31:0] extps5_prdata;
input 	          extps5_pready;
input 	          extps5_pslverr;
`endif
`ifdef AE250_APB_EXTSLV6
output	          extps6_psel;
input 	   [31:0] extps6_prdata;
input 	          extps6_pready;
input 	          extps6_pslverr;
`endif
`ifdef AE250_APB_EXTSLV7
output	          extps7_psel;
input 	   [31:0] extps7_prdata;
input 	          extps7_pready;
input 	          extps7_pslverr;
`endif
`ifdef AE250_APB_EXTSLV8
output	          extps8_psel;
input 	   [31:0] extps8_prdata;
input 	          extps8_pready;
input 	          extps8_pslverr;
`endif
`ifdef AE250_APB_EXTSLV9
output	          extps9_psel;
input 	   [31:0] extps9_prdata;
input 	          extps9_pready;
input 	          extps9_pslverr;
`endif
`ifdef AE250_APB_EXTSLV10
output	          extps10_psel;
input 	   [31:0] extps10_prdata;
input 	          extps10_pready;
input 	          extps10_pslverr;
`endif
`ifdef AE250_APB_EXTSLV11
output	          extps11_psel;
input 	   [31:0] extps11_prdata;
input 	          extps11_pready;
input 	          extps11_pslverr;
`endif
`ifdef AE250_APB_EXTSLV12
output	          extps12_psel;
input 	   [31:0] extps12_prdata;
input 	          extps12_pready;
input 	          extps12_pslverr;
`endif
`ifdef AE250_APB_EXTSLV13
output	          extps13_psel;
input 	   [31:0] extps13_prdata;
input 	          extps13_pready;
input 	          extps13_pslverr;
`endif
`ifdef AE250_APB_EXTSLV14
output	          extps14_psel;
input 	   [31:0] extps14_prdata;
input 	          extps14_pready;
input 	          extps14_pslverr;
`endif
`ifdef AE250_APB_EXTSLV15
output	          extps15_psel;
input 	   [31:0] extps15_prdata;
input 	          extps15_pready;
input 	          extps15_pslverr;
`endif
`ifdef AE250_APB_EXTSLV16
output	          extps16_psel;
input 	   [31:0] extps16_prdata;
input 	          extps16_pready;
input 	          extps16_pslverr;
`endif
`ifdef AE250_APB_EXTSLV17
output	          extps17_psel;
input 	   [31:0] extps17_prdata;
input 	          extps17_pready;
input 	          extps17_pslverr;
`endif
`ifdef AE250_APB_EXTSLV18
output	          extps18_psel;
input 	   [31:0] extps18_prdata;
input 	          extps18_pready;
input 	          extps18_pslverr;
`endif
`ifdef AE250_APB_EXTSLV19
output	          extps19_psel;
input 	   [31:0] extps19_prdata;
input 	          extps19_pready;
input 	          extps19_pslverr;
`endif
`ifdef AE250_APB_EXTSLV20
output	          extps20_psel;
input 	   [31:0] extps20_prdata;
input 	          extps20_pready;
input 	          extps20_pslverr;
`endif
`ifdef AE250_APB_EXTSLV21
output	          extps21_psel;
input 	   [31:0] extps21_prdata;
input 	          extps21_pready;
input 	          extps21_pslverr;
`endif
`ifdef AE250_APB_EXTSLV22
output	          extps22_psel;
input 	   [31:0] extps22_prdata;
input 	          extps22_pready;
input 	          extps22_pslverr;
`endif
`ifdef AE250_APB_EXTSLV23
output	          extps23_psel;
input 	   [31:0] extps23_prdata;
input 	          extps23_pready;
input 	          extps23_pslverr;
`endif
`ifdef AE250_APB_EXTSLV24
output	          extps24_psel;
input 	   [31:0] extps24_prdata;
input 	          extps24_pready;
input 	          extps24_pslverr;
`endif
`ifdef AE250_APB_EXTSLV25
output	          extps25_psel;
input 	   [31:0] extps25_prdata;
input 	          extps25_pready;
input 	          extps25_pslverr;
`endif
`ifdef AE250_APB_EXTSLV26
output	          extps26_psel;
input 	   [31:0] extps26_prdata;
input 	          extps26_pready;
input 	          extps26_pslverr;
`endif
`ifdef AE250_APB_EXTSLV27
output	          extps27_psel;
input 	   [31:0] extps27_prdata;
input 	          extps27_pready;
input 	          extps27_pslverr;
`endif
`ifdef AE250_APB_EXTSLV28
output	          extps28_psel;
input 	   [31:0] extps28_prdata;
input 	          extps28_pready;
input 	          extps28_pslverr;
`endif
`ifdef AE250_APB_EXTSLV29
output	          extps29_psel;
input 	   [31:0] extps29_prdata;
input	          extps29_pready;
input	          extps29_pslverr;
`endif
`ifdef AE250_APB_EXTSLV30
output	          extps30_psel;
input      [31:0] extps30_prdata;
input	          extps30_pready;
input	          extps30_pslverr;
`endif
`ifdef AE250_APB_EXTSLV31
output	          extps31_psel;
input      [31:0] extps31_prdata;
input	          extps31_pready;
input	          extps31_pslverr;
`endif
`ifdef AE250_DMAC_SUPPORT
    `ifdef AE250_DMA_EXTREQ_SUPPORT
output [`AE250_DMA_EXTREQ_NUM-1:0]         dma_ack_ext;
input  [`AE250_DMA_EXTREQ_NUM-1:0]         dma_req_ext;
    `endif
`endif

input      [7:0] ext_int_src;
//**********************************************************************
// --- Inter Signal Declaration
//**********************************************************************

wire T_osch;
wire T_hw_rstn;
wire T_por_b;
wire pin_trst_in;
wire pin_tdi_in;
wire pin_tdo_in;
wire pin_trst_out;
wire pin_trst_out_en;
wire pin_tdi_out;
wire pin_tdi_out_en;
wire pin_tdo_out;
wire pin_tdo_out_en;
wire pin_tms_in;
wire pin_tms_out;
wire pin_tms_out_en;
`ifdef AE250_SPI1_SUPPORT
wire	spi1_clk_in;
wire	spi1_csn_in;
wire	spi1_miso_in;
wire	spi1_mosi_in;
wire	spi1_clk_out;
wire	spi1_clk_oe;
wire	spi1_csn_out;
wire	spi1_csn_oe;
wire	spi1_miso_out;
wire	spi1_miso_oe;
wire	spi1_mosi_out;
wire	spi1_mosi_oe;
    `ifdef ATCSPI200_1_QUADSPI_SUPPORT
    wire	spi1_holdn_in;
    wire	spi1_wpn_in;
    wire    spi1_holdn_out;
    wire	spi1_holdn_oe;
    wire	spi1_wpn_out;
    wire	spi1_wpn_oe;
    `endif
`endif
`ifdef AE250_SPI2_SUPPORT
wire	spi2_clk_in;
wire	spi2_csn_in;
wire	spi2_miso_in;
wire	spi2_mosi_in;
wire	spi2_clk_out;
wire	spi2_clk_oe;
wire	spi2_csn_out;
wire	spi2_csn_oe;
wire	spi2_miso_out;
wire	spi2_miso_oe;
wire	spi2_mosi_out;
wire	spi2_mosi_oe;
    `ifdef ATCSPI200_2_QUADSPI_SUPPORT
    wire	spi2_holdn_in;
    wire	spi2_wpn_in;
    wire    spi2_holdn_out;
    wire	spi2_holdn_oe;
    wire	spi2_wpn_out;
    wire	spi2_wpn_oe;
    `endif
`endif
`ifdef AE250_SPI3_SUPPORT
wire	spi3_clk_in;
wire	spi3_csn_in;
wire	spi3_miso_in;
wire	spi3_mosi_in;
wire	spi3_clk_out;
wire	spi3_clk_oe;
wire	spi3_csn_out;
wire	spi3_csn_oe;
wire	spi3_miso_out;
wire	spi3_miso_oe;
wire	spi3_mosi_out;
wire	spi3_mosi_oe;
    `ifdef ATCSPI200_3_QUADSPI_SUPPORT
    wire	spi3_holdn_in;
    wire	spi3_wpn_in;
    wire    spi3_holdn_out;
    wire	spi3_holdn_oe;
    wire	spi3_wpn_out;
    wire	spi3_wpn_oe;
    `endif
`endif
`ifdef AE250_SPI4_SUPPORT
wire	spi4_clk_in;
wire	spi4_csn_in;
wire	spi4_miso_in;
wire	spi4_mosi_in;
wire	spi4_clk_out;
wire	spi4_clk_oe;
wire	spi4_csn_out;
wire	spi4_csn_oe;
wire	spi4_miso_out;
wire	spi4_miso_oe;
wire	spi4_mosi_out;
wire	spi4_mosi_oe;
    `ifdef ATCSPI200_4_QUADSPI_SUPPORT
    wire	spi4_holdn_in;
    wire	spi4_wpn_in;
    wire    spi4_holdn_out;
    wire	spi4_holdn_oe;
    wire	spi4_wpn_out;
    wire	spi4_wpn_oe;
    `endif
`endif
`ifdef AE250_I2C_1_SUPPORT
wire	i2c1_scl_in;
wire	i2c1_sda_in;
wire	i2c1_scl;
wire	i2c1_sda;
`endif
`ifdef AE250_I2C_2_SUPPORT
wire	i2c2_scl_in;
wire	i2c2_sda_in;
wire	i2c2_scl;
wire	i2c2_sda;
`endif
`ifdef AE250_I2C_3_SUPPORT
wire	i2c3_scl_in;
wire	i2c3_sda_in;
wire	i2c3_scl;
wire	i2c3_sda;
`endif
`ifdef AE250_I2C_4_SUPPORT
wire	i2c4_scl_in;
wire	i2c4_sda_in;
wire	i2c4_scl;
wire	i2c4_sda;
`endif
`ifdef AE250_UART1_SUPPORT
wire	uart1_txd;
wire	uart1_rtsn;
wire	uart1_rxd;
wire	uart1_ctsn;
wire    uart1_dsrn;
wire    uart1_dcdn;
wire    uart1_rin;
wire    uart1_dtrn;
wire    uart1_out1n;
wire    uart1_out2n;
`endif
`ifdef AE250_UART2_SUPPORT
wire	uart2_txd;
wire	uart2_rtsn;
wire	uart2_rxd;
wire	uart2_ctsn;
wire    uart2_dcdn;
wire    uart2_dsrn;
wire    uart2_rin;
wire    uart2_dtrn;
wire    uart2_out1n;
wire    uart2_out2n;
`endif
`ifdef AE250_UART3_SUPPORT
wire	uart3_txd;
wire	uart3_rtsn;
wire	uart3_rxd;
wire	uart3_ctsn;
wire    uart3_dcdn;
wire    uart3_dsrn;
wire    uart3_rin;
wire    uart3_dtrn;
wire    uart3_out1n;
wire    uart3_out2n;
`endif
`ifdef AE250_UART4_SUPPORT 
wire	uart4_txd;
wire	uart4_rtsn;
wire	uart4_rxd;
wire	uart4_ctsn;
wire    uart4_dcdn;
wire    uart4_dsrn;
wire    uart4_rin;
wire    uart4_dtrn;
wire    uart4_out1n;
wire    uart4_out2n;
`endif
`ifdef AE250_PIT1_SUPPORT
wire    pit1_ch0_pwm;
wire    pit1_ch0_pwmoe;
wire    pit1_ch1_pwm;
wire    pit1_ch1_pwmoe;
wire    pit1_ch2_pwm;
wire    pit1_ch2_pwmoe;
wire    pit1_ch3_pwm;
wire    pit1_ch3_pwmoe;
`endif
`ifdef AE250_PIT2_SUPPORT
wire    pit2_ch0_pwm;
wire    pit2_ch0_pwmoe;
wire    pit2_ch1_pwm;
wire    pit2_ch1_pwmoe;
wire    pit2_ch2_pwm;
wire    pit2_ch2_pwmoe;
wire    pit2_ch3_pwm;
wire    pit2_ch3_pwmoe;
`endif
`ifdef AE250_GPIO_SUPPORT
wire    [31:0] gpio_oe;
wire    [31:0] gpio_out;
wire    [31:0] gpio_in;
`endif

//**********************************************************************
// --- Module: AE250 PIN
//**********************************************************************
`ifdef AE250_INOUT_SUPPORT

assign	T_osch	= X_oschin;
assign	X_oschio	= X_oschin;
assign  T_hw_rstn=X_hw_rstn;
assign  T_por_b=X_por_b;

`ifdef DEBUG_SUPPORT 
assign  X_trst	= pin_trst_out_en ? pin_trst_out : 1'bz;
assign  pin_trst_in	= X_trst;
assign  X_tdi	= pin_tdi_out_en ? pin_tdi_out : 1'bz;
assign  pin_tdi_in	= X_tdi;
assign  X_tdo	= pin_tdo_out_en ? pin_tdo_out : 1'bz;
assign  pin_tdo_in	= X_tdo;
assign  X_tms=pin_tms_out_en ? pin_tms_out : 1'bz;
assign  pin_tms_in=X_tms;
`else
assign pin_trst_in = 1'bx;
assign pin_tdi_in = 1'bx;
assign pin_tdo_in = 1'bx;
assign pin_tms_in = 1'bx;
`endif

`ifdef AE250_SPI1_SUPPORT
assign  X_spi1_clk	= spi1_clk_oe ? spi1_clk_out : 1'bz;
assign  spi1_clk_in	= X_spi1_clk;
assign  X_spi1_csn	= spi1_csn_oe ? spi1_csn_out : 1'bz;
assign  spi1_csn_in	= X_spi1_csn;
assign  X_spi1_miso	= spi1_miso_oe ? spi1_miso_out : 1'bz;
assign  spi1_miso_in	= X_spi1_miso;
assign  X_spi1_mosi	= spi1_mosi_oe ?spi1_mosi_out : 1'bz;
assign  spi1_mosi_in	= X_spi1_mosi;
    `ifdef ATCSPI200_1_QUADSPI_SUPPORT
    assign  X_spi1_wpn	= spi1_wpn_oe ? spi1_wpn_out : 1'bz;
    assign  spi1_wpn_in	= X_spi1_wpn;
    assign  X_spi1_holdn	= spi1_holdn_oe ? spi1_holdn_out : 1'bz;
    assign  spi1_holdn_in	= X_spi1_holdn;
    `endif
`endif

`ifdef AE250_SPI2_SUPPORT
assign  X_spi2_clk	= spi2_clk_oe ? spi2_clk_out : 1'bz;
assign  spi2_clk_in	= X_spi2_clk;
assign  X_spi2_csn	= spi2_csn_oe ? spi2_csn_out : 1'bz;
assign  spi2_csn_in	= X_spi2_csn;
assign  X_spi2_miso	= spi2_miso_oe ? spi2_miso_out : 1'bz;
assign  spi2_miso_in	= X_spi2_miso;
assign  X_spi2_mosi	= spi2_mosi_oe ?spi2_mosi_out : 1'bz;
assign  spi2_mosi_in	= X_spi2_mosi;
    `ifdef ATCSPI200_2_QUADSPI_SUPPORT
    assign  X_spi2_wpn	= spi2_wpn_oe ? spi2_wpn_out : 1'bz;
    assign  spi2_wpn_in	= X_spi2_wpn;
    assign  X_spi2_holdn	= spi2_holdn_oe ? spi2_holdn_out : 1'bz;
    assign  spi2_holdn_in	= X_spi2_holdn;
    `endif
`endif

`ifdef AE250_SPI3_SUPPORT
assign  X_spi3_clk	= spi3_clk_oe ? spi3_clk_out : 1'bz;
assign  spi3_clk_in	= X_spi3_clk;
assign  X_spi3_csn	= spi3_csn_oe ? spi3_csn_out : 1'bz;
assign  spi3_csn_in	= X_spi3_csn;
assign  X_spi3_miso	= spi3_miso_oe ? spi3_miso_out : 1'bz;
assign  spi3_miso_in	= X_spi3_miso;
assign  X_spi3_mosi	= spi3_mosi_oe ?spi3_mosi_out : 1'bz;
assign  spi3_mosi_in	= X_spi3_mosi;
    `ifdef ATCSPI200_3_QUADSPI_SUPPORT
    assign  X_spi3_wpn	= spi3_wpn_oe ? spi3_wpn_out : 1'bz;
    assign  spi3_wpn_in	= X_spi3_wpn;
    assign  X_spi3_holdn	= spi3_holdn_oe ? spi3_holdn_out : 1'bz;
    assign  spi3_holdn_in	= X_spi3_holdn;
    `endif
`endif

`ifdef AE250_SPI4_SUPPORT
assign  X_spi4_clk	= spi4_clk_oe ? spi4_clk_out : 1'bz;
assign  spi4_clk_in	= X_spi4_clk;
assign  X_spi4_csn	= spi4_csn_oe ? spi4_csn_out : 1'bz;
assign  spi4_csn_in	= X_spi4_csn;
assign  X_spi4_miso	= spi4_miso_oe ? spi4_miso_out : 1'bz;
assign  spi4_miso_in	= X_spi4_miso;
assign  X_spi4_mosi	= spi4_mosi_oe ?spi4_mosi_out : 1'bz;
assign  spi4_mosi_in	= X_spi4_mosi;
    `ifdef ATCSPI200_4_QUADSPI_SUPPORT
    assign  X_spi4_wpn	= spi4_wpn_oe ? spi4_wpn_out : 1'bz;
    assign  spi4_wpn_in	= X_spi4_wpn;
    assign  X_spi4_holdn	= spi4_holdn_oe ? spi4_holdn_out : 1'bz;
    assign  spi4_holdn_in	= X_spi4_holdn;
    `endif
`endif

`ifdef AE250_I2C_1_SUPPORT
assign  X_i2c1_scl	= (~i2c1_scl) ? i2c1_scl : 1'bz;
assign  X_i2c1_sda	= (~i2c1_sda) ? i2c1_sda : 1'bz;
assign  i2c1_scl_in=X_i2c1_scl;
assign  i2c1_sda_in=X_i2c1_sda;
`endif

`ifdef AE250_I2C_2_SUPPORT
assign  X_i2c2_scl	= (~i2c2_scl) ? i2c2_scl : 1'bz;
assign  X_i2c2_sda	= (~i2c2_sda) ? i2c2_sda : 1'bz;
assign  i2c2_scl_in=X_i2c2_scl;
assign  i2c2_sda_in=X_i2c2_sda;
`endif

`ifdef AE250_I2C_3_SUPPORT
assign  X_i2c3_scl	= (~i2c3_scl) ? i2c3_scl : 1'bz;
assign  X_i2c3_sda	= (~i2c3_sda) ? i2c3_sda : 1'bz;
assign  i2c3_scl_in=X_i2c3_scl;
assign  i2c3_sda_in=X_i2c3_sda;
`endif

`ifdef AE250_I2C_4_SUPPORT
assign  X_i2c4_scl	= (~i2c4_scl) ? i2c4_scl : 1'bz;
assign  X_i2c4_sda	= (~i2c4_sda) ? i2c4_sda : 1'bz;
assign  i2c4_scl_in=X_i2c4_scl;
assign  i2c4_sda_in=X_i2c4_sda;
`endif

`ifdef AE250_UART1_SUPPORT
assign  X_uart1_txd	= 1'b1 ? uart1_txd : 1'bz;
assign  uart1_rxd=X_uart1_rxd;
assign  X_uart1_dtrn	= 1'b1 ? uart1_dtrn : 1'bz;
assign  X_uart1_out1n	= 1'b1 ? uart1_out1n : 1'bz;
assign  X_uart1_out2n	= 1'b1 ? uart1_out2n : 1'bz;
assign  uart1_dcdn=X_uart1_dcdn;
assign  uart1_dsrn=X_uart1_dsrn;
assign  uart1_rin=X_uart1_rin;
assign  uart1_ctsn=X_uart1_ctsn;
assign  X_uart1_rtsn	= 1'b1 ? uart1_rtsn : 1'bz;
`endif

`ifdef AE250_UART2_SUPPORT
assign  X_uart2_txd	= 1'b1 ? uart2_txd : 1'bz;
assign  uart2_rxd=X_uart2_rxd;
assign  X_uart2_dtrn	= 1'b1 ? uart2_dtrn : 1'bz;
assign  X_uart2_out1n	= 1'b1 ? uart2_out1n : 1'bz;
assign  X_uart2_out2n	= 1'b1 ? uart2_out2n : 1'bz;
assign  uart2_dcdn=X_uart2_dcdn;
assign  uart2_dsrn=X_uart2_dsrn;
assign  uart2_rin=X_uart2_rin;
assign  uart2_ctsn=X_uart2_ctsn;
assign  X_uart2_rtsn	= 1'b1 ? uart2_rtsn : 1'bz;
`endif

`ifdef AE250_UART3_SUPPORT
assign  X_uart3_txd	= 1'b1 ? uart3_txd : 1'bz;
assign  uart3_rxd=X_uart3_rxd;
assign  X_uart3_dtrn	= 1'b1 ? uart3_dtrn : 1'bz;
assign  X_uart3_out1n	= 1'b1 ? uart3_out1n : 1'bz;
assign  X_uart3_out2n	= 1'b1 ? uart3_out2n : 1'bz;
assign  uart3_dcdn=X_uart3_dcdn;
assign  uart3_dsrn=X_uart3_dsrn;
assign  uart3_rin=X_uart3_rin;
assign  uart3_ctsn=X_uart3_ctsn;
assign  X_uart3_rtsn	= 1'b1 ? uart3_rtsn : 1'bz;
`endif

`ifdef AE250_UART4_SUPPORT 
assign  X_uart4_txd	= 1'b1 ? uart4_txd : 1'bz;
assign  uart4_rxd=X_uart4_rxd;
assign  X_uart4_dtrn	= 1'b1 ? uart4_dtrn : 1'bz;
assign  X_uart4_out1n	= 1'b1 ? uart4_out1n : 1'bz;
assign  X_uart4_out2n	= 1'b1 ? uart4_out2n : 1'bz;
assign  uart4_dcdn=X_uart4_dcdn;
assign  uart4_dsrn=X_uart4_dsrn;
assign  uart4_rin=X_uart4_rin;
assign  uart4_ctsn=X_uart4_ctsn;
assign  X_uart4_rtsn	= 1'b1 ? uart4_rtsn : 1'bz;
`endif

`ifdef AE250_PIT1_SUPPORT
    assign  X_pit1_pwm_ch0	= pit1_ch0_pwmoe ? pit1_ch0_pwm : 1'bz;
    `ifdef ATCPIT100_1_CH1_SUPPORT
    assign  X_pit1_pwm_ch1	= pit1_ch1_pwmoe ? pit1_ch1_pwm : 1'bz;
    `endif
    `ifdef ATCPIT100_1_CH2_SUPPORT
    assign  X_pit1_pwm_ch2	= pit1_ch2_pwmoe ? pit1_ch2_pwm : 1'bz;
    `endif
    `ifdef ATCPIT100_1_CH3_SUPPORT
    assign  X_pit1_pwm_ch3	= pit1_ch3_pwmoe ? pit1_ch3_pwm : 1'bz;
    `endif
`endif

`ifdef AE250_PIT2_SUPPORT
    assign  X_pit2_pwm_ch0	= pit2_ch0_pwmoe ? pit2_ch0_pwm : 1'bz;
    `ifdef ATCPIT100_2_CH1_SUPPORT
    assign  X_pit2_pwm_ch1	= pit2_ch1_pwmoe ? pit2_ch1_pwm : 1'bz;
    `endif
    `ifdef ATCPIT100_2_CH2_SUPPORT
    assign  X_pit2_pwm_ch2	= pit2_ch2_pwmoe ? pit2_ch2_pwm : 1'bz;
    `endif
    `ifdef ATCPIT100_2_CH3_SUPPORT
    assign  X_pit2_pwm_ch3	= pit2_ch3_pwmoe ? pit2_ch3_pwm : 1'bz;
`endif
`endif

`ifdef AE250_GPIO_SUPPORT

assign  X_gpio[0 ]	= gpio_oe[0 ] ? gpio_out[0 ]  : 1'bz;
assign  X_gpio[1 ]	= gpio_oe[1 ] ? gpio_out[1 ]  : 1'bz;
assign  X_gpio[2 ]	= gpio_oe[2 ] ? gpio_out[2 ]  : 1'bz;
assign  X_gpio[3 ]	= gpio_oe[3 ] ? gpio_out[3 ]  : 1'bz;
assign  X_gpio[4 ]	= gpio_oe[4 ] ? gpio_out[4 ]  : 1'bz;
assign  X_gpio[5 ]	= gpio_oe[5 ] ? gpio_out[5 ]  : 1'bz;
assign  X_gpio[6 ]	= gpio_oe[6 ] ? gpio_out[6 ]  : 1'bz;
assign  X_gpio[7 ]	= gpio_oe[7 ] ? gpio_out[7 ]  : 1'bz;
assign  X_gpio[8 ]	= gpio_oe[8 ] ? gpio_out[8 ]  : 1'bz;
assign  X_gpio[9 ]	= gpio_oe[9 ] ? gpio_out[9 ]  : 1'bz;
assign  X_gpio[10]	= gpio_oe[10] ? gpio_out[10]  : 1'bz;
assign  X_gpio[11]	= gpio_oe[11] ? gpio_out[11]  : 1'bz;
assign  X_gpio[12]	= gpio_oe[12] ? gpio_out[12]  : 1'bz;
assign  X_gpio[13]	= gpio_oe[13] ? gpio_out[13]  : 1'bz;
assign  X_gpio[14]	= gpio_oe[14] ? gpio_out[14]  : 1'bz;
assign  X_gpio[15]	= gpio_oe[15] ? gpio_out[15]  : 1'bz;
assign  X_gpio[16]	= gpio_oe[16] ? gpio_out[16]  : 1'bz;
assign  X_gpio[17]	= gpio_oe[17] ? gpio_out[17]  : 1'bz;
assign  X_gpio[18]	= gpio_oe[18] ? gpio_out[18]  : 1'bz;
assign  X_gpio[19]	= gpio_oe[19] ? gpio_out[19]  : 1'bz;
assign  X_gpio[20]	= gpio_oe[20] ? gpio_out[20]  : 1'bz;
assign  X_gpio[21]	= gpio_oe[21] ? gpio_out[21]  : 1'bz;
assign  X_gpio[22]	= gpio_oe[22] ? gpio_out[22]  : 1'bz;
assign  X_gpio[23]	= gpio_oe[23] ? gpio_out[23]  : 1'bz;
assign  X_gpio[24]	= gpio_oe[24] ? gpio_out[24]  : 1'bz;
assign  X_gpio[25]	= gpio_oe[25] ? gpio_out[25]  : 1'bz;
assign  X_gpio[26]	= gpio_oe[26] ? gpio_out[26]  : 1'bz;
assign  X_gpio[27]	= gpio_oe[27] ? gpio_out[27]  : 1'bz;
assign  X_gpio[28]	= gpio_oe[28] ? gpio_out[28]  : 1'bz;
assign  X_gpio[29]	= gpio_oe[29] ? gpio_out[29]  : 1'bz;
assign  X_gpio[30]	= gpio_oe[30] ? gpio_out[30]  : 1'bz;
assign  X_gpio[31]	= gpio_oe[31] ? gpio_out[31]  : 1'bz;

assign  gpio_in[0]	= X_gpio[0];
assign  gpio_in[1]	= X_gpio[1];
assign  gpio_in[2]	= X_gpio[2];
assign  gpio_in[3]	= X_gpio[3];
assign  gpio_in[4]	= X_gpio[4];
assign  gpio_in[5]	= X_gpio[5];
assign  gpio_in[6]	= X_gpio[6];
assign  gpio_in[7]	= X_gpio[7];
assign  gpio_in[8]	= X_gpio[8];
assign  gpio_in[9]	= X_gpio[9];
assign  gpio_in[10]	= X_gpio[10];
assign  gpio_in[11]	= X_gpio[11];
assign  gpio_in[12]	= X_gpio[12];
assign  gpio_in[13]	= X_gpio[13];
assign  gpio_in[14]	= X_gpio[14];
assign  gpio_in[15]	= X_gpio[15];
assign  gpio_in[16]	= X_gpio[16];
assign  gpio_in[17]	= X_gpio[17];
assign  gpio_in[18]	= X_gpio[18];
assign  gpio_in[19]	= X_gpio[19];
assign  gpio_in[20]	= X_gpio[20];
assign  gpio_in[21]	= X_gpio[21];
assign  gpio_in[22]	= X_gpio[22];
assign  gpio_in[23]	= X_gpio[23];
assign  gpio_in[24]	= X_gpio[24];
assign  gpio_in[25]	= X_gpio[25];
assign  gpio_in[26]	= X_gpio[26];
assign  gpio_in[27]	= X_gpio[27];
assign  gpio_in[28]	= X_gpio[28];
assign  gpio_in[29]	= X_gpio[29];
assign  gpio_in[30]	= X_gpio[30];
assign  gpio_in[31]	= X_gpio[31];
`endif

`endif
//**********************************************************************
// --- Module: AE250 Chip
//**********************************************************************
defparam ae250_chip.IP_name=`IP_name;

`ifdef AE250_DMAC_SUPPORT
defparam ae250_chip.AE250_DMAC_SUPPORT="yes";
    `ifdef AE250_DMA_EXTREQ_SUPPORT
    defparam ae250_chip.AE250_DMA_EXTREQ_SUPPORT="yes";
    defparam ae250_chip.AE250_DMA_EXTREQ_NUM=`AE250_DMA_EXTREQ_NUM;
    `else
    defparam ae250_chip.AE250_DMA_EXTREQ_SUPPORT="no";
    defparam ae250_chip.AE250_DMA_EXTREQ_NUM=0;
    `endif
defparam ae250_chip.ATCDMAC100_CHAIN_TRANSFER_SUPPORT=`ATCDMAC100_CHAIN_TRANSFER_SUPPORT;
defparam ae250_chip.ATCDMAC100_REQ_SYNC_SUPPORT=`ATCDMAC100_REQ_SYNC_SUPPORT;
defparam ae250_chip.ATCDMAC100_FIFO_DEPTH=`ATCDMAC100_FIFO_DEPTH;
defparam ae250_chip.ATCDMAC100_CH_NUM=`ATCDMAC100_CH_NUM;
`else
defparam ae250_chip.AE250_DMAC_SUPPORT="no";
`endif
`ifdef AE250_SPI1_SUPPORT
defparam ae250_chip.AE250_SPI1_SUPPORT="yes";
defparam ae250_chip.ATCSPI200_1_SLAVE_SUPPORT=`ATCSPI200_1_SLAVE_SUPPORT;
defparam ae250_chip.ATCSPI200_1_DUALSPI_SUPPORT=`ATCSPI200_1_DUALSPI_SUPPORT;
    `ifdef ATCSPI200_1_QUADSPI_SUPPORT
    defparam ae250_chip.ATCSPI200_1_QUADSPI_SUPPORT="yes";
    `else
    defparam ae250_chip.ATCSPI200_1_QUADSPI_SUPPORT="no";
    `endif
defparam ae250_chip.ATCSPI200_1_DIRECT_IO_SUPPORT=`ATCSPI200_1_DIRECT_IO_SUPPORT;
defparam ae250_chip.ATCSPI200_1_MEM_RDCMD_DEFAULT=`ATCSPI200_1_MEM_RDCMD_DEFAULT;
defparam ae250_chip.ATCSPI200_1_CS2CLK_DEFAULT=`ATCSPI200_1_CS2CLK_DEFAULT;
defparam ae250_chip.ATCSPI200_1_CSHT_DEFAULT=`ATCSPI200_1_CSHT_DEFAULT;
defparam ae250_chip.ATCSPI200_1_SCLKDIV_DEFAULT=`ATCSPI200_1_SCLKDIV_DEFAULT;
defparam ae250_chip.ATCSPI200_1_TXFIFO_DEPTH=`ATCSPI200_1_TXFIFO_DEPTH;
defparam ae250_chip.ATCSPI200_1_RXFIFO_DEPTH=`ATCSPI200_1_RXFIFO_DEPTH;
`else
defparam ae250_chip.AE250_SPI1_SUPPORT="no";
`endif
`ifdef AE250_SPI2_SUPPORT
defparam ae250_chip.AE250_SPI2_SUPPORT="yes";
defparam ae250_chip.ATCSPI200_2_SLAVE_SUPPORT=`ATCSPI200_2_SLAVE_SUPPORT;
defparam ae250_chip.ATCSPI200_2_DUALSPI_SUPPORT=`ATCSPI200_2_DUALSPI_SUPPORT;
    `ifdef ATCSPI200_2_QUADSPI_SUPPORT
    defparam ae250_chip.ATCSPI200_2_QUADSPI_SUPPORT="yes";
    `else
    defparam ae250_chip.ATCSPI200_2_QUADSPI_SUPPORT="no";
    `endif
defparam ae250_chip.ATCSPI200_2_DIRECT_IO_SUPPORT=`ATCSPI200_2_DIRECT_IO_SUPPORT;
defparam ae250_chip.ATCSPI200_2_MEM_RDCMD_DEFAULT=`ATCSPI200_2_MEM_RDCMD_DEFAULT;
defparam ae250_chip.ATCSPI200_2_CS2CLK_DEFAULT=`ATCSPI200_2_CS2CLK_DEFAULT;
defparam ae250_chip.ATCSPI200_2_CSHT_DEFAULT=`ATCSPI200_2_CSHT_DEFAULT;
defparam ae250_chip.ATCSPI200_2_SCLKDIV_DEFAULT=`ATCSPI200_2_SCLKDIV_DEFAULT;
defparam ae250_chip.ATCSPI200_2_TXFIFO_DEPTH=`ATCSPI200_2_TXFIFO_DEPTH;
defparam ae250_chip.ATCSPI200_2_RXFIFO_DEPTH=`ATCSPI200_2_RXFIFO_DEPTH;
`else
defparam ae250_chip.AE250_SPI2_SUPPORT="no";
`endif
`ifdef AE250_SPI3_SUPPORT
defparam ae250_chip.AE250_SPI3_SUPPORT="yes";
defparam ae250_chip.ATCSPI200_3_SLAVE_SUPPORT=`ATCSPI200_3_SLAVE_SUPPORT;
defparam ae250_chip.ATCSPI200_3_DUALSPI_SUPPORT=`ATCSPI200_3_DUALSPI_SUPPORT;
    `ifdef ATCSPI200_3_QUADSPI_SUPPORT
    defparam ae250_chip.ATCSPI200_3_QUADSPI_SUPPORT="yes";
    `else
    defparam ae250_chip.ATCSPI200_3_QUADSPI_SUPPORT="no";
    `endif
defparam ae250_chip.ATCSPI200_3_DIRECT_IO_SUPPORT=`ATCSPI200_3_DIRECT_IO_SUPPORT;
defparam ae250_chip.ATCSPI200_3_MEM_RDCMD_DEFAULT=`ATCSPI200_3_MEM_RDCMD_DEFAULT;
defparam ae250_chip.ATCSPI200_3_CS2CLK_DEFAULT=`ATCSPI200_3_CS2CLK_DEFAULT;
defparam ae250_chip.ATCSPI200_3_CSHT_DEFAULT=`ATCSPI200_3_CSHT_DEFAULT;
defparam ae250_chip.ATCSPI200_3_SCLKDIV_DEFAULT=`ATCSPI200_3_SCLKDIV_DEFAULT;
defparam ae250_chip.ATCSPI200_3_TXFIFO_DEPTH=`ATCSPI200_3_TXFIFO_DEPTH;
defparam ae250_chip.ATCSPI200_3_RXFIFO_DEPTH=`ATCSPI200_3_RXFIFO_DEPTH;
`else
defparam ae250_chip.AE250_SPI3_SUPPORT="no";
`endif
`ifdef AE250_SPI4_SUPPORT
defparam ae250_chip.AE250_SPI4_SUPPORT="yes";
defparam ae250_chip.ATCSPI200_4_SLAVE_SUPPORT=`ATCSPI200_4_SLAVE_SUPPORT;
defparam ae250_chip.ATCSPI200_4_DUALSPI_SUPPORT=`ATCSPI200_4_DUALSPI_SUPPORT;
    `ifdef ATCSPI200_4_QUADSPI_SUPPORT
    defparam ae250_chip.ATCSPI200_4_QUADSPI_SUPPORT="yes";
    `else
    defparam ae250_chip.ATCSPI200_4_QUADSPI_SUPPORT="no";
    `endif
defparam ae250_chip.ATCSPI200_4_DIRECT_IO_SUPPORT=`ATCSPI200_4_DIRECT_IO_SUPPORT;
defparam ae250_chip.ATCSPI200_4_MEM_RDCMD_DEFAULT=`ATCSPI200_4_MEM_RDCMD_DEFAULT;
defparam ae250_chip.ATCSPI200_4_CS2CLK_DEFAULT=`ATCSPI200_4_CS2CLK_DEFAULT;
defparam ae250_chip.ATCSPI200_4_CSHT_DEFAULT=`ATCSPI200_4_CSHT_DEFAULT;
defparam ae250_chip.ATCSPI200_4_SCLKDIV_DEFAULT=`ATCSPI200_4_SCLKDIV_DEFAULT;
defparam ae250_chip.ATCSPI200_4_TXFIFO_DEPTH=`ATCSPI200_4_TXFIFO_DEPTH;
defparam ae250_chip.ATCSPI200_4_RXFIFO_DEPTH=`ATCSPI200_4_RXFIFO_DEPTH;
`else
defparam ae250_chip.AE250_SPI4_SUPPORT="no";
`endif
defparam ae250_chip.AE250_SMU_SCRATCH_SUPPORT=`AE250_SMU_SCRATCH_SUPPORT;
defparam ae250_chip.AE250_SMU_SCRATCH_BIT=`AE250_SMU_SCRATCH_BIT;
defparam ae250_chip.AE250_SMU_SCRATCH_DEFAULT=`AE250_SMU_SCRATCH_DEFAULT;
defparam ae250_chip.AE250_SMU_USERDR0_SUPPORT=`AE250_SMU_USERDR0_SUPPORT;
defparam ae250_chip.AE250_SMU_USERDR0_BIT=`AE250_SMU_USERDR0_BIT;
defparam ae250_chip.AE250_SMU_USERDR0_DEFAULT=`AE250_SMU_USERDR0_DEFAULT;
defparam ae250_chip.AE250_SMU_USERDR1_SUPPORT=`AE250_SMU_USERDR1_SUPPORT;
defparam ae250_chip.AE250_SMU_USERDR1_BIT=`AE250_SMU_USERDR1_BIT;
defparam ae250_chip.AE250_SMU_USERDR1_DEFAULT=`AE250_SMU_USERDR1_DEFAULT;
defparam ae250_chip.AE250_SMU_RESET_VECTOR_DEFAULT=`AE250_SMU_RESET_VECTOR_DEFAULT;
defparam ae250_chip.AE250_SMU_EXT_WAKEUP_LEVEL=`AE250_SMU_EXT_WAKEUP_LEVEL;
defparam ae250_chip.AE250_SMU_MDP_PWR_OFF_LEVEL=`AE250_SMU_MDP_PWR_OFF_LEVEL;
`ifdef AE250_RTC_SUPPORT
defparam ae250_chip.AE250_RTC_SUPPORT="yes";
defparam ae250_chip.ATCRTC100_DAY_WIDTH	= `ATCRTC100_DAY_WIDTH;
defparam ae250_chip.ATCRTC100_HALF_SECOND_SUPPORT = `ATCRTC100_HALF_SECOND_SUPPORT;
`else
defparam ae250_chip.AE250_RTC_SUPPORT="no";
`endif
`ifdef AE250_WDT_SUPPORT
defparam ae250_chip.AE250_WDT_SUPPORT="yes";
defparam ae250_chip.ATCWDT200_32BIT_TIMER=`ATCWDT200_32BIT_TIMER;
defparam ae250_chip.ATCWDT200_WP_NUM=`ATCWDT200_WP_NUM;
defparam ae250_chip.ATCWDT200_RESTART_NUM=`ATCWDT200_RESTART_NUM;
`else
defparam ae250_chip.AE250_WDT_SUPPORT="no";
`endif
`ifdef AE250_I2C_1_SUPPORT
defparam ae250_chip.AE250_I2C_1_SUPPORT="yes";
defparam ae250_chip.ATCIIC100_1_FIFO_DEPTH=`ATCIIC100_1_FIFO_DEPTH;
`else
defparam ae250_chip.AE250_I2C_1_SUPPORT="no";
`endif
`ifdef AE250_I2C_2_SUPPORT
defparam ae250_chip.AE250_I2C_2_SUPPORT="yes";
defparam ae250_chip.ATCIIC100_2_FIFO_DEPTH=`ATCIIC100_2_FIFO_DEPTH;
`else
defparam ae250_chip.AE250_I2C_2_SUPPORT="no";
`endif
`ifdef AE250_I2C_3_SUPPORT
defparam ae250_chip.AE250_I2C_3_SUPPORT="yes";
defparam ae250_chip.ATCIIC100_3_FIFO_DEPTH=`ATCIIC100_3_FIFO_DEPTH;
`else
defparam ae250_chip.AE250_I2C_3_SUPPORT="no";
`endif
`ifdef AE250_I2C_4_SUPPORT
defparam ae250_chip.AE250_I2C_4_SUPPORT="yes";
defparam ae250_chip.ATCIIC100_4_FIFO_DEPTH=`ATCIIC100_4_FIFO_DEPTH;
`else
defparam ae250_chip.AE250_I2C_4_SUPPORT="no";
`endif
`ifdef AE250_PIT1_SUPPORT
defparam ae250_chip.AE250_PIT1_SUPPORT="yes";
defparam ae250_chip.ATCPIT100_1_NUM_CHANNEL=`ATCPIT100_1_NUM_CHANNEL;
`else
defparam ae250_chip.AE250_PIT1_SUPPORT="no";
`endif
`ifdef AE250_PIT2_SUPPORT
defparam ae250_chip.AE250_PIT2_SUPPORT="yes";
defparam ae250_chip.ATCPIT100_2_NUM_CHANNEL=`ATCPIT100_2_NUM_CHANNEL;
`else
defparam ae250_chip.AE250_PIT2_SUPPORT="no";
`endif
`ifdef AE250_UART1_SUPPORT
defparam ae250_chip.AE250_UART1_SUPPORT="yes";
defparam ae250_chip.ATCUART100_1_FIFO_DEPTH=`ATCUART100_1_FIFO_DEPTH;
`else
defparam ae250_chip.AE250_UART1_SUPPORT="no";
`endif
`ifdef AE250_UART2_SUPPORT
defparam ae250_chip.AE250_UART2_SUPPORT="yes";
defparam ae250_chip.ATCUART100_2_FIFO_DEPTH=`ATCUART100_2_FIFO_DEPTH;
`else
defparam ae250_chip.AE250_UART2_SUPPORT="no";
`endif
`ifdef AE250_UART3_SUPPORT
defparam ae250_chip.AE250_UART3_SUPPORT="yes";
defparam ae250_chip.ATCUART100_3_FIFO_DEPTH=`ATCUART100_3_FIFO_DEPTH;
`else
defparam ae250_chip.AE250_UART3_SUPPORT="no";
`endif
`ifdef AE250_UART4_SUPPORT
defparam ae250_chip.AE250_UART4_SUPPORT="yes";
defparam ae250_chip.ATCUART100_4_FIFO_DEPTH=`ATCUART100_4_FIFO_DEPTH;
`else
defparam ae250_chip.AE250_UART4_SUPPORT="no";
`endif
`ifdef AE250_GPIO_SUPPORT
defparam ae250_chip.AE250_GPIO_SUPPORT="yes";
defparam ae250_chip.ATCGPIO100_GPIO_NUM        = `ATCGPIO100_GPIO_NUM;
defparam ae250_chip.ATCGPIO100_DEBOUNCE_SUPPORT= `ATCGPIO100_DEBOUNCE_SUPPORT;
defparam ae250_chip.ATCGPIO100_PULL_SUPPORT    = `ATCGPIO100_PULL_SUPPORT;
defparam ae250_chip.ATCGPIO100_INTR_SUPPORT    = `ATCGPIO100_INTR_SUPPORT;
`else
defparam ae250_chip.AE250_GPIO_SUPPORT="no";
`endif
`ifdef DEBUG_SUPPORT
defparam ae250_chip.DEBUG_SUPPORT            = "yes";
`else
defparam ae250_chip.DEBUG_SUPPORT            = "no";
`endif
defparam ae250_chip.ISA_BASE                 = `ISA_BASE;
defparam ae250_chip.MMU_SCHEME               = `MMU_SCHEME;
defparam ae250_chip.PLIC_BASE                = `PLIC_BASE;
defparam ae250_chip.CACHE_LINE_SIZE          = `CACHE_LINE_SIZE;
defparam ae250_chip.DLM_SIZE_KB              = `DLM_SIZE_KB;
defparam ae250_chip.WRITETHROUGH_REGION2_BASE= `WRITETHROUGH_REGION2_BASE;
defparam ae250_chip.POWERBRAKE_SUPPORT       = `POWERBRAKE_SUPPORT;
defparam ae250_chip.STLB_ENTRIES             = `STLB_ENTRIES;
defparam ae250_chip.PLDM_BASE                = `PLDM_BASE;
defparam ae250_chip.WRITETHROUGH_REGION3_MASK= `WRITETHROUGH_REGION3_MASK;
defparam ae250_chip.SLAVE_PORT_SUPPORT       = `SLAVE_PORT_SUPPORT;
defparam ae250_chip.LM_INTERFACE             = `LM_INTERFACE;
defparam ae250_chip.WRITETHROUGH_REGION5_MASK= `WRITETHROUGH_REGION5_MASK;
defparam ae250_chip.DEVICE_REGION5_MASK      = `DEVICE_REGION5_MASK;
defparam ae250_chip.DEBUG_INTERFACE          = `DEBUG_INTERFACE;
defparam ae250_chip.NUM_TRIGGER              = `NUM_TRIGGER;
defparam ae250_chip.NON_CRITICAL_WORD_FIRST  = `NON_CRITICAL_WORD_FIRST;
defparam ae250_chip.WRITETHROUGH_REGION7_MASK= `WRITETHROUGH_REGION7_MASK;
defparam ae250_chip.UNALIGNED_ACCESS         = `UNALIGNED_ACCESS;
defparam ae250_chip.ICACHE_SIZE_KB           = `ICACHE_SIZE_KB;
defparam ae250_chip.ICACHE_WAY               = `ICACHE_WAY;
defparam ae250_chip.PLIC_SW_MASK             = `PLIC_SW_MASK;
defparam ae250_chip.DEVICE_REGION1_MASK      = `DEVICE_REGION1_MASK;
defparam ae250_chip.DLM_ECC_TYPE             = `DLM_ECC_TYPE;
defparam ae250_chip.WRITETHROUGH_REGION0_MASK= `WRITETHROUGH_REGION0_MASK;
defparam ae250_chip.DEVICE_REGION6_MASK      = `DEVICE_REGION6_MASK;
defparam ae250_chip.PLMT_MASK                = `PLMT_MASK;
defparam ae250_chip.WRITETHROUGH_REGION3_BASE= `WRITETHROUGH_REGION3_BASE;
defparam ae250_chip.WRITETHROUGH_REGION7_BASE= `WRITETHROUGH_REGION7_BASE;
defparam ae250_chip.FPU_TYPE                 = `FPU_TYPE;
defparam ae250_chip.ILM_BASE                 = `ILM_BASE;
defparam ae250_chip.LM_ENABLE_CTRL           = `LM_ENABLE_CTRL;
defparam ae250_chip.WRITETHROUGH_REGION4_BASE= `WRITETHROUGH_REGION4_BASE;
defparam ae250_chip.ITLB_ENTRIES             = `ITLB_ENTRIES;
defparam ae250_chip.STACKSAFE_SUPPORT        = `STACKSAFE_SUPPORT;
defparam ae250_chip.ILM_SIZE_KB              = `ILM_SIZE_KB;
defparam ae250_chip.DEVICE_REGION0_MASK      = `DEVICE_REGION0_MASK;
defparam ae250_chip.DEVICE_REGION4_MASK      = `DEVICE_REGION4_MASK;
defparam ae250_chip.PLIC_SW_BASE             = `PLIC_SW_BASE;
defparam ae250_chip.DTLB_ENTRIES             = `DTLB_ENTRIES;
defparam ae250_chip.DEVICE_REGION4_BASE      = `DEVICE_REGION4_BASE;
defparam ae250_chip.PLMT_BASE                = `PLMT_BASE;
defparam ae250_chip.WRITETHROUGH_REGION2_MASK= `WRITETHROUGH_REGION2_MASK;
defparam ae250_chip.LSU_PREFETCH             = `LSU_PREFETCH;
defparam ae250_chip.DEVICE_REGION6_BASE      = `DEVICE_REGION6_BASE;
defparam ae250_chip.WRITETHROUGH_REGION0_BASE= `WRITETHROUGH_REGION0_BASE;
defparam ae250_chip.AHB_LOW_LATENCY          = `AHB_LOW_LATENCY;
defparam ae250_chip.DEVICE_REGION3_MASK      = `DEVICE_REGION3_MASK;
defparam ae250_chip.DEVICE_REGION1_BASE      = `DEVICE_REGION1_BASE;
defparam ae250_chip.CODENSE_SUPPORT          = `CODENSE_SUPPORT;
defparam ae250_chip.MULTIPLIER               = `MULTIPLIER;
defparam ae250_chip.VECTOR_PLIC_SUPPORT      = `VECTOR_PLIC_SUPPORT;
defparam ae250_chip.PMP_ENTRIES              = `PMP_ENTRIES;
defparam ae250_chip.STLB_SP_ENTRIES          = `STLB_SP_ENTRIES;
defparam ae250_chip.SYSTEM_BUS_ACCESS_SUPPORT= `SYSTEM_BUS_ACCESS_SUPPORT;
defparam ae250_chip.RVA_SUPPORT              = `RVA_SUPPORT;
defparam ae250_chip.DCACHE_WAY               = `DCACHE_WAY;
defparam ae250_chip.DEBUG_VEC                = `DEBUG_VEC;
defparam ae250_chip.WRITETHROUGH_REGION6_MASK= `WRITETHROUGH_REGION6_MASK;
defparam ae250_chip.PLDM_MASK                = `PLDM_MASK;
defparam ae250_chip.PERFORMANCE_MONITOR      = `PERFORMANCE_MONITOR;
defparam ae250_chip.WRITETHROUGH_REGION5_BASE= `WRITETHROUGH_REGION5_BASE;
defparam ae250_chip.DEVICE_REGION3_BASE      = `DEVICE_REGION3_BASE;
defparam ae250_chip.DEVICE_REGION7_MASK      = `DEVICE_REGION7_MASK;
defparam ae250_chip.NUM_PRIVILEGE_LEVELS     = `NUM_PRIVILEGE_LEVELS;
defparam ae250_chip.PLIC_MASK                = `PLIC_MASK;
defparam ae250_chip.DSP_SUPPORT              = `DSP_SUPPORT;
defparam ae250_chip.TRACE_INTERFACE          = `TRACE_INTERFACE;
defparam ae250_chip.DEVICE_REGION7_BASE      = `DEVICE_REGION7_BASE;
defparam ae250_chip.AE250_PLIC_SUPPORT       = `AE250_PLIC_SUPPORT;
defparam ae250_chip.ICACHE_ECC_TYPE          = `ICACHE_ECC_TYPE;
defparam ae250_chip.AE250_PLMT_SUPPORT       = `AE250_PLMT_SUPPORT;
defparam ae250_chip.DCACHE_SIZE_KB           = `DCACHE_SIZE_KB;
defparam ae250_chip.ICACHE_LRU               = `ICACHE_LRU;
defparam ae250_chip.WRITETHROUGH_REGION1_BASE= `WRITETHROUGH_REGION1_BASE;
defparam ae250_chip.BRANCH_PREDICTION        = `BRANCH_PREDICTION;
defparam ae250_chip.DLM_BASE                 = `DLM_BASE;
defparam ae250_chip.DEVICE_REGION2_MASK      = `DEVICE_REGION2_MASK;
defparam ae250_chip.DEVICE_REGION2_BASE      = `DEVICE_REGION2_BASE;
defparam ae250_chip.DEVICE_REGION5_BASE      = `DEVICE_REGION5_BASE;
defparam ae250_chip.WRITETHROUGH_REGION1_MASK= `WRITETHROUGH_REGION1_MASK;
defparam ae250_chip.RVN_SUPPORT              = `RVN_SUPPORT;
defparam ae250_chip.WRITETHROUGH_REGION6_BASE= `WRITETHROUGH_REGION6_BASE;
defparam ae250_chip.PROGBUF_SIZE             = `PROGBUF_SIZE;
defparam ae250_chip.DEVICE_REGION0_BASE      = `DEVICE_REGION0_BASE;
defparam ae250_chip.DCACHE_ECC_TYPE          = `DCACHE_ECC_TYPE;
defparam ae250_chip.AE250_PLIC_SW_SUPPORT    = `AE250_PLIC_SW_SUPPORT;
defparam ae250_chip.WRITETHROUGH_REGION4_MASK= `WRITETHROUGH_REGION4_MASK;
defparam ae250_chip.ILM_ECC_TYPE             = `ILM_ECC_TYPE;
defparam ae250_chip.DCACHE_LRU               = `DCACHE_LRU;
defparam ae250_chip.ISA_LEA					 = `ISA_LEA;
defparam ae250_chip.ISA_BFO					 = `ISA_BFO;
defparam ae250_chip.ISA_STR					 = `ISA_STR;
defparam ae250_chip.ISA_BBZ					 = `ISA_BBZ;
defparam ae250_chip.ISA_GP					 = `ISA_GP;
defparam ae250_chip.ISA_BEQC				 = `ISA_BEQC;
defparam ae250_chip.INT_NUM                  = `INT_NUM;
defparam ae250_chip.TARGET_NUM               = 5'd1;
defparam ae250_chip.FAST_MULT_ALGO			 = `FAST_MULT_ALGO;
defparam ae250_chip.MULT_ACCELERATOR_TYPE	 = `MULT_ACCELERATOR_TYPE;
defparam ae250_chip.Amem    =   `Amem;
defparam ae250_chip.Bmem    =   `Bmem;
defparam ae250_chip.Cmem    =   `Cmem;
defparam ae250_chip.Dmem    =   `Dmem;
//Matrix
`ifdef AE250_MATRIX_EXTMST1
	defparam ae250_chip.AE250_MATRIX_EXTMST1="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST1="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST2
	defparam ae250_chip.AE250_MATRIX_EXTMST2="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST2="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST3
	defparam ae250_chip.AE250_MATRIX_EXTMST3="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST3="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST4
	defparam ae250_chip.AE250_MATRIX_EXTMST4="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST4="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST5
	defparam ae250_chip.AE250_MATRIX_EXTMST5="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST5="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST6
	defparam ae250_chip.AE250_MATRIX_EXTMST6="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST6="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST7
	defparam ae250_chip.AE250_MATRIX_EXTMST7="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST7="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST8
	defparam ae250_chip.AE250_MATRIX_EXTMST8="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST8="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST9
	defparam ae250_chip.AE250_MATRIX_EXTMST9="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST9="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST10
	defparam ae250_chip.AE250_MATRIX_EXTMST10="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST10="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST11
	defparam ae250_chip.AE250_MATRIX_EXTMST11="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST11="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST12
	defparam ae250_chip.AE250_MATRIX_EXTMST12="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST12="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST13
	defparam ae250_chip.AE250_MATRIX_EXTMST13="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST13="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST14
	defparam ae250_chip.AE250_MATRIX_EXTMST14="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST14="no"; 
`endif 
`ifdef AE250_MATRIX_EXTMST15
	defparam ae250_chip.AE250_MATRIX_EXTMST15="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTMST15="no"; 
`endif 



`ifdef AE250_MATRIX_EXTSLV2
	defparam ae250_chip.AE250_MATRIX_EXTSLV2="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV2="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV3
	defparam ae250_chip.AE250_MATRIX_EXTSLV3="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV3="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV4
	defparam ae250_chip.AE250_MATRIX_EXTSLV4="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV4="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV5
	defparam ae250_chip.AE250_MATRIX_EXTSLV5="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV5="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV6
	defparam ae250_chip.AE250_MATRIX_EXTSLV6="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV6="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV7
	defparam ae250_chip.AE250_MATRIX_EXTSLV7="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV7="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV8
	defparam ae250_chip.AE250_MATRIX_EXTSLV8="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV8="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV9
	defparam ae250_chip.AE250_MATRIX_EXTSLV9="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV9="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV10
	defparam ae250_chip.AE250_MATRIX_EXTSLV10="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV10="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV11
	defparam ae250_chip.AE250_MATRIX_EXTSLV11="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV11="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV12
	defparam ae250_chip.AE250_MATRIX_EXTSLV12="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV12="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV13
	defparam ae250_chip.AE250_MATRIX_EXTSLV13="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV13="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV14
	defparam ae250_chip.AE250_MATRIX_EXTSLV14="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV14="no"; 
`endif 
`ifdef AE250_MATRIX_EXTSLV15
	defparam ae250_chip.AE250_MATRIX_EXTSLV15="yes";
`else
	defparam ae250_chip.AE250_MATRIX_EXTSLV15="no"; 
`endif 

defparam ae250_chip.ATCBMC200_AHB_SLV0_BASE = `ATCBMC200_AHB_SLV0_BASE ; 
defparam ae250_chip.ATCBMC200_AHB_SLV1_BASE = `ATCBMC200_AHB_SLV1_BASE ;
defparam ae250_chip.ATCBMC200_AHB_SLV2_BASE = `ATCBMC200_AHB_SLV2_BASE ;
defparam ae250_chip.ATCBMC200_AHB_SLV3_BASE = `ATCBMC200_AHB_SLV3_BASE ;
defparam ae250_chip.ATCBMC200_AHB_SLV4_BASE = `ATCBMC200_AHB_SLV4_BASE ;
defparam ae250_chip.ATCBMC200_AHB_SLV5_BASE = `ATCBMC200_AHB_SLV5_BASE ;
defparam ae250_chip.ATCBMC200_AHB_SLV6_BASE = `ATCBMC200_AHB_SLV6_BASE ;
defparam ae250_chip.ATCBMC200_AHB_SLV7_BASE = `ATCBMC200_AHB_SLV7_BASE ;
defparam ae250_chip.ATCBMC200_AHB_SLV8_BASE = `ATCBMC200_AHB_SLV8_BASE ;
defparam ae250_chip.ATCBMC200_AHB_SLV9_BASE = `ATCBMC200_AHB_SLV9_BASE ;
defparam ae250_chip.ATCBMC200_AHB_SLV10_BASE= `ATCBMC200_AHB_SLV10_BASE;
defparam ae250_chip.ATCBMC200_AHB_SLV11_BASE= `ATCBMC200_AHB_SLV11_BASE;
defparam ae250_chip.ATCBMC200_AHB_SLV12_BASE= `ATCBMC200_AHB_SLV12_BASE;
defparam ae250_chip.ATCBMC200_AHB_SLV13_BASE= `ATCBMC200_AHB_SLV13_BASE;
defparam ae250_chip.ATCBMC200_AHB_SLV14_BASE= `ATCBMC200_AHB_SLV14_BASE;
defparam ae250_chip.ATCBMC200_AHB_SLV15_BASE= `ATCBMC200_AHB_SLV15_BASE;

defparam ae250_chip.ATCBMC200_AHB_SLV0_SIZE = `ATCBMC200_AHB_SLV0_SIZE ;
defparam ae250_chip.ATCBMC200_AHB_SLV1_SIZE = `ATCBMC200_AHB_SLV1_SIZE ;
defparam ae250_chip.ATCBMC200_AHB_SLV2_SIZE = `ATCBMC200_AHB_SLV2_SIZE ;
defparam ae250_chip.ATCBMC200_AHB_SLV3_SIZE = `ATCBMC200_AHB_SLV3_SIZE ;
defparam ae250_chip.ATCBMC200_AHB_SLV4_SIZE = `ATCBMC200_AHB_SLV4_SIZE ;
defparam ae250_chip.ATCBMC200_AHB_SLV5_SIZE = `ATCBMC200_AHB_SLV5_SIZE ;
defparam ae250_chip.ATCBMC200_AHB_SLV6_SIZE = `ATCBMC200_AHB_SLV6_SIZE ;
defparam ae250_chip.ATCBMC200_AHB_SLV7_SIZE = `ATCBMC200_AHB_SLV7_SIZE ;
defparam ae250_chip.ATCBMC200_AHB_SLV8_SIZE = `ATCBMC200_AHB_SLV8_SIZE ;
defparam ae250_chip.ATCBMC200_AHB_SLV9_SIZE = `ATCBMC200_AHB_SLV9_SIZE ;
defparam ae250_chip.ATCBMC200_AHB_SLV10_SIZE= `ATCBMC200_AHB_SLV10_SIZE;
defparam ae250_chip.ATCBMC200_AHB_SLV11_SIZE= `ATCBMC200_AHB_SLV11_SIZE;
defparam ae250_chip.ATCBMC200_AHB_SLV12_SIZE= `ATCBMC200_AHB_SLV12_SIZE;
defparam ae250_chip.ATCBMC200_AHB_SLV13_SIZE= `ATCBMC200_AHB_SLV13_SIZE;
defparam ae250_chip.ATCBMC200_AHB_SLV14_SIZE= `ATCBMC200_AHB_SLV14_SIZE;
defparam ae250_chip.ATCBMC200_AHB_SLV15_SIZE= `ATCBMC200_AHB_SLV15_SIZE;
//APB
defparam ae250_chip.ATCAPBBRG100_FLOP_OUT = `ATCAPBBRG100_FLOP_OUT;
defparam ae250_chip.ATCAPBBRG100_ADDR_DECODE_WIDTH=`ATCAPBBRG100_ADDR_DECODE_WIDTH;

`ifdef AE250_APB_EXTSLV2
	defparam ae250_chip.AE250_APB_EXTSLV2=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV2=0; 
`endif 
`ifdef AE250_APB_EXTSLV3
	defparam ae250_chip.AE250_APB_EXTSLV3=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV3=0; 
`endif 
`ifdef AE250_APB_EXTSLV4
	defparam ae250_chip.AE250_APB_EXTSLV4=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV4=0; 
`endif 
`ifdef AE250_APB_EXTSLV5
	defparam ae250_chip.AE250_APB_EXTSLV5=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV5=0; 
`endif 
`ifdef AE250_APB_EXTSLV6
	defparam ae250_chip.AE250_APB_EXTSLV6=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV6=0; 
`endif 
`ifdef AE250_APB_EXTSLV7
	defparam ae250_chip.AE250_APB_EXTSLV7=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV7=0; 
`endif 
`ifdef AE250_APB_EXTSLV8
	defparam ae250_chip.AE250_APB_EXTSLV8=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV8=0; 
`endif 
`ifdef AE250_APB_EXTSLV9
	defparam ae250_chip.AE250_APB_EXTSLV9=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV9=0; 
`endif 
`ifdef AE250_APB_EXTSLV10
	defparam ae250_chip.AE250_APB_EXTSLV10=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV10=0; 
`endif 
`ifdef AE250_APB_EXTSLV11
	defparam ae250_chip.AE250_APB_EXTSLV11=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV11=0; 
`endif 
`ifdef AE250_APB_EXTSLV12
	defparam ae250_chip.AE250_APB_EXTSLV12=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV12=0; 
`endif 
`ifdef AE250_APB_EXTSLV13
	defparam ae250_chip.AE250_APB_EXTSLV13=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV13=0; 
`endif 
`ifdef AE250_APB_EXTSLV14
	defparam ae250_chip.AE250_APB_EXTSLV14=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV14=0; 
`endif 
`ifdef AE250_APB_EXTSLV15
	defparam ae250_chip.AE250_APB_EXTSLV15=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV15=0; 
`endif 
`ifdef AE250_APB_EXTSLV16
	defparam ae250_chip.AE250_APB_EXTSLV16=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV16=0; 
`endif 
`ifdef AE250_APB_EXTSLV17
	defparam ae250_chip.AE250_APB_EXTSLV17=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV17=0; 
`endif 
`ifdef AE250_APB_EXTSLV18
	defparam ae250_chip.AE250_APB_EXTSLV18=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV18=0; 
`endif 
`ifdef AE250_APB_EXTSLV19
	defparam ae250_chip.AE250_APB_EXTSLV19=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV19=0; 
`endif 
`ifdef AE250_APB_EXTSLV20
	defparam ae250_chip.AE250_APB_EXTSLV20=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV20=0; 
`endif 
`ifdef AE250_APB_EXTSLV21
	defparam ae250_chip.AE250_APB_EXTSLV21=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV21=0; 
`endif 
`ifdef AE250_APB_EXTSLV22
	defparam ae250_chip.AE250_APB_EXTSLV22=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV22=0; 
`endif 
`ifdef AE250_APB_EXTSLV23
	defparam ae250_chip.AE250_APB_EXTSLV23=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV23=0; 
`endif 
`ifdef AE250_APB_EXTSLV24
	defparam ae250_chip.AE250_APB_EXTSLV24=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV24=0; 
`endif 
`ifdef AE250_APB_EXTSLV25
	defparam ae250_chip.AE250_APB_EXTSLV25=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV25=0; 
`endif 
`ifdef AE250_APB_EXTSLV26
	defparam ae250_chip.AE250_APB_EXTSLV26=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV26=0; 
`endif 
`ifdef AE250_APB_EXTSLV27
	defparam ae250_chip.AE250_APB_EXTSLV27=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV27=0; 
`endif 
`ifdef AE250_APB_EXTSLV28
	defparam ae250_chip.AE250_APB_EXTSLV28=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV28=0; 
`endif 
`ifdef AE250_APB_EXTSLV29
	defparam ae250_chip.AE250_APB_EXTSLV29=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV29=0; 
`endif 
`ifdef AE250_APB_EXTSLV30
	defparam ae250_chip.AE250_APB_EXTSLV30=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV30=0; 
`endif 
`ifdef AE250_APB_EXTSLV31
	defparam ae250_chip.AE250_APB_EXTSLV31=1;
`else
	defparam ae250_chip.AE250_APB_EXTSLV31=0; 
`endif 

defparam ae250_chip.ATCAPBBRG100_SLV1_OFFSET =`ATCAPBBRG100_SLV1_OFFSET ;
defparam ae250_chip.ATCAPBBRG100_SLV2_OFFSET =`ATCAPBBRG100_SLV2_OFFSET ;
defparam ae250_chip.ATCAPBBRG100_SLV3_OFFSET =`ATCAPBBRG100_SLV3_OFFSET ;
defparam ae250_chip.ATCAPBBRG100_SLV4_OFFSET =`ATCAPBBRG100_SLV4_OFFSET ;
defparam ae250_chip.ATCAPBBRG100_SLV5_OFFSET =`ATCAPBBRG100_SLV5_OFFSET ;
defparam ae250_chip.ATCAPBBRG100_SLV6_OFFSET =`ATCAPBBRG100_SLV6_OFFSET ;
defparam ae250_chip.ATCAPBBRG100_SLV7_OFFSET =`ATCAPBBRG100_SLV7_OFFSET ;
defparam ae250_chip.ATCAPBBRG100_SLV8_OFFSET =`ATCAPBBRG100_SLV8_OFFSET ;
defparam ae250_chip.ATCAPBBRG100_SLV9_OFFSET =`ATCAPBBRG100_SLV9_OFFSET ;
defparam ae250_chip.ATCAPBBRG100_SLV10_OFFSET=`ATCAPBBRG100_SLV10_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV11_OFFSET=`ATCAPBBRG100_SLV11_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV12_OFFSET=`ATCAPBBRG100_SLV12_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV13_OFFSET=`ATCAPBBRG100_SLV13_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV14_OFFSET=`ATCAPBBRG100_SLV14_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV15_OFFSET=`ATCAPBBRG100_SLV15_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV16_OFFSET=`ATCAPBBRG100_SLV16_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV17_OFFSET=`ATCAPBBRG100_SLV17_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV18_OFFSET=`ATCAPBBRG100_SLV18_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV19_OFFSET=`ATCAPBBRG100_SLV19_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV20_OFFSET=`ATCAPBBRG100_SLV20_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV21_OFFSET=`ATCAPBBRG100_SLV21_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV22_OFFSET=`ATCAPBBRG100_SLV22_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV23_OFFSET=`ATCAPBBRG100_SLV23_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV24_OFFSET=`ATCAPBBRG100_SLV24_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV25_OFFSET=`ATCAPBBRG100_SLV25_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV26_OFFSET=`ATCAPBBRG100_SLV26_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV27_OFFSET=`ATCAPBBRG100_SLV27_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV28_OFFSET=`ATCAPBBRG100_SLV28_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV29_OFFSET=`ATCAPBBRG100_SLV29_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV30_OFFSET=`ATCAPBBRG100_SLV30_OFFSET;
defparam ae250_chip.ATCAPBBRG100_SLV31_OFFSET=`ATCAPBBRG100_SLV31_OFFSET;

defparam ae250_chip.ATCAPBBRG100_SLV0_SIZE	= `ATCAPBBRG100_SLV0_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV1_SIZE	= `ATCAPBBRG100_SLV1_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV2_SIZE	= `ATCAPBBRG100_SLV2_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV3_SIZE	= `ATCAPBBRG100_SLV3_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV4_SIZE	= `ATCAPBBRG100_SLV4_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV5_SIZE	= `ATCAPBBRG100_SLV5_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV6_SIZE	= `ATCAPBBRG100_SLV6_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV7_SIZE	= `ATCAPBBRG100_SLV7_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV8_SIZE	= `ATCAPBBRG100_SLV8_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV9_SIZE	= `ATCAPBBRG100_SLV9_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV10_SIZE	= `ATCAPBBRG100_SLV10_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV11_SIZE	= `ATCAPBBRG100_SLV11_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV12_SIZE	= `ATCAPBBRG100_SLV12_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV13_SIZE	= `ATCAPBBRG100_SLV13_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV14_SIZE	= `ATCAPBBRG100_SLV14_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV15_SIZE	= `ATCAPBBRG100_SLV15_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV16_SIZE	= `ATCAPBBRG100_SLV16_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV17_SIZE	= `ATCAPBBRG100_SLV17_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV18_SIZE	= `ATCAPBBRG100_SLV18_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV19_SIZE	= `ATCAPBBRG100_SLV19_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV20_SIZE	= `ATCAPBBRG100_SLV20_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV21_SIZE	= `ATCAPBBRG100_SLV21_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV22_SIZE	= `ATCAPBBRG100_SLV22_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV23_SIZE	= `ATCAPBBRG100_SLV23_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV24_SIZE	= `ATCAPBBRG100_SLV24_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV25_SIZE	= `ATCAPBBRG100_SLV25_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV26_SIZE	= `ATCAPBBRG100_SLV26_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV27_SIZE	= `ATCAPBBRG100_SLV27_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV28_SIZE	= `ATCAPBBRG100_SLV28_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV29_SIZE	= `ATCAPBBRG100_SLV29_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV30_SIZE	= `ATCAPBBRG100_SLV30_SIZE;
defparam ae250_chip.ATCAPBBRG100_SLV31_SIZE	= `ATCAPBBRG100_SLV31_SIZE;

ae250_chip ae250_chip(

    .X_om             ( X_om),
    .X_pd_pwr_off     ( X_pd_pwr_off),
    .X_aopd_por_b     ( X_aopd_por_b),
    .X_mpd_pwr_off    ( X_mpd_pwr_off),
    .X_osclin         ( X_osclin),
    .X_osclio         ( X_osclio),
    .X_rtc_wakeup     ( X_rtc_wakeup),
    .X_wakeup_in      ( X_wakeup_in),

    .T_osch           ( T_osch),
    .T_hw_rstn        ( T_hw_rstn),
    .T_por_b          ( T_por_b),
    .X_tck            ( X_tck),
    .pin_tms_in       ( pin_tms_in),
    .pin_tms_out      ( pin_tms_out),
    .pin_tms_out_en   ( pin_tms_out_en),
    .pin_trst_in      ( pin_trst_in),
    .pin_trst_out     ( pin_trst_out),
    .pin_trst_out_en  ( pin_trst_out_en),
    .pin_tdi_in       ( pin_tdi_in),
    .pin_tdi_out      ( pin_tdi_out),
    .pin_tdi_out_en   ( pin_tdi_out_en),
    .pin_tdo_in       ( pin_tdo_in),
    .pin_tdo_out      ( pin_tdo_out),
    .pin_tdo_out_en   ( pin_tdo_out_en),
`ifdef AE250_DMAC_SUPPORT
`ifdef AE250_DMA_EXTREQ_SUPPORT
    .dma_ack_ext      (dma_ack_ext),
    .dma_req_ext      (dma_req_ext),
`endif
`endif
`ifdef AE250_SPI1_SUPPORT
    .spi1_clk_in      ( spi1_clk_in),
    .spi1_csn_in      ( spi1_csn_in),
    .spi1_miso_in     ( spi1_miso_in),
    .spi1_mosi_in     ( spi1_mosi_in),
    .spi1_clk_out     ( spi1_clk_out),
    .spi1_clk_oe      ( spi1_clk_oe),
    .spi1_csn_out     ( spi1_csn_out),
    .spi1_csn_oe      ( spi1_csn_oe),
    .spi1_miso_out    ( spi1_miso_out),
    .spi1_miso_oe     ( spi1_miso_oe),
    .spi1_mosi_out    ( spi1_mosi_out),
    .spi1_mosi_oe     ( spi1_mosi_oe),
    .spi1_holdn_in    ( spi1_holdn_in),
    .spi1_wpn_in      ( spi1_wpn_in),
    .spi1_holdn_out   ( spi1_holdn_out),
    .spi1_holdn_oe    ( spi1_holdn_oe),
    .spi1_wpn_out     ( spi1_wpn_out),
    .spi1_wpn_oe      ( spi1_wpn_oe),
`endif
`ifdef AE250_SPI2_SUPPORT
    .spi2_clk_in      ( spi2_clk_in),
    .spi2_csn_in      ( spi2_csn_in),
    .spi2_miso_in     ( spi2_miso_in),
    .spi2_mosi_in     ( spi2_mosi_in),
    .spi2_clk_out     ( spi2_clk_out),
    .spi2_clk_oe      ( spi2_clk_oe),
    .spi2_csn_out     ( spi2_csn_out),
    .spi2_csn_oe      ( spi2_csn_oe),
    .spi2_miso_out    ( spi2_miso_out),
    .spi2_miso_oe     ( spi2_miso_oe),
    .spi2_mosi_out    ( spi2_mosi_out),
    .spi2_mosi_oe     ( spi2_mosi_oe),
    .spi2_holdn_in    ( spi2_holdn_in),
    .spi2_wpn_in      ( spi2_wpn_in),
    .spi2_holdn_out   ( spi2_holdn_out),
    .spi2_holdn_oe    ( spi2_holdn_oe),
    .spi2_wpn_out     ( spi2_wpn_out),
    .spi2_wpn_oe      ( spi2_wpn_oe),
`endif
`ifdef AE250_SPI3_SUPPORT
    .spi3_clk_in      ( spi3_clk_in),
    .spi3_csn_in      ( spi3_csn_in),
    .spi3_miso_in     ( spi3_miso_in),
    .spi3_mosi_in     ( spi3_mosi_in),
    .spi3_clk_out     ( spi3_clk_out),
    .spi3_clk_oe      ( spi3_clk_oe),
    .spi3_csn_out     ( spi3_csn_out),
    .spi3_csn_oe      ( spi3_csn_oe),
    .spi3_miso_out    ( spi3_miso_out),
    .spi3_miso_oe     ( spi3_miso_oe),
    .spi3_mosi_out    ( spi3_mosi_out),
    .spi3_mosi_oe     ( spi3_mosi_oe),
    .spi3_holdn_in    ( spi3_holdn_in),
    .spi3_wpn_in      ( spi3_wpn_in),
    .spi3_holdn_out   ( spi3_holdn_out),
    .spi3_holdn_oe    ( spi3_holdn_oe),
    .spi3_wpn_out     ( spi3_wpn_out),
    .spi3_wpn_oe      ( spi3_wpn_oe),
`endif
`ifdef AE250_SPI4_SUPPORT
    .spi4_clk_in      ( spi4_clk_in),
    .spi4_csn_in      ( spi4_csn_in),
    .spi4_miso_in     ( spi4_miso_in),
    .spi4_mosi_in     ( spi4_mosi_in),
    .spi4_clk_out     ( spi4_clk_out),
    .spi4_clk_oe      ( spi4_clk_oe),
    .spi4_csn_out     ( spi4_csn_out),
    .spi4_csn_oe      ( spi4_csn_oe),
    .spi4_miso_out    ( spi4_miso_out),
    .spi4_miso_oe     ( spi4_miso_oe),
    .spi4_mosi_out    ( spi4_mosi_out),
    .spi4_mosi_oe     ( spi4_mosi_oe),
    .spi4_holdn_in    ( spi4_holdn_in),
    .spi4_wpn_in      ( spi4_wpn_in),
    .spi4_holdn_out   ( spi4_holdn_out),
    .spi4_holdn_oe    ( spi4_holdn_oe),
    .spi4_wpn_out     ( spi4_wpn_out),
    .spi4_wpn_oe      ( spi4_wpn_oe),
`endif
`ifdef AE250_I2C_1_SUPPORT
    .i2c1_scl_in      ( i2c1_scl_in),
    .i2c1_sda_in      ( i2c1_sda_in),
    .i2c1_scl         ( i2c1_scl),
    .i2c1_sda         ( i2c1_sda),
`endif
`ifdef AE250_I2C_2_SUPPORT
    .i2c2_scl_in      ( i2c2_scl_in),
    .i2c2_sda_in      ( i2c2_sda_in),
    .i2c2_scl         ( i2c2_scl),
    .i2c2_sda         ( i2c2_sda),
`endif
`ifdef AE250_I2C_3_SUPPORT
    .i2c3_scl_in      ( i2c3_scl_in),
    .i2c3_sda_in      ( i2c3_sda_in),
    .i2c3_scl         ( i2c3_scl),
    .i2c3_sda         ( i2c3_sda),
`endif
`ifdef AE250_I2C_4_SUPPORT
    .i2c4_scl_in      ( i2c4_scl_in),
    .i2c4_sda_in      ( i2c4_sda_in),
    .i2c4_scl         ( i2c4_scl),
    .i2c4_sda         ( i2c4_sda),
`endif
`ifdef AE250_UART1_SUPPORT 
    .uart1_txd        ( uart1_txd),
    .uart1_rtsn       ( uart1_rtsn),
    .uart1_rxd        ( uart1_rxd),
    .uart1_ctsn       ( uart1_ctsn),
    .uart1_dsrn       ( uart1_dsrn),
    .uart1_dcdn       ( uart1_dcdn),
    .uart1_rin        ( uart1_rin),
    .uart1_dtrn       ( uart1_dtrn),
    .uart1_out1n      ( uart1_out1n),
    .uart1_out2n      ( uart1_out2n),
`endif
`ifdef AE250_UART2_SUPPORT  
    .uart2_txd        ( uart2_txd),
    .uart2_rtsn       ( uart2_rtsn),
    .uart2_rxd        ( uart2_rxd),
    .uart2_ctsn       ( uart2_ctsn),
    .uart2_dcdn       ( uart2_dcdn),
    .uart2_dsrn       ( uart2_dsrn),
    .uart2_rin        ( uart2_rin),
    .uart2_dtrn       ( uart2_dtrn),
    .uart2_out1n      ( uart2_out1n),
    .uart2_out2n      ( uart2_out2n),
`endif
`ifdef AE250_UART3_SUPPORT 
    .uart3_txd        ( uart3_txd),
    .uart3_rtsn       ( uart3_rtsn),
    .uart3_rxd        ( uart3_rxd),
    .uart3_ctsn       ( uart3_ctsn),
    .uart3_dcdn       ( uart3_dcdn),
    .uart3_dsrn       ( uart3_dsrn),
    .uart3_rin        ( uart3_rin),
    .uart3_dtrn       ( uart3_dtrn),
    .uart3_out1n      ( uart3_out1n),
    .uart3_out2n      ( uart3_out2n),
`endif
`ifdef AE250_UART4_SUPPORT 
    .uart4_txd        ( uart4_txd),
    .uart4_rtsn       ( uart4_rtsn),
    .uart4_rxd        ( uart4_rxd),
    .uart4_ctsn       ( uart4_ctsn),
    .uart4_dcdn       ( uart4_dcdn),
    .uart4_dsrn       ( uart4_dsrn),
    .uart4_rin        ( uart4_rin),
    .uart4_dtrn       ( uart4_dtrn),
    .uart4_out1n      ( uart4_out1n),
    .uart4_out2n      ( uart4_out2n),
`endif
`ifdef AE250_PIT1_SUPPORT
    .pit1_ch0_pwm     ( pit1_ch0_pwm),
    .pit1_ch0_pwmoe   ( pit1_ch0_pwmoe),
    `ifdef ATCPIT100_1_CH1_SUPPORT    
    .pit1_ch1_pwm     ( pit1_ch1_pwm),
    .pit1_ch1_pwmoe   ( pit1_ch1_pwmoe),
    `endif
    `ifdef ATCPIT100_1_CH2_SUPPORT
    .pit1_ch2_pwm     ( pit1_ch2_pwm),
    .pit1_ch2_pwmoe   ( pit1_ch2_pwmoe),
    `endif
    `ifdef ATCPIT100_1_CH3_SUPPORT
    .pit1_ch3_pwm     ( pit1_ch3_pwm),
    .pit1_ch3_pwmoe   ( pit1_ch3_pwmoe),
    `endif
`endif
`ifdef AE250_PIT2_SUPPORT
    .pit2_ch0_pwm     ( pit2_ch0_pwm),
    .pit2_ch0_pwmoe   ( pit2_ch0_pwmoe),
    `ifdef ATCPIT100_2_CH1_SUPPORT
    .pit2_ch1_pwm     ( pit2_ch1_pwm),
    .pit2_ch1_pwmoe   ( pit2_ch1_pwmoe),
    `endif
    `ifdef ATCPIT100_2_CH2_SUPPORT
    .pit2_ch2_pwm     ( pit2_ch2_pwm),
    .pit2_ch2_pwmoe   ( pit2_ch2_pwmoe),
    `endif
    `ifdef ATCPIT100_2_CH3_SUPPORT
    .pit2_ch3_pwm     ( pit2_ch3_pwm),
    .pit2_ch3_pwmoe   ( pit2_ch3_pwmoe),
    `endif
`endif
`ifdef AE250_GPIO_SUPPORT
    .gpio_in          ( gpio_in),
    .gpio_oe          ( gpio_oe),
    .gpio_out         ( gpio_out),
    .gpio_pulldown    ( gpio_pulldown),
    .gpio_pullup      ( gpio_pullup),
`endif
`ifdef AE250_AHB_EXT
    .hclk_o              (hclk_o),
    .hresetn_o           (hresetn_o),
`endif
`ifdef AE250_MATRIX_EXTMST1
    .exthm1_haddr        ( exthm1_haddr),
    .exthm1_hburst       ( exthm1_hburst),
    .exthm1_hprot        ( exthm1_hprot),
    .exthm1_hrdata       ( exthm1_hrdata),
    .exthm1_hready       ( exthm1_hready),
    .exthm1_hresp        ( exthm1_hresp),
    .exthm1_hsize        ( exthm1_hsize),
    .exthm1_htrans       ( exthm1_htrans),
    .exthm1_hwrite       ( exthm1_hwrite),
    .exthm1_hwdata       ( exthm1_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST2
    .exthm2_haddr        ( exthm2_haddr),
    .exthm2_hburst       ( exthm2_hburst),
    .exthm2_hprot        ( exthm2_hprot),
    .exthm2_hrdata       ( exthm2_hrdata),
    .exthm2_hready       ( exthm2_hready),
    .exthm2_hresp        ( exthm2_hresp),
    .exthm2_hsize        ( exthm2_hsize),
    .exthm2_htrans       ( exthm2_htrans),
    .exthm2_hwrite       ( exthm2_hwrite),
    .exthm2_hwdata       ( exthm2_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST3
    .exthm3_haddr        ( exthm3_haddr),
    .exthm3_hburst       ( exthm3_hburst),
    .exthm3_hprot        ( exthm3_hprot),
    .exthm3_hrdata       ( exthm3_hrdata),
    .exthm3_hready       ( exthm3_hready),
    .exthm3_hresp        ( exthm3_hresp),
    .exthm3_hsize        ( exthm3_hsize),
    .exthm3_htrans       ( exthm3_htrans),
    .exthm3_hwrite       ( exthm3_hwrite),
    .exthm3_hwdata       ( exthm3_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST4
    .exthm4_haddr        ( exthm4_haddr),
    .exthm4_hburst       ( exthm4_hburst),
    .exthm4_hprot        ( exthm4_hprot),
    .exthm4_hrdata       ( exthm4_hrdata),
    .exthm4_hready       ( exthm4_hready),
    .exthm4_hresp        ( exthm4_hresp),
    .exthm4_hsize        ( exthm4_hsize),
    .exthm4_htrans       ( exthm4_htrans),
    .exthm4_hwrite       ( exthm4_hwrite),
    .exthm4_hwdata       ( exthm4_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST5
    .exthm5_haddr        ( exthm5_haddr),
    .exthm5_hburst       ( exthm5_hburst),
    .exthm5_hprot        ( exthm5_hprot),
    .exthm5_hrdata       ( exthm5_hrdata),
    .exthm5_hready       ( exthm5_hready),
    .exthm5_hresp        ( exthm5_hresp),
    .exthm5_hsize        ( exthm5_hsize),
    .exthm5_htrans       ( exthm5_htrans),
    .exthm5_hwrite       ( exthm5_hwrite),
    .exthm5_hwdata       ( exthm5_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST6
    .exthm6_haddr        ( exthm6_haddr),
    .exthm6_hburst       ( exthm6_hburst),
    .exthm6_hprot        ( exthm6_hprot),
    .exthm6_hrdata       ( exthm6_hrdata),
    .exthm6_hready       ( exthm6_hready),
    .exthm6_hresp        ( exthm6_hresp),
    .exthm6_hsize        ( exthm6_hsize),
    .exthm6_htrans       ( exthm6_htrans),
    .exthm6_hwrite       ( exthm6_hwrite),
    .exthm6_hwdata       ( exthm6_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST7
    .exthm7_haddr        ( exthm7_haddr),
    .exthm7_hburst       ( exthm7_hburst),
    .exthm7_hprot        ( exthm7_hprot),
    .exthm7_hrdata       ( exthm7_hrdata),
    .exthm7_hready       ( exthm7_hready),
    .exthm7_hresp        ( exthm7_hresp),
    .exthm7_hsize        ( exthm7_hsize),
    .exthm7_htrans       ( exthm7_htrans),
    .exthm7_hwrite       ( exthm7_hwrite),
    .exthm7_hwdata       ( exthm7_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST8
    .exthm8_haddr        ( exthm8_haddr),
    .exthm8_hburst       ( exthm8_hburst),
    .exthm8_hprot        ( exthm8_hprot),
    .exthm8_hrdata       ( exthm8_hrdata),
    .exthm8_hready       ( exthm8_hready),
    .exthm8_hresp        ( exthm8_hresp),
    .exthm8_hsize        ( exthm8_hsize),
    .exthm8_htrans       ( exthm8_htrans),
    .exthm8_hwrite       ( exthm8_hwrite),
    .exthm8_hwdata       ( exthm8_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST9
    .exthm9_haddr        ( exthm9_haddr),
    .exthm9_hburst       ( exthm9_hburst),
    .exthm9_hprot        ( exthm9_hprot),
    .exthm9_hrdata       ( exthm9_hrdata),
    .exthm9_hready       ( exthm9_hready),
    .exthm9_hresp        ( exthm9_hresp),
    .exthm9_hsize        ( exthm9_hsize),
    .exthm9_htrans       ( exthm9_htrans),
    .exthm9_hwrite       ( exthm9_hwrite),
    .exthm9_hwdata       ( exthm9_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST10
    .exthm10_haddr       ( exthm10_haddr),
    .exthm10_hburst      ( exthm10_hburst),
    .exthm10_hprot       ( exthm10_hprot),
    .exthm10_hrdata      ( exthm10_hrdata),
    .exthm10_hready      ( exthm10_hready),
    .exthm10_hresp       ( exthm10_hresp),
    .exthm10_hsize       ( exthm10_hsize),
    .exthm10_htrans      ( exthm10_htrans),
    .exthm10_hwrite      ( exthm10_hwrite),
    .exthm10_hwdata      ( exthm10_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST11
    .exthm11_haddr       ( exthm11_haddr),
    .exthm11_hburst      ( exthm11_hburst),
    .exthm11_hprot       ( exthm11_hprot),
    .exthm11_hrdata      ( exthm11_hrdata),
    .exthm11_hready      ( exthm11_hready),
    .exthm11_hresp       ( exthm11_hresp),
    .exthm11_hsize       ( exthm11_hsize),
    .exthm11_htrans      ( exthm11_htrans),
    .exthm11_hwrite      ( exthm11_hwrite),
    .exthm11_hwdata      ( exthm11_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST12
    .exthm12_haddr       ( exthm12_haddr),
    .exthm12_hburst      ( exthm12_hburst),
    .exthm12_hprot       ( exthm12_hprot),
    .exthm12_hrdata      ( exthm12_hrdata),
    .exthm12_hready      ( exthm12_hready),
    .exthm12_hresp       ( exthm12_hresp),
    .exthm12_hsize       ( exthm12_hsize),
    .exthm12_htrans      ( exthm12_htrans),
    .exthm12_hwrite      ( exthm12_hwrite),
    .exthm12_hwdata      ( exthm12_hwdata),
    .exthm13_haddr       ( exthm13_haddr),
    .exthm13_hburst      ( exthm13_hburst),
`endif
`ifdef AE250_MATRIX_EXTMST13
    .exthm13_hprot       ( exthm13_hprot),
    .exthm13_hrdata      ( exthm13_hrdata),
    .exthm13_hready      ( exthm13_hready),
    .exthm13_hresp       ( exthm13_hresp),
    .exthm13_hsize       ( exthm13_hsize),
    .exthm13_htrans      ( exthm13_htrans),
    .exthm13_hwrite      ( exthm13_hwrite),
    .exthm13_hwdata      ( exthm13_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST14
    .exthm14_haddr       ( exthm14_haddr),
    .exthm14_hburst      ( exthm14_hburst),
    .exthm14_hprot       ( exthm14_hprot),
    .exthm14_hrdata      ( exthm14_hrdata),
    .exthm14_hready      ( exthm14_hready),
    .exthm14_hresp       ( exthm14_hresp),
    .exthm14_hsize       ( exthm14_hsize),
    .exthm14_htrans      ( exthm14_htrans),
    .exthm14_hwrite      ( exthm14_hwrite),
    .exthm14_hwdata      ( exthm14_hwdata),
`endif
`ifdef AE250_MATRIX_EXTMST15
    .exthm15_haddr       ( exthm15_haddr),
    .exthm15_hburst      ( exthm15_hburst),
    .exthm15_hprot       ( exthm15_hprot),
    .exthm15_hrdata      ( exthm15_hrdata),
    .exthm15_hready      ( exthm15_hready),
    .exthm15_hresp       ( exthm15_hresp),
    .exthm15_hsize       ( exthm15_hsize),
    .exthm15_htrans      ( exthm15_htrans),
    .exthm15_hwrite      ( exthm15_hwrite),
    .exthm15_hwdata      ( exthm15_hwdata),
`endif
`ifdef AE250_MATRIX_EXTSLV2
    .exths2_hrdata       ( exths2_hrdata),
    .exths2_hready   ( exths2_hready),
    .exths2_hresp        ( exths2_hresp),
    .exths2_hreadyout   ( exths2_hreadyout),
    .exths2_haddr        ( exths2_haddr),
    .exths2_hburst       ( exths2_hburst),
    .exths2_hprot        ( exths2_hprot),
    .exths2_hsel         ( exths2_hsel),
    .exths2_hsize        ( exths2_hsize),
    .exths2_htrans       ( exths2_htrans),
    .exths2_hwdata       ( exths2_hwdata),
    .exths2_hwrite       ( exths2_hwrite),
`endif
`ifdef AE250_MATRIX_EXTSLV3
    .exths3_hrdata       ( exths3_hrdata),
    .exths3_hready   ( exths3_hready),
    .exths3_hresp        ( exths3_hresp),
    .exths3_hreadyout   ( exths3_hreadyout),
    .exths3_haddr        ( exths3_haddr),
    .exths3_hburst       ( exths3_hburst),
    .exths3_hprot        ( exths3_hprot),
    .exths3_hsel         ( exths3_hsel),
    .exths3_hsize        ( exths3_hsize),
    .exths3_htrans       ( exths3_htrans),
    .exths3_hwdata       ( exths3_hwdata),
    .exths3_hwrite       ( exths3_hwrite),
`endif
`ifdef AE250_MATRIX_EXTSLV4
    .exths4_hrdata       ( exths4_hrdata),
    .exths4_hready   ( exths4_hready),
    .exths4_hresp        ( exths4_hresp),
    .exths4_hreadyout   ( exths4_hreadyout),
    .exths4_haddr        ( exths4_haddr),
    .exths4_hburst       ( exths4_hburst),
    .exths4_hprot        ( exths4_hprot),
    .exths4_hsel         ( exths4_hsel),
    .exths4_hsize        ( exths4_hsize),
    .exths4_htrans       ( exths4_htrans),
    .exths4_hwdata       ( exths4_hwdata),
    .exths4_hwrite       ( exths4_hwrite),
`endif
`ifdef AE250_MATRIX_EXTSLV5
    .exths5_hrdata       ( exths5_hrdata),
    .exths5_hready   ( exths5_hready),
    .exths5_hresp        ( exths5_hresp),
    .exths5_hreadyout   ( exths5_hreadyout),
    .exths5_haddr        ( exths5_haddr),
    .exths5_hburst       ( exths5_hburst),
    .exths5_hprot        ( exths5_hprot),
    .exths5_hsel         ( exths5_hsel),
    .exths5_hsize        ( exths5_hsize),
    .exths5_htrans       ( exths5_htrans),
    .exths5_hwdata       ( exths5_hwdata),
    .exths5_hwrite       ( exths5_hwrite),
`endif
`ifdef AE250_MATRIX_EXTSLV6
    .exths6_hrdata       ( exths6_hrdata),
    .exths6_hready   ( exths6_hready),
    .exths6_hresp        ( exths6_hresp),
    .exths6_hreadyout   ( exths6_hreadyout),
    .exths6_haddr        ( exths6_haddr),
    .exths6_hburst       ( exths6_hburst),
    .exths6_hprot        ( exths6_hprot),
    .exths6_hsel         ( exths6_hsel),
    .exths6_hsize        ( exths6_hsize),
    .exths6_htrans       ( exths6_htrans),
    .exths6_hwdata       ( exths6_hwdata),
    .exths6_hwrite       ( exths6_hwrite),
`endif
`ifdef AE250_MATRIX_EXTSLV7
    .exths7_hrdata       ( exths7_hrdata),
    .exths7_hready   ( exths7_hready),
    .exths7_hresp        ( exths7_hresp),
    .exths7_hreadyout   ( exths7_hreadyout),
    .exths7_haddr        ( exths7_haddr),
    .exths7_hburst       ( exths7_hburst),
    .exths7_hprot        ( exths7_hprot),
    .exths7_hsel         ( exths7_hsel),
    .exths7_hsize        ( exths7_hsize),
    .exths7_htrans       ( exths7_htrans),
    .exths7_hwdata       ( exths7_hwdata),
    .exths7_hwrite       ( exths7_hwrite),
`endif
`ifdef AE250_MATRIX_EXTSLV8
    .exths8_hrdata      ( exths8_hrdata),
    .exths8_hready  ( exths8_hready),
    .exths8_hresp       ( exths8_hresp),
    .exths8_hreadyout  ( exths8_hreadyout),
    .exths8_haddr       ( exths8_haddr),
    .exths8_hburst      ( exths8_hburst),
    .exths8_hprot       ( exths8_hprot),
    .exths8_hsel        ( exths8_hsel),
    .exths8_hsize       ( exths8_hsize),
    .exths8_htrans      ( exths8_htrans),
    .exths8_hwdata      ( exths8_hwdata),
    .exths8_hwrite      ( exths8_hwrite),
`endif
`ifdef AE250_MATRIX_EXTSLV9
    .exths9_hrdata      ( exths9_hrdata),
    .exths9_hready  ( exths9_hready),
    .exths9_hresp       ( exths9_hresp),
    .exths9_hreadyout  ( exths9_hreadyout),
    .exths9_haddr       ( exths9_haddr),
    .exths9_hburst      ( exths9_hburst),
    .exths9_hprot       ( exths9_hprot),
    .exths9_hsel        ( exths9_hsel),
    .exths9_hsize       ( exths9_hsize),
    .exths9_htrans      ( exths9_htrans),
    .exths9_hwdata      ( exths9_hwdata),
    .exths9_hwrite      ( exths9_hwrite),
`endif
`ifdef AE250_MATRIX_EXTSLV10
    .exths10_hrdata      ( exths10_hrdata),
    .exths10_hready      ( exths10_hready),
    .exths10_hresp       ( exths10_hresp),
    .exths10_hreadyout   ( exths10_hreadyout),
    .exths10_haddr       ( exths10_haddr),
    .exths10_hburst      ( exths10_hburst),
    .exths10_hprot       ( exths10_hprot),
    .exths10_hsel        ( exths10_hsel),
    .exths10_hsize       ( exths10_hsize),
    .exths10_htrans      ( exths10_htrans),
    .exths10_hwdata      ( exths10_hwdata),
    .exths10_hwrite      ( exths10_hwrite),
`endif
`ifdef AE250_MATRIX_EXTSLV11
    .exths11_hrdata      ( exths11_hrdata),
    .exths11_hready      ( exths11_hready),
    .exths11_hresp       ( exths11_hresp),
    .exths11_hreadyout   ( exths11_hreadyout),
    .exths11_haddr       ( exths11_haddr),
    .exths11_hburst      ( exths11_hburst),
    .exths11_hprot       ( exths11_hprot),
    .exths11_hsel        ( exths11_hsel),
    .exths11_hsize       ( exths11_hsize),
    .exths11_htrans      ( exths11_htrans),
    .exths11_hwdata      ( exths11_hwdata),
    .exths11_hwrite      ( exths11_hwrite),    
`endif
`ifdef AE250_MATRIX_EXTSLV12
    .exths12_hrdata      ( exths12_hrdata),
    .exths12_hready      ( exths12_hready),
    .exths12_hresp       ( exths12_hresp),
    .exths12_hreadyout   ( exths12_hreadyout),
    .exths12_haddr       ( exths12_haddr),
    .exths12_hburst      ( exths12_hburst),
    .exths12_hprot       ( exths12_hprot),
    .exths12_hsel        ( exths12_hsel),
    .exths12_hsize       ( exths12_hsize),
    .exths12_htrans      ( exths12_htrans),
    .exths12_hwdata      ( exths12_hwdata),
    .exths12_hwrite      ( exths12_hwrite),
`endif
`ifdef AE250_MATRIX_EXTSLV13
    .exths13_hrdata      ( exths13_hrdata),
    .exths13_hready      ( exths13_hready),
    .exths13_hresp       ( exths13_hresp),
    .exths13_hreadyout   ( exths13_hreadyout),
    .exths13_haddr       ( exths13_haddr),
    .exths13_hburst      ( exths13_hburst),
    .exths13_hprot       ( exths13_hprot),
    .exths13_hsel        ( exths13_hsel),
    .exths13_hsize       ( exths13_hsize),
    .exths13_htrans      ( exths13_htrans),
    .exths13_hwdata      ( exths13_hwdata),
    .exths13_hwrite      ( exths13_hwrite),    
`endif
`ifdef AE250_MATRIX_EXTSLV14
    .exths14_hrdata      ( exths14_hrdata),
    .exths14_hready      ( exths14_hready),
    .exths14_hresp       ( exths14_hresp),
    .exths14_hreadyout   ( exths14_hreadyout),
    .exths14_haddr       ( exths14_haddr),
    .exths14_hburst      ( exths14_hburst),
    .exths14_hprot       ( exths14_hprot),
    .exths14_hsel        ( exths14_hsel),
    .exths14_hsize       ( exths14_hsize),
    .exths14_htrans      ( exths14_htrans),
    .exths14_hwdata      ( exths14_hwdata),
    .exths14_hwrite      ( exths14_hwrite),
`endif
`ifdef AE250_MATRIX_EXTSLV15
    .exths15_hrdata      ( exths15_hrdata),
    .exths15_hready      ( exths15_hready),
    .exths15_hresp       ( exths15_hresp),
    .exths15_hreadyout   ( exths15_hreadyout),
    .exths15_haddr       ( exths15_haddr),
    .exths15_hburst      ( exths15_hburst),
    .exths15_hprot       ( exths15_hprot),
    .exths15_hsel        ( exths15_hsel),
    .exths15_hsize       ( exths15_hsize),
    .exths15_htrans      ( exths15_htrans),
    .exths15_hwdata      ( exths15_hwdata),
    .exths15_hwrite      ( exths15_hwrite),
`endif

`ifdef AE250_APB_EXTSLV
    .pclk_o              (pclk_o),
    .presetn_o           (presetn_o),
	.pprot               ( pprot),
	.pstrb               ( pstrb),
	.paddr               ( paddr),
	.penable             ( penable),
	.pwrite              ( pwrite),
	.pwdata              ( pwdata),
`endif
`ifdef AE250_APB_EXTSLV2
    .extps2_psel         ( extps2_psel),
    .extps2_prdata       ( extps2_prdata),
    .extps2_pready       ( extps2_pready),
    .extps2_pslverr      ( extps2_pslverr),
`endif
`ifdef AE250_APB_EXTSLV3
    .extps3_psel         ( extps3_psel),
    .extps3_prdata       ( extps3_prdata),
    .extps3_pready       ( extps3_pready),
    .extps3_pslverr      ( extps3_pslverr),
`endif
`ifdef AE250_APB_EXTSLV4
    .extps4_psel         ( extps4_psel),
    .extps4_prdata       ( extps4_prdata),
    .extps4_pready       ( extps4_pready),
    .extps4_pslverr      ( extps4_pslverr),
`endif
`ifdef AE250_APB_EXTSLV5
    .extps5_psel         ( extps5_psel),
    .extps5_prdata       ( extps5_prdata),
    .extps5_pready       ( extps5_pready),
    .extps5_pslverr      ( extps5_pslverr),
`endif
`ifdef AE250_APB_EXTSLV6
    .extps6_psel         ( extps6_psel),
    .extps6_prdata       ( extps6_prdata),
    .extps6_pready       ( extps6_pready),
    .extps6_pslverr      ( extps6_pslverr),
`endif
`ifdef AE250_APB_EXTSLV7
    .extps7_psel         ( extps7_psel),
    .extps7_prdata       ( extps7_prdata),
    .extps7_pready       ( extps7_pready),
    .extps7_pslverr      ( extps7_pslverr),
`endif
`ifdef AE250_APB_EXTSLV8
    .extps8_psel         ( extps8_psel),
    .extps8_prdata       ( extps8_prdata),
    .extps8_pready       ( extps8_pready),
    .extps8_pslverr      ( extps8_pslverr),
`endif
`ifdef AE250_APB_EXTSLV9
    .extps9_psel         ( extps9_psel),
    .extps9_prdata       ( extps9_prdata),
    .extps9_pready       ( extps9_pready),
    .extps9_pslverr      ( extps9_pslverr),
`endif
`ifdef AE250_APB_EXTSLV10
    .extps10_psel        ( extps10_psel),
    .extps10_prdata      ( extps10_prdata),
    .extps10_pready      ( extps10_pready),
    .extps10_pslverr     ( extps10_pslverr),
`endif
`ifdef AE250_APB_EXTSLV11
    .extps11_psel        ( extps11_psel),
    .extps11_prdata      ( extps11_prdata),
    .extps11_pready      ( extps11_pready),
    .extps11_pslverr     ( extps11_pslverr),
`endif
`ifdef AE250_APB_EXTSLV12
    .extps12_psel        ( extps12_psel),
    .extps12_prdata      ( extps12_prdata),
    .extps12_pready      ( extps12_pready),
    .extps12_pslverr     ( extps12_pslverr),
`endif
`ifdef AE250_APB_EXTSLV13
    .extps13_psel        ( extps13_psel),
    .extps13_prdata      ( extps13_prdata),
    .extps13_pready      ( extps13_pready),
    .extps13_pslverr     ( extps13_pslverr),
`endif
`ifdef AE250_APB_EXTSLV14
    .extps14_psel        ( extps14_psel),
    .extps14_prdata      ( extps14_prdata),
    .extps14_pready      ( extps14_pready),
    .extps14_pslverr     ( extps14_pslverr),
`endif
`ifdef AE250_APB_EXTSLV15
    .extps15_psel        ( extps15_psel),
    .extps15_prdata      ( extps15_prdata),
    .extps15_pready      ( extps15_pready),
    .extps15_pslverr     ( extps15_pslverr),
`endif
`ifdef AE250_APB_EXTSLV16
    .extps16_psel        ( extps16_psel),
    .extps16_prdata      ( extps16_prdata),
    .extps16_pready      ( extps16_pready),
    .extps16_pslverr     ( extps16_pslverr),
`endif
`ifdef AE250_APB_EXTSLV17
    .extps17_psel        ( extps17_psel),
    .extps17_prdata      ( extps17_prdata),
    .extps17_pready      ( extps17_pready),
    .extps17_pslverr     ( extps17_pslverr),
`endif
`ifdef AE250_APB_EXTSLV18
    .extps18_psel        ( extps18_psel),
    .extps18_prdata      ( extps18_prdata),
    .extps18_pready      ( extps18_pready),
    .extps18_pslverr     ( extps18_pslverr),
`endif
`ifdef AE250_APB_EXTSLV19
    .extps19_psel        ( extps19_psel),
    .extps19_prdata      ( extps19_prdata),
    .extps19_pready      ( extps19_pready),
    .extps19_pslverr     ( extps19_pslverr),
`endif
`ifdef AE250_APB_EXTSLV20
    .extps20_psel        ( extps20_psel),
    .extps20_prdata      ( extps20_prdata),
    .extps20_pready      ( extps20_pready),
    .extps20_pslverr     ( extps20_pslverr),
`endif
`ifdef AE250_APB_EXTSLV21
    .extps21_psel        ( extps21_psel),
    .extps21_prdata      ( extps21_prdata),
    .extps21_pready      ( extps21_pready),
    .extps21_pslverr     ( extps21_pslverr),
`endif
`ifdef AE250_APB_EXTSLV22
    .extps22_psel        ( extps22_psel),
    .extps22_prdata      ( extps22_prdata),
    .extps22_pready      ( extps22_pready),
    .extps22_pslverr     ( extps22_pslverr),
`endif
`ifdef AE250_APB_EXTSLV23
    .extps23_psel        ( extps23_psel),
    .extps23_prdata      ( extps23_prdata),
    .extps23_pready      ( extps23_pready),
    .extps23_pslverr     ( extps23_pslverr),
`endif
`ifdef AE250_APB_EXTSLV24
    .extps24_psel        ( extps24_psel),
    .extps24_prdata      ( extps24_prdata),
    .extps24_pready      ( extps24_pready),
    .extps24_pslverr     ( extps24_pslverr),
`endif
`ifdef AE250_APB_EXTSLV25
    .extps25_psel        ( extps25_psel),
    .extps25_prdata      ( extps25_prdata),
    .extps25_pready      ( extps25_pready),
    .extps25_pslverr     ( extps25_pslverr),
`endif
`ifdef AE250_APB_EXTSLV26
    .extps26_psel        ( extps26_psel),
    .extps26_prdata      ( extps26_prdata),
    .extps26_pready      ( extps26_pready),
    .extps26_pslverr     ( extps26_pslverr),
`endif
`ifdef AE250_APB_EXTSLV27
    .extps27_psel        ( extps27_psel),
    .extps27_prdata      ( extps27_prdata),
    .extps27_pready      ( extps27_pready),
    .extps27_pslverr     ( extps27_pslverr),
`endif
`ifdef AE250_APB_EXTSLV28
    .extps28_psel        ( extps28_psel),
    .extps28_prdata      ( extps28_prdata),
    .extps28_pready      ( extps28_pready),
    .extps28_pslverr     ( extps28_pslverr),
`endif
`ifdef AE250_APB_EXTSLV29
    .extps29_psel        ( extps29_psel),
    .extps29_prdata      ( extps29_prdata),
    .extps29_pready      ( extps29_pready),
    .extps29_pslverr     ( extps29_pslverr),
`endif
`ifdef AE250_APB_EXTSLV30
    .extps30_psel        ( extps30_psel),
    .extps30_prdata      ( extps30_prdata),
    .extps30_pready      ( extps30_pready),
    .extps30_pslverr     ( extps30_pslverr),
`endif
`ifdef AE250_APB_EXTSLV31
    .extps31_psel        ( extps31_psel),
    .extps31_prdata      ( extps31_prdata),
    .extps31_pready      ( extps31_pready),
    .extps31_pslverr     ( extps31_pslverr),
`endif
    .ext_int_src        (ext_int_src)

);
endmodule
