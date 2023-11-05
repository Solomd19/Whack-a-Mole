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
input [15:0] sw,
input reset,
output reg [15:0] LED,
output reg [5:0]score_count);

localparam 
S0000000 = 0, 
S0000001 = 1, 
S0000010 = 2, 
S0000011 = 3,
S0000100 = 4,
S0000101 = 5,
S0000110 = 6,
S0000111 = 7,
S0001000 = 8,
S0001001 = 9,
S0001010 = 10,
S0001011 = 11,
S0001100 = 12,
S0001101 = 13,
S0001110 = 14,
S0001111 = 15,
S0010000 = 16,
S0010001 = 17,
S0010010 = 18,
S0010011 = 19,
S0010100 = 20,
S0010101 = 21,
S0010110 = 22,
S0010111 = 23,
S0011000 = 24,
S0011001 = 25,
S0011010 = 26,
S0011011 = 27,
S0011100 = 28,
S0011101 = 29,
S0011110 = 30,
S0011111 = 31,
S0100000 = 32;

 reg [7:0] current_state = 0; // Current State
 reg [7:0] next_state = 0; // Next State
 //reg set_flag = 1; // Flag for when to count
 //reg LED[15:0];
//--------------------------------------------------------------------------------------------
// Next state sequential logic
//--------------------------------------------------------------------------------------------

 always @(posedge clk) begin
 if (reset) 
    current_state <= S0000000;
else 
    current_state <= next_state;
 end
 
 
 always @(posedge clk) begin
 
 end
//--------------------------------------------------------------------------------------------
// Next state combinational logic
//--------------------------------------------------------------------------------------------
 always @(current_state, sw[15:0])
 begin
 case(current_state)
 
S0000000: begin
next_state <= S0000000;
LED[15:1] <= 0;
score_count <= 6'b000000;
LED[0] <= 1;
    if (sw[0])
        next_state <= S0000001;
    else
        next_state <= S0000000;
end

S0000001: begin
score_count <= 6'b000001;
    LED[15:0] <= 0;
    LED[1] <= 1;
    if (sw[1])
        next_state <= S0000010; //go on to next state
    else
        next_state <= S0000001;
end


S0000010: begin
score_count <= 6'b000010;
    LED[15:0] <= 0;
    LED[2] <= 1;
    if (sw[2])
        next_state <= S0000011; //go on to next state
    else
        next_state <= S0000010;
end
 
S0000011: begin //NEXT TO DO
score_count <= 6'b000011;
    LED[15:0] <= 0;
    LED[3] <= 1;
    if (sw[3])
        next_state <= S0000100; //go on to next state
    else
        next_state <= S0000011;
end

S0000100: begin
score_count <= 6'b0000100;
    LED[15:0] <= 0;
    LED[4] <= 1;
    if (sw[4])
        next_state <= S0000101; //go on to next state
    else
        next_state <= S0000100;
end

S0000101: begin
score_count <= 6'b0000101;
    LED[15:0] <= 0;
    LED[5] <= 1;
    if (sw[5])
        next_state <= S0000110; //go on to next state
    else
        next_state <= S0000101;
end

//ALL GOOD THROUGH HERE

S0000110: begin
score_count <= 6;
    LED[15:0] <= 0;
    LED[6] <= 1;
    if (sw[6])
        next_state <= S0000111; //go on to next state
    else
        next_state <= S0000110;
end

S0000111: begin
score_count <= 7;
    LED[15:0] <= 0;
    LED[7] <= 1;
    if (sw[7])
        next_state <= S0001000; //go on to next state
    else
        next_state <= S0000111;
end

S0001000: begin
score_count <= 8;
    LED[15:0] <= 0;
    LED[8] <= 1;
    if (sw[8])
        next_state <= S0001001; //go on to next state
    else
        next_state <= S0001000;
end

S0001001: begin
score_count <= 9;
    LED[15:0] <= 0;
    LED[9] <= 1;
    if (sw[9])
        next_state <= S0001010; //go on to next state
    else
        next_state <= S0001001;
end

S0001010: begin
score_count <= 10;
    LED[15:0] <= 0;
    LED[10] <= 1;
    if (sw[10])
        next_state <= S0001011; //go on to next state
    else
        next_state <= S0001010;
end

S0001011: begin
score_count <= 11;
    LED[15:0] <= 0;
    LED[11] <= 1;
    if (sw[11])
        next_state <= S0001100; //go on to next state
    else
        next_state <= S0001011;
end

S0001100: begin
score_count <= 12;
    LED[15:0] <= 0;
    LED[12] <= 1;
    if (sw[12])
        next_state <= S0001101; //go on to next state
    else
        next_state <= S0001100;
