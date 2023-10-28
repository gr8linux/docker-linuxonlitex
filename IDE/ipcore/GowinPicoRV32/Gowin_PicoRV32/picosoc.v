
`timescale 1 ns / 1 ns

`include "pico_define.vh"
`include "pico_config.vh"
`include "advspi_config.vh"
`include "advspi_const.vh"

module Gowin_PicoRV32_Top  #(
`ifdef ENABLE_WB_SPI_MASTER
   parameter  WBSPI_SLAVE_NUM  = `WBSPI_MASTER_SLAVE_NUMBER		//  maximum value = 8 for current design
`else
   parameter  WBSPI_SLAVE_NUM  = 1		//  maximum value = 8 for current design   
`endif
)(
`ifdef ENABLE_SIMPLE_UART
	output ser_tx,
	input  ser_rx,
`endif

`ifdef ENABLE_WB_UART
    output wbuart_tx,
    input  wbuart_rx,
 `endif

`ifdef ENABLE_WB_GPIO
    inout     [`GPIO_DW-1:0] gpio_io,
`endif

`ifdef ENABLE_WB_SPI_MASTER
    input                          wbspi_master_miso,
    output                         wbspi_master_mosi,
    output [WBSPI_SLAVE_NUM-1 : 0] wbspi_master_ssn,
    output                         wbspi_master_sclk,
`endif

`ifdef ENABLE_WB_SPI_SLAVE
    output wbspi_slave_miso,
    input  wbspi_slave_mosi,
    input  wbspi_slave_ssn,
    input  wbspi_slave_sclk,
`endif

`ifdef ENABLE_WB_I2C
    inout  wbi2c_sda,
    inout  wbi2c_scl,
`endif

// external wishbone slave interface
`ifdef ENABLE_OPEN_WB_INTERFACE
    output          slv_ext_stb_o,
    output          slv_ext_we_o,
    output          slv_ext_cyc_o,
    input           slv_ext_ack_i,
    output   [31:0] slv_ext_adr_o,
    output   [31:0] slv_ext_wdata_o,
    input    [31:0] slv_ext_rdata_i,
    output    [3:0] slv_ext_sel_o,
`endif

`ifdef ENABLE_ADVSPI
    `ifdef ADVSPI_QUADSPI_SUPPORT
    inout            io_spi_holdn,
    inout            io_spi_wpn,
    `endif
    inout            io_spi_clk,
    inout            io_spi_csn,
    inout            io_spi_mosi,
    inout            io_spi_miso,
`endif

`ifdef ENABLE_OPEN_AHB
    input      [31:0] hrdata,
    input       [1:0] hresp,
    input             hready,
    output reg [31:0] haddr,
    output reg        hwrite,
    output reg  [2:0] hsize,
    output reg  [2:0] hburst,
    output reg [31:0] hwdata,
    output reg        hsel,
    output reg  [1:0] htrans,
`endif

`ifdef ENABLE_OPEN_WB_INTERFACE
    input   [31:20] irq_in,
`elsif ENABLE_OPEN_AHB
    input   [31:20] irq_in,
`endif

`ifdef ENABLE_DEBUG
    input             jtag_TDI,
    output            jtag_TDO,
    input             jtag_TCK,
    input             jtag_TMS,
`endif

    input             clk_in,
    input             resetn_in
);  

    localparam         [31:0]  DATA_MEM_BASE     = 32'h 0100_0000;
    localparam         [31:0]  INSTR_MEM_BASE    = 32'h 0200_0000;
    localparam         [31:0]  INNER_PERIPH_BASE = 32'h 0400_0000;
    localparam         [31:0]  WISHBONE_BASE     = 32'h 1000_0000;
    localparam integer         MEM_WORDS         = (256 * `D_MEM_K_BYTE);
    localparam         [31:0]  STACKADDR         = (4 * MEM_WORDS + DATA_MEM_BASE);  // end of memory, (4*MEM_WORDS) 
    localparam         [31:0]  PROGADDR_RESET    =  `PROGADDR_RESET_DEF;
    localparam         [31:0]  PROGADDR_IRQ      =  `PROGADDR_IRQ_DEF;

    wire        clk;
    wire        resetn;
    wire        trap;

    reg  [31:0] irq;
    wire [31:0] irq_mask_o;

    wire        mem_valid;
    wire        mem_instr;
    reg         mem_ready;
    wire [31:0] mem_addr;
    wire [31:0] mem_wdata;
    wire  [3:0] mem_wstrb;
    reg  [31:0] mem_rdata;
    
