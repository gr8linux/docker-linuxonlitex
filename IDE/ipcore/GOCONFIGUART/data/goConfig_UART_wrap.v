
`include "goConfig_UART_define.v"
`include "static_macro_define.v"

module `module_name (
	//Flash IO
	output      GW_BACKGROUND_INT_SCLK  ,
	output      GW_BACKGROUND_INT_CS_N  ,
	output      GW_BACKGROUND_INT_MOSI  ,
	input       GW_BACKGROUND_INT_MISO  ,
	// UART IO 
	input       GW_BACKGROUND_EXT_RX    ,
	output      GW_BACKGROUND_EXT_TX    ,
	// 
	output      GW_BACKGROUND_RECONFIG_N,
    input       GW_RSTN,
	input       GW_OSC_CLK               
); 
// uart 
    parameter   UART_SLAVE_SYSCLK   = `SYS_CLK;	//采样频率
//    parameter   UART_BAUD_RATE      = 115_200,		//波特率
    parameter   UART_BAUD_RATE      = `UART_BAUD_RATE ;		//波特率
    parameter   POLARITY_BIT        = `POLARITY_BIT;    		// 0:no     1:odd   2:even      //奇偶校验
    parameter   IDLE_CYCLE          = `IDLE_CYCLE;    		// 2~n :n=65535

// Flash
    //Flash Sector Constant 
	parameter	SECTOR_WAIT		= 50;	//等待几次算超时(区域，sector)
    //Flash Page Constant 
	parameter	PAGE_WAIT		= 4;	//等待几次算超时(页，page)
    parameter   WAIT_XX_MS      = 4;		//单位：ms
										//XX ms进行一次状态查询，确保操作已完成
                                        //一次等xx ms

`getname(GW_BACKGROUND_UART,`module_name)
#(
//uart
	.UART_SLAVE_SYSCLK(UART_SLAVE_SYSCLK),
	.UART_BAUD_RATE(UART_BAUD_RATE),
	.POLARITY_BIT(POLARITY_BIT),
    .IDLE_CYCLE(IDLE_CYCLE),
//Flash
	.SECTOR_WAIT(SECTOR_WAIT),
	.PAGE_WAIT(PAGE_WAIT),
	.WAIT_XX_MS(WAIT_XX_MS),
//delay_ms
	.SIM(0)
)
 inst_GW_UART(
	.GW_BACKGROUND_INT_SCLK(GW_BACKGROUND_INT_SCLK),
	.GW_BACKGROUND_INT_CS_N(GW_BACKGROUND_INT_CS_N),
	.GW_BACKGROUND_INT_MOSI(GW_BACKGROUND_INT_MOSI),
	.GW_BACKGROUND_INT_MISO(GW_BACKGROUND_INT_MISO),
    .GW_BACKGROUND_EXT_RX(GW_BACKGROUND_EXT_RX),
    .GW_BACKGROUND_EXT_TX(GW_BACKGROUND_EXT_TX),
    .GW_BACKGROUND_RECONFIG_N(GW_BACKGROUND_RECONFIG_N),
	.GW_OSC_CLK(GW_OSC_CLK),
	.GW_RSTN(GW_RSTN)


 );


endmodule
