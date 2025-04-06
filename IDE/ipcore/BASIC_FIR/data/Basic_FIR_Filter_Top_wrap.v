`include "define.vh"
`include "static_macro_define.v"
//**********************************************************************
// --- Module:	Basic FIR Filter
//**********************************************************************

module `MODULE_NAME(
    clk,       // 时钟信号
    rst_n,      // 复位信号
    ini,      // 初始化信号
    wr_en_data, // 写数据使能
    wr_en_coeffi, // 写系数使能
    din_coeffi, // 系数输入
    din_data,  // 数据输入
    dout,      // 数据输出
    done,      // 计算完成信号
    input_rdy  // 输入就绪信号
);
//**********************************************************************
// --- parameter Declaration
//**********************************************************************
`include "parameter.vh"

//**********************************************************************
// --- Input/Output Declaration
//**********************************************************************
// --- input ---	
    input clk;
    input rst_n;
    input ini;
    input wr_en_data;
    input wr_en_coeffi;
    input signed [icoeffi_width-1:0] din_coeffi;
    input signed [idata_width-1:0] din_data;

// --- output ---
    output wire done;
    output wire [53 : 0] dout;
    output input_rdy;


//**********************************************************************
// --- Module:	 Basic_FIR_Filter 
//**********************************************************************

	`getname(Basic_FIR_Filter_Top,`MODULE_NAME) Basic_FIR_Filter_inst(
        .clk(clk),
        .rst_n(rst_n),
        .ini(ini),
        .wr_en_data(wr_en_data),
        .wr_en_coeffi(wr_en_coeffi),
        .din_coeffi(din_coeffi),
        .din_data(din_data),
        .dout(dout),
        .done(done),
        .input_rdy(input_rdy)
    );
    defparam Basic_FIR_Filter_inst.idata_width = idata_width;
    defparam Basic_FIR_Filter_inst.icoeffi_width = icoeffi_width;
    defparam Basic_FIR_Filter_inst.tapsize = tapsize;

endmodule