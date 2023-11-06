`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 03:35:45 PM
// Design Name: 
// Module Name: game_timer_clk
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


module game_timer_clk(
    input clk_in, // 100MHz input clk

    output clk_out // 1Hz output pulse
);
    
    reg [27:0] period_count = 0;

    always @ (posedge clk_in) begin
        if (period_count == 100_000_000 - 1) begin
            period_count <= 0;
            clk_out <= 1;
        end
        else begin
            period_count <= period_count + 1;
            clk_out <= 0;
        end
    end
        
endmodule
