`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME #(
    localparam                          FRACTION_WIDTH = 15,
    localparam                          PI_FRACTION_WIDTH = 12,
	localparam							DATA_WIDTH = 16)(
	input                           	clk, 
    input                           	rstn,
    input                           	ce,
    
	input								in_feedback_valid,
    input  [16-1:0]                 	in_theta,
    input signed [DATA_WIDTH-1:0]  		in_adc_Ia,
    input signed [DATA_WIDTH-1:0]   	in_adc_Ib,
`ifdef foc_clarke_transform_3i  
    input signed [DATA_WIDTH-1:0]   	in_adc_Ic,
`endif  
    
    input                          		in_pid_init,//初始化pid内部中间运算量-积分项为0
    
    input signed [DATA_WIDTH-1:0]   	in_Iq_ref,
    input [DATA_WIDTH-1:0]          	in_Iq_kp,
    input [DATA_WIDTH-1:0]          	in_Iq_ki,
    input [DATA_WIDTH-1:0]          	in_Iq_kaw,
    input signed [DATA_WIDTH-1:0]   	in_Iq_min,
    input signed [DATA_WIDTH-1:0]   	in_Iq_max,
			
    input signed [DATA_WIDTH-1:0]   	in_Id_ref,
    input [DATA_WIDTH-1:0]          	in_Id_kp,
    input [DATA_WIDTH-1:0]          	in_Id_ki,
    input [DATA_WIDTH-1:0]          	in_Id_kaw,
    input signed [DATA_WIDTH-1:0]   	in_Id_min,
    input signed [DATA_WIDTH-1:0]   	in_Id_max,
`ifdef DEBUG_MODE    
//---------- Internal Debug Signal	---------------
    output                          	out_cordic_valid,
    output signed[DATA_WIDTH-1:0]   	out_cordic_cos,
    output signed[DATA_WIDTH-1:0]  		out_cordic_sin,
    
    output                          	out_ct_I_valid,
    output signed [DATA_WIDTH-1:0]  	out_ct_Ialfa,
    output signed [DATA_WIDTH-1:0]  	out_ct_Ibeta,
    
    output                          	out_pt_I_valid,
    output signed [DATA_WIDTH-1:0]  	out_pt_Iq,
    output signed [DATA_WIDTH-1:0]  	out_pt_Id,
    
    output                          	out_pi_valid,
    output signed [DATA_WIDTH-1:0]  	out_pi_Uq,
    output signed [DATA_WIDTH-1:0]  	out_pi_Ud,
    
	output [DATA_WIDTH-1:0]        		out_torque_pid_err,
    output [31:0]                   	out_torque_pid_p,
    output [31:0]                   	out_torque_pid_i,
    output [DATA_WIDTH-1:0]         	out_flux_pid_err,
    output [31:0]                   	out_flux_pid_p,
    output [31:0]                   	out_flux_pid_i,
	
    output                          	out_ipt_valid,
    output signed [DATA_WIDTH-1:0]  	out_ipt_Ualfa,
    output signed [DATA_WIDTH-1:0]  	out_ipt_Ubeta,
    
    output                         	 	out_svpwm_valid,
    output [DATA_WIDTH-1:0]         	out_svpwm_Ta,
    output [DATA_WIDTH-1:0]         	out_svpwm_Tb,
    output [DATA_WIDTH-1:0]         	out_svpwm_Tc,
    output [2:0]                    	out_svpwm_sector,
// --------------------------------------------------------
`endif


`ifdef FOC_OPEN_LOOP_DEBUG
//---开环测试  
    input                           	in_svpwm_valid,
    input signed[DATA_WIDTH-1:0]    	in_svpwm_Ualfa,
    input signed[DATA_WIDTH-1:0]   	 	in_svpwm_Ubeta,
