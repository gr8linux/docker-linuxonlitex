//===========================================================================
//
// File         : text_overlay.v
// Description  : Text overlay
// Revision     : V1.0
// Date         : 8/1/2022
// Author       : Embedded RnD of Gowin
//
//===========================================================================

module text_overlay (
    input clk,
    input rstn,
    // input video stream
    input hs,
    input vs,
    input de,
    input [23:0] rgb,
    // text selector
    // 0 - empty label
    // 1 - 'Airplane'
    // 2 - 'Car'
    // 3 - 'Bird'
    // 4 - 'Cat'
    // 5 - 'Deer'
    // 6 - 'Dog'
    // 7 - 'Frog'
    // 8 - 'Horse'
    // 9 - 'Ship'
    // 10 - 'Truck'
    // 11 - 'Smile'
    // 12 - 'Person'
    // others - reserved
    input [3:0]  text_option,
    // output video stream
    output hs_o,
    output vs_o,
    output de_o,
    output [23:0] rgb_o
);

// coordinates of left-top corner of label
// must be a multiple of 8 
parameter X_POS = 256;
parameter Y_POS = 512;

// scale coefficients
// 0 - no scale, symbol 8x8
// 1 - scale x2, symbol 16x16
// 2 - scale x4, symbol 32x32
// ... etc
parameter SCALE = 4;

// font color 
parameter FONT_COLOR = 24'h000000;

// using background filling
// 0 - transparent background
// 1 - background filling
parameter FILL_BACKGROUND = 0;

// background color
// used with FILL_BACKGROUND=1 only
parameter BACKGROUND_COLOR = 24'h000000;

// simulation mode
// 0 - normal mode
// 1 - simulation, FONT_COLOR and BACKGROUND_COLOR are ignored
// if FILL_BACKGROUND = 0 text pixels indicates as symbol 'X', background pixels doesn't changed
// if FILL_BACKGROUND = 1 text pixels indicates as symbol space, background pixels indicates as symbol 'X'
parameter SIM_MODE = 0;

// local font color
localparam RGB_FONT_COLOR = (SIM_MODE)? (FILL_BACKGROUND)?"   ":"XXX" : FONT_COLOR;
// local background color
localparam RGB_BACKGROUND_COLOR = (SIM_MODE)? (FILL_BACKGROUND)?"XXX":BACKGROUND_COLOR : BACKGROUND_COLOR;


// ROMs for text labels and font
reg [7:0] labels_rom [0 : 8*13 - 1];
reg [7:0] font_rom   [0:1023];

initial
begin
    $readmemh("font8x8_basic.txt", font_rom);
    $readmemh("text.txt", labels_rom);
end 

wire [2:0] current_place;
wire [2:0] current_row;
wire [2:0] current_pixel;
wire in_label;

label_placer #(
    .X_POS(X_POS),
    .Y_POS(Y_POS),
    .SCALE(SCALE)
    )
    u_label_placer (
        .clk(clk),
        .rstn(rstn),
        .hs(hs),
        .vs(vs),
        .de(de),
        .in_label(in_label),
        .place(current_place),
        .row(current_row),
        .pixel(current_pixel)
    );

wire [7:0] current_smbl_addr = {text_option, current_place};
reg  [1:0] non_printable_smbl;
reg  [7:0] current_smbl;
reg  [2:0] current_row_d;
reg  [7:0] current_smbl_row;
reg  [2:0] current_pixel_d[0:1];
reg  text_pixel;
reg  [2:0] in_label_d;

always @(posedge clk)
begin   
    current_smbl <= labels_rom[current_smbl_addr];
    non_printable_smbl <= (!current_smbl)?1:0;
    current_row_d <= current_row;
    current_smbl_row <= font_rom[{current_smbl[6:0], current_row_d}];
    current_pixel_d[0] <= current_pixel;
    current_pixel_d[1] <= current_pixel_d[0];
    non_printable_smbl[1] <= non_printable_smbl[0];
    text_pixel <= current_smbl_row[current_pixel_d[1]];
    in_label_d[0] <= in_label;
    in_label_d[1] <= in_label_d[0];
    in_label_d[2] <= in_label_d[1];
end

integer i;
reg [2:0] hs_d, vs_d, de_d;
reg [23:0] rgb_d [0:2];

always @(posedge clk or negedge rstn)
begin
    if(!rstn) begin
        hs_d <= 0;
        vs_d <= 0;
        de_d <= 0;
    end else begin
        hs_d[0] <= hs;
        vs_d[0] <= vs;
        de_d[0] <= de;
        rgb_d[0] <= rgb;
        for(i = 1; i < 3; i = i + 1) begin
            vs_d[i] <= vs_d[i - 1];
            hs_d[i] <= hs_d[i - 1];
            de_d[i] <= de_d[i - 1];
            rgb_d[i] <= rgb_d[i - 1];
        end
    end
end 

assign hs_o = hs_d[2];
assign vs_o = vs_d[2];
assign de_o = de_d[2];
assign rgb_o = (in_label_d[2])?(text_pixel)?RGB_FONT_COLOR:(non_printable_smbl[1])?rgb_d[2]:(FILL_BACKGROUND)?RGB_BACKGROUND_COLOR:rgb_d[2]:rgb_d[2];

endmodule
