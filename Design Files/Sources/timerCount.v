`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 03:44:51 PM
// Design Name: 
// Module Name: timerCount
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


module timerCount(
    input clk, //clock
    input reset, //reset
    input increment, //increment
    input decrement, //decrement

    output reg [7:0] count = 20 //count, max count is 255 (8-bit)
);

    always @(posedge clk) begin //when positive edge of the clock arrives
        if(reset)
            count <= 20;
        else if(count == 0)
            count <= count;           
        else if(increment)
            count <= count + 1; //increment
        else if(decrement)
            count <= count - 1; //decrement
        else
            count <= count;
    end

endmodule
