`timescale 1ns / 1ps

module clk_5ms(
	input clk_1ms,
	input reset,
	output clk_5ms
    );
reg[5:0] count;
reg second_m;

initial count <= 0;

	always@(posedge clk_1ms)begin
		if(reset || (count == 5))begin
			count <= 0;
			second_m <= 1'b1;
		end
		else begin
			count <= count + 1'b1;
			second_m <= 0;
			end
		end
assign clk_5ms = second_m;

endmodule
