`include "define.v"
`include "static_macro_define.v"
module `MODULE_NAME(
    clk,
    rstn,
    coeff_wr,
    coeff_addr,
    coeff_in,

    in_pcm_valid,
`ifdef NOT_1_CHN
    in_pcm_sync,
`endif
    in_pcm_data,
    in_pdm_clk,
    out_pdm_data,

    fifo_RdEn,
    fifo_Empty,
    fifo_Full
	);
//**********************************************************************
// --- paramter
//**********************************************************************
`include "parameter.v"
localparam COEFF_WIDTH=DATA_WIDTH;
//**********************************************************************
// --- Inter Signal Declaration
//**********************************************************************

input clk;
input rstn;
input coeff_wr;
input [15:0] coeff_addr;
input [COEFF_WIDTH-1:0] coeff_in;
input	in_pcm_valid;
`ifdef NOT_1_CHN
 input   in_pcm_sync;
`endif
input signed [DATA_WIDTH-1:0]	in_pcm_data;

input	in_pdm_clk;
output 	out_pdm_data;

input fifo_RdEn;
output fifo_Empty;
output fifo_Full;
//**********************************************************************
// --- Main Core
//**********************************************************************

`getname(Sigma_Delta_Modulator,`MODULE_NAME) Sigma_Delta_Modulator(
//Sigma_Delta_Modulator Sigma_Delta_Modulator(
    .clk    (clk),
    .rstn   (rstn),
    .coeff_wr   (coeff_wr),
    .coeff_addr (coeff_addr),
    .coeff_in   (coeff_in),

    .in_pcm_valid   (in_pcm_valid),
`ifdef NOT_1_CHN
    .in_pcm_sync    (in_pcm_sync),
`endif
    .in_pcm_data    (in_pcm_data),
    .in_pdm_clk     (in_pdm_clk),
    .out_pdm_data   (out_pdm_data),

    .fifo_RdEn      (fifo_RdEn),
    .fifo_Empty     (fifo_Empty),
    .fifo_Full      (fifo_Full)
);

endmodule
