`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 04:53:21 PM
// Design Name: 
// Module Name: TBtimerClock
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


module TBtimerClock(

    );
    
    reg clk;
    wire clk_out;
    
    timerClock u7(clk, clk_out);
    
    always
    begin
    clk = 0;
    #1;
    clk = 1;
    #1;
    end
    
    
    
endmodule
