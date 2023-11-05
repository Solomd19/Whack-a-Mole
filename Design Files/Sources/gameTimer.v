`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 03:35:45 PM
// Design Name: 
// Module Name: gameTimer
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


module timerClock(
    input clk_in,

    output clk_out
);
    
    reg [27:0] period_count = 0;

    always @ (posedge clk_in) begin
        if (period_count == 100000000 - 1)
            period_count<= 0;
        else
            period_count <= period_count + 1;
    end
    
    assign clk_out = (period_count == 100000000 - 1);
    
endmodule
