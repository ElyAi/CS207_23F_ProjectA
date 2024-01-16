`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/09 18:54:20
// Design Name: 
// Module Name: Arrange
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "constant.v"
module Arrange(
    input [2:0] disp_bit,
    input [5:0] disp_dat0,
    input [5:0] disp_dat1,
    input [5:0] disp_dat2,
    input [5:0] disp_dat3,
    input [5:0] disp_dat4,
    input [5:0] disp_dat5,
    input [5:0] disp_dat6,
    input [5:0] disp_dat7,
    output reg [5:0] disp_dat,
    output reg [7:0] choose=`ch8
    );
    always@(disp_bit)
    begin
     case (disp_bit)
       `n_space :
       begin
           disp_dat=disp_dat0;
           choose=`ch0;
       end
       `n_do :
       begin
           disp_dat=disp_dat1;
           choose=`ch1;
       end
       `n_re :
       begin
           disp_dat=disp_dat2;
           choose=`ch2;
       end
       `n_mi :
       begin
           disp_dat=disp_dat3;
           choose=`ch3;
       end
       `n_fa :
       begin
           disp_dat=disp_dat4;
           choose=`ch4;
       end
       `n_so :
       begin
           disp_dat=disp_dat5;
           choose=`ch5;
       end
       `n_la :
       begin
           disp_dat=disp_dat6;
           choose=`ch6;
       end
       `n_q1 :
       begin
           disp_dat=disp_dat7;
           choose=`ch7;
       end
   endcase
end
endmodule
