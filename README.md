# CS207 Project A 钢琴学习机
个人感觉这个project难度不大，不过前期工作有些难以进行，在后续课程学习中会愈发觉得这个project好写。
但verilog的debug真难--很多时候都是看着代码逻辑没有任何问题，跑出来的仿真也是所期望的波形，一在顶层模块里例化就有奇怪的bug。

一些建议：对子模块的代码编写尽可能将一个较长的逻辑判断拆解成多个短的逻辑语块，当出现仿真正确，上板操作却感觉代码逻辑混乱，或许可以换一个较慢的时钟信号来替代（我record里面的bug就是这么解决的）。

该项目最终获得成绩为 `118.625/120`   
对应报告部分得分 `10/10`  
bonus得分 `13/15`  
基础部分得分 `90/90`
