`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 11:29:12 AM
// Design Name: 
// Module Name: mux4
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


module mux4( 
    input [3:0] ch0,
    input [3:0] ch1,
    input [3:0] ch2,
    input [3:0] ch3,
    input [1:0] sel,

    output [3:0] out
);

    // Selector switches decide what data at the input data lines go through to the output (out).
    assign out =    (sel == 0) ? ch0 :
                    (sel == 1) ? ch1 :
                    (sel == 2) ? ch2 :
                    (sel == 3) ? ch3 :
                                4'h0;

endmodule
