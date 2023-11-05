`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 12:25:32 PM
// Design Name: 
// Module Name: tb_binary_to_BCD
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


module tb_binary_to_BCD(

    );
    
    reg [7:0]aa;
    wire [3:0]ones,tens;
    wire [1:0]hundreds;
    
    binary_to_BCD U0(aa,ones,tens,hundreds);
    
    initial begin
        aa = 8'b0000_0000;
        #100;
        aa = 8'b0000_1111;
        #100;
        aa = 8'b1111_0000;
        #100;
        aa = 8'b1111_1111;
        #100;
        
    end
    
endmodule
