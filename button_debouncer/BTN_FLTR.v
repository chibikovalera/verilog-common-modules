/**
Button Debouncer Module

Descriprion: This module filters mechanical switch bounce by waiting for a stable input state.
             It synchronizes the asynchronous button input, counts stable periods, and outputs
             a clean, debounced signal with a change detection pulse.

@parameter CNTR_WIDTH: Counter width. Debounce time = (2^CNTR_WIDTH) * CLK_period * CE_period.
@note: Includes metastability protection via dual-stage synchronizer.
@note: Asynchronous reset (RST) initializes all internal registers.
*/

`timescale 1ns / 1ps

module BTN_FLTR # (parameter CNTR_WIDTH = 4)
(
	input wire BTN_IN, // Raw button input 
	input CLK, // System clock
	input CE, // Clock Enable for the counter
	input RST, // Asynchronous reset (active high)
	
	output BTN_OUT, // Filtered button state
	output reg BTN_CEO // Pulse on filtered state change
);

// Synchronization registers
reg BTN_S0;
reg BTN_S1;

// Counter
reg [CNTR_WIDTH-1:0] FLTR_CNT;

// Output register
reg BTN_S2;

//Synchronizer
always@(posedge CLK or posedge RST) 
begin
	if(RST)
	begin
		BTN_S0 <= 1'b0;
		BTN_S1 <= 1'b0;
	end
	else
	begin
		BTN_S0 <= BTN_IN;
		BTN_S1 <= BTN_S0;
	end
end

// Counter
always@(posedge CLK, posedge RST)
begin
	if(RST)
		FLTR_CNT <= {CNTR_WIDTH{1'b0}};
	else
	begin
		if (BTN_S1 ^~ BTN_S2)
			FLTR_CNT <= {CNTR_WIDTH{1'b0}};
		else if (CE)
			FLTR_CNT <= FLTR_CNT + 1;
	end
end

// Output register update
always@(posedge CLK, posedge RST)
begin
	if(RST)
		BTN_S2 <= 1'b0;
	else if (CE && FLTR_CNT == {CNTR_WIDTH{1'b1}})
	begin
		BTN_S2 <= BTN_S1;
	end 
end

// Assign the output
assign BTN_OUT = BTN_S2;

// CEO generation
always@(posedge CLK, posedge RST)
begin
	if(RST)
		BTN_CEO <= 1'b0;
	else
		BTN_CEO <= (FLTR_CNT == {CNTR_WIDTH{1'b1}}) && CE && BTN_S1;
end

endmodule
