
`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME (
	clk, 
    rstn,
    ce,
	out_ready4input,
    in_adc_valid,
	in_adc_chn,
    in_adc_Ia,
    in_adc_Ib,
`ifdef foc_clarke_transform_3i 
    in_adc_Ic,
`endif
   	in_theta_sinx,
    in_theta_cosx,
	in_Iq_param_valid,
	in_Iq_param_chn,
	in_Iq_param_ref,
	in_Iq_param_kp,
	in_Iq_param_ki,
	in_Iq_param_min,
	in_Iq_param_max,
	in_Iq_init_valid,
	in_Iq_init_chn,
	in_Id_param_valid,
	in_Id_param_chn,
	in_Id_param_ref,
	in_Id_param_kp,
	in_Id_param_ki,
	in_Id_param_min,
	in_Id_param_max,
	in_Id_init_valid,
	in_Id_init_chn,
	in_pwm_enable,
    out_pwm_head_sync,
    out_pwm_peak_sync,
    out_pwm_tail_sync,
    out_pwm_a_p/*synthesis syn_keep=1*/,
    out_pwm_a_n/*synthesis syn_keep=1*/,
    out_pwm_b_p/*synthesis syn_keep=1*/,
    out_pwm_b_n/*synthesis syn_keep=1*/,
    out_pwm_c_p/*synthesis syn_keep=1*/,
    out_pwm_c_n/*synthesis syn_keep=1*/
);

`include "parameter.vh"

	input                           	clk; 
    input                           	rstn;
    input                           	ce;
	output								out_ready4input;
    input                           	in_adc_valid;
	input 		 [$clog2(NUM_CHN):0]	in_adc_chn;
    input signed [16-1:0]   			in_adc_Ia;
    input signed [16-1:0]   			in_adc_Ib;
`ifdef foc_clarke_transform_3i 
    input signed [16-1:0]   			in_adc_Ic;
`endif
	input signed [16-1:0]   			in_theta_sinx;
    input signed [16-1:0]   			in_theta_cosx;	
	input								in_Iq_param_valid;
	input 		 [$clog2(NUM_CHN):0]	in_Iq_param_chn;
	input signed [16-1:0]				in_Iq_param_ref;
	input signed [16-1:0]				in_Iq_param_kp;
	input signed [16-1:0]				in_Iq_param_ki;
	input signed [16-1:0]				in_Iq_param_min;
	input signed [16-1:0]				in_Iq_param_max;
	input								in_Iq_init_valid;
	input		 [$clog2(NUM_CHN):0]	in_Iq_init_chn;
	input								in_Id_param_valid;
	input 		 [$clog2(NUM_CHN):0] 	in_Id_param_chn;
	input signed [16-1:0]				in_Id_param_ref;
	input signed [16-1:0]				in_Id_param_kp;
	input signed [16-1:0]				in_Id_param_ki;
	input signed [16-1:0]				in_Id_param_min;
	input signed [16-1:0]				in_Id_param_max;
	input								in_Id_init_valid;
	input		 [$clog2(NUM_CHN):0]	in_Id_init_chn;
	input		[NUM_CHN-1:0] 			in_pwm_enable;
	output      [NUM_CHN-1:0]           out_pwm_head_sync;
    output      [NUM_CHN-1:0]           out_pwm_peak_sync;
    output      [NUM_CHN-1:0]           out_pwm_tail_sync;
    output 		[NUM_CHN-1:0]     		out_pwm_a_p/*synthesis syn_keep=1*/;
    output 		[NUM_CHN-1:0]     		out_pwm_a_n/*synthesis syn_keep=1*/;
    output 		[NUM_CHN-1:0]     		out_pwm_b_p/*synthesis syn_keep=1*/;
    output 		[NUM_CHN-1:0]     		out_pwm_b_n/*synthesis syn_keep=1*/;
    output 		[NUM_CHN-1:0]     		out_pwm_c_p/*synthesis syn_keep=1*/;
    output 		[NUM_CHN-1:0]     		out_pwm_c_n/*synthesis syn_keep=1*/;



	`getname(foc_current_loop_control,`MODULE_NAME) foc_current_loop_control(
		.clk					( clk				), 
       	.rstn					( rstn				),
       	.ce						( ce				),
		
		.out_ready4input		( out_ready4input	),
    	.in_adc_valid			( in_adc_valid		),
		.in_adc_chn				( in_adc_chn		),
    	.in_adc_Ia				( in_adc_Ia			),
    	.in_adc_Ib				( in_adc_Ib			),
	`ifdef foc_clarke_transform_3i 
    	.in_adc_Ic				( in_adc_Ic			),
	`endif
		.in_theta_sinx			( in_theta_sinx		),
    	.in_theta_cosx			( in_theta_cosx		),

		.in_Iq_param_valid		( in_Iq_param_valid	),
		.in_Iq_param_chn		( in_Iq_param_chn	),
		.in_Iq_param_ref		( in_Iq_param_ref	),
		.in_Iq_param_kp			( in_Iq_param_kp	),
		.in_Iq_param_ki			( in_Iq_param_ki	),
		.in_Iq_param_min		( in_Iq_param_min	),
		.in_Iq_param_max		( in_Iq_param_max	),
		.in_Iq_init_valid		( in_Iq_init_valid	),
		.in_Iq_init_chn			( in_Iq_init_chn	),
								
		.in_Id_param_valid		( in_Id_param_valid	),
		.in_Id_param_chn		( in_Id_param_chn	),
		.in_Id_param_ref		( in_Id_param_ref	),
		.in_Id_param_kp			( in_Id_param_kp	),
		.in_Id_param_ki			( in_Id_param_ki	),
		.in_Id_param_min		( in_Id_param_min	),
		.in_Id_param_max		( in_Id_param_max	),
		.in_Id_init_valid		( in_Id_init_valid	),			
		.in_Id_init_chn			( in_Id_init_chn	),

		.in_pwm_enable         	( in_pwm_enable		),  		
		.out_pwm_head_sync  	( out_pwm_head_sync ),
		.out_pwm_peak_sync  	( out_pwm_peak_sync ), 
		.out_pwm_tail_sync  	( out_pwm_tail_sync ),
    	.out_pwm_a_p        	( out_pwm_a_p 		),
		.out_pwm_a_n        	( out_pwm_a_n 		),
		.out_pwm_b_p        	( out_pwm_b_p 		),
		.out_pwm_b_n        	( out_pwm_b_n 		),
		.out_pwm_c_p        	( out_pwm_c_p 		),
		.out_pwm_c_n        	( out_pwm_c_n 		)
);

	defparam foc_current_loop_control.PI_FRACTION_WIDTH = 12;
	defparam foc_current_loop_control.FRACTION_WIDTH = 15;
	defparam foc_current_loop_control.DATA_WIDTH = 16;
	defparam foc_current_loop_control.NUM_CHN = NUM_CHN;
	defparam foc_current_loop_control.PWM_DEADTIME = PWM_DEADTIME;
	defparam foc_current_loop_control.PWM_HALF_PERIOD = PWM_HALF_PERIOD;
	defparam foc_current_loop_control.PWM_INVERSE = PWM_INVERSE;



endmodule
