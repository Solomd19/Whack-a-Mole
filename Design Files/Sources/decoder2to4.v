`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 11:32:37 AM
// Design Name: 
// Module Name: decoder2to4
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


module decoder2to4 (
    input [1:0] en,

    output reg [3:0] an
);

    always @ (*) begin
        case (en)
            0: an=4'b1110;
            1: an=4'b1101;
            2: an=4'b1011;
            3: an=4'b0111;
        endcase
    end

endmodule
