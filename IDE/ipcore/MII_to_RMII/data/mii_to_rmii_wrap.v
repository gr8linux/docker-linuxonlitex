`include "define.vh"
`include "static_macro_define.v"

module `MODULE_NAME (
	input			refclk,
	input  			rstn,

	input 			speedis_100,

	input			rmii_rx_crs_dv,
	input			rmii_rx_er,
	input	[ 1:0]	rmii_rxd,
	output			rmii_tx_en,
	output	[ 1:0]	rmii_txd,

	output			mii_rx_clk,
	output			mii_rx_dv,
	output			mii_rx_er,
	output	[ 3:0]	mii_rxd,
	output			mii_tx_clk,
	input			mii_tx_en,
	input			mii_tx_er,
	input	[ 3:0]	mii_txd,
	output 			mii_col,
	output			mii_crs
);

`getname(rmii_txrx,`MODULE_NAME) u_rmii_txrx (
		.refclk			(refclk			),
		.rstn			(rstn 			),

		.speedis_100	(speedis_100	),

		.rmii_rx_crs_dv	(rmii_rx_crs_dv	),
		.rmii_rx_er		(rmii_rx_er		),
		.rmii_rxd 		(rmii_rxd		),
		.rmii_tx_en		(rmii_tx_en		),
		.rmii_txd		(rmii_txd		),

		.mii_rx_clk		(mii_rx_clk		),
		.mii_rx_dv		(mii_rx_dv		),
		.mii_rx_er		(mii_rx_er		),
		.mii_rxd		(mii_rxd		),
		.mii_tx_clk		(mii_tx_clk		),
		.mii_tx_en		(mii_tx_en		),
		.mii_tx_er		(mii_tx_er		),
		.mii_txd		(mii_txd		),
		.mii_col		(mii_col		),
		.mii_crs		(mii_crs		)
	);

endmodule