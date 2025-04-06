module rstn_gen(clk,rstn);
input clk;
output reg rstn;

reg [15:0] cnt = 0;

always @(posedge clk) begin
    cnt<=cnt+1'b1;
    if (cnt >= 5 && cnt<=10) 
        rstn <=0;
    else    
        rstn <=1; 
    
end

endmodule