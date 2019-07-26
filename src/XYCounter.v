////////////////////////////////////////////////////////////////////////////////
// Joao Bittencourt
// Nov 6, 2018
////////////////////////////////////////////////////////////////////////////////
module XYCounter #(
	parameter width=4, height=10
	)(
	input clock,   
	input enable,  
	output reg [$clog2(width)-1:0] x = 0,
	output reg [$clog2(height)-1:0] y = 0
	);

always @(posedge clock) begin
	
	   if(enable)
	   begin
			if(x != width-1)
			x <= x + 1'b1;
			else
			if (y != height-1) begin
				y <= y + 1'b1;
				x <= {width{1'b0}};
			end
			else begin
				x <= {width{1'b0}};
				y <= {height{1'b0}};
			end

	   end		
	end
endmodule


