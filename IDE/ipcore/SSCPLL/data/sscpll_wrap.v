`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME (
        input           clkin,
        input           rstn,

        output          clkout
    );

`include "parameter.vh"

`getname(gwfpll,`MODULE_NAME) #(
        .PLL_FCLKIN     (PLL_FCLKIN ),
        .FRAC_DIV       (FRAC_DIV   ),
        .PLL_ODIV0      (PLL_ODIV0  ),
        .PLL_IDIV       (PLL_IDIV   ),
        .PLL_FBDIV      (PLL_FBDIV  ),
        .SSC_EN         (SSC_EN     ),
        .SSC_STEP       (SSC_STEP   ),
        .SSC_CLKDIV     (SSC_CLKDIV ),
        .SSC_DIR        (SSC_DIR    )
    ) u_gwfpll(
        .refclk_i       (clkin      ),
        .rstn           (rstn       ),

        .clkout0        (clkout     )
    );

endmodule