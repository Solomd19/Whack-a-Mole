`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 04:48:04 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,//clock
    input reset,//reset
    input increment,//increment
    input decrement,//decrement
    output [7:0] count//count, max count is 255 (8-bit)
);

reg [7:0] current_count = 0; //initially setting counter to zero
always @(posedge clk) begin //when positive edge of the clock arrives
    if(reset)
        current_count <= 0;
    else if(increment)
        current_count <= current_count + 1; //increment
    else if(decrement)
        current_count <= current_count - 1; //decrement
    else
        current_count <= current_count;
end
    assign count = current_count;
endmodule
