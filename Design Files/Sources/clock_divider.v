`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2023 09:17:08 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider #(
    parameter CLK_IN_FREQ_HZ = 100_000_000,
    parameter CLK_OUT_FREQ_HZ = 200,
    parameter PULSE_MODE = 0
)(
    input clk_in, // Input clock

    output reg clk_out // Output clock divided from input clock
);

    localparam CLK_OUT_HALF_PERIOD_TICKS = CLK_IN_FREQ_HZ / (CLK_OUT_FREQ_HZ * 2);
    localparam CLK_OUT_PERIOD_TICKS = CLK_IN_FREQ_HZ / CLK_OUT_FREQ_HZ;

    reg [$clog2(CLK_OUT_PERIOD_TICKS)-1:0] period_count = 0;

    always @ (posedge clk_in) begin
        if ((!PULSE_MODE & period_count >= CLK_OUT_HALF_PERIOD_TICKS - 1) | (PULSE_MODE & period_count >= CLK_OUT_PERIOD_TICKS - 1)) begin // If the counter has reached max value...
            period_count <= 0; // Reset the count
            if (PULSE_MODE)
                clk_out <= 1;
            else
                clk_out <= ~clk_out; // Toggle the output clock value
        end
        else begin // If the counter has not reached max value...
            period_count <= period_count + 1;
            if (PULSE_MODE)
                clk_out <= 0;
            else
                clk_out <= clk_out;
        end
    end

endmodule
