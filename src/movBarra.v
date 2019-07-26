`timescale 1ns / 1ps
module MOVBarra(
    input clock,
    input reset,
    input Up,
    input Down,
    output reg [9:0] y_S_Barra,
    output reg [9:0] y_I_Barra,
    input count2
    );
	
	reg count = 0;

	delay_4s c1s
	(
		.CLOCK_50(clock),
		.delay(return_barra)
	);

	always @(posedge clock) begin	
		
		if(~reset) begin
			y_S_Barra <= 220;
			y_I_Barra <= 260;
		end

		else if(count == 0 || count2 == 1) begin
			y_S_Barra <= 220;
			y_I_Barra <= 260;
			count <= count+1;
		end

		else if(Up == 0 && return_barra == 1) begin
			if(y_S_Barra > 28) begin
				y_S_Barra <= y_S_Barra - 10'b0000000011;
				y_I_Barra <= y_I_Barra - 10'b0000000011;
			end
			else begin
				y_S_Barra <= y_S_Barra;
				y_I_Barra <= y_I_Barra;
			end
		end

		else if(Down == 0 && return_barra == 1) begin
			if(y_I_Barra < 473) begin
				y_S_Barra <= y_S_Barra + 10'b0000000011;
				y_I_Barra <= y_I_Barra + 10'b0000000011;
			end
			else begin
				y_S_Barra <= y_S_Barra;
				y_I_Barra <= y_I_Barra;
			end
		end

		else begin
			y_S_Barra <= y_S_Barra;
			y_I_Barra <= y_I_Barra;
		end

	end

endmodule