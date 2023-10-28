
//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	NPU_Top your_instance_name(
		.pri_fclk(pri_fclk_i), //input pri_fclk
		.pri_fclk90(pri_fclk90_i), //input pri_fclk90
		.O_psram_ck(O_psram_ck_o), //output [1:0] O_psram_ck
		.O_psram_ck_n(O_psram_ck_n_o), //output [1:0] O_psram_ck_n
		.IO_psram_rwds(IO_psram_rwds_io), //inout [1:0] IO_psram_rwds
		.IO_psram_dq(IO_psram_dq_io), //inout [15:0] IO_psram_dq
		.O_psram_reset_n(O_psram_reset_n_o), //output [1:0] O_psram_reset_n
		.O_psram_cs_n(O_psram_cs_n_o), //output [1:0] O_psram_cs_n
		.spi_io(spi_io_io), //inout [3:0] spi_io
		.spi_clk(spi_clk_o), //output spi_clk
		.spi_cs_n(spi_cs_n_o), //output spi_cs_n
		.HCLK(HCLK_i), //input HCLK
		.HRESETn(HRESETn_i), //input HRESETn
		.HSELS(HSELS_i), //input HSELS
		.HADDRS(HADDRS_i), //input [11:0] HADDRS
		.HTRANSS(HTRANSS_i), //input [1:0] HTRANSS
		.HSIZES(HSIZES_i), //input [2:0] HSIZES
		.HWRITES(HWRITES_i), //input HWRITES
		.HREADYS(HREADYS_i), //input HREADYS
		.HWDATAS(HWDATAS_i), //input [31:0] HWDATAS
		.HREADYOUTS(HREADYOUTS_o), //output HREADYOUTS
		.HRESPS(HRESPS_o), //output HRESPS
		.HRDATAS(HRDATAS_o) //output [31:0] HRDATAS
	);

//--------Copy end-------------------
