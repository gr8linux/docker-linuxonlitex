`include "define.vh"
`include "static_macro_define.v"
//**********************************************************************
// --- Module:	 FP_Comp_Top
//**********************************************************************

module `MODULE_NAME(
    clk,       // 时钟信号
	`ifdef CE
	ce,        // 时钟使能信号
	`endif
   
    data_a,    // 输入数据A
    data_b,    // 输入数据B
    `ifdef AEB
    aeb,       // A = B
    `endif 
    `ifdef ANEB
    aneb,        // A != B
    `endif
    `ifdef AGEB
    ageb,        // A >= B
    `endif
    `ifdef AGB
    agb,         // A > B
    `endif
    `ifdef ALB
    alb,         // A < B
    `endif
    `ifdef ALEB
    aleb,        // A <= B
    `endif
    `ifdef UNORDER
    unorder,     // NaN
    `endif
    rstn      // 复位信号（低电平有效）
);


//**********************************************************************
// --- Input/Output Declaration
//**********************************************************************
// --- input ---	
	input 						  clk;
	input 					 	  rstn;
	input  [31:0]    		      data_a;
	input  [31:0]       		  data_b;
`ifdef CE
    input ce;
`endif

// --- output ---
    `ifdef AEB
    output wire aeb; // A eqauls B
    `endif

    `ifdef ANEB
    output wire aneb; // A not Equals B
    `endif

    `ifdef AGB
    output wire agb; // A greater than B
    `endif

    `ifdef AGEB
    output wire ageb; // A greater or equal to B
    `endif

    `ifdef ALB
    output wire alb; // A less than B
    `endif
    
    `ifdef ALEB
    output wire aleb; // less than or equal to B
    `endif

    `ifdef UNORDER
    output wire unorder; // UNdefine data input
    `endif

    //**********************************************************************
// --- Module:	 FP_COMP
//**********************************************************************

	`getname(FP_Comp,`MODULE_NAME) FP_Comp_inst(
        .clk(clk),
        `ifdef CE
        .ce(ce),
        `endif
        .rstn(rstn),
        .data_a(data_a),
        

        `ifdef AEB
        .aeb(aeb), // A eqauls B
        `endif

        `ifdef ANEB
         .aneb(aneb),// A not Equals B
        `endif

        `ifdef AGB
        .agb(agb),// A greater than B
        `endif

        `ifdef AGEB
        .ageb(ageb),// A greater or equal to B
        `endif

        `ifdef ALB
        .alb(alb), // A less than B
        `endif
        
        `ifdef ALEB
        .aleb(aleb), // less than or equal to B
        `endif

        `ifdef UNORDER
        .unorder(unorder), // UNdefine data input
        `endif

        .data_b(data_b)
    );
endmodule