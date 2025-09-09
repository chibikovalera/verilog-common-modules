/**
Clock Divivder Module

Description: This module generates a clock enable pulse (CEO) every DIV_VAL clock cycles.
             It's useful for creating slower clock domains or periodic triggers from a fast main clock.

@parameter DIV_VAL: Division value. Output pulse period = (DIV_VAL) * CLK_period.
@note:          The CEO pulse is active high for exactly one clock cycle.
@note:          Asynchronous reset (RST) sets the counter to zero and deasserts CEO.

*/

`timescale 1ns / 1ps

module DIVIDER # (parameter DIV_VAL = 8)
(
	input wire CLK,
  input wire RST,
  
	output reg CEO, 
  output reg [$clog2(DIV_VAL) - 1:0] STATE //Current state of the counter (for debugging)
);

always@(posedge CLK, posedge RST)
begin
  if(RST) 
	begin
		CEO <= 1'b0;
		STATE <= {$clog2(DIV_VAL){1'b0}};
	end
	else
	begin
		if(STATE == DIV_VAL - 1)
		begin
			STATE <= {$clog2(DIV_VAL){1'b0}};
			CEO <= 1'b1;
		end
		else
		begin
			STATE <= STATE + 1;
			CEO <= 0; 
		end
	end
end

endmodule
