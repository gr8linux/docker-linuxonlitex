//===========================================================================
//
// File         : colorbar_generator.v
// Description  : Generating color bar
// Revision     : V1.0
// Date         : 8/1/2022
// Author       : Embedded RnD of Gowin
//
//===========================================================================

module colorbar_generator (
	input clk,
	input reset_n,

	output reg vsync,
	output reg hsync,
	output reg de,
	output [23:0] RGB,
	output [15:0] pix_addr,
	output [15:0] line_addr	
);

	parameter p_htotal		= 1650;
	parameter p_hactive		= 1280;
	parameter p_hfrontporch	= 110;
	parameter p_hsync		= 40;
	parameter p_vtotal		= 750;
	parameter p_vactive		= 720;
	parameter p_vfrontporch = 5;
	parameter p_vsync		= 5;
	
	reg [15:0] q_pixel_count;
	reg [15:0] q_line_count;
	
	assign pix_addr  = q_pixel_count;
	assign line_addr = q_line_count;

	always@(posedge clk or negedge reset_n) 
		if (!reset_n) begin
			q_pixel_count	<= 	0;
			q_line_count	<=	0;
		end
		else begin
			q_pixel_count	<=	(q_pixel_count<p_htotal-1'b1)											? q_pixel_count+1'b1	: 1'b0;
			q_line_count	<=	(q_pixel_count==p_htotal-1'b1)	&&	(q_line_count < p_vtotal		)	? q_line_count+1'b1	:
								(q_pixel_count==p_htotal-1'b1)	&&	(q_line_count == p_vtotal		)	? 1'b0					: q_line_count;
		end
	
	always@(posedge clk or negedge reset_n) 
		if (!reset_n) begin
			de		<= 0;
			hsync	<= 0;
			vsync	<= 0;
		end
		else begin
			de		<=	(q_pixel_count <=	p_hactive						) && (q_line_count  <  p_vactive							);
			hsync	<=	(q_pixel_count >	p_hactive+p_hfrontporch			) && (q_pixel_count <=  p_hactive+p_hfrontporch+p_hsync	);
			vsync	<=	(q_line_count  ==	p_vactive+p_vfrontporch-1			) && (q_pixel_count == p_hactive+p_hfrontporch+1				) ? 1 :
						(q_line_count  ==	p_vactive+p_vfrontporch+p_vsync-1	) && (q_pixel_count == p_hactive+p_hfrontporch+1				) ? 0 : vsync;
		end

    assign RGB[23:16] = (q_pixel_count< 426)							? 8'hFE : 8'h01;
    assign RGB[15: 8] = (q_pixel_count>=426) && (q_pixel_count < 853)	? 8'hFE : 8'h01;
    assign RGB[ 7: 0] = (q_pixel_count>=853)							? 8'hFE : 8'h01;
	
endmodule
