`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 11:22:55 AM
// Design Name: 
// Module Name: slowclock
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


module slowclock (
    input clk_in, // On Basys 3 board, 100MHz clock

    output reg clk_out // Input clock divided down to 200Hz pulse
);
    
    reg [20:0] period_count = 0;

    always @ (posedge clk_in) begin
        if (period_count != 500_000 - 1) begin // If the input clock has not counted to the max yet, keep clk_out low
            period_count <= period_count + 1;
            clk_out <= 0;
        end
        else begin // Once the count has reached max, pulse clk_out for 1 tick
            period_count <= 0;
            clk_out <= 1;
        end
    end

endmodule

