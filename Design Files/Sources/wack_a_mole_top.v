`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 02:19:09 PM
// Design Name: 
// Module Name: whack_a_mole_top
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


module whack_a_mole_top(
    input clk,
	input [15:0] sw,
	input reset,

	output [15:0] LED,
	output [3:0] an,
	output [6:0] seg
); //Inputs and outputs set, might need output to wire?
	
	localparam zero = 4'b0000; //might not need?

	wire clk_out;
	wire increment; //might need?
	wire decrement; //might need?
	wire [3:0] mux_out;
	wire [1:0] counter_out;
	wire [3:0] timerOnes, timerTens, scoreOnes, scoreTens;
	wire [7:0] score_count; //Max score of 32
	wire [7:0] timer_count; //Timer goes for 30 seconds
	
	// Instantiate Binary to BCD (Binary Coded Decimal) converter to convert internal signals to display output
	binarytobcd binarytobcd_inst(
		timer_count,
		score_count,
		timerOnes,
		timerTens,
		scoreOnes,
		scoreTens
	);
	
	// Instantiate 4 to 1 Mux to cycle through display outputs
	mux4to1 mux4to1_inst(
		scoreOnes,
		scoreTens,
		timerOnes,
		timerTens,
		counter_out,
		mux_out
	);
	
	// Instantiate slowclock module to create a clock for display cycling
	slowclock slowclock_inst(
		clk,
		clk_out
	);
	
	// Instantiate counter to count 0-3 for display cycling
	my_counter my_counter_inst(
		clk_out,
		counter_out
	);
	
	decoder2to4 decoder2to4_inst(
		counter_out,
		an
	); //cycles through an's
	
	bcd7seg bcd7seg_inst(
		mux_out,
		seg
	); //Converts bcd to 7 seg
		
	timerClock timerClock_inst(
		clk,
		timerClk_out
	);
	
	timerCount timerCount_inst(
		clk,
		reset,
		zero,
		timerClk_out,
		timer_count
	);
	
	// Uncomment below for non-randomized game?
	//game u9(clk, sw, reset, LED, score_count);//make a game file here

	// Instantiate an instance of the game
	gameRandomized gameRandomized_inst(
		clk,
		sw,
		reset,
		LED,
		score_count
	);

endmodule
