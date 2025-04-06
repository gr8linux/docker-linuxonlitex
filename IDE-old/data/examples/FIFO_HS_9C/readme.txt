_______________________________________________________________________________
       	  FIFO_HS_9C阅读指南
----------------------------------------------------------------------
工程描述：FIFO HS IP设计，并加载物理约束、时序约束、GAO配置等，实现整个设计流程。
----------------------------------------------------------------------
目标器件：GW1N-9C，GW1N-LV9QN48C6/I5
----------------------------------------------------------------------
文件列表
----------------------------------------------------------------------
.
| -- project
|    `-- readme.txt			        	-->	自述文件
|    `-- FIFO_HS_9C.gprj			    -->	参考设计工程
|    |-- impl
|        |-- project_process_config.json-->	工程配置文件
|    |-- src
|        |-- fifo_hs
|        |   |-- fifo_hs.ipc			-->	IP配置文件
|        |   |-- fifo_hs.v				-->	IP文件
|        |   |-- fifo_hs.vo				-->	仿真使用vo文件
|        |   |-- fifo_hs_tmp.v			-->	例化模板文件
|        |-- rstn_gen.v			    	-->	工程文件
|        |-- test_fifo.v				-->	工程顶层文件
|        |-- FIFO_HS_9C.cst  	 		-->	工程物理约束文件
|        |-- FIFO_HS_9C.gpa  	 		-->	工程GPA配置文件
|        |-- FIFO_HS_9C.sdc  	 		-->	工程时序约束文件
|        |-- FIFO_HS_9C.rao				-->	工程gao配置文件

_______________________________________________________________________________
       	 FIFO_HS_9C  Readme
----------------------------------------------------------------------
Project description：FIFO HS IP design, with physical constraints, timing constraints, Gao configuration file, etc. to realize the whole design process.
----------------------------------------------------------------------
Object device: GW1N-9C, GW1N-LV9QN48C6/I5
----------------------------------------------------------------------
File List:
----------------------------------------------------------------------
.
| -- project
|    `-- readme.txt						-->	Read Me file (this file)
|    `-- FIFO_HS_9C.gprj				-->	Gowin Project File for Example Design
|    |-- impl
|        |-- project_process_config.json-->	Configuration File for Example Design
|    |-- src
|        |-- fifo_hs
|        |   |-- fifo_hs.ipc			-->	IP configuration file	
|        |   |-- fifo_hs.v			    -->	IP file	
|        |   |-- fifo_hs.vo			    -->	Verilog simulation File for tb
|        |   |-- fifo_hs_tmp.v		    -->	Template file for instantiation
|        |-- rstn_gen.v			        -->	File for Gowin Project
|        |-- test_fifo.v			    -->	File for Gowin Project
|        |-- FIFO_HS_9C.cst  	 		    -->	CST File
|        |-- FIFO_HS_9C.gpa  	 		    -->	GPA File
|        |-- FIFO_HS_9C.sdc  	 		    -->	SDC File
|        |-- FIFO_HS_9C.rao			    -->	GAO File


