// -----------------------------------------------------------------------------
// Universidade Federal do Recôncavo da Bahia
// -----------------------------------------------------------------------------
// Author : <seu nome aqui> <seu email>
// File   : countermod4.v
// Create : 2019-04-12 20:45:38
// Editor : Sublime Text 3, tab size (3)
// -----------------------------------------------------------------------------
// Module Purpose:
//		Contador módulo 7
// -----------------------------------------------------------------------------
// Entradas: 
// 	clock: clock do sistem
// 	reset: reset global 
// -----------------------------------------------------------------------------					
// Saidas:
// 	value: valor de saída do contador
// -----------------------------------------------------------------------------
`timescale 1ns / 1ps

module	delay_1s(
	output reg delay,
	input	CLOCK_50
);
	
	reg	[25:0] count;
	
	always @(posedge CLOCK_50) begin
		
		if(count==26'd1_499_99) begin
			count<=26'd0;
			delay<=1;
		end

		else begin
			count<=count+1;
			delay<=0;
		end
	
	end
endmodule
