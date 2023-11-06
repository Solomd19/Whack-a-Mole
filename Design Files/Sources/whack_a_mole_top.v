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
	input reset,
	input [15:0] sw,

	output [15:0] LED,
	output [3:0] an,
	output [6:0] seg
);

	// To-do List:
	// bin_to_bcd
	// mux4 DONE
	// slowclock DONE
	// an_cycle_7seg DONE
	// display_an_decoder DONE
	// bcd_to_7seg DONE
	// game_timer_clk DONE
	// game_timer_counter DONE
	// game
	// whack_a_mole_top

	// Just make a clock divider module and use it twice instead of using:
	// slowclock
	// game_timer_clk
	// Give it a parameter or something idk
	// Parameterize input and output clk freq to make calculation

	// Also could make a generic counter module with a param for the max value and that would take care of a lot of stuff
	// Hi mom and dad
	
	wire clk_out;
	wire [3:0] mux_out;
	wire [1:0] counter_out;
	wire [3:0] timerOnes, timerTens, scoreOnes, scoreTens;
	wire [7:0] score_count; //Max score of 32
	wire [7:0] timer_count; //Timer goes for 30 seconds
	
	// Game Timer ///////////////////////////////////////////////////////////////////////////////////////////

	// Creates a 1Hz output clock to decrement the value of the game timer
	game_timer_clk game_timer_clk_inst(
		.clk_in(clk),

		.clk_out(timerClk_out)
	);
	
	game_timer_counter game_timer_counter_inst(
		.clk(clk),
		.reset(reset),
		.increment(),
		.decrement(timerClk_out),

		.count(timer_count)
	);

	// The Actual Game ///////////////////////////////////////////////////////////////////////////////////////////

	// Instantiate an instance of the game
	game game_inst(
		.clk(clk),
		.reset(reset),
		.sw(sw),

		.LED(LED),
		.score_count(score_count)
	);

	// 7-Segment Display ///////////////////////////////////////////////////////////////////////////////////////////
	
	// Instantiate Binary to BCD (Binary Coded Decimal) converter to convert internal signals to display output
	bin_to_bcd bin_to_bcd_inst(
		.timerInput(timer_count),
		.scoreInput(score_count),

		.timerOnes(timerOnes),
		.timerTens(timerTens),
		.scoreOnes(scoreOnes),
		.scoreTens(scoreTens)
	);

	// Instantiate mux to cycle through display outputs
	mux4 mux4_inst(
		.ch0(scoreOnes),
		.ch1(scoreTens),
		.ch2(timerOnes),
		.ch3(timerTens),
		.sel(counter_out),

		.out(mux_out)
	);

	// Converts bcd to 7 seg LED signals
	bcd_to_7seg bcd_to_7seg_inst(
		.bcd(mux_out),

		.display(seg) // 7 segment display LED output
	);
	
	// Instantiate slowclock module to create a 200Hz clock for display cycling
	slowclock slowclock_inst(
		.clk_in(clk), // 100MHz clock

		.clk_out(clk_out) // 200Hz clock
	);
	
	// Instantiate counter to count 0-3 for display cycling
	an_cycle_7seg an_cycle_7seg_inst(
		.clk(clk_out), // 200Hz clock

		.Q(counter_out)
	);
	
	// Converts my_counter's output into a display enable signal
	display_an_decoder display_an_decoder_inst(
		.en(counter_out),

		.an(an)
	);

endmodule
