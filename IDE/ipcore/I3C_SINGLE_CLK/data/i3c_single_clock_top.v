`include "define.v"
`include "static_macro_define.v"

module  `module_name(
    inout           SCL,SDA,
    input           fclk,rstn,
    output          SDA_PULL,
    `ifdef REG
    input           cpu_cs,
    input           cpu_read,
    input           cpu_write,
    input   [7:0]   cpu_addr,
    input   [31:0]  cpu_wdat,
    output  [31:0]  cpu_rdat,
    `endif
    `ifdef APB
    input   [7:0]   PADDR,
    input   [31:0]  PWDATA,
    output  [31:0]  PRDATA, 
    input           PSEL,
    input           PWRITE,
    input           PENABLE,
    `endif
    output          int_o

);


`getname(i3c_single_clock,`module_name) u_i3c_single_clock_top(
    .SCL                        (SCL),
    .SDA                        (SDA),
    .fclk                       (fclk),
    .rstn                       (rstn),
    .SDA_PULL                   (SDA_PULL),
    `ifdef REG
    .cpu_cs                     (cpu_cs),
    .cpu_read                   (cpu_read),
    .cpu_write                  (cpu_write),
    .cpu_addr                   (cpu_addr),
    .cpu_wdat                   (cpu_wdat),
    .cpu_rdat                   (cpu_rdat),
    `endif
    `ifdef APB
    .PADDR                      (PADDR),
    .PWDATA                     (PWDATA),
    .PRDATA                     (PRDATA),
    .PSEL                       (PSEL),
    .PWRITE                     (PWRITE),
    .PENABLE                    (PENABLE),
    `endif
    .int_o                      (int_o)
);

endmodule
