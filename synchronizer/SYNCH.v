/**
Synchronizer Module for Asynchronous Inputs

Description:  Triple-flop synchronizer for safely passing asynchronous signals
              into a synchronous clock domain. Prevents metastability.

@note: Uses three D-flip-flops in series to reduce probability of
       metastable events propagating to the synchronous system.
@note: Includes asynchronous reset that initializes all flops to known state.
*/

`timescale 1ns / 1ps

module SYNCH
(
    input ASYNC_IN, // Asychronous input signal  
  	input CLK,  
  	input RST,
	
	  output SYNC_OUT // Synchronized output signal
);

// Internal synchronization registers (3-stage shift register)
reg a, b, c;

// Synchronization process (3-stage pipeline)
always@(posedge CLK, posedge RST)
begin
	if(RST)
	begin
		a <= 1'b1;
		b <= 1'b1;
		c <= 1'b1;
	end
	else
	begin
		a <= ASYNC_IN;
		b <= a;
		c <= b;
	end
end 

assign SYNC_OUT = c;

endmodule
