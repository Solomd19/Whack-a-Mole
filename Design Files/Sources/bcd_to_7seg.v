`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 11:20:32 AM
// Design Name: 
// Module Name: bcd_to_7seg
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


module bcd_to_7seg(
    input [3:0] bcd,

    output [6:0] display
);

    always @ (*) begin
        case (bcd)
            0: display = 7'b1000000;
            1: display = 7'b1111001;
            2: display = 7'b0100100;
            3: display = 7'b0110000;
            4: display = 7'b0011001;
            5: display = 7'b0010010;
            6: display = 7'b0000010;
            7: display = 7'b1111000;
            8: display = 7'b0000000;
            9: display = 7'b0010000;
            10: display = 7'b0001000;
            11: display = 7'b0000011;
            12: display = 7'b1000110;
            13: display = 7'b0100001;
            14: display = 7'b0000110;
            15: display = 7'b0001110;
        endcase
    end
    
endmodule