`ifdef ENABLE_DEBUG
    wire        dm_ready;
    wire [31:0] dm_rdata;
    wire        dm_valid;
    wire        dm_read;
    wire [11:0] dm_addr;
    wire [31:0] dm_wdata;
`endif

    wire        itcm_ready;
    wire [31:0] itcm_rdata;
    wire        itcm_valid;
    wire  [3:0] itcm_wstrb;
    wire [23:0] itcm_addr;
    wire [31:0] itcm_wdata;

    wire        dtcm_ready;
    wire [31:0] dtcm_rdata;
    wire        dtcm_valid;
    wire  [3:0] dtcm_wstrb;
    wire [21:0] dtcm_addr;
    wire [31:0] dtcm_wdata;

`ifdef ENABLE_SIMPLE_UART
    wire        simpleuart_reg_div_sel;
    wire [31:0] simpleuart_reg_div_do;    
    wire        simpleuart_reg_dat_sel;
    wire [31:0] simpleuart_reg_dat_do;
    wire        simpleuart_reg_dat_wait;    
`endif

    wire        wbmem_valid;   //input to wb
    wire [31:0] wbmem_addr;    //input to wb
    wire [31:0] wbmem_wdata;   //input to wb
    wire [ 3:0] wbmem_wstrb;   //input to wb
    wire        wbmem_ready;   //output from wb
    wire [31:0] wbmem_rdata;   //output from wb

`ifdef ENABLE_OPEN_AHB
    wire        ahbmem_valid;   //input to ahb
    wire [31:0] ahbmem_addr;    //input to ahb
    wire [31:0] ahbmem_wdata;   //input to ahb
    wire [ 3:0] ahbmem_wstrb;   //input to ahb
    wire        ahbmem_ready;   //output from ahb
    wire [31:0] ahbmem_rdata;   //output from ahb
`endif

    wire [31:0] wbm_adr_o;
    wire [31:0] wbm_dat_o;
    wire [31:0] wbm_dat_i;
    wire        wbm_we_o;
    wire  [3:0] wbm_sel_o;
    wire        wbm_stb_o;
    wire        wbm_ack_i;
    wire        wbm_cyc_o;

`ifdef ENABLE_WB_UART
    wire [`WB_SLAVE0_AW-1:0] wbuart_adr_i;
    wire [31:0] wbuart_dat_i;
    wire [31:0] wbuart_dat_o;
    wire        wbuart_we_i;
    wire        wbuart_stb_i;
    wire        wbuart_cyc_i;
    wire        wbuart_ack_o;
    wire        wbuart_stall_o;
    wire        uart_rx_int;
    wire        uart_tx_int;
    wire        uart_txfifo_int;
    wire        uart_rxfifo_int;
`endif

`ifdef ENABLE_WB_GPIO
    wire [`WB_SLAVE1_AW-1:0] wb_gpio_adr_i;
    wire [31:0] wb_gpio_dat_i;
    wire [31:0] wb_gpio_dat_o;
    wire        wb_gpio_we_i;
    wire        wb_gpio_stb_i;
    wire        wb_gpio_cyc_i;
    wire        wb_gpio_ack_o;
`endif

`ifdef ENABLE_WB_SPI_MASTER
    wire [`WB_SLAVE2_AW-1:0] wbspi_master_adr_i;
    wire [31:0] wbspi_master_dat_i;
    wire [31:0] wbspi_master_dat_o;
    wire        wbspi_master_we_i;
    wire        wbspi_master_cyc_i;
    wire        wbspi_master_stb_i;
    wire        wbspi_master_ack_o;
    wire        wbspi_master_int_o;
`endif

`ifdef ENABLE_WB_SPI_SLAVE
    wire [`WB_SLAVE3_AW-1:0] wbspi_slave_adr_i;
    wire [31:0] wbspi_slave_dat_i;
    wire [31:0] wbspi_slave_dat_o;
    wire        wbspi_slave_we_i;
    wire        wbspi_slave_cyc_i;
    wire        wbspi_slave_stb_i;
    wire        wbspi_slave_ack_o;
    wire        wbspi_slave_int_o;
`endif

`ifdef ENABLE_WB_I2C
    wire [`WB_SLAVE5_AW-1:0] wbi2c_adr_i;
    wire [31:0] wbi2c_dat_i;
    wire [31:0] wbi2c_dat_o;
    wire        wbi2c_we_i;
    wire        wbi2c_stb_i;
    wire        wbi2c_cyc_i;
    wire        wbi2c_ack_o;
    wire        wbi2c_inta_o;
