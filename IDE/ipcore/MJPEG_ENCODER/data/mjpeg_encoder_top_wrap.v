`include "define.v"
`include "static_macro_define.v"
module `MODULE_NAME(
    clk,
    rstn,
    DE,
    data_in,
    img_out,
    img_valid,
    img_done
	);
//**********************************************************************
// --- Inter Signal Declaration
//**********************************************************************

input   clk;
input   rstn;
input   DE;
input	[23:0]	data_in;
// --- output ---	

output  [7:0]  img_out;
output  img_valid;
output  img_done;

//**********************************************************************
// --- Main Core
//**********************************************************************

`getname(mjpeg_encoder_top,`MODULE_NAME) mjpeg_encoder_top(
//mjpeg_encoder_top  mjpeg_encoder_top (
    .clk        (clk), 
    .rstn       (rstn),
    .DE         (DE),
    .data_in    (data_in),
    .img_out    (img_out),
    .img_valid  (img_valid),
    .img_done   (img_done)
    );

endmodule
