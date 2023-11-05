`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 10:41:21 AM
// Design Name: 
// Module Name: binary_to_BCD
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


module binarytobcd(
    input [7:0] timerInput, 	//These refers to B0 to B7 as shown above in the circuit. 
    input [7:0] scoreInput,

    output [3:0] timerOnes, 	//We need 4 bits to display a digit for ones as it could go from 0 to 9. 
    output [3:0] timerTens, 	//We need 4 bits to display a digit for tens as it could go from 0 to 9.
    output [3:0] scoreOnes,
    output [3:0] scoreTens //We need to bits to display  a digit for hundreds as it could go from 0 to 2.
);

    wire [3:0] a1,a2,a3,a4,a5,a6,a7; //Declaring data lines coming out of each add 3 module as wires. 
    wire [3:0] b1,b2,b3,b4,b5,b6,b7; //Declaring data lines going into each add 3 module as wires.
    wire [3:0] c1,c2,c3,c4,c5,c6,c7; //Declaring data lines coming out of each add 3 module as wires. 
    wire [3:0] d1,d2,d3,d4,d5,d6,d7; //Declaring data lines going into each add 3 module as wires.

    //Timer section
    //Follow the Block Diagram
    assign b1 = {1'b0,timerInput[7:5]};	 //LMB is 0. A[7:5] -->Inputs refer to B7, B6, B5 going into C1 
    assign b2 = {a1[2:0],timerInput[4]}; 	//Inputs going into C2

    //do 3-5
    assign b3 = {a2[2:0], timerInput[3]};
    assign b4 = {a3[2:0], timerInput[2]};
    assign b5 = {a4[2:0], timerInput[1]};

    assign b6 = {1'b0,a1[3],a2[3],a3[3]}; 		//LMB is 1. Inputs going into C6.  
    assign b7 = {a6[2:0],a4[3]}; 		//Inputs going into C7.

    add3 m1(b1,a1);	 //Using add3 module that you created above to perform operation on  csign and dsign on all 7 modules. 
    add3 m2(b2,a2);

    add3 m3(b3,a3);
    add3 m4(b4,a4);
    add3 m5(b5,a5);
    add3 m6(b6,a6);
    add3 m7(b7,a7);
    //add in 5 more of these as necessary, look at diagram

    assign timerOnes = {a5[2:0],timerInput[0]}; 	//four bits that will make-up ones. 
    assign timerTens = {a7[2:0],a5[3]}; 	//four bits that will make-up tens. 

    /////////////////////////////////////////////////////////////////////////
    //Score section
    //Follow the Block Diagram
    assign d1 = {1'b0,scoreInput[7:5]};	 //LMB is 0. A[7:5] -->Inputs refer to B7, B6, B5 going into C1 
    assign d2 = {c1[2:0],scoreInput[4]}; 	//Inputs going into C2

    //do 3-5
    assign d3 = {c2[2:0], scoreInput[3]};
    assign d4 = {c3[2:0], scoreInput[2]};
    assign d5 = {c4[2:0], scoreInput[1]};

    assign d6 = {1'b0,c1[3],c2[3],c3[3]}; 		//LMB is 1. Inputs going into C6.  
    assign d7 = {c6[2:0],c4[3]}; 		//Inputs going into C7.

    add3 n1(d1,c1);	 //Using add3 module that you created above to perform operation on  csign and dsign on all 7 modules. 
    add3 n2(d2,c2);

    add3 n3(d3,c3);
    add3 n4(d4,c4);
    add3 n5(d5,c5);
    add3 n6(d6,c6);
    add3 n7(d7,c7);
    //add in 5 more of these as necessary, look at diagram

    assign scoreOnes = {c5[2:0],scoreInput[0]}; //two bits that will make-up hundreds, finish the line, follow the block diagram.
    assign scoreTens = {c7[2:0],c5[3]};
    //^^^Finish this!!!

endmodule