`endif

`ifdef ADVSPI_MEM_SUPPORT
    wire [`ADVSPI_REG_AW-1:0] advspimem_wb_adr_i;
    wire [31:0] advspimem_wb_dat_i;
    wire [31:0] advspimem_wb_dat_o;
    wire        advspimem_wb_we_i;
    wire  [3:0] advspimem_wb_sel_i;
    wire        advspimem_wb_stb_i;
    wire        advspimem_wb_ack_o;
    wire        advspimem_wb_cyc_i;
`endif

`ifdef ADVSPI_REG
    wire [`WB_SLAVE4_AW-1:0] advspireg_wb_adr_i;
    wire [31:0] advspireg_wb_dat_i;
    wire [31:0] advspireg_wb_dat_o;
    wire        advspireg_wb_we_i;
    wire  [3:0] advspireg_wb_sel_i;
    wire        advspireg_wb_stb_i;
    wire        advspireg_wb_ack_o;
    wire        advspireg_wb_cyc_i;
`endif

    wire [31:0] wr_csr_nxt;

    wire        wr_dscratch_ena;
    wire [31:0] dscratch_r;

    wire        wr_dpc_ena;
    wire        cmt_dpc_ena;
    wire [31:0] cmt_dpc;
    wire [31:0] dpc_r;

    wire  [2:0] cmt_dcause       ;
    wire        cmt_dcause_ena   ;
    wire        wr_dcsr_ena      ;
    wire [31:0] dcsr_r           ;

    wire        dbg_irq          ;
    wire        dbg_mode         ;
    wire        dbg_halt_r       ;
    wire        dbg_step_r       ;
    wire        dbg_ebreakm_r    ;
    wire        dbg_stopcycle    ;

    assign clk = clk_in;


/**********************interrupt input*******************************/
    always @* begin
        irq = 0;

`ifdef ENABLE_WB_SPI_MASTER
        irq[10] = wbspi_master_int_o;
`endif
`ifdef ENABLE_WB_SPI_SLAVE
        irq[11] = wbspi_slave_int_o;
`endif
`ifdef ENABLE_WB_I2C
        irq[12] = wbi2c_inta_o;
`endif
`ifdef ENABLE_WB_UART
        irq[13] = uart_rx_int;
`endif
`ifdef ENABLE_OPEN_WB_INTERFACE
        irq[31:20] = irq_in[31:20];
`endif
`ifdef ENABLE_DEBUG
        irq[4] = dbg_irq;
