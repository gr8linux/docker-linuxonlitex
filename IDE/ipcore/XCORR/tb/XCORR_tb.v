`timescale 1ns / 1ps

	module tb();
  `include "parameter.v"
	`include "define.v"

//to calculate the width of N
function integer clogb2(input integer N);
	begin
		for(clogb2=0;N>1;clogb2=clogb2+1)
		N = N >> 1;
	end
endfunction

//Interface for IP
reg clk;
reg rst;
reg start;
reg	 signed [W-1:0] series_x , series_y ;
wire signed [2*W-1:0] result;
wire complete ;
wire [9:0] delay;

//Interface for test

reg [(W - 1):0] matrix_x [0:(2048 - 1)] ; 
reg [(W - 1):0] matrix_y [0:(2048 - 1)] ; 
reg signed [((2 * W) - 1):0] test_out [0:(2 * lag)] ; 
reg signed [((2 * W) - 1):0] golden_result;
reg unsigned [(clogb2(N) - 1):0] ad = 0 ; 
reg signed [4:0] k = 0,  m = 0 ; 
integer file_out, file_result, golden ; 


//use the register result to show whether the result is true or not
reg ip_result  = 1  ;

//to reset the FPGA
GSR GSR (.GSRI(1'b1)) ;


//load data for input
always@(posedge clk)
begin
#0.1 ;
	if(start==1)
		;
	else
		if(ad == N-1)
		ad = 0;
		else
		ad = ad + 1; 
end

always@(posedge clk)
begin
if(start == 1)
;
else
	begin
	series_x = matrix_x[ad] ;
	series_y = matrix_y[ad] ;
	end
end

//campare data between output with result
always@(posedge complete)
begin
#0.1;
	if(k == 2*lag)
	k = 0 ;
	else
	k = k + 1 ;
end

always@(posedge complete)
begin
	if(result == test_out[k])
		;
	else
		ip_result  = 0  ; 
end


//display result and golden_result
 always @(posedge complete)
    begin
      $fdisplay (file_result,"%x",result) ;
      $fdisplay (file_out,"golden_result=%x,ip_reslut=%x",test_out[k],result) ;
			$fdisplay (golden,"%x",test_out[k]) ;
    end
always@(posedge complete)
	  begin
			golden_result = test_out[k];
		end



//signal for clock
always #10 clk = ~clk;

// load data from txt
initial
	begin
		$readmemh("../../doc/series_x_in.txt",matrix_x);
		$readmemh("../../doc/series_y_in.txt",matrix_y);

	end


//reset the IP
initial 
	begin
  	clk = 0;
		start = 1;
		rst = 1 ;

#25 start = 0 ;
		rst = 0 ;
	end

initial
	begin
	#80
	file_out = $fopen("../../doc/summary.txt","w") ;
  file_result = $fopen("../../doc/result_out.txt","w") ;
  golden = $fopen("../../doc/result_golden.txt","w") ; 

	$fdisplay (file_out," N=%d; W=%d; lag=%d; ",N,W,lag);
  #600000
	if(ip_result == 1)
		begin
		$fdisplay (file_out,"result = true")  ;
		end
		else
		begin	
		$fdisplay (file_out,"result = false") ;
		end

	$fclose(file_out);
	$fclose(file_result);
	$fclose(golden);
  $stop ;

	end

//load golden result
initial  
begin
    #5000;
    xcorr_task;
		test_out = xcorr_task.r_out ;
end

// xcorr_task is the task to calculate the golden result
task xcorr_task;
		
		reg signed [2*W-1: 0] r_out [0:2*lag];
		integer i,j;
		static integer x_lag =0;
		static integer y_lag =lag;
        reg [2*W-1:0] test2;
    begin
		for (i=0;i<2 * lag+1;i=i+1) begin
//            @(posedge clk)
			if (y_lag>0) begin
				sum_add(x_lag,N-y_lag,y_lag,N-x_lag,r_out[i]); 
				y_lag = y_lag -1;
				x_lag = x_lag;
			end
			else begin
				sum_add(x_lag,N-y_lag,y_lag,N-x_lag,r_out[i]);
				y_lag = y_lag;
				x_lag = x_lag +1;
			end
            test2=r_out[i];
		end
	
	end
	endtask
	
	task sum_add;
		input integer ad_1;
		input integer ad_2;
		input integer ad_3;
		input integer ad_4;
		output signed [2*W-1:0] sum_add_o;
		integer i,j;
		reg signed [2*W-1:0] sum_add_reg;
		reg signed [W-1:0] test_x;
		reg signed [W-1:0] test_y;
	begin
		sum_add_reg =0;
		j=ad_3;
		for (i=ad_1;i<ad_2;i=i+1) begin
//            @(posedge clk) begin
            if (j <ad_4) begin
                test_x=matrix_x[i];
                test_y=matrix_y[j];
				sum_add_reg = sum_add_reg+test_x*test_y;
                end
			j=j+1;
//            end
		end
		sum_add_o =sum_add_reg;
	end
	endtask

`module_name u1
(
	.series_x(series_x),
	.series_y(series_y),
	.clk(clk),
	.rst(rst),
	.start(start),
	.result(result),
	.complete(complete),
	.delay(delay)
);


	endmodule