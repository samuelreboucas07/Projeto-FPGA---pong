module impact(
	input clock,
	input reset,
	input [9:0] Pos_barra_y_S,
	input [9:0] Pos_barra_y_I,
	input [9:0] Pos_bola_I_x,
	input [9:0] Pos_bola_F_x,
	input [9:0] Pos_bola_S_y,
	input [9:0] Pos_bola_I_y,
	output reg [1:0] sentido_x,
	output reg [1:0] ponto,
	output reg setor1,
	output reg setor2,
	output reg setor3,
	output reg setor4,
	output reg setor5,
	output reg setor6
);
	
	parameter INITIAL = 3'b001; 
	parameter DIREITA = 3'b010;
	parameter ESQUERDA = 3'b101;
	
	reg [2:0] state, next_state;
	reg [2:0] aux2 = 3'b000;
	reg aux = 0;

	always @(posedge clock)
		if (~reset) state <= INITIAL;
		else state <= next_state;

	always @(posedge clock) begin
		case(state)
			INITIAL : begin

				if(Pos_bola_I_x == 33 && (Pos_barra_y_S <= ((Pos_bola_S_y + Pos_bola_I_y)/2)) && (Pos_barra_y_I >= ((Pos_bola_S_y + Pos_bola_I_y)/2))) begin
					ponto = 2'b10;
					if((((Pos_bola_S_y + Pos_bola_I_y)/2) >= Pos_barra_y_S) && (((Pos_bola_S_y + Pos_bola_I_y)/2) <= Pos_barra_y_S+5))begin
						setor1 = 1;
						setor2 = 0;
						setor3 = 0;
						setor4 = 0;
						setor5 = 0;
						setor6 = 0;
					end
					else if((((Pos_bola_S_y + Pos_bola_I_y)/2) >= Pos_barra_y_S+6) && (((Pos_bola_S_y + Pos_bola_I_y)/2) <= Pos_barra_y_S+11))begin
						setor2 = 1;
						setor1 = 0;
						setor3 = 0;
						setor4 = 0;
						setor5 = 0;
						setor6 = 0;
					end
					else if((((Pos_bola_S_y + Pos_bola_I_y)/2) >= Pos_barra_y_S+12) && (((Pos_bola_S_y + Pos_bola_I_y)/2) <= Pos_barra_y_S+16))begin
						setor3 = 1;
						setor1 = 0;
						setor2 = 0;
						setor4 = 0;
						setor5 = 0;
						setor6 = 0;
					end
					else if((((Pos_bola_S_y + Pos_bola_I_y)/2) <= Pos_barra_y_I-12) && (((Pos_bola_S_y + Pos_bola_I_y)/2) >= Pos_barra_y_I-17))begin
						setor4 = 1;
						setor1 = 0;
						setor3 = 0;
						setor2 = 0;
						setor5 = 0;
						setor6 = 0;
					end
					else if((((Pos_bola_S_y + Pos_bola_I_y)/2) <= Pos_barra_y_I-6) && (((Pos_bola_S_y + Pos_bola_I_y)/2) >= Pos_barra_y_I-11))begin
						setor5 = 1;
						setor1 = 0;
						setor3 = 0;
						setor4 = 0;
						setor2 = 0;
						setor6 = 0;
					end
					else if((((Pos_bola_S_y + Pos_bola_I_y)/2) <= Pos_barra_y_I) && (((Pos_bola_S_y + Pos_bola_I_y)/2) >= Pos_barra_y_I-5))begin
						setor6 = 1;
						setor1 = 0;
						setor3 = 0;
						setor4 = 0;
						setor5 = 0;
						setor2 = 0;
					end
					else begin
						setor1 = 0;
						setor2 = 0;
						setor3 = 0;
						setor4 = 0;
						setor5 = 0;
						setor6 = 0;
					end
					next_state = DIREITA;
				end
				
				else if(Pos_bola_I_x < 10 && ((((Pos_bola_S_y + Pos_bola_I_y)/2) > Pos_barra_y_I) || (((Pos_bola_S_y + Pos_bola_I_y)/2) < Pos_barra_y_S))) begin
					ponto = 2'b01;
					next_state = INITIAL;
				end
				
				else begin
					ponto = 2'b10;
					sentido_x = 2'b01;
					next_state = INITIAL;
				end
			end
			
			DIREITA: begin
				if(Pos_bola_F_x == 634) begin
					next_state = INITIAL;
				end
				else begin
					sentido_x = 2'b10;
					next_state = DIREITA;
				end
			end
		
		endcase

	end

endmodule