end

S0001101: begin
score_count <= 13;
    LED[15:0] <= 0;
    LED[13] <= 1;
    if (sw[13])
        next_state <= S0001110; //go on to next state
    else
        next_state <= S0001101;
end

S0001110: begin
score_count <= 14;
    LED[15:0] <= 0;
    LED[14] <= 1;
    LED[12] <= 0;
    if (sw[14])
        next_state <= S0001111; //go on to next state
    else
        next_state <= S0001110;
end

S0001111: begin
score_count <= 15;
    LED[15:0] <= 0;
    LED[15] <= 1;
    if (sw[15])
        next_state <= S0010000; //go on to next state
    else
        next_state <= S0001111;
end

//Turnaround point

S0010000: begin
score_count <= 16;
    LED[15:0] <= 0;
    LED[0] <= 1;
    if (sw[0] == 0)
        next_state <= S0010001; //go on to next state
    else
        next_state <= S0010000;
end


S0010001: begin
score_count <= 17;
    LED[15:0] <= 0;
    LED[1] <= 1;
    if (sw[1] ==  0)
        next_state <= S0010010; //go on to next state
    else
        next_state <= S0010001;
end

S0010010: begin
score_count <= 18;
    LED[15:0] <= 0;
    LED[2] <= 1;
    if (sw[2] ==  0)
        next_state <= S0010011; //go on to next state
    else
        next_state <= S0010010;
end

S0010011: begin
score_count <= 19;
    LED[15:0] <= 0;
    LED[3] <= 1;
    if (sw[3] ==  0)
        next_state <= S0010100; //go on to next state
    else
        next_state <= S0010011;
end

S0010100: begin
score_count <= 20;
    LED[15:0] <= 0;
    LED[4] <= 1;
    if (sw[4] ==  0)
        next_state <= S0010101; //go on to next state
    else
        next_state <= S0010100;
end

S0010101: begin
score_count <= 21;
    LED[15:0] <= 0;
    LED[5] <= 1;
    if (sw[5] ==  0)
        next_state <= S0010110; //go on to next state
    else
        next_state <= S0010101;
end

S0010110: begin
score_count <= 22;
    LED[15:0] <= 0;
    LED[6] <= 1;
    if (sw[6] ==  0)
        next_state <= S0010111; //go on to next state
    else
        next_state <= S0010110;
end

S0010111: begin
score_count <= 23;
    LED[15:0] <= 0;
    LED[7] <= 1;
    if (sw[7] ==  0)
        next_state <= S0011000; //go on to next state
    else
        next_state <= S0010111;
end

S0011000: begin
score_count <= 24;
    LED[15:0] <= 0;
    LED[8] <= 1;
    if (sw[8] ==  0)
        next_state <= S0011001; //go on to next state
    else
        next_state <= S0011000;
end

S0011001: begin
score_count <= 25;
    LED[15:0] <= 0;
    LED[9] <= 1;
    if (sw[9] ==  0)
        next_state <= S0011010; //go on to next state
    else
        next_state <= S0011001;
end

S0011010: begin
score_count <= 26;
    LED[15:0] <= 0;
    LED[10] <= 1;
    if (sw[10] ==  0)
        next_state <= S0011011; //go on to next state
    else
        next_state <= S0011010;
end

S0011011: begin
score_count <= 27;
    LED[15:0] <= 0;
    LED[11] <= 1;
    if (sw[11] ==  0)
        next_state <= S0011100; //go on to next state
    else
        next_state <= S0011011;
end

S0011100: begin
score_count <= 28;
    LED[15:0] <= 0;
    LED[12] <= 1;
    if (sw[12] ==  0)
        next_state <= S0011101; //go on to next state
    else
        next_state <= S0011100;
end

S0011101: begin
score_count <= 29;
    LED[15:0] <= 0;
    LED[13] <= 1;
    if (sw[13] ==  0)
        next_state <= S0011110; //go on to next state
    else
        next_state <= S0011101;
end

S0011110: begin
score_count <= 30;
    LED[15:0] <= 0;
    LED[14] <= 1;
    if (sw[14] ==  0)
        next_state <= S0011111; //go on to next state
    else
        next_state <= S0011110;
end

S0011111: begin
score_count <= 31;
    LED[15:0] <= 0;
    LED[15] <= 1;
    if (sw[15] ==  0)
        next_state <= S0100000; //go on to next state
    else
        next_state <= S0011111;
end

S0100000: begin
next_state <= S0100000;
score_count <= 32;
LED[15:0] <= 0;
end

default: begin // Implied-latch free implementation
    next_state = S0000000;
end

endcase
end

 
endmodule
