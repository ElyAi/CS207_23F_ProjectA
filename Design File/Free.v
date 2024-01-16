`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/05 00:38:11
// Design Name: 
// Module Name: Free
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

module Free(
    input clk,EN,
    input [2:0] mode,
    input [6:0] free_note,//note in free mode
    input [6:0] new_note1,
    input [6:0] new_note2,
    input [6:0] new_note3,
    input [6:0] new_note4,
    input [6:0] new_note5,
    input [6:0] new_note6,
    input [6:0] new_note7,
    output reg [2:0] num_note,
    output reg [6:0] led_note_control
);
always@(posedge clk)begin
    if(mode==`mode_free || mode==`mode_record)begin
        if(EN)begin
            case(free_note)//led in free mode
                `h_space:begin
                    num_note<=`n_space;
                    led_note_control<=`h_space;
                end
                new_note1:begin
                    num_note<=`n_do;//do
                    led_note_control<=new_note1;
                end
                new_note2:begin
                    num_note<=`n_re;//re
                    led_note_control<=new_note2;
                end
                new_note3:begin
                    num_note<=`n_mi;//mi
                    led_note_control<=new_note3;
                end
                new_note4:begin
                    num_note<=`n_fa;//fa
                    led_note_control<=new_note4;
                end
                new_note5:begin
                    num_note<=`n_so;//so
                    led_note_control<=new_note5;
                end
                new_note6:begin
                    num_note<=`n_la;//la
                    led_note_control<=new_note6;
                end
                new_note7:begin
                    num_note<=`n_q1;//xi
                    led_note_control<=new_note7;
                end
            endcase
        end
        else begin
            num_note<=`n_space;
            led_note_control<=`h_space;
        end
    end
end
endmodule