`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2023/12/26 08:17:40
// Design Name:
// Module Name: record
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

module record(
input sys_clk,
input rst_n,//deletion record
input rst,//replay
input [2:0] mode,
input [6:0] note_in,//hot Note input
output reg [2:0] note_num_out//Note output
    );
reg [6:0] index;//Record array index
//The length of the array to record the recording
integer i;
reg [2:0] note_data_in [127:0];//memory note
reg [9:0] cnt_data_in [127:0];//counter for record
wire clk;
counter_100HZ c(sys_clk, rst_n, clk);
always@(posedge clk, negedge rst_n) begin//record
if(!rst_n) begin
for (i = 0; i < 128 ;i = i + 1) begin
note_data_in[i] <= 0;
cnt_data_in[i] <= 0;
end
end
else if (mode == `mode_record)begin
case(note_in)
`h_do: note_data_in[index] <= `n_do;
`h_re: note_data_in[index] <= `n_re;
`h_mi: note_data_in[index] <= `n_mi;
`h_fa: note_data_in[index] <= `n_fa;
`h_so: note_data_in[index] <= `n_so;
`h_la: note_data_in[index] <= `n_la;
`h_q1: note_data_in[index] <= `n_q1;
default: note_data_in[index] <= `n_space;
endcase
cnt_data_in[index] <= cnt_data_in[index] + 1;
end
end

reg [6:0] now_note;
reg [6:0] next_note;
always@(posedge clk , negedge rst_n) begin//Determine state transitions, i.e. note input transitions
if(!rst_n) begin
now_note <= 0;
next_note <= 0;
end
else if (mode == `mode_record) begin
now_note <= next_note;
next_note <= note_in;
end
end

always@(negedge clk, negedge rst_n) begin//Index incrementally by note transformation
if(!rst_n)begin
index <= 0;
end else if (mode == `mode_record) begin
if(now_note != next_note) begin
index <= index + 1;
end
end
end

reg [9:0] counter;
reg [6:0] r_index;
always@ (posedge clk, negedge rst, negedge rst_n) begin//play recording
if(!rst | !rst_n) begin
note_num_out <= 0;
counter <= 0;
r_index <= 0;
end else if (mode == `mode_read) begin
if(r_index <= index)begin
if(counter <= cnt_data_in[r_index])begin
counter <= counter + 1;
note_num_out <= note_data_in[r_index];
end else begin
r_index <= r_index + 1;
counter <= 0;
end
end else
note_num_out <= 0;
end
end

endmodule
