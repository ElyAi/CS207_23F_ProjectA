`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/05 00:39:02
// Design Name: 
// Module Name: Buzzer
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

module Buzzer (
 input wire clk , // Clock signal
 input wire [2:0] free_note,
 input wire [2:0] auto_note,
 input wire [2:0] study_note,
 input wire [2:0] record_note,
 input wire [2:0] adjust_note,
 input [2:0] mode,
 input [1:0] auto_octave,
 input [1:0] note_control,// 01 low_note 10high_note
 output wire speaker// Buzzer output signal
 ) ;
wire [31:0] notes [7:0];
wire [31:0] low_notes [7:0];
wire [31:0] high_notes [7:0];
reg [31:0] counter;
reg pwm ;
 // Frequencies of do , re , mi , fa , so , la , si
 // Obtain the ratio of how long the buzzer should be active in one second
assign notes [1]=`note1;
assign notes [2]=`note2;
assign notes [3]=`note3;
assign notes [4]=`note4;
assign notes [5]=`note5;
assign notes [6]=`note6;
assign notes [7]=`note7;
assign low_notes [1]=`low_note1;
assign low_notes [2]=`low_note2;
assign low_notes [3]=`low_note3;
assign low_notes [4]=`low_note4;
assign low_notes [5]=`low_note5;
assign low_notes [6]=`low_note6;
assign low_notes [7]=`low_note7;
assign high_notes [1]=`high_note1;
assign high_notes [2]=`high_note2;
assign high_notes [3]=`high_note3;
assign high_notes [4]=`high_note4;
assign high_notes [5]=`high_note5;
assign high_notes [6]=`high_note6;
assign high_notes [7]=`high_note7;
initial begin
    pwm=0;
end
always@(posedge clk)begin
    if(mode==`mode_free)begin//Buzzer in free
        if(note_control[1])begin//Buzzer for low note
            if (counter<low_notes[free_note]||free_note ==1'b0)begin
            counter <= counter + 1'b1 ;
            end
            else begin
            pwm=~pwm ;
            counter<=0;
            end
        end
        else if(note_control[0])begin//Buzzer for High note
            if (counter<high_notes[free_note]||free_note ==1'b0)begin
            counter <= counter + 1'b1 ;
            end
            else begin
            pwm=~pwm ;
            counter<=0;
            end
        end
        else begin//Buzzer for normal note
            if (counter<notes[free_note]||free_note ==1'b0)begin
            counter <= counter + 1'b1 ;
            end
            else begin
            pwm=~pwm ;
            counter<=0;
            end
        end
    end
    else if(mode==`mode_auto)begin//Buzzer in Auto
      if(auto_octave == `Low_note)begin//Buzzer for low note
        if (counter<low_notes[auto_note]||auto_note ==1'b0)begin
        counter <= counter + 1'b1 ;
        end
        else begin
        pwm=~pwm ;
        counter<=0;
        end
    end
    else if(auto_octave == `High_note)begin//Buzzer for high note
        if (counter<high_notes[auto_note]||auto_note ==1'b0)begin
        counter <= counter + 1'b1 ;
        end
        else begin
        pwm=~pwm ;
        counter<=0;
        end
    end
    else begin//Buzzer for normal note
        if (counter<notes[auto_note]||auto_note ==1'b0)begin
        counter <= counter + 1'b1 ;
        end
        else begin
        pwm=~pwm ;
        counter<=0;
        end
    end
    end
    else if(mode==`mode_study)begin//Buzzer in study 
        if (counter<notes[study_note]||study_note ==1'b0)begin
            counter <= counter + 1'b1 ;
        end
        else begin
            pwm=~pwm ;
            counter<=0;
        end
       end
    else if(mode==`mode_record)begin
          if (counter<notes[free_note]||free_note ==1'b0)begin
                      counter <= counter + 1'b1 ;
                end
                else begin
                    pwm=~pwm ;
                    counter<=0;
                end
    end
    else if(mode==`mode_read)begin//Buzzer in read
          if (counter<notes[record_note]||record_note ==1'b0)begin
          counter <= counter + 1'b1 ;
      end
      else begin
          pwm=~pwm ;
          counter<=0;
      end
    end
    else if(mode==`mode_adjust)begin
        if (counter<notes[adjust_note]||adjust_note ==1'b0)begin
          counter <= counter + 1'b1 ;
      end
      else begin
          pwm=~pwm ;
          counter<=0;
      end
    end
    else begin
    end
end
assign speaker=pwm ; // Output a PWM signal to the buzzer
endmodule