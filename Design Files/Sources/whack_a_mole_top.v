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
		
	// Game Timer ///////////////////////////////////////////////////////////////////////////////////////////

	wire game_timer_pulse;
	wire [7:0] timer_count; //Timer goes for 30 seconds

	// Creates a 1Hz output clock to decrement the value of the game timer
	clock_divider #(
		.CLK_IN_FREQ_HZ(100_000_000),
		.CLK_OUT_FREQ_HZ(1),
		.PULSE_MODE(1)
	)clock_divider_game_timer(
		.clk_in(clk), // Input clock

		.clk_out(game_timer_pulse) // Output clock divided from input clock
	);

	counter #(
		.INITIAL_VALUE(20), // Initial value of the counter on reset
		.COUNT_DOWN(1), // Toggle to count down instead of count up
		.STOP_VALUE(0), // Value at which to stop the count
		.COUNTER_BITS(5) // Bit length of the counter - adjust as needed
	)counter_game_timer(
		.clk(clk),
		.srst(reset), // Sycnhronous reset to clk
		.enable(game_timer_pulse), // Value of counter will only change if enable is asserted at time of clk posedge

		.count(timer_count) // Value of the counter
	);

	// The Actual Game ///////////////////////////////////////////////////////////////////////////////////////////

	wire [7:0] score_count; //Max score of 32

	// Instantiate an instance of the game
	game game_inst(
		.clk(clk),
		.reset(reset),
		.sw(sw),

		.LED(LED),
		.score_count(score_count)
	);

	// 7-Segment Display ///////////////////////////////////////////////////////////////////////////////////////////
	
	wire [3:0] timerOnes, timerTens, scoreOnes, scoreTens;
	wire display_pulse;
	wire [1:0] counter_out;
	wire [3:0] mux_out;

	// Instantiate Binary to BCD (Binary Coded Decimal) converter to convert internal signals to display output
	bin_to_bcd bin_to_bcd_inst(
		.timerInput(timer_count),
		.scoreInput(score_count),

		.timerOnes(timerOnes),
		.timerTens(timerTens),
		.scoreOnes(scoreOnes),
		.scoreTens(scoreTens)
	);

	// Instantiate slowclock module to create a 200Hz clock for display cycling
	clock_divider #(
		.CLK_IN_FREQ_HZ(100_000_000),
		.CLK_OUT_FREQ_HZ(200),
		.PULSE_MODE(1)
	)clock_divider_display_en(
		.clk_in(clk), // Input clock

		.clk_out(display_pulse) // Output clock divided from input clock
	);

	counter #(
		.INITIAL_VALUE(0), // Initial value of the counter on reset
		.COUNT_DOWN(0), // Toggle to count down instead of count up
		.STOP_VALUE(32'hFFFFFFFF), // Value at which to stop the count
		.COUNTER_BITS(2) // Bit length of the counter - adjust as needed
	)counter_display_en(
		.clk(clk),
		.srst(reset), // Sycnhronous reset to clk
		.enable(display_pulse), // Value of counter will only change if enable is asserted at time of clk posedge

		.count(counter_out) // Value of the counter
	);
	
	// Converts my_counter's output into a display enable signal
	display_an_decoder display_an_decoder_inst(
		.en(counter_out),

		.an(an)
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

endmodule
