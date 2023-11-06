`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 03:44:51 PM
// Design Name: 
// Module Name: game_timer_counter
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


module game_timer_counter(
    input clk,
    input reset,
    input increment,
    input decrement,

    output reg [7:0] count = 20 //count, max count is 255 (8-bit)
);

    always @ (posedge clk) begin
        if (reset)
            count <= 20;
        else if (count == 0) // Count can't go below 0
            count <= count;   
        else if (increment & !decrement)
            count <= count + 1;
        else if (!increment & decrement)
            count <= count - 1;
        // If both increment and decrement flags are asserted, count should not change
    end

endmodule
