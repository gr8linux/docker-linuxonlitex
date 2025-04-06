_______________________________________________________________________________
         game阅读指南
----------------------------------------------------------------------
工程描述：工程设计采用Verilog代码编程实现。核心模块的实现依赖于状态机的建立。
         根据jump、reset等按钮开关等改变状态机的状态，进而改变Demon和工程的状态。
         背景和障碍物出现的依赖于计数器和时钟分频模块的实现。利用计数器根据时间改
         变背景和障碍物的移动速度，进而提升游戏难度。
----------------------------------------------------------------------
目标器件：GW1N-4，GW1N-LV4PG256C6/I5
----------------------------------------------------------------------
文件列表
----------------------------------------------------------------------
.
| -- project
|    `-- readme.txt			        -->	自述文件
|    `-- game.gprj		                -->	参考设计工程
|    |-- impl
|        |-- project_process_config.json        -->	工程参数配置文件
|    |-- src
|        |-- TOP.v		                -->	工程顶层模块
|        |-- VGA_640x480.v	                -->	工程源文件
|        |-- draw_demon1.v	                -->	工程源文件
|        |-- demon1.v		                -->	工程源文件
|        |-- clk_100ms.v		        -->	工程源文件
|        |-- clk_10ms.v		                -->	工程源文件
|        |-- clk_5ms.v		                -->	工程源文件
|        |-- clk_1ms.v		                -->	工程源文件
|        |-- clk_01ms.v		                -->	工程源文件
|        |-- game.cst   	                -->	工程物理约束文件
|        |-- game.sdc   	                -->	工程时序约束文件
|        |-- game.gao  	                        -->	工程gao配置文件

_______________________________________________________________________________
         game Readme
----------------------------------------------------------------------
Project description: The engineering design is realized by Verilog code programming. 
                     The implementation of the core module depends on the establishment 
                     of the state machine. Change the state of the state machine according 
                     to the button switches such as jump and reset, and then change the 
                     state of demon and the project. The appearance of background and obstacles 
                     depends on the implementation of counter and clock frequency division module. 
                     Use the counter to change the moving speed of the background and obstacles 
                     according to time, so as to improve the difficulty of the game.
----------------------------------------------------------------------
Object device: GW1N-4, GW1N-LV4PG256C6/I5
----------------------------------------------------------------------
File List:
----------------------------------------------------------------------
.
| -- project
|    `-- readme.txt			        -->	Read Me file (this file)
|    `-- game.gprj		                -->	GowinYunYuan Project File
|    |-- impl
|        |-- project_process_config.json        -->	Parameter Configuration File
|    |-- src
|        |-- TOP.v		                -->	Source File
|        |-- VGA_640x480.v	                -->	Source File
|        |-- draw_demon1.v	                -->	Source File
|        |-- demon1.v		                -->	Source File
|        |-- clk_100ms.v		        -->	Source File
|        |-- clk_10ms.v		                -->	Source File
|        |-- clk_5ms.v		                -->	Source File
|        |-- clk_1ms.v		                -->	Source File
|        |-- clk_01ms.v		                -->	Source File
|        |-- game.cst                           -->	CST File
|        |-- game.sdc                           -->	SDC File
|        |-- game.gao                           -->     GAO File

