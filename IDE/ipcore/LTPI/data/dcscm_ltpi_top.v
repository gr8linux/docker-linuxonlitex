`include"top_define.vh"
`include"static_macro_define.vh"
`include"dcscm_ltpi_top_defines.vh"


`timescale 1ns / 1ps






module `module_name (
     input wire                                   clk_i,            
     input wire                                   ref_clk_i,        
     input wire                                   rstn_i,
     input                                        start_i,
    

     
     output wire                                  lvds_tx_data_o,
     output wire                                  lvds_tx_clk_o,

     
     input wire                                   lvds_rx_data_i,
     input wire                                   lvds_rx_clk_i,
     output wire                                  tx_pll_locked_o,
     output wire                                  aligned_o,          

`ifdef LLGPIO_ENABLE

     input   [  (`DEFINE_LLGPIO_WIDTH - 1) :0]          ll_gpio_in_i,
     output  [  (`DEFINE_LLGPIO_WIDTH - 1) :0]          ll_gpio_out_o,
`endif

`ifdef LLGPIO_ENABLE
     input   [  (`DEFINE_NLGPIO_WIDTH - 1) :0]          nl_gpio_in_i,       
     output  [  (`DEFINE_NLGPIO_WIDTH - 1) :0]          nl_gpio_out_o,
`endif

`ifdef UART_ENABLE
     input   [ (`DEFINE_UART_WIDTH - 1) :0]          uart_rxd_i,         
     output  [ (`DEFINE_UART_WIDTH - 1) :0]          uart_txd_o,
