`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/09 23:05:33
// Design Name: 
// Module Name: Led
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

module Led(
    input [6:0] free_note_control,
    input [6:0] auto_note_control,
    input [6:0] study_note_control,
    input [2:0] record_note,
    input [2:0] mode,
    input [2:0] select,
    input EN,
    input [1:0] low_note_control,
    output reg led_low_note_control,
    output reg led_high_note_control,
    output reg [2:0] led_select,
    output reg [6:0] led_note,
    output reg [2:0] led_mode
);
always@(*)begin
    //led for mode and note
    if(mode==`mode_free)begin
        led_mode=`mode_free;
        if(EN)
            led_note=free_note_control;

    end
    else if(mode==`mode_auto)begin
         led_mode=`mode_auto;
         led_note = auto_note_control;
    end
    else if(mode==`mode_study)begin
        led_mode=`mode_study;
        led_note = study_note_control;
    end
    else if(mode==`mode_record)begin
    led_mode = `mode_record;
    led_note=free_note_control;
    end
    else if(mode==`mode_read)begin
    led_mode = `mode_read;
    case(record_note)
       `n_do: led_note = `h_do;
       `n_re: led_note = `h_re;
       `n_mi: led_note = `h_mi;
       `n_fa: led_note = `h_fa;
       `n_so: led_note = `h_so;
       `n_la: led_note = `h_la;
       `n_q1: led_note = `h_q1;
       default: led_note = `h_space;
                endcase
    end
    else if(mode==`mode_adjust)begin
        led_mode=`mode_adjust;
    end
    else begin
        led_mode=`mode_space;
        led_note=`h_space;
    end
    //led for HighLow control
    if(low_note_control[1]&&!low_note_control[0]) led_low_note_control=1;
    else if(low_note_control[0]&&!low_note_control[1]) led_high_note_control=1;
    else begin
        led_low_note_control=0;
        led_high_note_control=0;
    end
    //led for select
    if(select[0]&&!select[1]&&!select[2]) led_select[0]=1;
    else if(!select[0]&&select[1]&&!select[2]) led_select[1]=1;
    else if(!select[0]&&!select[1]&&select[2]) led_select[2]=1;
    else led_select=`mode_space;
end
endmodule
