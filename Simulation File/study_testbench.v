`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2023/12/27 21:02:12
// Design Name:
// Module Name: study_testbench
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


module study_testbench();
reg clk, rst_n, user_store, model_selection;
reg [6:0] user_input;
reg [2:0] user_selection;
wire [6:0] leds;
wire [2:0] num_note;
wire [4:0] cnt;
wire [4:0] record;
new_study_model model (clk, rst_n, user_input, user_selection, user_store, model_selection, leds, num_note, cnt, record);
initial begin
rst_n = 1'b0;
user_input = 7'b0000000;
model_selection = 1'b0;
user_store = 1'b0;
clk = 1'b0;
user_selection = 3'b000;
forever #5 clk = ~clk;
end
initial fork
#10 rst_n = 1'b1;
#30 rst_n = 1'b0;
#50 rst_n = 1'b1;
#80 user_selection = 3'b010;
join
endmodule
