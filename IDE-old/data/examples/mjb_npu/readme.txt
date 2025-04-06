________________________________________________________________________
	   mjb_npu  阅读指南
-------------------------------------------------------------------------
工程描述：mjb_npu设计，并加载物理约束和时序约束，实现整个设计流程。
---------------------------------------------------------------------------
目标器件：GW2AR-18C, GW2AR-LV18QN88PC8/I7
---------------------------------------------------------------------------
文件列表：
---------------------------------------------------------------------------
.
|-- project
|   `-- readme.txt                          --> 自述文件
|   `-- mjb_npu.gprj                     	--> 参考设计工程
|   `-- mjb_npu.gprj.user                 	--> 参考设计工程
|   |-- impl
|       |-- project_process_config.json-->	工程配置文件
|   |-- src                                
|   	|-- camera2dvi 
|       |   |-- colorbar_generator.v		-->	工程文件
|       |   |-- DVI_out.v					-->	工程文件
|       |   |-- gw_10bserializer.v			-->	工程文件
|       |   |-- label_placer.v				-->	工程文件                   
|       |   |-- text_overlay.v				-->	工程文件  
|       |   |-- tmds_enc.v					-->	工程文件  
|       |   |-- TMDS8b10b.v					-->	工程文件  
|       |   |-- frame_buffer				  
|       |   |   |-- frame_buffer.ipc		-->	IP配置文件  
|       |   |   |-- frame_buffer.v			-->	IP文件  
|       |   |   |-- frame_buffer.mod		-->	mod配置文件  
|       |   |   |-- frame_buffer_tmp.v		-->	例化模板文件  
|       |   |-- gw_rpll_27					  
|       |   |   |-- gw_rpll_27.ipc			-->	IP配置文件  
|       |   |   |-- gw_rpll_27.v			-->	IP文件  
|       |   |   |-- gw_rpll_27.mod			-->	mod配置文件  
|       |   |   |-- gw_rpll_27_tmp.v		-->	例化模板文件  
|   	|-- camera2npu 
|       |   |-- downscaler.v				-->	工程文件 
|       |   |-- tflite_img_buf				  
|       |   |   |-- tflite_img_buf.ipc		-->	IP配置文件  
|       |   |   |-- tflite_img_buf.v		-->	IP文件  
|       |   |   |-- tflite_img_buf.mod		-->	mod配置文件  
|       |   |   |-- tflite_img_buf_tmp.v	-->	例化模板文件 
|   	|-- gowin_empu_m1 
|       |   |-- gowin_empu_m1.v				-->	IP文件
|   	|-- gowin_rpll 
|       |   |-- gowin_rpll.ipc				-->	IP配置文件
|       |   |-- gowin_rpll.v				-->	IP文件
|       |   |-- gowin_rpll.mod				-->	mod配置文件
|       |   |-- gowin_rpll_tmp.v			-->	例化模板文件
|   	|-- npu 
|       |   |-- npu.ipc						-->	IP配置文件
|       |   |-- npu.v						-->	IP文件
|       |   |-- npu.vo						-->	仿真使用vo文件
|       |   |-- npu_tmp.v					-->	例化模板文件
|       |-- mjb_npu.v                     	--> 工程文件  
|       |-- mjb_npu.cst  	 		        -->	CST文件
|       |-- mjb_npu.sdc  	 		        -->	SDC文件


________________________________________________________________________
	   mjb_npu  Readme
-------------------------------------------------------------------------
Project description：mjb_npu design, with physical constraints, timing constraints, to realize the whole design process.
---------------------------------------------------------------------------
Object device: GW2AR-18C, GW2AR-LV18QN88PC8/I7
---------------------------------------------------------------------------
File List:
---------------------------------------------------------------------------
.
|-- project
|   `-- readme.txt                          --> Read Me file (this file)
|   `-- mjb_npu.gprj                        --> GowinYunYuan Project File for Example Design
|   `-- mjb_npu.gprj.user                   --> GowinYunYuan Project File for Example Design
|   |-- impl
|       |-- project_process_config.json		-->	Configuration File for Example Design
|   |-- src                                
|   	|-- camera2dvi 
|       |   |-- colorbar_generator.v		-->	File for GowinYunYuan Project
|       |   |-- DVI_out.v					-->	File for GowinYunYuan Project
|       |   |-- gw_10bserializer.v			-->	File for GowinYunYuan Project
|       |   |-- label_placer.v				-->	File for GowinYunYuan Project                   
|       |   |-- text_overlay.v				-->	File for GowinYunYuan Project  
|       |   |-- tmds_enc.v					-->	File for GowinYunYuan Project  
|       |   |-- TMDS8b10b.v					-->	File for GowinYunYuan Project  
|       |   |-- frame_buffer				  
|       |   |   |-- frame_buffer.ipc		-->	IP configuration file  
|       |   |   |-- frame_buffer.v			-->	IP file  
|       |   |   |-- frame_buffer.mod		-->	mod configuration file  
|       |   |   |-- frame_buffer_tmp.v		-->	Template file for instantiation  
|       |   |-- gw_rpll_27					  
|       |   |   |-- gw_rpll_27.ipc			-->	IP configuration file  
|       |   |   |-- gw_rpll_27.v			-->	IP file  
|       |   |   |-- gw_rpll_27.mod			-->	mod configuration file  
|       |   |   |-- gw_rpll_27_tmp.v		-->	Template file for instantiation  
|   	|-- camera2npu 
|       |   |-- downscaler.v				-->	File for GowinYunYuan Project 
|       |   |-- tflite_img_buf				  
|       |   |   |-- tflite_img_buf.ipc		-->	IP configuration file  
|       |   |   |-- tflite_img_buf.v		-->	IP file  
|       |   |   |-- tflite_img_buf.mod		-->	mod configuration file  
|       |   |   |-- tflite_img_buf_tmp.v	-->	Template file for instantiation 
|   	|-- gowin_empu_m1 
|       |   |-- gowin_empu_m1.v				-->	IP file
|   	|-- gowin_rpll 
|       |   |-- gowin_rpll.ipc				-->	IP configuration file
|       |   |-- gowin_rpll.v				-->	IP file
|       |   |-- gowin_rpll.mod				-->	mod configuration file
|       |   |-- gowin_rpll_tmp.v			-->	Template file for instantiation
|   	|-- npu 
|       |   |-- npu.ipc						-->	IP configuration file
|       |   |-- npu.v						-->	IP file
|       |   |-- npu.vo						-->	Verilog simulation File for tb
|       |   |-- npu_tmp.v					-->	Template file for instantiation
|       |-- mjb_npu.v                     	--> File for GowinYunYuan Project  
|       |-- mjb_npu.cst  	 		        -->	CST File
|       |-- mjb_npu.sdc  	 		        -->	SDC File
