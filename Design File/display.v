`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/09 18:55:22
// Design Name: 
// Module Name: Display
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

module Display(
    input [5:0] display_data,//data for display
    input [7:0] choose,
    output reg [7:0] seg_left,//left display
    output reg [7:0] seg_right//right display
);
always@(display_data)begin
    if(choose>8'b0000_1000)
      case(display_data)
      `dis0 : seg_left = `tub0;//0
      `dis1 : seg_left = `tub1;//1
      `dis2 : seg_left = `tub2;//2
      `dis3 : seg_left = `tub3;//3
      `dis4 : seg_left = `tub4;//4
      `dis5 : seg_left = `tub5;//5
      `dis6 : seg_left = `tub6;//6
      `dis7 : seg_left = `tub7;//7
      `dis8 : seg_left = `tub8;//8
      `dis9 : seg_left = `tub9;//9
      `dis10 : seg_left = `tub10;//F
      `dis11 : seg_left = `tub11;//A
      `dis12 : seg_left = `tub12;//S
      `dis13 : seg_left = `tub13;//l
      `dis14 : seg_left = `tub14;//o
      `dis15 : seg_left = `tub15;//H
      `dis16 : seg_left = `tub16;//i
      `dis17 : seg_left = `tub17;//g
      `dis18 : seg_left = `tub18;//h
      `dis19 : seg_left = `tub19;//E
      `dis20 : seg_left = `tub20;//r
      `dis21 : seg_left = `tub21;//c
      `dis22 : seg_left = `tub22;//d
      `dis23 : seg_left = `tub23;//e
    endcase
    else
      case(display_data)
      `dis0 : seg_right = `tub0;//0
      `dis1 : seg_right = `tub1;//1
      `dis2 : seg_right = `tub2;//2
      `dis3 : seg_right = `tub3;//3
      `dis4 : seg_right = `tub4;//4
      `dis5 : seg_right = `tub5;//5
      `dis6 : seg_right = `tub6;//6
      `dis7 : seg_right = `tub7;//7
      `dis8 : seg_right = `tub8;//8
      `dis9 : seg_right = `tub9;//9
      `dis10 : seg_right = `tub10;//F
      `dis11 : seg_right = `tub11;//A
      `dis12 : seg_right = `tub12;//S
      `dis13 : seg_right = `tub13;//l
      `dis14 : seg_right = `tub14;//o
      `dis15 : seg_right = `tub15;//H
      `dis16 : seg_right = `tub16;//i
      `dis17 : seg_right = `tub17;//g
      `dis18 : seg_right = `tub18;//h
      `dis19 : seg_right = `tub19;//E
      `dis20 : seg_right = `tub20;//r
      `dis21 : seg_right = `tub21;//c
      `dis22 : seg_right = `tub22;//d
      `dis23 : seg_right = `tub23;//e
    endcase
end
endmodule
