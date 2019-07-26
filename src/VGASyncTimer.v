//////////////////////////////////////////////////////////////////////////////////
//
// VGA Sync Generator
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
`include "Display640x480.vh"

module VGASyncTimer (
	input clock, 
	output hsync,
	output vsync,
	output activevideo,
	output [`xbits-1:0] x,
	output [`ybits-1:0] y
	);

	// These lines below allow you to count every 2nd clock tick
	// This is because, depending on the display mode, we may need to count at 50 MHz or 25 MHz

	reg [1:0] clock_count = 0;
	always @(posedge clock) begin : proc_clock_count
		clock_count <= clock_count + 2'b01;
		
	end
	
	wire Every2ndTick;
	wire Every4thTick;

	assign Every2ndTick = (clock_count[0] == 1'b1);
	assign Every4thTick = (clock_count == 2'b11);

	// This part instantiates an xy-counter using the appropriate clock tick counter
	// XYCounter #(`WholeLine, `WholeFrame) xy (clock, 1'b1, x, y); // Count at 50 MHz
	XYCounter #(`WholeLine, `WholeFrame) xy (clock, Every2ndTick, x, y); // Count at 25 MHz

   assign activevideo 		= (x > `hVisible-1) || (y > `vVisible-1) ? 1'b0 : 1'b1;
   assign hsync 			= (x > `hSyncStart - 1) && (x < `hSyncEnd + 1)? 1'b0 : 1'b1; // x
   assign vsync 			= (y > `vSyncStart - 1) && (y < `vSyncEnd + 1) ? 1'b0 : 1'b1; // y

   
endmodule
