_______________________________________________________________________________
         vga_text_generator阅读指南
----------------------------------------------------------------------
工程描述：一个基本的VGA文本生成器，用于通过VGA从FPGA打印文本到监视器。
----------------------------------------------------------------------
目标器件：GW1N-9，GW1N-LV9LQ100C6/I5
----------------------------------------------------------------------
文件列表
----------------------------------------------------------------------
.
| -- project
|    `-- readme.txt			        -->	自述文件
|    `-- vga_text_generator.gprj		-->	参考设计工程
|    |-- impl
|        |-- project_process_config.json        -->	工程参数配置文件
|    |-- src
|        |-- wrapper.vhd		        -->	工程顶层模块
|        |-- fontRom.vhd	 	        -->	工程源文件
|        |-- pixelOnText.vhd	 	        -->	工程源文件
|        |-- commonPak.vhd	 	        -->	工程源文件
|        |-- vga_text_generator.cst  	        -->	工程物理约束文件
|        |-- vga_text_generator.sdc  	        -->	工程时序约束文件
|        |-- vga_text_generator.gao  	        -->	工程gao配置文件

_______________________________________________________________________________
         vga_text_generator Readme
----------------------------------------------------------------------
Project description: A basic VGA text generator for printing text from FPGA to Monitor via VGA.
----------------------------------------------------------------------
Object device: GW1N-9, GW1N-LV9LQ100C6/I5
----------------------------------------------------------------------
File List:
----------------------------------------------------------------------
.
| -- project
|    `-- readme.txt			        -->	Read Me file (this file)
|    `-- vga_text_generator.gprj		-->	GowinYunYuan Project File
|    |-- impl
|        |-- project_process_config.json        -->	Parameter Configuration File
|    |-- src
|        |-- wrapper.vhd	 	        -->	Source File
|        |-- fontRom.vhd	 	        -->	Source File
|        |-- pixelOnText.vhd		        -->	Source File
|        |-- commonPak.vhd		        -->	Source File
|        |-- vga_text_generator.cst             -->	CST File
|        |-- vga_text_generator.sdc           	-->	SDC File
|        |-- vga_text_generator.gao             -->     GAO File

