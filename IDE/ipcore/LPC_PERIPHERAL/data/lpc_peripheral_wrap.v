
`include "define.vh"
`include "static_macro_define.vh"

module `MODULE_NAME (

   input            lclk            , 
   input            lreset_n        ,
   input            lframe_n        ,
   inout     [ 3:0] lad             ,

   input            io_addr_hit     ,
   input            io_wr_sync_zero	,
   input            io_rd_sync_zero	, 
   output           io_addr_hit_ready,

   output           io_wr_en        ,
   output           io_rd_en        ,
   output    [15:0] io_addr         ,
   output    [7:0]  io_wr_data      ,
   input     [7:0]  io_rd_data      ,
   output           io_rd_data_ready
);


`getname(lpc_peri,`MODULE_NAME)  u_lpc_peri (

   .lclk            (lclk               ), 
   .lreset_n        (lreset_n           ), 
   .lframe_n        (lframe_n           ), 
   .lad_in          (lad                ), 
   .addr_hit        (io_addr_hit        ),
   .wr_done	        (io_wr_sync_zero	),
   .rd_done	        (io_rd_sync_zero	), 
   .addr_hit_ready  (io_addr_hit_ready  ),
   .io_wr_en        (io_wr_en           ),
   .io_rd_en        (io_rd_en           ),
   .io_addr         (io_addr            ),
   .io_wr_data      (io_wr_data         ),
   .io_rd_data      (io_rd_data         ),
   .io_rd_data_ready(io_rd_data_ready   )
   );

   endmodule
