`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME(
	clk,        // 时钟信号
	clk2, 		// 第二时钟信号
    rstn,       // 复位信号（低电平有效）
	in_valid,   // 输入数据有效信号
	in_data,    // JPEG输入数据

	frame_sync, 		// 帧同步信号
	out_in_accept, 		// 输出数据接收信号
	out_valid,  		// 输出数据有效信号
	width,				// 图像宽度
	height,				// 图像高度
	coordinate_x,		// 像素坐标x
	coordinate_y,		// 像素坐标y
	r, 					// 红色通道
	g, 					// 绿色通道
	b 					// 蓝色通道
);


//**********************************************************************
// --- Input/Output Declaration
//**********************************************************************
// --- input ---	
	input 						  clk;
	input					      clk2;
	input 					 	  rstn;
	input 						  in_valid;
	input  [31:0]    		      in_data;

// --- output ---
	output 						  frame_sync;
	output 						  out_in_accept;
	output 						  out_valid;
	output  [15:0]				  width;
	output  [15:0]				  height;
	output  [15:0]				  coordinate_x;
	output  [15:0]				  coordinate_y;
	output  [7:0]				  r;
	output  [7:0]				  g;
	output  [7:0]				  b;

//*************************************************************
//*************-- Module Instance  --**************************
//*************************************************************
	`getname(MJPEG_Decoder,`MODULE_NAME) MJPEG_Decoder_inst(
		.clk				(clk),       		// 时钟信号
		.clk2				(clk2),      		// 第二时钟信号
		.rstn				(rstn),      		// 复位信号（低电平有效）
		.in_valid			(in_valid),  		// 输入数据有效信号
		.in_data			(in_data),   		// JPEG输入数据

		.frame_sync			(frame_sync),		// 帧同步信号
		.out_in_accept		(out_in_accept),	// 输出数据接收信号
		.out_valid			(out_valid),		// 输出数据有效信号
		.width				(width),			// 图像宽度
		.height				(height),			// 图像高度
		.coordinate_x		(coordinate_x),		// 像素坐标x
		.coordinate_y		(coordinate_y),		// 像素坐标y
		.r					(r),				// 红色通道
		.g					(g),				// 绿色通道
		.b					(b)					// 蓝色通道
    );
endmodule


