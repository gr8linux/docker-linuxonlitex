_______________________________________________________________________________
         JESD204B_demo阅读指南
----------------------------------------------------------------------
工程描述：调用串口转总线、DDS、Apb2local、local2reg、JESD204B等模块，实现与serdes的交互。
----------------------------------------------------------------------
目标器件：GW5AST-138B，GW5AST-LV138FPG676AES
----------------------------------------------------------------------
文件列表
----------------------------------------------------------------------
.
| -- project
|    `-- readme.txt			                -->	自述文件
|    `-- jesd204b_demo.gprj		            -->	参考设计工程
|    |-- impl
|        |-- project_process_config.json    -->	工程参数配置文件
|    |-- src
|        |-- top.v		                    -->	工程顶层模块
|        |-- sysreg.v		                -->	工程源文件
|        |-- gowin_pll		                   
|        |    |--gowin_pll.v		        -->	IP文件
|        |    |--gowin_pll.mod		        -->	mod配置文件
|        |    |--gowin_pll.ipc		        -->	IP配置文件
|        |    |--gowin_pll_tmp.v		    -->	例化模板文件
|        |-- serdes 		                   
|        |    |--serdes.csr		            -->	CSR文件
|        |    |--serdes.ipc		            -->	IP配置文件
|        |    |--serdes.mod		            -->	mod配置文件
|        |    |--serdes.toml		        -->	toml源文件
|        |    |--serdes.v		            -->	IP文件
|        |    |--serdes_temp.csr		    -->	CSR文件
|        |    |--serdes_temp.toml		    -->	toml源文件
|        |    |--serdes_tmp.v		        --> 例化模板文件
|        |    |-- jesd204b		                    
|        |    |    |--jesd204b.ipc		    -->	IP配置文件
|        |    |    |--jesd204b.v		    -->	IP文件
|        |    |    |--jesd204b.vo		    -->	仿真使用vo文件
|        |    |    |--jesd204b_tmp.v		-->	例化模板文件
|        |-- dds 		                   
|        |    |--cos_sin_table.v	        -->	工程源文件
|        |-- uart_to_bus		                   
|        |    |--uart_to_bus.v	            -->	IP文件
|        |    |--uart_to_bus.ipc		    -->	IP配置文件
|        |    |--uart_to_bus.vo		        -->	仿真使用vo文件
|        |    |--uart_to_bus_tmp.v		    -->	例化模板文件
|        |-- top.cst  	                    -->	工程物理约束文件
|        |-- top.sdc  	                    -->	工程时序约束文件
|        |-- top.rao  	                    -->	工程gao配置文件


_______________________________________________________________________________
         JESD204B_demo Readme
----------------------------------------------------------------------
Project description:  Invoked serial port to bus, DDS, Apb2local, local2reg, JESD204B modules to interact with serdes.
----------------------------------------------------------------------
Object device: GW5AST-138B，GW5AST-LV138FPG676AES
----------------------------------------------------------------------
File List:
----------------------------------------------------------------------
.
| -- project
|    `-- readme.txt			                -->	Read Me file (this file)
|    `-- jesd204b_demo.gprj		            -->	GowinYunYuan Project File for Example Design
|    |-- impl
|        |-- project_process_config.json    -->	Parameter Configuration File
|    |-- src
|        |-- top.v		                    -->	File for GowinYunYuan Project
|        |-- sysreg.v		                -->	File for GowinYunYuan Project
|        |-- gowin_pll		                   
|        |    |--gowin_pll.v		        -->	IP File
|        |    |--gowin_pll.mod		        -->	MOD Configuration File
|        |    |--gowin_pll.ipc		        -->	IP Configuration File
|        |    |--gowin_pll_tmp.v		    -->	Template File for Instantiation
|        |-- serdes 		                   
|        |    |--serdes.csr		            -->	CSR File
|        |    |--serdes.ipc		            -->	IP Configuration File
|        |    |--serdes.mod		            -->	MOD Configuration File
|        |    |--serdes.toml		        -->	TOML File 
|        |    |--serdes.v		            -->	IP File 
|        |    |--serdes_temp.csr		    -->	CSR File
|        |    |--serdes_temp.toml		    -->	TOML File
|        |    |--serdes_tmp.v		        --> Template File for Instantiation
|        |    |-- jesd204b		                    
|        |    |    |--jesd204b.ipc		    -->	IP Configuration File
|        |    |    |--jesd204b.v		    -->	IP File
|        |    |    |--jesd204b.vo		    -->	Verilog Simulation File for tb
|        |    |    |--jesd204b_tmp.v		-->	Template File for Instantiation
|        |-- dds 		                   
|        |    |--cos_sin_table.v	        -->	File for GowinYunYuan Project
|        |-- uart_to_bus		                   
|        |    |--uart_to_bus.v	            -->	IP File
|        |    |--uart_to_bus.ipc		    --> IP Configuration File
|        |    |--uart_to_bus.vo		        -->	Verilog Simulation File for tb
|        |    |--uart_to_bus_tmp.v		    -->	Template File for Instantiation
|        |-- top.cst  	                    -->	CST File
|        |-- top.sdc  	                    -->	SDC File
|        |-- top.rao  	                    -->	GAO File

