_______________________________________________________________________________
         cpu阅读指南
----------------------------------------------------------------------
工程描述：调用rom、mem、reg等模块实现状态跳转，实现了CPU构建。
----------------------------------------------------------------------
目标器件：GW1N-2，GW1N-UV2LQ144XC6/I5
----------------------------------------------------------------------
文件列表
----------------------------------------------------------------------
.
| -- project
|    `-- readme.txt			                -->	自述文件
|    `-- cpu.gprj		                    -->	参考设计工程
|    |-- impl
|        |-- project_process_config.json    -->	工程参数配置文件
|    |-- src
|        |-- mips.sv		                -->	工程顶层模块
|        |-- define.sv		                -->	工程源文件
|        |-- ex.sv		                    -->	工程源文件
|        |-- ex_mem.sv		                -->	工程源文件
|        |-- hilo_reg.sv		            -->	工程源文件
|        |-- id.sv		                    -->	工程源文件
|        |-- id_ex.sv		                -->	工程源文件
|        |-- if_id.sv		                -->	工程源文件
|        |-- mem.sv		                    -->	工程源文件
|        |-- mem_wb.sv		                -->	工程源文件
|        |-- pc_reg.sv		                -->	工程源文件
|        |-- regfile.sv		                -->	工程源文件
|        |-- rom.sv		                    -->	工程源文件
|        |-- cpu.cst  	                    -->	工程物理约束文件
|        |-- cpu.sdc  	                    -->	工程时序约束文件
|        |-- cpu.gao  	                    -->	工程gao配置文件
|        |-- cpu.gpa  	                    -->	工程gpa配置文件

_______________________________________________________________________________
         cpu Readme
----------------------------------------------------------------------
Project description: Achieve state jump, and realize the CPU.
----------------------------------------------------------------------
Object device: GW1N-2, GW1N-UV2LQ144XC6/I5
----------------------------------------------------------------------
File List:
----------------------------------------------------------------------
.
| -- project
|    `-- readme.txt			                -->	Read Me file (this file)
|    `-- cpu.gprj		                    -->	GowinYunYuan Project File
|    |-- impl
|        |-- project_process_config.json    -->	Parameter Configuration File
|    |-- src
|        |-- mips.sv		                -->	Source File
|        |-- define.sv		                -->	Source File
|        |-- ex.sv		                    -->	Source File
|        |-- ex_mem.sv		                -->	Source File
|        |-- hilo_reg.sv		            -->	Source File
|        |-- id.sv		                    -->	Source File
|        |-- id_ex.sv		                -->	Source File
|        |-- if_id.sv		                -->	Source File
|        |-- mem.sv		                    -->	Source File
|        |-- mem_wb.sv		                -->	Source File
|        |-- pc_reg.sv		                -->	Source File
|        |-- regfile.sv		                -->	Source File
|        |-- rom.sv		                    -->	Source File
|        |-- cpu.cst                        -->	CST File
|        |-- cpu.sdc                        -->	SDC File
|        |-- cpu.gao                        --> GAO File
|        |-- cpu.gpa  	                    -->	GPA File
