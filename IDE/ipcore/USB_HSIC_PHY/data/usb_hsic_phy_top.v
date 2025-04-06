`timescale 1ns/100ps

`include "usb_hsic_phy_name.v"
`include "static_macro_define.v"

module `module_name    
(
		input  wire       fclk_i       ,//240Mhz
		output wire       clk60m_o     ,//60mhz
		input  wire       rst_n_i      ,
		// HSIC Interface
		input  wire       hsic_data_i     ,
		input  wire       hsic_strobe_i   ,
		output wire       hsic_data_o     ,
		output wire       hsic_strobe_o    ,
		input  wire       hsic_linestate_data_i    ,
		input  wire       hsic_linestate_strobe_i  ,
		// UTMI Interface
		input  wire       utim_reset_i      ,
		input  wire [7:0] utim_dataout_i    ,
		input  wire       utim_txvalid_i    ,
		output wire       utim_txready_o    ,
		output wire [7:0] utim_datain_o     ,
		output wire       utim_rxvalid_o    ,
		output wire       utim_rxactive_o   ,
		output wire       utim_rxerror_o    ,
		output wire [1:0] utim_linestate_o  ,//2'b00:RESET  ;2'b01:CONNECT/RESUME  ;2'b10:IDLE/SUSPEND  ;2'b11:保留
		input  wire [1:0] utim_opmode_i     ,//2'b00：正常操作；2'b10:不使能填充位和NRZI编码
		input  wire       utim_termselect_i ,//HOST模式时，1'b1:使能Strobe上的上拉1.5K电阻，1'b0：禁用Strobe上的上拉1.5K电阻
		input  wire [1:0] utim_xcvrselect_i  //HOST/SLAVE模式时，固定为2'b00，即HS传输

);

`getname(usb_hsic_phy,`module_name)  u_usb_hsic_phy(

   .I_fclk         (fclk_i   ),
   .I_rst_n        (rst_n_i  ),
   .O_clk60m       (clk60m_o),

   .IO_data_i      (hsic_data_i  ),
   .IO_strobe_i    (hsic_strobe_i),
   .IO_data_o      (hsic_data_o  ),
   .IO_strobe_o    (hsic_strobe_o),
   .I_data         (hsic_linestate_data_i  ),
   .I_strobe       (hsic_linestate_strobe_i),

   .I_utimReset    		 (utim_reset_i),
   .I_utimDataOut      (utim_dataout_i),
   .I_utimTxValid      (utim_txvalid_i),
   .O_utimTxReady      (utim_txready_o),
   .O_utimDataIn       (utim_datain_o  ),
   .O_utimRxValid      (utim_rxvalid_o ),
   .O_utimRxActive     (utim_rxactive_o),
   .O_utimRxError      (utim_rxerror_o ),
   .O_utimLineState    (utim_linestate_o),
   .I_utimOpMode       (utim_opmode_i),
   .I_utimTermSelect   (utim_termselect_i),
   .I_utimXcvrSelect   (utim_xcvrselect_i),
   .test()

  );	
		
endmodule