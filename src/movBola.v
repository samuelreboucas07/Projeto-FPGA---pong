`timescale 1ns / 1ps
module MOVBola(
    input clock,
    input reset,
    input [1:0] sentido,
    output reg [9:0] x_F_Bola,
    output reg [9:0] x_I_Bola,
    output reg [9:0] y_S_Bola,
    output reg [9:0] y_I_Bola, 
    input [9:0] Pos_barra_y_I,
    input [9:0] Pos_barra_y_S,
    input [1:0] ponto,
    input setor1,
    input setor2,
    input setor3,
    input setor4,
    input setor5,
    input setor6,
    input count4
);
	
	reg ponto2 = 0;
	reg count = 0;
	reg [3:0] random;
	reg [9:0] y_S_random;
    reg [9:0] y_I_random;
    reg sentido2 = 0;
    reg sentido3 = 0;
    
	delay_1s c1s
	(
		.CLOCK_50(clock), 
		.delay(return)
	);

	always @(posedge clock) begin


		if (random == 4'b0001) begin
			y_S_random <= 100;
			y_I_random <= 106;
		end
		else if (random == 4'b0010) begin
			y_S_random <= 400;
			y_I_random <= 406;
		end
		else if (random == 4'b0011) begin
			y_S_random <= 270;
			y_I_random <= 276;
		end
		else if (random == 4'b0100) begin
			y_S_random <= 133;
			y_I_random <= 139;
		end
		else if (random == 4'b0101) begin
			y_S_random <= 450;
			y_I_random <= 456;
		end
		else if (random == 4'b0110) begin
			y_S_random <= 310;
			y_I_random <= 316;
		end
		else if (random == 4'b0111) begin
			y_S_random <= 210;
			y_I_random <= 216;
		end
		else if (random == 4'b1000) begin
			y_S_random <= 35;
			y_I_random <= 41;
		end
		else if (random == 4'b1001) begin
			y_S_random <= 335;
			y_I_random <= 341;
		end
		else if (random == 4'b1010) begin
			y_S_random <= 135;
			y_I_random <= 141;
		end
		else begin
			y_S_random <= 227;
			y_I_random <= 233;
		end
	end

	reg aux = 0;
	reg aux2 = 0;
	reg aux11 = 0;
	reg aux22 = 0;
	
	always @(posedge clock) begin
		
		if(~reset) begin
			x_I_Bola <= 630;
			x_F_Bola <= 634;
			y_S_Bola <= 237;
			y_I_Bola <= 243;
			sentido2 <= 0;
			sentido3 <= 0;
			aux <= 0;
			aux2 <= 0;
			aux11 <= 0;
			aux22 <= 0;

		end

		else if(count == 0) begin
			x_I_Bola <= 630;
			x_F_Bola <= 634;
			y_S_Bola <= 237;
			y_I_Bola <= 243;
			count <= count + 1;
		end

		else if(return == 1) begin

			if (ponto == 2'b01 || ponto2 == 1 || count4 == 1) begin
				random <= random + 1'b1;
				x_I_Bola <= 630;
				x_F_Bola <= 634;
				y_S_Bola <= y_S_random;
				y_I_Bola <= y_I_random;
				sentido2 <= 0;
				sentido3 <= 0;
				ponto2 <= 0;
				aux <= 0;
				aux2 <= 0;
				aux11 <= 0;
				aux22 <= 0;
			end
		
			else if(y_S_Bola <= 29)begin
				aux <= 1;
				y_S_Bola <= y_S_Bola + 10'b0000000001;
				y_I_Bola <= y_I_Bola + 10'b0000000001;
				if (x_F_Bola == 636) begin
					aux2 <= 1;
				end
			end

			else if(aux == 1 &&  aux2 == 0)begin
				if (x_F_Bola == 636) begin
						aux2 <= 1;
						sentido2 <= 1;
				end
				else if(y_I_Bola >= 470) begin
						aux2 <= 1;
						sentido2 <= 0;
				end
					else begin
						if (sentido == 2'b01) begin
							if(x_I_Bola <= 10) begin
								ponto2 = 1;
							end
							else begin
								x_I_Bola <= x_I_Bola - 10'b0000000001;
								x_F_Bola <= x_F_Bola - 10'b0000000001;
								y_S_Bola <= y_S_Bola + 10'b0000000001;
								y_I_Bola <= y_I_Bola + 10'b0000000001;
							end
						end
						else begin
							x_I_Bola <= x_I_Bola + 10'b0000000001;
							x_F_Bola <= x_F_Bola + 10'b0000000001;
							y_S_Bola <= y_S_Bola + 10'b0000000001;
							y_I_Bola <= y_I_Bola + 10'b0000000001;
						end
					end
			end

			else if(aux2 == 1)begin
				aux <= 0;
				aux2 <= 0;
			end

			else if(y_I_Bola >= 470)begin
					aux11 <= 1;
					x_I_Bola <= x_I_Bola + 10'b0000000001;
					x_F_Bola <= x_F_Bola + 10'b0000000001;
					y_S_Bola <= y_S_Bola - 10'b0000000001;
					y_I_Bola <= y_I_Bola - 10'b0000000001;
				if (x_F_Bola == 636) begin
					aux22 <= 1;
				end
			end

			else if(aux11 == 1 &&  aux22 == 0)begin
				if (x_F_Bola == 636 ) begin
					aux22 <= 1;
					sentido3 <= 1;
				end

				else if (y_S_Bola <= 29) begin
					aux22 <= 1;
					sentido3 <= 0;
				end
				else begin
					if (sentido == 2'b01) begin
							if(x_I_Bola <= 10) begin
								ponto2 = 1;
							end
							else begin
								x_I_Bola <= x_I_Bola - 10'b0000000001;
								x_F_Bola <= x_F_Bola - 10'b0000000001;
								y_S_Bola <= y_S_Bola - 10'b0000000001;
								y_I_Bola <= y_I_Bola - 10'b0000000001;
							end
						end
						else begin
							x_I_Bola <= x_I_Bola + 10'b0000000001;
							x_F_Bola <= x_F_Bola + 10'b0000000001;
							y_S_Bola <= y_S_Bola - 10'b0000000001;
							y_I_Bola <= y_I_Bola - 10'b0000000001;
						end
				end
			end

			else if(aux22 == 1)begin
				aux11 <= 0;
				aux22 <= 0;
			end

			else if(sentido == 2'b01 && sentido2 == 1) begin
				x_I_Bola <= x_I_Bola - 10'b0000000001;
				x_F_Bola <= x_F_Bola - 10'b0000000001;
				y_S_Bola <= y_S_Bola + 10'b0000000001;
				y_I_Bola <= y_I_Bola + 10'b0000000001;
			end
			else if(sentido == 2'b01 && sentido3 == 1) begin
				x_I_Bola <= x_I_Bola - 10'b0000000001;
				x_F_Bola <= x_F_Bola - 10'b0000000001;
				y_S_Bola <= y_S_Bola - 10'b0000000001;
				y_I_Bola <= y_I_Bola - 10'b0000000001;
			end

			else if(sentido == 2'b01) begin
				x_I_Bola <= x_I_Bola - 10'b0000000001;
				x_F_Bola <= x_F_Bola - 10'b0000000001;
			end

			else begin
				if(setor1 == 1)begin
					x_I_Bola <= x_I_Bola + 10'b0000000001;
					x_F_Bola <= x_F_Bola + 10'b0000000001;
					y_S_Bola <= y_S_Bola - 10'b0000000011;
					y_I_Bola <= y_I_Bola - 10'b0000000011;
				end
				else if(setor2 == 1)begin
					x_I_Bola <= x_I_Bola + 10'b0000000001;
					x_F_Bola <= x_F_Bola + 10'b0000000001;
					y_S_Bola <= y_S_Bola - 10'b0000000010;
					y_I_Bola <= y_I_Bola - 10'b0000000010;
				end
				else if(setor3 == 1)begin
					x_I_Bola <= x_I_Bola + 10'b0000000001;
					x_F_Bola <= x_F_Bola + 10'b0000000001;
					y_S_Bola <= y_S_Bola - 10'b0000000001;
					y_I_Bola <= y_I_Bola - 10'b0000000001;
				end
				else if(setor4 == 1)begin
					x_I_Bola <= x_I_Bola + 10'b0000000001;
					x_F_Bola <= x_F_Bola + 10'b0000000001;
					y_S_Bola <= y_S_Bola + 10'b0000000001;
					y_I_Bola <= y_I_Bola + 10'b0000000001;
				end
				else if(setor5 == 1)begin
					x_I_Bola <= x_I_Bola + 10'b0000000001;
					x_F_Bola <= x_F_Bola + 10'b0000000001;
					y_S_Bola <= y_S_Bola + 10'b0000000010;
					y_I_Bola <= y_I_Bola + 10'b0000000010;
				end
				else if(setor6 == 1)begin
					x_I_Bola <= x_I_Bola + 10'b0000000001;
					x_F_Bola <= x_F_Bola + 10'b0000000001;
					y_S_Bola <= y_S_Bola + 10'b0000000011;
					y_I_Bola <= y_I_Bola + 10'b0000000011;
				end
				else begin
					x_I_Bola <= x_I_Bola + 10'b0000000001;
					x_F_Bola <= x_F_Bola + 10'b0000000001;
				end
			end
		end
		
		else begin
			x_I_Bola <= x_I_Bola;
			x_F_Bola <= x_F_Bola;
		end

	end
	
endmodule