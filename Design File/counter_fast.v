`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2023/12/07 13:30:08
// Design Name:
// Module Name: counter
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
module counter_fast(
input clk,
input rst_n,
output clk_bps
    );
    reg[14:0] cnt_first, cnt_second;
    always@(posedge clk, negedge rst_n)
    if (~rst_n)
    cnt_first <= 15'd0;
    else if (cnt_first==15'd10000)
    cnt_first <= 15'd0;
    else
    cnt_first <= cnt_first + 1'b1;
    always@(posedge clk, negedge rst_n)
    if (~rst_n)
    cnt_second <= 15'd0;
    else if (cnt_second==15'd5000)
        cnt_second <= 15'd0;
    else if (cnt_first ==15'd10000)
        cnt_second <= cnt_second +1'b1;
    else
        cnt_second <= cnt_second;
assign clk_bps = cnt_second == 15'd5000;
endmodule
