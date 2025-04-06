//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.10.01 (64-bit)
//Part Number: GW1N-LV9LQ144C6/I5
//Device: GW1N-9
//Device Version: C
//Created Time: Tue Jul 23 16:42:49 2024

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	FIFO_HS_Top your_instance_name(
		.Data(Data), //input [31:0] Data
		.WrReset(WrReset), //input WrReset
		.RdReset(RdReset), //input RdReset
		.WrClk(WrClk), //input WrClk
		.RdClk(RdClk), //input RdClk
		.WrEn(WrEn), //input WrEn
		.RdEn(RdEn), //input RdEn
		.Wnum(Wnum), //output [10:0] Wnum
		.Rnum(Rnum), //output [9:0] Rnum
		.Almost_Empty(Almost_Empty), //output Almost_Empty
		.Almost_Full(Almost_Full), //output Almost_Full
		.Q(Q), //output [63:0] Q
		.Empty(Empty), //output Empty
		.Full(Full) //output Full
	);

//--------Copy end-------------------