`endif
    end
/*********************************************************************/


/**********************power on resetn*******************************/
    reg [15:0] rstdly = 0;
    wire resetn_auto;
    always @(negedge clk_in)
    begin
        if(!resetn_in)
            rstdly <= 0;
        else
            rstdly <= {rstdly[14:0],1'b1};
    end
    assign resetn_auto = rstdly[15];
    assign resetn = resetn_in & resetn_auto;
//assign resetn = resetn_in;
/*********************************************************************/

`ifdef ENABLE_DEBUG
    assign dm_valid   = mem_valid && (mem_addr[31:24] == 'h00);
    assign dm_read    = !(|{mem_wstrb});
    assign dm_addr    = mem_addr[11:0];
    assign dm_wdata   = mem_wdata;
`endif

    assign itcm_valid   = mem_valid && (mem_addr[31:24] == 'h02);
    assign itcm_wstrb   = mem_wstrb;
    assign itcm_addr    = mem_addr[23:0];
    assign itcm_wdata   = mem_wdata;

    assign dtcm_valid   = mem_valid && (mem_addr[31:24] == 'h01);
    assign dtcm_wstrb   = mem_wstrb;
    assign dtcm_addr    = mem_addr[23:2];
    assign dtcm_wdata   = mem_wdata;

    assign wbmem_valid  = mem_valid && (mem_addr[31:28] > 'h0) && (mem_addr[31] == 1'b0);
    assign wbmem_wstrb  = mem_wstrb;
    assign wbmem_addr   = mem_addr;
    assign wbmem_wdata  = mem_wdata;

`ifdef ENABLE_OPEN_AHB
    assign ahbmem_valid = mem_valid && (mem_addr[31:28] > 'h0) && (mem_addr[31] == 1'b1);
    assign ahbmem_wstrb = mem_wstrb;
    assign ahbmem_addr  = mem_addr;
    assign ahbmem_wdata = mem_wdata;
`endif

    assign mem_ready =    itcm_ready 
                       || dtcm_ready
                       || wbmem_ready
`ifdef ENABLE_OPEN_AHB
                       || ahbmem_ready
`endif
`ifdef ENABLE_SIMPLE_UART
                       || simpleuart_reg_div_sel 
		       || (simpleuart_reg_dat_sel && !simpleuart_reg_dat_wait)
`endif
`ifdef ENABLE_DEBUG
                       || dm_ready
`endif
    ;

    assign mem_rdata =  itcm_ready ? itcm_rdata : 
                        dtcm_ready ? dtcm_rdata :
                       wbmem_ready ? wbmem_rdata :
`ifdef ENABLE_OPEN_AHB
                      ahbmem_ready ? ahbmem_rdata :
`endif
`ifdef ENABLE_SIMPLE_UART
            simpleuart_reg_div_sel ? simpleuart_reg_div_do :
            simpleuart_reg_dat_sel ? simpleuart_reg_dat_do : 
`endif
`ifdef ENABLE_DEBUG
                          dm_ready ? dm_rdata : 
`endif
                                     32'h 0000_0000;

 
    reg  [31:0] irq_reg, irq_reg_0, irq_reg_1, irq_reg_2;
    wire [31:0] irq_to_core ;
    always @(posedge clk or negedge resetn)
    begin
        if (!resetn)
        begin
            irq_reg   <= 'h0;
            irq_reg_0 <= 'h0;
            irq_reg_1 <= 'h0;
            irq_reg_2 <= 'h0;
        end 
        else begin
            irq_reg   <= irq & (~irq_mask_o);
            irq_reg_0 <= irq_reg;
            irq_reg_1 <= irq_reg_0;
            irq_reg_2 <= irq_reg_1;
        end
    end   
    //assign irq_to_core[31:4] = irq_reg_1[31:4] & (~irq_reg_2[31:4]);
    assign irq_to_core[31:6] = irq_reg[31:6];
    assign irq_to_core[5]    = 1'b0;
    assign irq_to_core[4]    = irq_reg_1[4] & (~irq_reg_2[4]);
    assign irq_to_core[3:0]  = 4'h0;
	
    picorv32 #(
        .STACKADDR        (STACKADDR),
        .PROGADDR_RESET   (PROGADDR_RESET),
        .PROGADDR_IRQ     (PROGADDR_IRQ)
        ) core (
        .trap              (           ),
        .irq_mask_o        (irq_mask_o ),
        .mem_valid         (mem_valid  ),
        .mem_instr         (mem_instr  ),
        .mem_ready         (mem_ready  ),
        .mem_addr          (mem_addr   ),
        .mem_wdata         (mem_wdata  ),
        .mem_wstrb         (mem_wstrb  ),
        .mem_rdata         (mem_rdata  ),
        .irq               (irq_to_core),

`ifdef ENABLE_DEBUG
        .wr_csr_nxt        (wr_csr_nxt),

        .wr_dscratch_ena   (wr_dscratch_ena),
        .dscratch_r        (dscratch_r),
        
        .wr_dpc_ena        (wr_dpc_ena),
        .cmt_dpc_ena       (cmt_dpc_ena),
        .cmt_dpc           (cmt_dpc),
        .dpc_r             (dpc_r),
        
        .cmt_dcause        (cmt_dcause),
        .cmt_dcause_ena    (cmt_dcause_ena),
        .wr_dcsr_ena       (wr_dcsr_ena),
        .dcsr_r            (dcsr_r),
        .dbg_mode          (dbg_mode),
        .dbg_halt_r        (dbg_halt_r),
        .dbg_step_r        (dbg_step_r),
        .dbg_ebreakm_r     (dbg_ebreakm_r),
        .dbg_stopcycle     (dbg_stopcycle),
`endif

        .clk               (clk        ),
        .resetn            (resetn     )
    );

`ifdef ENABLE_DEBUG
    s_debug_module u_dm (
        /* The interface with commit stage*/
        .cmt_dpc           (cmt_dpc           ),  //in  31:0
        .cmt_dpc_ena       (cmt_dpc_ena       ),  //in

        .cmt_dcause        (cmt_dcause        ),  //in  2:0
        .cmt_dcause_ena    (cmt_dcause_ena    ),  //in

        /* The interface with CSR control*/ 
        .wr_dcsr_ena       (wr_dcsr_ena       ),  //in
        .wr_dpc_ena        (wr_dpc_ena        ),  //in
        .wr_dscratch_ena   (wr_dscratch_ena   ),  //in

        .wr_csr_nxt        (wr_csr_nxt        ),  //in  31:0

        .dcsr_r            (dcsr_r            ),  //out 31:0
        .dpc_r             (dpc_r             ),  //out 31:0
        .dscratch_r        (dscratch_r        ),  //out 31:0

        .dbg_mode          (dbg_mode          ),  //out
        .dbg_halt_r        (dbg_halt_r        ),  //out
        .dbg_step_r        (dbg_step_r        ),  //out
        .dbg_ebreakm_r     (dbg_ebreakm_r     ),  //out
        .dbg_stopcycle     (dbg_stopcycle     ),  //out

        // Pico interfaces
        .mem_valid         (dm_valid          ),
	    .mem_addr          (dm_addr           ),
	    .mem_wdata         (dm_wdata          ),
	    .mem_read          (dm_read           ),
	    .mem_ready         (dm_ready          ),
	    .mem_rdata         (dm_rdata          ),

        /*JTAG PORT*/
        .jtag_TDI          (jtag_TDI          ),  //in
        .jtag_TDO          (jtag_TDO          ),  //out
        .jtag_TCK          (jtag_TCK          ),  //in
        .jtag_TMS          (jtag_TMS          ),  //in

        /* To the target hart*/
        .o_dbg_irq         (dbg_irq           ),  //out

        .clk               (clk               ),
        .corerst           (~resetn           )
    );
`endif

    picosoc_itcm  
    #(.K_BYTES(`I_MEM_K_BYTE)) 
    itcm (
        .clk         (clk         ),
        .mem_valid   (itcm_valid  ), 
        .mem_ready   (itcm_ready  ), 
        .mem_addr    (itcm_addr   ), 
        .mem_wdata   (itcm_wdata  ),  
        .mem_wstrb   (itcm_wstrb  ), 
        .mem_rdata   (itcm_rdata  )
    );


    picosoc_dtcm
     #(.K_BYTES(`D_MEM_K_BYTE))  
    dtcm (
        .clk       (clk),
        .mem_valid (dtcm_valid),
        .mem_ready (dtcm_ready),
        .mem_addr  (dtcm_addr),
        .mem_wdata (dtcm_wdata),
        .mem_wstrb (dtcm_wstrb),
        .mem_rdata (dtcm_rdata)
    );

