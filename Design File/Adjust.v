`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/27 21:17:33
// Design Name: 
// Module Name: Adjust
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

module Adjust(
    input sys_clk,rst_n,
    input [6:0] note,
    input [2:0] mode,
    output reg [6:0] new_note1 = `h_do,
    output reg [6:0] new_note2 = `h_re,
    output reg [6:0] new_note3 = `h_mi,
    output reg [6:0] new_note4 = `h_fa,
    output reg [6:0] new_note5 = `h_so,
    output reg [6:0] new_note6 = `h_la,
    output reg [6:0] new_note7 = `h_q1,
    output reg [2:0] cnt
);

    wire clk;
    counter_100HZ c1(sys_clk, rst_n, clk);

reg [6:0] now_note;
reg [6:0] next_note;
always@(posedge clk , negedge rst_n) begin//Determine state transitions, i.e. note input transitions
if(!rst_n) begin
now_note <= 0;
next_note <= 0;
end
else if (mode == `mode_adjust) begin
now_note <= next_note;
next_note <= note;
end
end

always@(negedge clk, negedge rst_n) begin//Index incrementally by note transformation
if(!rst_n)begin
cnt <= 1;
end else if (mode == `mode_adjust) begin
if(now_note != next_note & next_note==0) begin
cnt <= cnt + 1;
end else
cnt <= cnt;
end
end

always@(posedge clk,negedge rst_n)begin
    if(!rst_n)begin
    cnt <= 1;
    new_note1<=`h_do;
    new_note2<=`h_re;
    new_note3<=`h_mi;
    new_note4<=`h_fa;
    new_note5<=`h_so;
    new_note6<=`h_la;
    new_note7<=`h_q1;
    end else if (mode == `mode_adjust)begin
    case(cnt)
    `n_do:new_note1<=now_note;
    `n_re:new_note2<=now_note;
    `n_mi:new_note3<=now_note;
    `n_fa:new_note4<=now_note;
    `n_so:new_note5<=now_note;
    `n_la:new_note6<=now_note;
    `n_q1:new_note7<=now_note;
    endcase
    end else begin
      cnt <= 1;
      new_note1<=`h_do;
      new_note2<=`h_re;
      new_note3<=`h_mi;
      new_note4<=`h_fa;
      new_note5<=`h_so;
      new_note6<=`h_la;
      new_note7<=`h_q1;
    end
end
endmodule
