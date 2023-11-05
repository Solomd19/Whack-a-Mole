`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 10:30:28 AM
// Design Name: 
// Module Name: add3
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


module add3(     
input [3:0] in, 	//Four inputs 
output reg [3:0] out);	 //Declaring output as registers
always @ (in) 		//Describing an event that should happen to input when certain condition is met. 
case (in) 	//The case  statement is a decision instruction that executes the statement.
4'b0000: out <= 4'b0000; 	//Here when all four input (in) bits (A3,A2,A1,A0) are Zeros (0000), out is 0000 (S3,S2,S1,S0)
4'b0001: out <= 4'b0001;
4'b0010: out <= 4'b0010; 
4'b0011: out <= 4'b0011; 
4'b0100: out <= 4'b0100; 
4'b0101: out <= 4'b1000;
4'b0110: out <= 4'b1001;
4'b0111: out <= 4'b1010;
4'b1000: out <= 4'b1011; 
4'b1001: out <= 4'b1100;

default: out <= 4'b0000; 
endcase
endmodule
