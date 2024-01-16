`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2023/12/06 21:12:13
// Design Name:
// Module Name: AutoPlay_sim
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


module AutoPlay_sim( );
reg clk;
reg rst_n;
reg [2:0] select;
wire [6:0] led;
wire speaker;
AutoPlayModule AP(clk, rst_n, select, led, speaker);
initial begin
clk = 0;
rst_n = 0;
select = 1;
#2 rst_n = 1;
end
always@ (*) begin
forever #5 clk = ~clk;
end
endmodule
