`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 03:53:10 PM
// Design Name: 
// Module Name: game
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


module game(
    input clk,
    input reset,
    input [15:0] sw,

    output reg [15:0] LED,
    output reg [5:0] score_count
);

    // State Machine States
    localparam STATE_0 = 0;
    localparam STATE_1 = 1; 
    localparam STATE_2 = 2; 
    localparam STATE_3 = 3;
    localparam STATE_4 = 4;
    localparam STATE_5 = 5;
    localparam STATE_6 = 6;
    localparam STATE_7 = 7;
    localparam STATE_8 = 8;
    localparam STATE_9 = 9;
    localparam STATE_10 = 10;
    localparam STATE_11 = 11;
    localparam STATE_12 = 12;
    localparam STATE_13 = 13;
    localparam STATE_14 = 14;
    localparam STATE_15 = 15;
    localparam STATE_16 = 16;
    localparam STATE_17 = 17;
    localparam STATE_18 = 18;
    localparam STATE_19 = 19;
    localparam STATE_20 = 20;
    localparam STATE_21 = 21;
    localparam STATE_22 = 22;
    localparam STATE_23 = 23;
    localparam STATE_24 = 24;
    localparam STATE_25 = 25;
    localparam STATE_26 = 26;
    localparam STATE_27 = 27;
    localparam STATE_28 = 28;
    localparam STATE_29 = 29;
    localparam STATE_30 = 30;
    localparam STATE_31 = 31;
    localparam STATE_32 = 32;

    reg [7:0] state = 0; // Current State
    reg [7:0] state_next; // Next State

    reg [15:0] LED_next = 0
    reg [5:0] score_count_next = 0;

    // Sequential logic
    always @ (posedge clk) begin
        if (reset) begin
            score_count <= 0;
            LED <= 0;
            state <= STATE_0;
        end
        else begin
            score_count <= score_count_next;
            LED <= LED_next;
            state <= state_next;
        end
    end

    // Combinational logic
    always @ (*) begin

        case (state)
 
            STATE_0: begin
                score_count = 0;
                LED_next = 0;
                LED_next[0] = 1;
                if (sw[0] == 1)
                    state_next = STATE_1;
                else
                    state_next = STATE_0;
            end

            STATE_1: begin
                score_count = 1;
                LED_next = 0;
                LED_next[1] = 1;
                if (sw[1] == 1)
                    state_next = STATE_2; //go on to next state
                else
                    state_next = STATE_1;
            end


            STATE_2: begin
                score_count = 2;
                LED_next = 0;
                LED_next[2] = 1;
                if (sw[2] == 1)
                    state_next = STATE_3; //go on to next state
                else
                    state_next = STATE_2;
            end
 
            STATE_3: begin
                score_count = 3;
                LED_next = 0;
                LED_next[3] = 1;
                if (sw[3] == 1)
                    state_next = STATE_4; //go on to next state
                else
                    state_next = STATE_3;
            end

            STATE_4: begin
                score_count = 4;
                LED_next = 0;
                LED_next[4] = 1;
                if (sw[4] == 1)
                    state_next = STATE_5; //go on to next state
                else
                    state_next = STATE_4;
            end

            STATE_5: begin
                score_count = 5;
                LED_next = 0;
                LED_next[5] = 1;
                if (sw[5] == 1)
                    state_next = STATE_6; //go on to next state
                else
                    state_next = STATE_5;
            end

            STATE_6: begin
                score_count = 6;
                LED_next = 0;
                LED_next[6] = 1;
                if (sw[6] == 1)
                    state_next = STATE_7; //go on to next state
                else
                    state_next = STATE_6;
            end

            STATE_7: begin
                score_count = 7;
                LED_next = 0;
                LED_next[7] = 1;
                if (sw[7] == 1)
                    state_next = STATE_8; //go on to next state
                else
                    state_next = STATE_7;
            end

            STATE_8: begin
                score_count = 8;
                LED_next = 0;
                LED_next[8] = 1;
                if (sw[8] == 1)
                    state_next = STATE_9; //go on to next state
                else
                    state_next = STATE_8;
            end

            STATE_9: begin
                score_count = 9;
                LED_next = 0;
                LED_next[9] = 1;
                if (sw[9] == 1)
                    state_next = STATE_10; //go on to next state
                else
                    state_next = STATE_9;
            end

            STATE_10: begin
                score_count = 10;
                LED_next = 0;
                LED_next[10] = 1;
                if (sw[10] == 1)
                    state_next = STATE_11; //go on to next state
                else
                    state_next = STATE_10;
            end

            STATE_11: begin
                score_count = 11;
                LED_next = 0;
                LED_next[11] = 1;
                if (sw[11] == 1)
                    state_next = STATE_12; //go on to next state
                else
                    state_next = STATE_11;
            end

            STATE_12: begin
                score_count = 12;
                LED_next = 0;
                LED_next[12] = 1;
                if (sw[12] == 1)
                    state_next = STATE_13; //go on to next state
                else
                    state_next = STATE_12;
            end

            STATE_13: begin
                score_count = 13;
                LED_next = 0;
                LED_next[13] = 1;
                if (sw[13] == 1)
                    state_next = STATE_14; //go on to next state
                else
                    state_next = STATE_13;
            end

            STATE_14: begin
                score_count = 14;
                LED_next = 0;
                LED_next[14] = 1;
                LED_next[12] = 0;
                if (sw[14] == 1)
                    state_next = STATE_15; //go on to next state
                else
                    state_next = STATE_14;
            end

            STATE_15: begin
                score_count = 15;
                LED_next = 0;
                LED_next[15] = 1;
                if (sw[15] == 1)
                    state_next = STATE_16; //go on to next state
                else
                    state_next = STATE_15;
            end

            //Turnaround point

            STATE_16: begin
                score_count = 16;
                LED_next = 0;
                LED_next[0] = 1;
                if (sw[0] == 0)
                    state_next = STATE_17; //go on to next state
                else
                    state_next = STATE_16;
            end


            STATE_17: begin
                score_count = 17;
                LED_next = 0;
                LED_next[1] = 1;
                if (sw[1] == 0)
                    state_next = STATE_18; //go on to next state
                else
                    state_next = STATE_17;
            end

            STATE_18: begin
                score_count = 18;
                LED_next = 0;
                LED_next[2] = 1;
                if (sw[2] == 0)
                    state_next = STATE_19; //go on to next state
                else
                    state_next = STATE_18;
            end

            STATE_19: begin
                score_count = 19;
                LED_next = 0;
                LED_next[3] = 1;
                if (sw[3] == 0)
                    state_next = STATE_20; //go on to next state
                else
                    state_next = STATE_19;
            end

            STATE_20: begin
                score_count = 20;
                LED_next = 0;
                LED_next[4] = 1;
                if (sw[4] == 0)
                    state_next = STATE_21; //go on to next state
                else
                    state_next = STATE_20;
            end

            STATE_21: begin
                score_count = 21;
                LED_next = 0;
                LED_next[5] = 1;
                if (sw[5] == 0)
                    state_next = STATE_22; //go on to next state
                else
                    state_next = STATE_21;
            end

            STATE_22: begin
                score_count = 22;
                LED_next = 0;
                LED_next[6] = 1;
                if (sw[6] == 0)
                    state_next = STATE_23; //go on to next state
                else
                    state_next = STATE_22;
            end

            STATE_23: begin
                score_count = 23;
                LED_next = 0;
                LED_next[7] = 1;
                if (sw[7] == 0)
                    state_next = STATE_24; //go on to next state
                else
                    state_next = STATE_23;
            end

            STATE_24: begin
                score_count = 24;
                LED_next = 0;
                LED_next[8] = 1;
                if (sw[8] == 0)
                    state_next = STATE_25; //go on to next state
                else
                    state_next = STATE_24;
            end

            STATE_25: begin
                score_count = 25;
                LED_next = 0;
                LED_next[9] = 1;
                if (sw[9] == 0)
                    state_next = STATE_26; //go on to next state
                else
                    state_next = STATE_25;
            end

            STATE_26: begin
                score_count = 26;
                LED_next = 0;
                LED_next[10] = 1;
                if (sw[10] == 0)
                    state_next = STATE_27; //go on to next state
                else
                    state_next = STATE_26;
            end

            STATE_27: begin
                score_count = 27;
                LED_next = 0;
                LED_next[11] = 1;
                if (sw[11] == 0)
                    state_next = STATE_28; //go on to next state
                else
                    state_next = STATE_27;
            end

            STATE_28: begin
                score_count = 28;
                LED_next = 0;
                LED_next[12] = 1;
                if (sw[12] == 0)
                    state_next = STATE_29; //go on to next state
                else
                    state_next = STATE_28;
            end

            STATE_29: begin
                score_count = 29;
                LED_next = 0;
                LED_next[13] = 1;
                if (sw[13] == 0)
                    state_next = STATE_30; //go on to next state
                else
                    state_next = STATE_29;
            end

            STATE_30: begin
                score_count = 30;
                LED_next = 0;
                LED_next[14] = 1;
                if (sw[14] == 0)
                    state_next = STATE_31; //go on to next state
                else
                    state_next = STATE_30;
            end

            STATE_31: begin
                score_count = 31;
                LED_next = 0;
                LED_next[15] = 1;
                if (sw[15] == 0)
                    state_next = STATE_32; //go on to next state
                else
                    state_next = STATE_31;
            end

            STATE_32: begin // End of the game
                score_count = 32;
                LED_next = 0;
                state_next = STATE_32;
            end

            default: begin
                score_count_next = 0;
                LED_next = 0;
                state_next = STATE_0;
            end

        endcase
    end

 
endmodule