`ifdef UART_FLOW_CTRL     
     input   [ (`DEFINE_UART_WIDTH - 1) :0]          uart_cts_i,       
     output  [ (`DEFINE_UART_WIDTH - 1) :0]          uart_rts_o, 
`endif    
`endif

`ifdef IIC_ENABLE
    inout    [(`DEFINE_IIC_WIDTH - 1) :0]          iic_scl_io,         
    inout    [(`DEFINE_IIC_WIDTH - 1) :0]          iic_sda_io,
`endif


`ifdef OEM_ENABLE
    input    [`DEFINE_OEMGPIO_WIDTH - 1 :0]          oem_gpio_in_i,
    output   [`DEFINE_OEMGPIO_WIDTH - 1 :0]          oem_gpio_out_o,  
`endif

`ifdef DATA_ENABLE
`ifdef SCM
	input      [31:0]   apb_addr_i   ,  //slave
	input               apb_sel_i    ,
	input               apb_ena_i    ,
	input               apb_wr_i     ,
	output     [31:0]   apb_rdata_o  ,
	input      [31:0]   apb_wdata_i  ,
	output              apb_rdy_o    ,
    output              apb_err_o    ,
	input      [3 :0]   apb_strb_i   ,
`endif	
`ifdef HPM
	output      [31:0]   apb_addr_o   ,  //master
	output               apb_sel_o    ,
	output               apb_ena_o    ,
	output               apb_wr_o     ,
	input       [31:0]   apb_rdata_i  ,
	output      [31:0]   apb_wdata_o  ,
	input                apb_rdy_i    ,
    input                apb_err_i    ,
	output      [3 :0]   apb_strb_o   ,
`endif
    input       [7 :0]   data_channel_tag_i,
    output      [7 :0]   data_channel_tag_o,	    
`endif

	input                                         cfg_clk_i   ,
	input                                         cfg_rstn_i  ,
	input      [31:0]                             cfg_addr_i  ,
	input                                         cfg_sel_i   ,
	input                                         cfg_ena_i   ,
	input                                         cfg_wr_i    ,
	output     [31:0]                             cfg_rdata_o ,
	input      [31:0]                             cfg_wdata_i ,
	output                                        cfg_rdy_o   ,
	input      [3 :0]                             cfg_strb_i  ,
    output [5:0]debug_o	

   );

   
`ifdef SCM
   parameter DATA_CONTROLLER = 1;
`else
   parameter DATA_CONTROLLER = 0; 
`endif 


`ifdef LLGPIO_ENABLE
   parameter GPIO_EN = 1;
`else
   parameter GPIO_EN = 0; 
`endif 

`ifdef UART_ENABLE
   parameter UART_EN = 1;
`else
   parameter UART_EN = 0; 
`endif 

`ifdef IIC_ENABLE
   parameter IIC_EN = 1;
`else
   parameter IIC_EN = 0; 
`endif 

`ifdef OEM_ENABLE
   parameter OEM_EN = 1;
`else
   parameter OEM_EN = 0; 
`endif 

`ifdef DATA_ENABLE
   parameter DATA_CHANNEL_EN = 1;
`else
   parameter DATA_CHANNEL_EN = 0; 
`endif 

`ifdef UART_FLOW_CTRL
   parameter INIT_ADVERTISE_UART_FLOW_CTRL = 1;
`else
   parameter INIT_ADVERTISE_UART_FLOW_CTRL = 0; 
`endif 






`getname(ltpi_core,`module_name)  #(
    .FPGA_TYPE                        (`DEFINE_FPGA_TYPE               ),
	.DATA_CONTROLLER                  (DATA_CONTROLLER                 ),
    .IIC_CONTROLLER                   (`IIC_CONTROLLER                  ),
	.GPIO_EN                          (GPIO_EN                         ),
	.NUM_OF_LL_GPIO                   (`DEFINE_LLGPIO_WIDTH            ),
	.LL_GPIO_RST_VALUE                ({`DEFINE_LLGPIO_WIDTH{1'b1}}     ),
	.NUM_OF_NL_GPIO                   (`DEFINE_NLGPIO_WIDTH            ),
	.NL_GPIO_RST_VALUE                ({`DEFINE_NLGPIO_WIDTH{1'b1}}     ),
	.UART_EN                          (UART_EN                         ),
	.NUM_OF_UART_DEV                  (`DEFINE_UART_WIDTH              ),
	.IIC_EN                           (IIC_EN                          ),
	.NUM_OF_IIC_DEV                   (`DEFINE_IIC_WIDTH               ),

    .OEM_EN                           (OEM_EN                          ),
    .NUM_OF_OEM_GPIO                  (`DEFINE_OEMGPIO_WIDTH           ),    
    .OEM_GPIO_RST_VALUE               ({`DEFINE_OEMGPIO_WIDTH{1'b1}}    ),

	.DATA_CHANNEL_EN                  (DATA_CHANNEL_EN                 ),
	.INIT_LTPI_VERSION                ({`DEFINE_VERMAJOR,`DEFINE_VERMINOR}),
	.INIT_SPEED_CAPABILITIES          (`DEFINE_SPEED_CAPABILITIES),
    .INIT_LOCOAL_ID                   (`DEFINE_LOCAL_ID),

	.INIT_ADVERTISE_LOCAL_SUPPORTED  (`DEFINE_ADVERTISE_LOCAL_SUPPORTED),   
	.INIT_ADVERTISE_LOCAL_NL_GPIO    (`DEFINE_NLGPIO_WIDTH),  
	.INIT_ADVERTISE_I2C_ECHO_SUPPORT (`DEFINE_ADVERTISE_I2C_ECHO_SUPPORT),  
	.INIT_ADVERTISE_I2C_CHANNEL_EN   ({`DEFINE_IIC_WIDTH{1'b1}}         ),  
	.INIT_ADVERTISE_I2C_CHANNEL_CPBL (`DEFINE_ADVERTISE_I2C_CHANNEL_CPBL),  
	.INIT_ADVERTISE_UART_CHANNEL_EN  ({`DEFINE_UART_WIDTH{1'b1}}        ),  
	.INIT_ADVERTISE_UART_FLOW_CTRL   (INIT_ADVERTISE_UART_FLOW_CTRL     ), 
	.INIT_ADVERTISE_UART_CHANNEL_CPBL (`DEFINE_ADVERTISE_UART_CHANNEL_CPBL),
	.INIT_ADVERTISE_OEM_CPBL (`DEFINE_ADVERTISE_OEM_CPBL), 


	.INIT_CONFIG_LOCAL_SUPPORTED (`DEFINE_ADVERTISE_LOCAL_SUPPORTED),   
	.INIT_CONFIG_LOCAL_NL_GPIO (`DEFINE_NLGPIO_WIDTH),     
	.INIT_CONFIG_I2C_ECHO_SUPPORT (`DEFINE_ADVERTISE_I2C_ECHO_SUPPORT),  
	.INIT_CONFIG_I2C_CHANNEL_EN({`DEFINE_IIC_WIDTH{1'b1}} ),  
	.INIT_CONFIG_I2C_CHANNEL_CPBL(`DEFINE_ADVERTISE_I2C_CHANNEL_CPBL),  
	.INIT_CONFIG_UART_CHANNEL_EN ({`DEFINE_UART_WIDTH{1'b1}}),  
	.INIT_CONFIG_UART_FLOW_CTRL(INIT_ADVERTISE_UART_FLOW_CTRL), 
	.INIT_CONFIG_UART_CHANNEL_CPBL(`DEFINE_ADVERTISE_UART_CHANNEL_CPBL),	
	.INIT_CONFIG_OEM_CPBL         (`DEFINE_ADVERTISE_OEM_CPBL), 
	.AUTO_MOVE_CONFIG(`DEFINE_AUTO_MOVE_CONFIG) 
) u_ltpi_core
(
     .clk_i           (clk_i          ),            
     .ref_clk_i       (ref_clk_i      ),        
     .rstn_i          (rstn_i         ),
     .start_i         (start_i        ),
     .lvds_tx_data_o  (lvds_tx_data_o ),
     .lvds_tx_clk_o   (lvds_tx_clk_o  ),
     .lvds_rx_data_i  (lvds_rx_data_i ),
     .lvds_rx_clk_i   (lvds_rx_clk_i  ),
     .tx_pll_locked_o (tx_pll_locked_o),
     .aligned_o       (aligned_o      ),         
     .ll_gpio_in_i    (ll_gpio_in_i   ),
     .ll_gpio_out_o   (ll_gpio_out_o  ),
     .nl_gpio_in_i (nl_gpio_in_i),        
     .nl_gpio_out_o(nl_gpio_out_o),

     .uart_rxd_i (uart_rxd_i),          
     .uart_cts_i (uart_cts_i),          
     .uart_txd_o (uart_txd_o),
     .uart_rts_o (uart_rts_o),          

    .iic_scl_io  (iic_scl_io),          
    .iic_sda_io  (iic_sda_io),

    .oem_gpio_in_i  (oem_gpio_in_i ),
    .oem_gpio_out_o (oem_gpio_out_o),


	.apb_addr_i  (apb_addr_i   ),
	.apb_sel_i   (apb_sel_i    ),
	.apb_ena_i   (apb_ena_i    ),
	.apb_wr_i    (apb_wr_i     ),
	.apb_rdata_o (apb_rdata_o  ),
	.apb_wdata_i (apb_wdata_i  ),
	.apb_rdy_o   (apb_rdy_o    ),
    .apb_err_o   (apb_err_o    ),
	.apb_strb_i  (apb_strb_i   ),


	.apb_addr_o  (apb_addr_o   ),
	.apb_sel_o   (apb_sel_o    ),
	.apb_ena_o   (apb_ena_o    ),
	.apb_wr_o    (apb_wr_o     ),
	.apb_rdata_i (apb_rdata_i  ),
	.apb_wdata_o (apb_wdata_o  ),
	.apb_rdy_i   (apb_rdy_i    ),
    .apb_err_i   (apb_err_i    ),
	.apb_strb_o  (apb_strb_o   ),


	.cfg_clk_i   (cfg_clk_i    ),
	.cfg_rstn_i  (cfg_rstn_i   ),
	.cfg_addr_i  (cfg_addr_i   ),
	.cfg_sel_i   (cfg_sel_i    ),
	.cfg_ena_i   (cfg_ena_i    ),
	.cfg_wr_i    (cfg_wr_i     ),
	.cfg_rdata_o (cfg_rdata_o  ),
	.cfg_wdata_i (cfg_wdata_i  ),
	.cfg_rdy_o   (cfg_rdy_o    ),
	.cfg_strb_i  (cfg_strb_i   ),
    .data_channel_tag_i(data_channel_tag_i),
    .data_channel_tag_o(data_channel_tag_o),
    .debug_o(debug_o)
		

   );
   
   
   
   
   
   
   
   

endmodule
