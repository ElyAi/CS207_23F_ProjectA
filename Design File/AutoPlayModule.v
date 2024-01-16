`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2023/12/02 18:35:05
// Design Name:
// Module Name: AutoPlayModule
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

module AutoPlayModule(
input wire clk,
input wire rst_n,
input wire [2:0] select, //Song selection
output reg [1:0] octave, //Song octave
output reg [2:0] notes,//Output current note
output reg [6:0] led_note//Output the current led status
    );
    integer length; // Record the length of the array
    integer i;
    reg [2:0] song_notes [63:0];
    reg [4:0] song_durations [63:0];
    reg [1:0] song_octave [63:0];

    always @ (*) begin
    case(select)
    `sel_s1: begin //Little star  001
    length = 42;
    song_notes[0] = 1; song_notes[1] = 1; song_notes[2] = 5; song_notes[3] = 5; song_notes[4] = 6; song_notes[5] = 6; song_notes[6] = 5;
    song_notes[7] = 4; song_notes[8] = 4; song_notes[9] = 3; song_notes[10] = 3; song_notes[11] = 2; song_notes[12] = 2; song_notes[13] = 1;
    song_notes[14] = 5; song_notes[15] = 5; song_notes[16] = 4; song_notes[17] = 4; song_notes[18] = 3; song_notes[19] = 3; song_notes[20] = 2;
    song_notes[21] = 5; song_notes[22] = 5; song_notes[23] = 4; song_notes[24] = 4; song_notes[25] = 3; song_notes[26] = 3; song_notes[27] = 2;
    song_notes[28] = 1; song_notes[29] = 1; song_notes[30] = 5; song_notes[31] = 5; song_notes[32] = 6; song_notes[33] = 6; song_notes[34] = 5;
    song_notes[35] = 4; song_notes[36] = 4; song_notes[37] = 3; song_notes[38] = 3; song_notes[39] = 2; song_notes[40] = 2; song_notes[41] = 1;

    song_durations[0] = 4; song_durations[1] = 4;  song_durations[2] = 4;  song_durations[3] = 4;  song_durations[4] = 4;  song_durations[5] = 4;  song_durations[6] = 8;
    song_durations[7] = 4; song_durations[8] = 4;  song_durations[9] = 4;  song_durations[10] = 4;  song_durations[11] = 4;  song_durations[12] = 4;  song_durations[13] = 8;
    song_durations[14] = 4; song_durations[15] = 4;  song_durations[16] = 4;  song_durations[17] = 4;  song_durations[18] = 4;  song_durations[19] = 4;  song_durations[20] = 8;
    song_durations[21] = 4; song_durations[22] = 4;  song_durations[23] = 4;  song_durations[24] = 4;  song_durations[25] = 4;  song_durations[26] = 4;  song_durations[27] = 8;
    song_durations[28] = 4; song_durations[29] = 4;  song_durations[30] = 4;  song_durations[31] = 4;  song_durations[32] = 4;  song_durations[33] = 4;  song_durations[34] = 8;
    song_durations[35] = 4; song_durations[36] = 4;  song_durations[37] = 4;  song_durations[38] = 4;  song_durations[39] = 4;  song_durations[40] = 4;  song_durations[41] = 8;

    for(i = 0; i < 64; i = i + 1)
    begin
    song_octave[i] = 0;
    end
    end
    `sel_s2 :begin //Ode to joy   010
    length = 64;
     song_notes[0] = 3; song_notes[1] = 3; song_notes[2] = 4; song_notes[3] = 5; song_notes[4] = 5; song_notes[5] = 4; song_notes[6] = 3; song_notes[7] = 2;
     song_notes[8] = 1; song_notes[9] = 1; song_notes[10] = 2; song_notes[11] = 3; song_notes[12] = 3; song_notes[13] = 2; song_notes[14] = 2;
     song_notes[15] = 3; song_notes[16] = 3; song_notes[17] = 4; song_notes[18] = 5; song_notes[19] = 5; song_notes[20] = 4; song_notes[21] = 3; song_notes[22] = 2;
     song_notes[23] = 1; song_notes[24] = 1; song_notes[25] = 2; song_notes[26] = 3; song_notes[27] = 2; song_notes[28] = 1; song_notes[29] = 1;
     song_notes[30] = 2; song_notes[31] = 2; song_notes[32] = 3; song_notes[33] = 1; song_notes[34] = 2; song_notes[35] = 3; song_notes[36] = 4; song_notes[37] = 3; song_notes[38] = 1;
     song_notes[39] = 2; song_notes[40] = 3; song_notes[41] = 4; song_notes[42] = 3; song_notes[43] = 2; song_notes[44] = 1; song_notes[45] = 2; song_notes[46] = 5;//ตอา๔5
     song_notes[47] = 3; song_notes[48] = 3; song_notes[49] = 3; song_notes[50] = 4; song_notes[51] = 5; song_notes[52] = 5; song_notes[53] = 4; song_notes[54] = 3; song_notes[55] = 4; song_notes[56] = 2;
     song_notes[57] = 1; song_notes[58] = 1; song_notes[59] = 2; song_notes[60] = 3; song_notes[61] = 2; song_notes[62] = 1; song_notes[63] = 1;

     for ( i = 0; i < 64; i = i + 1)
     begin
      song_durations[i] = 4;
     end
     song_durations[12] = 6; song_durations[13] = 2; song_durations[14] = 8; song_durations[27] = 6; song_durations[28] = 2; song_durations[29] = 8;
     song_durations[35] = 2; song_durations[36] = 2; song_durations[40] = 2; song_durations[41] = 6; song_durations[55] = 2; song_durations[56] = 2;
     song_durations[61] = 6; song_durations[62] = 2; song_durations[63] = 8;
      for(i = 0; i < 64; i = i + 1)
      begin
      song_octave[i] = 0;
      end
      song_octave[46] = `Low_note;
     end

     `sel_s3: begin //high and low 100
     length = 21;
     song_notes[0] = 1;  song_notes[1] = 2;  song_notes[2] = 3;
     song_notes[3] = 4;  song_notes[4] = 5;  song_notes[5] = 6;
     song_notes[6] = 7;  song_notes[7] = 1;  song_notes[8] = 2;
     song_notes[9] = 3;  song_notes[10] = 4;  song_notes[11] = 5;
     song_notes[12] = 6;  song_notes[13] = 7;  song_notes[14] = 1;
     song_notes[15] = 2;  song_notes[16] = 3;  song_notes[17] = 4;
     song_notes[18] = 5;  song_notes[19] = 6;  song_notes[20] = 7;

    for(i = 0; i < 21; i = i + 1)
    begin
    song_durations[i] = 4;
    end

   for(i = 0; i < 7; i = i + 1)
    begin
    song_octave[i] = `Low_note;
    end
   for(i = 7; i < 14; i = i + 1)
      begin
      song_octave[i] = 0;
      end
   for(i = 14; i < 21; i = i + 1)
      begin
      song_octave[i] = `High_note;
      end
     end

     default length = 0;

    endcase
  end

 reg [31:0] duration_counter;
 reg [31:0] count;
 reg [6:0] notes_index;

  //There is a time interval between each sound. For duration >= 4, the interval is 1ms, the other interval is duration * 0.25ms.
  always@ (posedge clk, negedge rst_n) begin
          if(!rst_n) begin
            notes_index <= 0;
            duration_counter <= 0;
            notes <= 0;
            octave <= 0;
            end
          else if (notes_index < length)
            if (notes != 0)begin
              if (duration_counter < song_durations[notes_index] * 12500000) begin
                notes <= song_notes[notes_index];
                octave <= song_octave[notes_index];
                duration_counter <= duration_counter + 1;
              end
              else begin
                duration_counter <= 0;
                notes_index <= notes_index + 1;
                notes <= 0;
              end
            end
            else begin
              if (song_durations[notes_index-1] >= 4) begin
                if (count < 10000000)
                  count <= count + 1;
                else begin
                  count <= 0;
                  notes <= song_notes[notes_index];
                  octave <= song_octave[notes_index];
                end
              end
              else begin
                if (count < 2500000 * song_durations[notes_index-1]) begin
                  count <= count + 1;
                end
                else begin
                  count <= 0;
                  notes <= song_notes[notes_index];
                 octave <= song_octave[notes_index];
                end
              end
            end
          else begin
            notes <= 0;
          end
        end
   always@ (*) begin //Assign the status to the led
   case(notes)
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
endmodule
