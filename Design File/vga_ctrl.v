`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/22 22:56:30
// Design Name: 
// Module Name: vga_ctrl
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
//This module is the control module whose purpose is to obtain the location of the field scan and line scan
module vga_ctrl(
input clk,
input rst_n,
input [11:0] pix_data,//VGA display information
output reg [9:0] pix_x,//x of the valid region
output reg [9:0] pix_y,//y of the valid region
output reg hsync,
output reg vsync,
output reg [11:0] rgb
    );
reg [9:0] cnt_h;//row counter
reg [9:0] cnt_v;//Field counter
reg rgb_valid;//VGA valid area - Easy to determine pix_x and pix_y

always@ (posedge clk, negedge rst_n)//control cnt_h
if(!rst_n)
cnt_h <= 0;
else if(cnt_h < `H_TOTAL)
cnt_h <= cnt_h + 1;
else
cnt_h <= 0;

always@ (posedge clk, negedge rst_n)//control cnt_v
if(!rst_n)
cnt_v <= 0;
else if(cnt_v < `V_TOTAL && cnt_h >= `H_TOTAL)
cnt_v <= cnt_v + 1;
else if(cnt_v >= `V_TOTAL)
cnt_v <= 0;
else
cnt_v <= cnt_v;
   
always@ (*)//rgb_valid control
if((cnt_h >= `H_SYNC + `H_BACK + `H_LEFT) && (cnt_h <= `H_SYNC + `H_BACK + `H_LEFT + `H_VALID) &&
    (cnt_v >= `V_SYNC + `V_BACK + `V_TOP) && (cnt_v <= `V_SYNC + `V_BACK + `V_TOP + `V_VALID))
rgb_valid = 1;
else 
rgb_valid = 0;
    
always@ (*)//pix_x and pix_y generate
if(rgb_valid == 1)begin
pix_x = cnt_h - (`H_SYNC + `H_BACK + `H_LEFT);
pix_y = cnt_v - (`V_SYNC + `V_BACK + `V_TOP);
end else begin
pix_x = 0;
pix_y = 0;
end
    
always@ (*)
if(!rst_n)
hsync = 0;
else if(cnt_h <= `H_SYNC - 1)
hsync = 1;
else
hsync = 0;
    
always@ (*)
if(!rst_n)
vsync = 0;
else if(cnt_v <= `V_SYNC - 1)
vsync = 1;
else
vsync = 0;
    
always@ (*)  //Assign display data to VGA
if(rgb_valid == 1)
rgb = pix_data;
else
rgb = 12'h000;

endmodule
