`include "define.v"
`include "static_macro_define.v"

module `module_name(
	input 							clk,                    // system clock
    input                      		rstn,                  	// rstn
	input							ce,						// enable
	input							start,					// start
	input 							VAD,					// valid audio detection
	output							din_ready,				// ready for input data
    input                       	ibstart,                // input block start (for multi-channel)
    input                       	inpvalid,               // input data valid
	input	signed [18-1:0]			din,                    // input data
	output	reg [7:0]				dir,					// direction
	input							dout_ready,				// ready for output data
    output                      	outvalid,               // output data valid
	output 	signed [18-1:0]			dout                    // output data
);


	`getname(beam_forming,`module_name) beam_forming (
//  beam_forming beam_forming (
    .clk        ( clk),
    .rstn       ( rstn),
    .ce         ( ce),
    .start      ( start),
    .VAD        ( VAD),
    .din_ready  ( din_ready),
    .ibstart    ( ibstart),
    .inpvalid   ( inpvalid),
    .din        ( din),
    .dir        ( dir),
    .dout_ready ( dout_ready),
    .outvalid   ( outvalid),
    .dout       ( dout)
  );
  
  
endmodule
