`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 05:00:16 PM
// Design Name: 
// Module Name: TBcounterFSM
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


module TBcounterFSM(
//input clk
    );
    reg clk;
    reg reset, a, b, c, d;
    wire [7:0]count;
    wire increment;
    wire decrement;
    
    //slowclock();
    enterFSM U5(clk, reset, a, b, increment);
    exitFSM U6(clk, reset, c, d, decrement);
    counter U7(clk, reset, increment, decrement, count);
    
    always
    begin
    clk = 0;
    #50;
    clk = 1;
    #50;
    end
    
    
    
    initial begin
        reset = 0;
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        
        //One car enters
        #100;
        a = 1;
        #100;
        a = 0;
        #100
        b = 1;
        #100;
        b = 0;
        #100;
        
        //Another car enters
        #100;
        a = 1;
        #100;
        a = 0;
        #100
        b = 1;
        #100;
        b = 0;
        #100;
        
        //One more car enters
        #100;
        a = 1;
        #100;
        a = 0;
        #100
        b = 1;
        #100;
        b = 0;
        #100;
        
        //One car exits
        #100;
        c = 1;
        #100;
        c = 0;
        #100
        d = 1;
        #100;
        d = 0;
        #100;
        
        //Reset count
        #100
        reset = 1;
        #100
        reset = 0;
        #100;
    end
    
endmodule