// --------------------------------------------------------	
`endif

	input								in_pwm_enable,
	output                          	out_pwm_head_sync,
    output                          	out_pwm_peak_sync,
    output                          	out_pwm_tail_sync,
	
    output                          	out_pwm_a_p,
    output                          	out_pwm_a_n,
    output                          	out_pwm_b_p,
    output                          	out_pwm_b_n,
    output                          	out_pwm_c_p,
    output                          	out_pwm_c_n
    
);

`include "parameter.vh"

	`getname(current_loop_control,`MODULE_NAME) current_loop_contorl_top(
		.clk					( clk				), 
		.rstn					( rstn				),
		.ce						( ce				),
			
		.in_feedback_valid		( in_feedback_valid	),
		.in_theta				( in_theta 	        ),
		.in_adc_Ia				( in_adc_Ia	        ),
		.in_adc_Ib				( in_adc_Ib	        ),
								
`ifdef foc_clarke_transform_3i		  
		.in_adc_Ic				( in_adc_Ic			),
`endif	                    	  
			
		 .in_pid_init			( in_pid_init		),
		 // Torque              
		.in_Iq_ref              ( in_Iq_ref      	), 
		.in_Iq_kp               ( in_Iq_kp       	),  
		.in_Iq_ki               ( in_Iq_ki       	),  
		.in_Iq_kaw              ( in_Iq_kaw         ),  
		.in_Iq_min              ( in_Iq_min         ), 
		.in_Iq_max              ( in_Iq_max         ), 
		// Flux
		.in_Id_ref              ( in_Id_ref        ), 
		.in_Id_kp               ( in_Id_kp         ), 
		.in_Id_ki               ( in_Id_ki         ),
		.in_Id_kaw              ( in_Id_kaw        ),  
		.in_Id_min              ( in_Id_min        ), 
		.in_Id_max              ( in_Id_max        ), 

`ifdef DEBUG_MODE
		.out_cordic_valid       ( out_cordic_valid  ),
		.out_cordic_cos         ( out_cordic_cos    ),
		.out_cordic_sin         ( out_cordic_sin    ),
			
		.out_ct_I_valid         ( out_ct_I_valid    ),
		.out_ct_Ialfa           ( out_ct_Ialfa      ),
		.out_ct_Ibeta           ( out_ct_Ibeta      ),
			
		.out_pt_I_valid         ( out_pt_I_valid    ),
		.out_pt_Iq              ( out_pt_Iq         ),
		.out_pt_Id              ( out_pt_Id         ),
			
		.out_pi_valid           ( out_pi_valid      ),
		.out_pi_Uq              ( out_pi_Uq         ),
		.out_pi_Ud              ( out_pi_Ud         ),
		
		.out_torque_pid_err     ( out_torque_pid_err ),
		.out_torque_pid_p       ( out_torque_pid_p   ),
		.out_torque_pid_i       ( out_torque_pid_i   ),

		.out_flux_pid_err       ( out_flux_pid_err   ),
		.out_flux_pid_p         ( out_flux_pid_p     ),
		.out_flux_pid_i         ( out_flux_pid_i     ),
													
		.out_ipt_valid          ( out_ipt_valid     ),
		.out_ipt_Ualfa          ( out_ipt_Ualfa     ),
		.out_ipt_Ubeta          ( out_ipt_Ubeta     ),
												

								
		.out_svpwm_valid        ( out_svpwm_valid       ),
		.out_svpwm_Ta           ( out_svpwm_Ta          ),
		.out_svpwm_Tb           ( out_svpwm_Tb          ),
		.out_svpwm_Tc           ( out_svpwm_Tc          ),
		.out_svpwm_sector       ( out_svpwm_sector      ),
`endif	

		//开环测试 
`ifdef FOC_OPEN_LOOP_DEBUG    
		.in_svpwm_valid          ( in_svpwm_valid  ),   
		.in_svpwm_Ualfa          ( in_svpwm_Ualfa  ),
		.in_svpwm_Ubeta          ( in_svpwm_Ubeta  ),
`endif
        .in_pwm_enable          ( in_pwm_enable     ),
		
		.out_pwm_head_sync  	( out_pwm_head_sync ),
		.out_pwm_peak_sync  	( out_pwm_peak_sync ), // free counter
		.out_pwm_tail_sync  	( out_pwm_tail_sync ),
				
		.out_pwm_a_p        	( out_pwm_a_p       ),
		.out_pwm_a_n        	( out_pwm_a_n       ),
		.out_pwm_b_p        	( out_pwm_b_p       ),
		.out_pwm_b_n        	( out_pwm_b_n       ),
		.out_pwm_c_p        	( out_pwm_c_p       ),
		.out_pwm_c_n        	( out_pwm_c_n       )

);

	defparam current_loop_contorl_top.PI_FRACTION_WIDTH = PI_FRACTION_WIDTH;
	defparam current_loop_contorl_top.FRACTION_WIDTH = FRACTION_WIDTH;
	defparam current_loop_contorl_top.DATA_WIDTH = DATA_WIDTH;
	defparam current_loop_contorl_top.PWM_DEADTIME = PWM_DEADTIME;
	defparam current_loop_contorl_top.PWM_HALF_PERIOD = PWM_HALF_PERIOD;
	defparam current_loop_contorl_top.PWM_INVERSE = PWM_INVERSE;



endmodule
