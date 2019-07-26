//------------------------------------------------------------------------------
//	Module:	FPGA_TOP_DE2115
//	Desc:	Top level interface from a DE2-115 FPGA board
//------------------------------------------------------------------------------

module FPGA_TOP_DE2115
	(
		////////////////////	Clock Input	 	////////////////////	 
		input CLOCK_50,							//	50 MHz
		////////////////////	Push Button		////////////////////	 
		input [3:0] KEY,
		input [17:0] SW,
		////////////////////	VGA DAC Output ////////////////////		
		output VGA_CLK,
		output VGA_SYNC_N,
		output VGA_BLANK_N,
		output [7:0] VGA_R,
		output [7:0] VGA_G,
		output [7:0] VGA_B,
		////////////////////	VGA Display		////////////////////		
		output VGA_HS,
		output VGA_VS,
		output [6:0] HEX0,
		output [6:0] HEX1,
		output [6:0] HEX2,
		output [6:0] HEX3,
		output [6:0] HEX4,
		output [6:0] HEX5,
		output [6:0] HEX6,
		output [6:0] HEX7
	);
	
	assign switch = SW[0];
	assign Up = KEY[3];
	assign Down = KEY[2];

	//--------------------------------------------------------------------------
	//	Internal signals
	//--------------------------------------------------------------------------
	wire reset = KEY[0];
	wire [3:0] red, green, blue;
	//--------------------------------------------------------------------------

	//--------------------------------------------------------------------------
	//	Module instantiation
	//--------------------------------------------------------------------------

	pong myPong
	(
		.clock (CLOCK_50),
		.red   (red),
		.green (green),
		.blue  (blue),
		.hsync (VGA_HS),
		.vsync (VGA_VS),
		.avideo(VGA_BLANK_N),
		.switch(switch),
		.reset(reset),
		.pushUp(Up),
		.pushDown(Down)
	);

	assign HEX0 = ~7'b1110111;
	assign HEX1 = ~7'b1111101;
	assign HEX2 = ~7'b1110011;
	assign HEX3 = ~7'b1110001;

	assign HEX4 = ~7'b1111101;
	assign HEX5 = ~7'b0110111;
	assign HEX6 = ~7'b0111111;
	assign HEX7 = ~7'b1110011;

	//--------------------------------------------------------------------------
	//	Output Logic
	//--------------------------------------------------------------------------	
	
	assign VGA_R = {red, 4'b0000};
	assign VGA_G = {green, 4'b0000};
	assign VGA_B = {blue, 4'b0000};
	assign VGA_CLK = CLOCK_50;
	
   //--------------------------------------------------------------------------	

endmodule