`ifdef ENABLE_SIMPLE_UART
    assign simpleuart_reg_div_sel = mem_valid && (mem_addr == 32'h 0300_0004);
    assign simpleuart_reg_dat_sel = mem_valid && (mem_addr == 32'h 0300_0008);
    simpleuart simpleuart (
        .clk         (clk         ),
        .resetn      (resetn      ),

        .ser_tx      (ser_tx      ),
        .ser_rx      (ser_rx      ),

        .reg_div_we  (simpleuart_reg_div_sel ? mem_wstrb : 4'b 0000),
        .reg_div_di  (mem_wdata),
        .reg_div_do  (simpleuart_reg_div_do),

        .reg_dat_we  (simpleuart_reg_dat_sel ? mem_wstrb[0] : 1'b0),
        .reg_dat_re  (simpleuart_reg_dat_sel && !mem_wstrb),
        .reg_dat_di  (mem_wdata),
        .reg_dat_do  (simpleuart_reg_dat_do),
        .reg_dat_wait(simpleuart_reg_dat_wait)
    );
`endif

    wishbone_bus wb (
        .wb_rst_i    (~resetn),
        .wb_clk_i    (clk),
    
        //Wishbone interfaces
        .wbm_adr_o   (wbm_adr_o),
        .wbm_dat_o   (wbm_dat_o),
        .wbm_dat_i   (wbm_dat_i),
        .wbm_we_o    (wbm_we_o),
        .wbm_sel_o   (wbm_sel_o),
        .wbm_stb_o   (wbm_stb_o),
        .wbm_ack_i   (wbm_ack_i),
        .wbm_cyc_o   (wbm_cyc_o),
 
        //Pico interfaces
        .mem_valid   (wbmem_valid),
        .mem_addr    (wbmem_addr),
        .mem_wdata   (wbmem_wdata),
        .mem_wstrb   ((wbmem_valid && !wbmem_ready) ? wbmem_wstrb : 4'b0),
        .mem_ready   (wbmem_ready),
        .mem_rdata   (wbmem_rdata)
    );

    wisbhone_intercon wb_intercon (
//  spi flash memory map. address space (0x10000000 - 0x10ffffff)
`ifdef ADVSPI_MEM_SUPPORT
        .memmap_stb_o     (advspimem_wb_stb_i),
        .memmap_we_o      (advspimem_wb_we_i),
        .memmap_cyc_o     (advspimem_wb_cyc_i),
        .memmap_ack_i     (advspimem_wb_ack_o),
        .memmap_adr_o     (advspimem_wb_adr_i),
        .memmap_wdata_o   (advspimem_wb_dat_i),
        .memmap_rdata_i   (advspimem_wb_dat_o),
        .memmap_sel_o     (advspimem_wb_sel_i),
`endif
//  slave 0. address space (0x1100 0000 - 0x1100 0fff)
`ifdef ENABLE_WB_SLAVE0
        .slv0_stb_o       (wbuart_stb_i),
        .slv0_we_o        (wbuart_we_i),
        .slv0_cyc_o       (wbuart_cyc_i),
        .slv0_ack_i       (wbuart_ack_o),
        .slv0_adr_o       (wbuart_adr_i),
        .slv0_wdata_o     (wbuart_dat_i),
        .slv0_rdata_i     (wbuart_dat_o),
`endif
//  slave 1. address space (0x1100 1000 - 0x1100 1fff)
`ifdef ENABLE_WB_SLAVE1
        .slv1_stb_o       (wb_gpio_stb_i),
        .slv1_we_o        (wb_gpio_we_i),
        .slv1_cyc_o       (wb_gpio_cyc_i),
        .slv1_ack_i       (wb_gpio_ack_o),
        .slv1_adr_o       (wb_gpio_adr_i),
        .slv1_wdata_o     (wb_gpio_dat_i),
        .slv1_rdata_i     (wb_gpio_dat_o),
`endif
//  slave 2. address space (0x1100 2000 - 0x1100 2fff)
`ifdef ENABLE_WB_SLAVE2
        .slv2_stb_o       (wbspi_master_stb_i),
        .slv2_we_o        (wbspi_master_we_i),
        .slv2_cyc_o       (wbspi_master_cyc_i),
        .slv2_ack_i       (wbspi_master_ack_o),
        .slv2_adr_o       (wbspi_master_adr_i),
        .slv2_wdata_o     (wbspi_master_dat_i),
        .slv2_rdata_i     (wbspi_master_dat_o),
`endif
//  slave 3. address space (0x1100 3000 - 0x1100 3fff)
`ifdef ENABLE_WB_SLAVE3
        .slv3_stb_o       (wbspi_slave_stb_i),
        .slv3_we_o        (wbspi_slave_we_i),
        .slv3_cyc_o       (wbspi_slave_cyc_i),
        .slv3_ack_i       (wbspi_slave_ack_o),
        .slv3_adr_o       (wbspi_slave_adr_i),
        .slv3_wdata_o     (wbspi_slave_dat_i),
        .slv3_rdata_i     (wbspi_slave_dat_o),
`endif
//  slave 4. address space (0x1100 4000 - 0x1100 4fff)
`ifdef ENABLE_WB_SLAVE4
        .slv4_stb_o       (advspireg_wb_stb_i),
        .slv4_we_o        (advspireg_wb_we_i),
        .slv4_cyc_o       (advspireg_wb_cyc_i),
        .slv4_ack_i       (advspireg_wb_ack_o),
        .slv4_adr_o       (advspireg_wb_adr_i),
        .slv4_wdata_o     (advspireg_wb_dat_i),
        .slv4_rdata_i     (advspireg_wb_dat_o),
        .slv4_sel_o       (advspireg_wb_sel_i),
`endif
//  slave 5. address space (0x1100 5000 - 0x1100 5fff)
`ifdef ENABLE_WB_SLAVE5
        .slv5_stb_o       (wbi2c_stb_i),
        .slv5_we_o        (wbi2c_we_i),
        .slv5_cyc_o       (wbi2c_cyc_i),
        .slv5_ack_i       (wbi2c_ack_o),
        .slv5_adr_o       (wbi2c_adr_i),
        .slv5_wdata_o     (wbi2c_dat_i),
        .slv5_rdata_i     (wbi2c_dat_o),
`endif
//  slave ext. address space (0x2000_0000 - )
`ifdef ENABLE_OPEN_WB_INTERFACE
        .slv_ext_stb_o    (slv_ext_stb_o),
        .slv_ext_we_o     (slv_ext_we_o),
        .slv_ext_cyc_o    (slv_ext_cyc_o),
        .slv_ext_ack_i    (slv_ext_ack_i),
        .slv_ext_adr_o    (slv_ext_adr_o),
        .slv_ext_wdata_o  (slv_ext_wdata_o),
        .slv_ext_rdata_i  (slv_ext_rdata_i),
        .slv_ext_sel_o    (slv_ext_sel_o),
`endif
//  global wishbone signals
        .glob_stb_i       (wbm_stb_o),
        .glob_we_i        (wbm_we_o),
        .glob_cyc_i       (wbm_cyc_o),
        .glob_ack_o       (wbm_ack_i),
        .glob_adr_i       (wbm_adr_o),
        .glob_wdata_i     (wbm_dat_o),
        .glob_rdata_o     (wbm_dat_i),
        .glob_sel_i       (wbm_sel_o)
    );


`ifdef ENABLE_WB_UART
    wbuart wbuart_ins (
        .i_clk             (clk), 
        .i_rst             (~resetn),
        .i_wb_cyc          (wbuart_cyc_i), 
        .i_wb_stb          (wbuart_stb_i), 
        .i_wb_we           (wbuart_we_i), 
        .i_wb_addr         (wbuart_adr_i), 
        .i_wb_data         (wbuart_dat_i),
        .o_wb_ack          (wbuart_ack_o), 
        .o_wb_stall        (wbuart_stall_o), 
        .o_wb_data         (wbuart_dat_o),
        .i_uart_rx         (wbuart_rx), 
        .o_uart_tx         (wbuart_tx), 
        .o_uart_rx_int     (uart_rx_int), 
        .o_uart_tx_int     (uart_tx_int),
        .o_uart_rxfifo_int (uart_rxfifo_int), 
        .o_uart_txfifo_int (uart_txfifo_int)
    );
`endif

`ifdef ENABLE_WB_GPIO
    wb_gpio wbgpio_ins (
        .wb_clk_i (clk),               // master clock input
        .wb_rst_i (~resetn),           // synchronous active high reset
        .wb_adr_i (wb_gpio_adr_i),     // lower address bits
        .wb_dat_i (wb_gpio_dat_i),     // databus input
        .wb_dat_o (wb_gpio_dat_o),     // databus output
        .wb_we_i  (wb_gpio_we_i),      // write enable input
        .wb_stb_i (wb_gpio_stb_i),     // stobe/core select signal
        .wb_cyc_i (wb_gpio_cyc_i),     // valid bus cycle input
        .wb_ack_o (wb_gpio_ack_o),     // bus cycle acknowledge output
        .gpio_io  (gpio_io)
    );
`endif
  
`ifdef ENABLE_WB_SPI_MASTER
    wbspi 
    #(
        .SHIFT_DIRECTION (`WBSPI_MASTER_SHIFT_DIRECTION),
        .CLOCK_PHASE     (`WBSPI_MASTER_CLOCK_PHASE),
        .CLOCK_POLARITY  (`WBSPI_MASTER_CLOCK_POLARITY),
        .CLOCK_SEL       (`WBSPI_MASTER_CLOCK_SEL),        
        .MASTER          (1),
        .SLAVE_NUMBER    (`WBSPI_MASTER_SLAVE_NUMBER),        
        .DATA_LENGTH     (`WBSPI_MASTER_DATA_LENGTH),        
        .DELAY_TIME      (`WBSPI_MASTER_DELAY_TIME),
        .CLKCNT_WIDTH    (`WBSPI_MASTER_CLKCNT_WIDTH),
        .INTERVAL_LENGTH (`WBSPI_MASTER_INTERVAL_LENGTH)
    ) wbspi_master_0 (
       //slave port
       .SPI_ADR_I     (wbspi_master_adr_i),    //8 bit width - changed from 32 bits
       .SPI_DAT_I     (wbspi_master_dat_i),    //8 bit width - changed from 32 bits
       .SPI_WE_I      (wbspi_master_we_i),
       .SPI_CYC_I     (wbspi_master_cyc_i),
       .SPI_STB_I     (wbspi_master_stb_i),
       .SPI_SEL_I     ('b0),
       .SPI_CTI_I     ('b0),
       .SPI_BTE_I     ('b0),
       .SPI_LOCK_I    ('b0),
       .SPI_DAT_O     (wbspi_master_dat_o),    //8 bit width - changed from 32 bits
       .SPI_ACK_O     (wbspi_master_ack_o),
       .SPI_INT_O     (wbspi_master_int_o),
       .SPI_ERR_O     (),
       .SPI_RTY_O     (),
       //spi interface
       .MISO_MASTER   (wbspi_master_miso),
       .MOSI_MASTER   (wbspi_master_mosi),
       .SS_N_MASTER   (wbspi_master_ssn),
       .SCLK_MASTER   (wbspi_master_sclk),
       .MISO_SLAVE    (),
       .MOSI_SLAVE    ('b0),
       .SS_N_SLAVE    ('b0),
       .SCLK_SLAVE    ('b0),
       //system clock and reset
       .CLK_I         (clk),
       .RST_I         (~resetn)
    );
`endif

`ifdef ENABLE_WB_SPI_SLAVE
    wbspi 
    #(
        .SHIFT_DIRECTION (`WBSPI_SLAVE_SHIFT_DIRECTION),
        .CLOCK_PHASE     (`WBSPI_SLAVE_CLOCK_PHASE),
        .CLOCK_POLARITY  (`WBSPI_SLAVE_CLOCK_POLARITY),
        .CLOCK_SEL       (`WBSPI_SLAVE_CLOCK_SEL),        
        .MASTER          (0),
        .SLAVE_NUMBER    (1),        
        .DATA_LENGTH     (`WBSPI_SLAVE_DATA_LENGTH),        
        .DELAY_TIME      (`WBSPI_SLAVE_DELAY_TIME),
        .CLKCNT_WIDTH    (`WBSPI_SLAVE_CLKCNT_WIDTH),
        .INTERVAL_LENGTH (`WBSPI_SLAVE_INTERVAL_LENGTH)
    ) wbspi_slave (
       //slave port
       .SPI_ADR_I     (wbspi_slave_adr_i),    //8 bit width - changed from 32 bits
       .SPI_DAT_I     (wbspi_slave_dat_i),    //8 bit width - changed from 32 bits
       .SPI_WE_I      (wbspi_slave_we_i),
       .SPI_CYC_I     (wbspi_slave_cyc_i),
       .SPI_STB_I     (wbspi_slave_stb_i),
       .SPI_SEL_I     ('b0),
       .SPI_CTI_I     ('b0),
       .SPI_BTE_I     ('b0),
       .SPI_LOCK_I    ('b0),
       .SPI_DAT_O     (wbspi_slave_dat_o),    //8 bit width - changed from 32 bits
       .SPI_ACK_O     (wbspi_slave_ack_o),
       .SPI_INT_O     (wbspi_slave_int_o),
       .SPI_ERR_O     (),
       .SPI_RTY_O     (),
       //spi interface
       .MISO_MASTER   ('b0),
       .MOSI_MASTER   (),
       .SS_N_MASTER   (),
       .SCLK_MASTER   (),
       .MISO_SLAVE    (wbspi_slave_miso),
       .MOSI_SLAVE    (wbspi_slave_mosi),
       .SS_N_SLAVE    (wbspi_slave_ssn),
       .SCLK_SLAVE    (wbspi_slave_sclk),
       //system clock and reset
       .CLK_I         (clk),
       .RST_I         (~resetn)
    );
`endif

`ifdef ENABLE_WB_I2C
    assign wbi2c_dat_o[31:8] = 24'b0;
    i2c_master_top wbi2c_ins (
        .wb_clk_i   (clk), 
        .wb_rst_i   (~resetn), 
        .arst_i     (resetn), 
        .wb_adr_i   (wbi2c_adr_i),      //[5:0]
        .wb_dat_i   (wbi2c_dat_i[7:0]), //[7:0]
        .wb_dat_o   (wbi2c_dat_o[7:0]), //[7:0]
        .wb_we_i    (wbi2c_we_i),  
        .wb_stb_i   (wbi2c_stb_i), 
        .wb_cyc_i   (wbi2c_cyc_i), 
        .wb_ack_o   (wbi2c_ack_o), 
        .wb_inta_o  (wbi2c_inta_o),
        .scl        (wbi2c_scl),
        .sda        (wbi2c_sda)
    );
`endif


`ifdef ENABLE_ADVSPI
    advspi_top u_dualportspi (
        .wb_rst_i         (~resetn),
        .wb_clk_i         (clk),

`ifdef ADVSPI_MEM_SUPPORT
        .spimem_wb_adr_i  ({4'h0, advspimem_wb_adr_i}),
        .spimem_wb_dat_i  (advspimem_wb_dat_i),
        .spimem_wb_dat_o  (advspimem_wb_dat_o),
        .spimem_wb_we_i   (advspimem_wb_we_i),
        .spimem_wb_sel_i  (advspimem_wb_sel_i),
        .spimem_wb_stb_i  (advspimem_wb_stb_i),
        .spimem_wb_ack_o  (advspimem_wb_ack_o),
        .spimem_wb_cyc_i  (advspimem_wb_cyc_i),
`endif
`ifdef ADVSPI_REG
        .regspi_wb_adr_i  (advspireg_wb_adr_i),
        .regspi_wb_dat_i  (advspireg_wb_dat_i),
        .regspi_wb_dat_o  (advspireg_wb_dat_o),
        .regspi_wb_we_i   (advspireg_wb_we_i),
        .regspi_wb_sel_i  (advspireg_wb_sel_i),
        .regspi_wb_stb_i  (advspireg_wb_stb_i),
        .regspi_wb_ack_o  (advspireg_wb_ack_o),
        .regspi_wb_cyc_i  (advspireg_wb_cyc_i),
`endif
`ifdef ADVSPI_QUADSPI_SUPPORT
        .io_spi_holdn     (io_spi_holdn),
        .io_spi_wpn       (io_spi_wpn),
`endif
        .io_spi_clk       (io_spi_clk),
        .io_spi_csn       (io_spi_csn),
        .io_spi_mosi      (io_spi_mosi),
        .io_spi_miso      (io_spi_miso)
    );
`endif

`ifdef ENABLE_OPEN_AHB
    ahb_bus ahb_interface (
        .rst_i        (~resetn),
        .clk_i        (clk),    

        .mem_valid    (ahbmem_valid),
        .mem_addr     (ahbmem_addr),
        .mem_wdata    (ahbmem_wdata),
        .mem_wstrb    (ahbmem_wstrb),
        .mem_ready    (ahbmem_ready),
        .mem_rdata    (ahbmem_rdata),
    
        .hrdata       (hrdata),
        .hresp        (hresp),
        .hready       (hready),
        .haddr        (haddr),
        .hwrite       (hwrite),
        .hsize        (hsize),
        .hburst       (hburst),
        .hwdata       (hwdata),
        .hsel         (hsel),
        .htrans       (htrans)
    );
`endif


endmodule
