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


module counter #(
    parameter INITIAL_VALUE = 0, // Initial value of the counter on reset
    parameter COUNT_DOWN = 0, // Toggle to count down instead of count up
    parameter STOP_VALUE = 0, // Value at which to stop the count
    parameter COUNTER_BITS = 0 // Bit length of the counter - adjust as needed
)(
    input clk,
    input srst, // Sycnhronous reset to clk
    input enable, // Value of counter will only change if enable is asserted at time of clk posedge

    output reg [COUNTER_BITS-1:0] count = INITIAL_VALUE // Value of the counter
);

    always @ (posedge clk) begin 
        if (reset) // If the module is reset, return to the initial value
            count <= INITIAL_VALUE;
        else if (enable & count != STOP_VALUE) // Only change the counter value if the enable is asserted and the count is not at STOP_VALUE
            if (!COUNT_DOWN)
                count <= count + 1; // Count up if !COUNT_DOWN
            else
                count <= count - 1; // Count down if COUNT_DOWN
        else
            count <= count;
    end


endmodule
