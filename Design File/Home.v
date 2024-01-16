`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/05 00:37:30
// Design Name: 
// Module Name: Home
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

module Home(
    input clk,rst_n,rst,
    input [6:0] note,
    input [2:0] mode,//F 001,A 010,S 100,Ad 101,record 011,read 111
    input [1:0] low_note_control,//10low,01high
    input [2:0] select,
    output [2:0] led_select,
    output [2:0] led_mode,
    output [6:0] led_note,
    output [7:0] seg_left,
    output [7:0] seg_right,
    output [7:0] choose,
    output led_low_note_control,
    output led_high_note_control,
    output speaker,
    output hsync,
    output vsync,
    output [11:0] vga_rgb,
    output vol
);
assign vol = 1;
reg [18:0] divclk_cnt = 0;
reg divclk = 0;
reg [2:0] disp_bit=0;
reg [16:0] state;//000_000_000_000_00_000,mode_select_point_record_HighLow_note
reg [5:0] dis_3,dis_2,dis_1;
reg [5:0] r_dis4,r_dis3,r_dis2,r_dis1;
wire [6:0] new_note1;
wire [6:0] new_note2;
wire [6:0] new_note3;
wire [6:0] new_note4;
wire [6:0] new_note5;
wire [6:0] new_note6;
wire [6:0] new_note7;
wire [2:0] free_num_note;//number for note in free mode
wire [2:0] auto_num_note;//number for note in auto mode
wire [2:0] study_num_note;//number for note in study mode
wire [2:0] record_num_note;//number for note in record mode
wire [2:0] adjust_num_note;//number for note in adjust mode
wire [4:0] cnt;//point in study mode
wire [4:0] record;//record in study mode
wire [6:0] led_free_note_control;//led in free mode
wire [6:0] led_auto_note_control;//led in auto mode
wire [6:0] led_study_note_control;//led in study mode
wire [1:0] auto_octave;//HighLow control in auto mode
wire [5:0] display_data;
wire [5:0] display0;
wire [5:0] display1;
wire [5:0] display2;
wire [5:0] display3;
wire [5:0] display4;
wire [5:0] display5;
wire [5:0] display6;
wire [5:0] display7;
    Free free(clk,rst_n,mode,note,new_note1,new_note2,new_note3,new_note4,new_note5,new_note6,new_note7,free_num_note,led_free_note_control);
    AutoPlayModule auto(clk,rst_n,select,auto_octave,auto_num_note,led_auto_note_control);
    new_study_model study(clk,rst_n,rst,note,select,low_note_control[0],low_note_control[1],led_study_note_control,study_num_note, cnt, record);
    record r(clk, rst_n, rst, mode, note, record_num_note);
    Adjust Ad(clk,rst_n, note,mode,new_note1,new_note2,new_note3,new_note4,new_note5,new_note6,new_note7,adjust_num_note);


    Buzzer buzzer(clk,free_num_note,auto_num_note,study_num_note,record_num_note,adjust_num_note,mode,auto_octave,low_note_control,speaker);
    Shift s(state,r_dis4,r_dis3,r_dis2,r_dis1,dis_3,dis_2,dis_1,clk,display0,display1,display2,display3,display4,display5,display6,display7);
    Arrange a(disp_bit,display0,display1,display2,display3,display4,display5,display6,display7,display_data,choose);
    Display d(display_data,choose,seg_left,seg_right);
    Led l(led_free_note_control,led_auto_note_control,led_study_note_control,record_num_note,mode,select,rst_n,low_note_control,led_low_note_control,led_high_note_control,led_select,led_note,led_mode);
    VGA v(clk, rst_n, mode, select, hsync, vsync, vga_rgb);


   always@(posedge divclk) begin//Frequency Divider for display
        if(disp_bit >= 7)
            disp_bit<=0;
         else
            disp_bit<=disp_bit+1'b1;
    end
    always@(posedge clk)
    begin
        if(divclk_cnt==`maxcnt)
        begin
            divclk<=~divclk;
            divclk_cnt<=0;
        end
        else
        begin
            divclk_cnt<=divclk_cnt+1'b1;
        end
    end
    always@(posedge clk) begin//number the state
        //display in free note
        if(mode==`mode_free)begin
            case(note)
                `h_space:state[2:0]<=`n_space;
                `h_do:state[2:0]<=`n_do;
                `h_re:state[2:0]<=`n_re;
                `h_mi:state[2:0]<=`n_mi;
                `h_fa:state[2:0]<=`n_fa;
                `h_so:state[2:0]<=`n_so;
                `h_la:state[2:0]<=`n_la;
                `h_q1:state[2:0]<=`n_q1;
            endcase
        end
         //display in auto mode
        else if(mode==`mode_auto)begin
                case(auto_num_note)
                   `n_space:state[2:0]<=`n_space;
                   `n_do:state[2:0]<=`n_do;
                   `n_re:state[2:0]<=`n_re;
                   `n_mi:state[2:0]<=`n_mi;
                   `n_fa:state[2:0]<=`n_fa;
                   `n_so:state[2:0]<=`n_so;
                   `n_la:state[2:0]<=`n_la;
                   `n_q1:state[2:0]<=`n_q1;
               endcase
               end
        else state[2:0]<=3'b000;
        //display for HighLow control
        if(mode==`mode_free)begin
            if(low_note_control[1]) state[4]<=1'b1;
            else state[4]<=1'b0;
            if(low_note_control[0]) state[3]<=1'b1;
            else state[3]<=1'b0;
        end
        else begin
            state[4:3]<=2'b00;
        end
    end
    always@(posedge clk) begin
        //display for select in auto mode
        if(mode==`n_re)
            case(select)
                `n_space:state[13:11]<=`sel_s0;
                `n_do:state[13:11]<=`sel_s1;
                `n_re:state[13:11]<=`sel_s2;
                `n_fa:state[13:11]<=`sel_s3;
            endcase

    end
    always@(posedge clk) begin
        //display for points in study mode
        if(mode==`n_fa)begin
            if(cnt<=`cnt5) state[10:8]<=`n_do;
            else if(cnt>=`cnt6&&cnt<=`cnt10)state[10:8]<=`n_re;
            else if(cnt>=`cnt11&&cnt<=`cnt15)state[10:8]<=`n_mi;
            else if(cnt>=`cnt16)state[10:8]<=`n_fa;
        end
        else state[10:8]<=3'b000;
        if(mode==`n_fa)begin
            if(low_note_control[0])begin
                state[10:8]<=`n_space;
            end
        end
    end
    always@(posedge clk) begin
        //display for record in study mode
        if(mode==`n_fa)begin
            if(record<=`cnt5) state[7:5]<=`n_do;
            else if(record>=`cnt6&&record<=`cnt10)state[7:5]<=`n_re;
            else if(record>=`cnt11&&record<=`cnt15)state[7:5]<=`n_mi;
            else if(record>=`cnt16)state[7:5]<=`n_fa;
        end
        else state[7:5]<=3'b000;
        if(mode==`n_fa)begin
            if(low_note_control[0])begin
                state[7:5]<=`n_space;
            end
        end
    end
    always@(posedge clk)begin
        //display for mode
        case(mode)
           `n_do:state[16:14]<=`mode_free;//FreePlay
           `n_re:state[16:14]<=`mode_auto;//AutoPlay
           `n_mi:state[16:14]<=`mode_record;//Record
           `n_fa:state[16:14]<=`mode_study;//Study
           `n_so:state[16:14]<=`mode_adjust;//Adjust
           `n_q1:state[16:14]<=`mode_read;//Play
           default:state[16:14]<=`mode_space;
        endcase
    end
    always@(posedge clk)begin
        //Score Assignment
        case(cnt)
            `cnt0:
            begin
                dis_3<=`dis1;
                dis_2<=`dis0;
                dis_1<=`dis0;
            end
            `cnt1:
            begin
                dis_3<=`dis0;
                dis_2<=`dis9;
                dis_1<=`dis8;
            end
            `cnt2:
            begin
                dis_3<=`dis0;
                dis_2<=`dis9;
                dis_1<=`dis6;
            end
            `cnt3:
            begin
                dis_3<=`dis0;
                dis_2<=`dis9;
                dis_1<=`dis4;
            end
            `cnt4:
            begin
                dis_3<=`dis0;
                dis_2<=`dis9;
                dis_1<=`dis2;
            end
            `cnt5:
            begin
                dis_3<=`dis0;
                dis_2<=`dis9;
                dis_1<=`dis0;
            end
            `cnt6:
            begin
                dis_3<=`dis0;
                dis_2<=`dis8;
                dis_1<=`dis8;
            end
            `cnt7:
            begin
                dis_3<=`dis0;
                dis_2<=`dis8;
                dis_1<=`dis6;
            end
            `cnt8:
            begin
                dis_3<=`dis0;
                dis_2<=`dis8;
                dis_1<=`dis4;
            end
            `cnt9:
            begin
                dis_3<=`dis0;
                dis_2<=`dis8;
                dis_1<=`dis2;
            end
            `cnt10:
            begin
                dis_3<=`dis0;
                dis_2<=`dis8;
                dis_1<=`dis0;
            end
            `cnt11:
            begin
                dis_3<=`dis0;
                dis_2<=`dis7;
                dis_1<=`dis8;
            end
            `cnt12:
            begin
                dis_3<=`dis0;
                dis_2<=`dis7;
                dis_1<=`dis6;
            end
            `cnt13:
            begin
                dis_3<=`dis0;
                dis_2<=`dis7;
                dis_1<=`dis4;
            end
            `cnt14:
            begin
                dis_3<=`dis0;
                dis_2<=`dis7;
                dis_1<=`dis2;
            end
            `cnt15:
            begin
                dis_3<=`dis0;
                dis_2<=`dis7;
                dis_1<=`dis0;
            end
            `cnt16:
            begin
                dis_3<=`dis0;
                dis_2<=`dis6;
                dis_1<=`dis8;
            end
            `cnt17:
            begin
                dis_3<=`dis0;
                dis_2<=`dis6;
                dis_1<=`dis6;
            end
            `cnt18:
            begin
                dis_3<=`dis0;
                dis_2<=`dis6;
                dis_1<=`dis4;
            end
            `cnt19:
            begin
                dis_3<=`dis0;
                dis_2<=`dis6;
                dis_1<=`dis2;
            end
            `cnt20:
            begin
                dis_3<=`dis0;
                dis_2<=`dis6;
                dis_1<=`dis0;
            end
        endcase
    end

    always@(posedge clk)begin
        //Record Assignment
        case(record)
            `cnt0:
            begin
                r_dis4<=`dis21;
                r_dis3<=`dis1;
                r_dis2<=`dis0;
                r_dis1<=`dis0;
            end
            `cnt1:
            begin
                r_dis4<=`dis21;
                r_dis3<=`dis0;
                r_dis2<=`dis9;
                r_dis1<=`dis8;
            end
            `cnt2:
            begin
                r_dis4<=`dis21;
                r_dis3<=`dis0;
                r_dis2<=`dis9;
                r_dis1<=`dis6;
            end
            `cnt3:
            begin
                r_dis4=`dis21;
                r_dis3<=`dis0;
                r_dis2<=`dis9;
                r_dis1<=`dis4;
            end
            `cnt4:
            begin
                r_dis4<=`dis21;
                r_dis3<=`dis0;
                r_dis2<=`dis9;
                r_dis1<=`dis2;
            end
            `cnt5:
            begin
                r_dis4<=`dis21;
                r_dis3<=`dis0;
                r_dis2<=`dis9;
                r_dis1<=`dis0;
            end
            `cnt6:
            begin
                r_dis4<=`dis22;
                r_dis3<=`dis0;
                r_dis2<=`dis8;
                r_dis1<=`dis8;
            end
            `cnt7:
            begin
                r_dis4<=`dis22;
                r_dis3<=`dis0;
                r_dis2<=`dis8;
                r_dis1<=`dis6;
            end
            `cnt8:
            begin
                r_dis4<=`dis22;
                r_dis3<=`dis0;
                r_dis2<=`dis8;
                r_dis1<=`dis4;
            end
            `cnt9:
            begin
                r_dis4<=`dis22;
                r_dis3<=`dis0;
                r_dis2<=`dis8;
                r_dis1<=`dis2;
            end
            `cnt10:
            begin
                r_dis4<=`dis22;
                r_dis3<=`dis0;
                r_dis2<=`dis8;
                r_dis1<=`dis0;
            end
            `cnt11:
            begin
                r_dis4<=`dis19;
                r_dis3<=`dis0;
                r_dis2<=`dis7;
                r_dis1<=`dis8;
            end
            `cnt12:
            begin
                r_dis4<=`dis19;
                r_dis3<=`dis0;
                r_dis2<=`dis7;
                r_dis1<=`dis6;
            end
            `cnt13:
            begin
                r_dis4<=`dis19;
                r_dis3<=`dis0;
                r_dis2<=`dis7;
                r_dis1<=`dis4;
            end
            `cnt14:
            begin
                r_dis4<=`dis19;
                r_dis3<=`dis0;
                r_dis2<=`dis7;
                r_dis1<=`dis2;
            end
            `cnt15:
            begin
                r_dis4<=`dis19;
                r_dis3<=`dis0;
                r_dis2<=`dis7;
                r_dis1<=`dis0;
            end
            `cnt16:
            begin
                r_dis4<=`dis10;
                r_dis3<=`dis0;
                r_dis2<=`dis6;
                r_dis1<=`dis8;
            end
            `cnt17:
            begin
                r_dis4<=`dis10;
                r_dis3<=`dis0;
                r_dis2<=`dis6;
                r_dis1<=`dis6;
            end
            `cnt18:
            begin
                r_dis4<=`dis10;
                r_dis3<=`dis0;
                r_dis2<=`dis6;
                r_dis1<=`dis4;
            end
            `cnt19:
            begin
                r_dis4<=`dis10;
                r_dis3<=`dis0;
                r_dis2<=`dis6;
                r_dis1<=`dis2;
            end
            `cnt20:
            begin
                r_dis4<=`dis10;
                r_dis3<=`dis0;
                r_dis2<=`dis6;
                r_dis1<=`dis0;
            end
            default:
               begin
                         r_dis4<=`dis10;
                         r_dis3<=`dis0;
                         r_dis2<=`dis6;
                         r_dis1<=`dis0;
                     end
        endcase
    end
endmodule
