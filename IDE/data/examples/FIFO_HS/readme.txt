_______________________________________________________________________________
       	  FIFO_HS阅读指南
----------------------------------------------------------------------
工程描述：FIFO HS IP设计，并加载物理约束、时序约束、GAO配置等，实现整个设计流程。
----------------------------------------------------------------------
目标器件：GW1N-9C，GW1N-LV9LQ144C6/I5
----------------------------------------------------------------------
文件列表
----------------------------------------------------------------------
.
| -- project
|    `-- readme.txt			        -->	自述文件
|    `-- FIFO_HS.gprj			    -->	参考设计工程
|    |-- impl
|    |-- src
|        |-- FIFO_HS
|        |   |-- FIFO_HS.ipc		-->	IP配置文件
|        |   |-- FIFO_HS.v			-->	IP文件
|        |   |-- FIFO_HS.vo			-->	仿真使用vo文件
|        |   |-- FIFO_HS_tmp.v		-->	例化模板文件
|        |-- rstn_gen.v			    -->	工程文件
|        |-- test_fifo.v			-->	工程顶层文件
|        |-- FIFO_HS.cst  	 		-->	工程物理约束文件
|        |-- FIFO_HS.gpa  	 		-->	工程GPA配置文件
|        |-- FIFO_HS.sdc  	 		-->	工程时序约束文件
|        |-- FIFO_HS.rao			-->	工程GAO配置文件
|        |-- FIFO_HS.gvio			-->	工程GVIO配置文件

_______________________________________________________________________________
       	 FIFO_HS  Readme
----------------------------------------------------------------------
Project description：FIFO HS IP design, with physical constraints, timing constraints, Gao configuration file, etc. to realize the whole design process.
----------------------------------------------------------------------
Object device: GW1N-9C, GW1N-LV9LQ144C6/I5
----------------------------------------------------------------------
File List:
----------------------------------------------------------------------
.
| -- project
|    `-- readme.txt						-->	Read Me file (this file)
|    `-- FIFO_HS.gprj					-->	Gowin Project File for Example Design
|    |-- impl
|    |-- src
|        |-- FIFO_HS
|        |   |-- FIFO_HS.ipc			-->	IP configuration file	
|        |   |-- FIFO_HS.v			    -->	IP file	
|        |   |-- FIFO_HS.vo			    -->	Verilog simulation File for tb
|        |   |-- FIFO_HS_tmp.v		    -->	Template file for instantiation
|        |-- rstn_gen.v			        -->	File for Gowin Project
|        |-- test_fifo.v			    -->	File for Gowin Project
|        |-- FIFO_HS.cst  	 		    -->	CST File
|        |-- FIFO_HS.gpa  	 		    -->	GPA File
|        |-- FIFO_HS.sdc  	 		    -->	SDC File
|        |-- FIFO_HS.rao			    -->	GAO File
|        |-- FIFO_HS.gvio			    -->	GVIO File


