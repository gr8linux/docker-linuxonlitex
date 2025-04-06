//===========================================================================
//
// File         : label_placer.v
// Description  : Laber placer
// Revision     : V1.0
// Date         : 8/1/2022
// Author       : Embedded RnD of Gowin
//
//===========================================================================

module label_placer (
    input clk,
    input rstn,
    input hs,
    input vs,
    input de,
    output in_label,
    output [2:0] place,
    output [2:0] row,
    output [2:0] pixel
);

// coordinates of left-top corner of label
// must be a multiple of 8 
parameter X_POS = 256;
parameter Y_POS = 256;

// scale coefficients
// 0 - no scale, symbol 8x8
// 1 - scale x2, symbol 16x16
// 2 - scale x4, symbol 32x32
// ... etc
parameter SCALE = 0;

// label length 
localparam LABEL_LEN = 8;

// local coordinates of left-top corner of label
localparam X_START = X_POS/(1 << SCALE);
localparam Y_START = Y_POS/(1 << SCALE);

// local coordinates of right-bottom corner of label
localparam X_END = X_START + 8 * LABEL_LEN;
localparam Y_END = Y_START + 8;

// current x,y counters
reg [11:0] x, y;
// scaled x,y counters
wire [12 - SCALE - 1:0] x_scaled, y_scaled;
// label relative x,y 
wire [12 - SCALE - 1:0] x_relative, y_relative;

assign x_scaled = x[11:SCALE];
assign y_scaled = y[11:SCALE];
assign x_relative = x_scaled & X_START;
assign y_relative = y_scaled & Y_START;

// flags indicates we are in the label area
wire in_label_x = x_scaled >= X_START && x_scaled < X_END;
wire in_label_y = y_scaled >= Y_START && y_scaled < Y_END;
assign in_label = in_label_x & in_label_y;

assign pixel = x_relative[2:0];
assign place = x_relative[5:3];
assign row   = y_relative[2:0];


reg hs_d;
// pixels counters
always @(posedge clk or negedge rstn)
begin
    if(!rstn) begin
        x <= 12'h0;
        y <= 12'h0;
        hs_d <= 0;
        //pxl <= 0;
    end else begin
        hs_d <= hs;
        if(vs) begin
            x <= 12'h0;
            y <= 12'h0;
        end else if(hs && !hs_d) begin
            y <= y + 1'b1;
            x <= 12'h0;
        end else if(de) begin
            x <= x + 1'b1;
            //if(in_label_x) 
            //    pxl <= pxl + 1;
        end
    end
end 

endmodule
  