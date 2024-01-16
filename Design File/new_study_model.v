`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/07 16:58:54
// Design Name: 
// Module Name: new_study_model
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
module new_study_model(
  input clk,   //clock signal
  input rst_n, //reset signal
  input rst,
  input [6:0] user_input, // user input notes
  input [2:0] user_selection, // user's account selection
  input user_store,
  input model_selection, // normal model and fast model
  output reg [6:0] leds,
  output reg [2:0] num_note, // the convert of ont-hot code
  output reg [4:0] cnt, // number of errors
  output reg [4:0] record // the information currently stored in the account
);
  // define note sequences and corresponding keys
   wire [31:0] key [41:0];  // provide guidance to users based on music scores
     assign key[0] = 1'd1;
     assign key[1] = 1'd1;
     assign key[2] = 3'd5;
     assign key[3] = 3'd5;
     assign key[4] = 3'd6;
     assign key[5] = 3'd6;
     assign key[6] = 3'd5;
     assign key[7] = 3'd4;
     assign key[8] = 3'd4;
     assign key[9] = 3'd3;
     assign key[10] = 3'd3;
     assign key[11] = 3'd2;
     assign key[12] = 3'd2;
     assign key[13] = 3'd1;
     assign key[14] = 3'd5;
     assign key[15] = 3'd5;
     assign key[16] = 3'd4;
     assign key[17] = 3'd4;
     assign key[18] = 3'd3;
     assign key[19] = 3'd3;
     assign key[20] = 3'd2;
     assign key[21] = 3'd5;
     assign key[22] = 3'd5;
     assign key[23] = 3'd4;
     assign key[24] = 3'd4;
     assign key[25] = 3'd3;
     assign key[26] = 3'd3;
     assign key[27] = 3'd2;
     assign key[28] = 1'd1;
     assign key[29] = 1'd1;
     assign key[30] = 3'd5;
     assign key[31] = 3'd5;
     assign key[32] = 3'd6;
     assign key[33] = 3'd6;
     assign key[34] = 3'd5;
     assign key[35] = 3'd4;
     assign key[36] = 3'd4;
     assign key[37] = 3'd3;
     assign key[38] = 3'd3;
     assign key[39] = 3'd2;
     assign key[40] = 3'd2;
     assign key[41] = 3'd1;
  reg [5:0] current_note;
  reg [3:0] duration_counter;
  reg [31:0] duration;
  reg [2:0] state; // there are three states: selection state, study state, store state;
  reg [4:0] user_scores [2:0]; // we store three accounts' levels
  wire clk_bps; // normal action time
  wire clk_bps_fast; // fast action time
  counter counter(clk, rst_n, clk_bps);
  counter_fast counter_fast(clk, rst_n, clk_bps_fast);

always @(posedge clk) begin
    case(user_input)  //convert the one-hot code into a note represented by a number
           `h_space:num_note<=`n_space;
           `h_do:num_note<=`n_do;//do
           `h_re:num_note<=`n_re;//re
           `h_mi:num_note<=`n_mi;//mi
           `h_fa:num_note<=`n_fa;//fa
           `h_so:num_note<=`n_so;//so
           `h_la:num_note<=`n_la;//la
           `h_q1:num_note<=`n_q1;//xi
    endcase
end


always @(posedge clk , negedge rst_n) begin
    if (~rst_n) begin
        state <= `buffer_state;
        user_scores[0] <= `first_score;
        user_scores[1] <= `first_score;
        user_scores[2] <= `first_score;
    end
    else begin
        case (state)
           `study_state: begin
            if(!rst)begin
            current_note <= 0;
            duration_counter <= 0;
            cnt <= 0;
            state <= `buffer_state;
            end
            else begin
                case (model_selection)
                1'b0: begin  // normal model
                    if (clk_bps) begin // the reaction time to determine if it is correct is 1 second
                        leds[key[current_note] - 1] <= 1'b1;
                        if (user_input[key[current_note] - 1]) begin
                            leds[key[current_note] - 1] <= 1'b0;
                            duration_counter <= 4'd0;
                            if (current_note == `study_model_last_note)
                                state <= `store_state;
                            else
                            current_note <= current_note + 1;
                        end
                        else begin
                            if (duration_counter == 4'd3) begin  // automatically switch after 4 seconds
                                if (current_note == `study_model_last_note)
                                    state <= `store_state;
                                else
                                    current_note <= current_note + 1;
                                if (cnt == `out_cnt)
                                    cnt <= `out_cnt;
                                else
                                    cnt <= cnt + 1'b1;
                                leds[key[current_note] - 1] <= 1'b0;
                                duration_counter <= 4'd0;
                            end
                            else
                                duration_counter <= duration_counter + 1;
                            end
                     end
                end
                1'b1: begin
                     if (clk_bps_fast) begin // the reaction time to determine if it is correct is half second
                        leds[key[current_note] - 1] <= 1'b1;
                        if (user_input[key[current_note] - 1]) begin
                            leds[key[current_note] - 1] <= 1'b0;
                            duration_counter <= 4'd0;
                            if (current_note == `study_model_last_note)
                                state <= 3'b100;
                            else
                                current_note <= current_note + 1;
                        end
                        else begin
                            if (duration_counter == 4'd4) begin  // automatically switch after 2 seconds
                                if (current_note == `study_model_last_note)
                                    state <= `store_state;
                                else
                                    current_note <= current_note + 1;
                                if (cnt == `out_cnt)
                                    cnt <= `out_cnt;
                                else
                                    cnt <= cnt + 1'b1;
                                leds[key[current_note] - 1] <= 1'b0;
                                duration_counter <= 4'd0;
                            end
                            else
                                duration_counter <= duration_counter + 1;
                    end
                  end
                end
                default: begin
                end
                endcase
                end
            end
            3'b010: begin   // please select your account
                case (user_selection)
                    `user1 : begin
                        record <= user_scores[0];
                        leds <= 7'b0000000;
                        state <= 3'b001;
                    end
                    `user2 : begin
                        record <= user_scores[1];
                        leds <= 7'b0000000;
                        state <= 3'b001;
                    end
                    `user3 : begin
                        record <= user_scores[2];
                        leds <= 7'b0000000;
                        state <= 3'b001;
                    end
                    default : state <= 3'b010;
                endcase
            end
            `store_state: begin   //  please determine if store your level
                leds <= `store_state_led;
                duration <= duration + 1'b1;
                if (duration >= `out_duration) // automatically switch after 8 seconds
                    state <= `buffer_state;
                case (user_selection)
                    `user1 :
                        if (user_store) begin
                            user_scores[0] <= cnt;
                            record <= cnt;
                            state <= `buffer_state;
                        end
                    `user2 :
                        if (user_store) begin
                            user_scores[1] <= cnt;
                             record <= cnt;
                            state <= `buffer_state;
                        end
                    `user3 :
                        if (user_store) begin
                            user_scores[2] <= cnt;
                            record <= cnt;
                            state <= `buffer_state;
                        end
                default : state <= `store_state;
                endcase
            end
            `buffer_state: begin   // buffer state
                duration <= 32'b0;
                current_note <= `study_model_first_note;
                duration_counter <= 4'd0;
                cnt <= `cnt0;
                leds <= `buffer_state_led;
                if (user_selection == `no_user)
                    state <= `selection_state;
            end
            default:begin
            state <= `buffer_state;
            end
        endcase
    end
end
endmodule