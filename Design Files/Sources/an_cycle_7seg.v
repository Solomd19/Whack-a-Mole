`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 11:25:13 AM
// Design Name: 
// Module Name: my_counter
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


module an_cycle_7seg(
    input clk,

    output reg [1:0] Q = 0
);

    // Counts from 0-3 at the rate of clk
    always @ (posedge clk)
        q <= q + 1;

endmodule
