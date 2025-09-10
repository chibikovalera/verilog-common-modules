/**
Testbench for SYNCH.v - Synchronizer Module Verification

Description: Comprehensive test environment that verifies the 3-stage synchronizer
             functionality with various asynchronous input scenarios and reset conditions.

@note: Tests include normal operation, glitch filtering, and reset recovery.
*/

`timescale 1ns / 1ps

module TB_SYNCH();

reg ASYNC_IN;
reg CLK;
reg RST;
    
wire SYNC_OUT;
    
SYNCH uut 
(
    .ASYNC_IN(ASYNC_IN),
    .CLK(CLK),
    .RST(RST),
    .SYNC_OUT(SYNC_OUT)
);

// Clock generation
always 
begin
    CLK = 1'b0;
    #5;
    CLK = 1'b1;
    #5;
end
   
// Text stimulus generation
initial 
begin
    ASYNC_IN = 1'b1;
    RST = 1'b1;

    #20;
    RST = 1'b0;
       
    #30;

    // Clean transition
    ASYNC_IN = 1'b0;
    #10;
    ASYNC_IN = 1'b1;
    #40;

    // Longer low pulse
    ASYNC_IN = 1'b0;
    #50;
    ASYNC_IN = 1'b1;
    #40;

    // Rapid transitions
    ASYNC_IN = 1'b0;
    #15;
    ASYNC_IN = 1'b1;
    #12;
    ASYNC_IN = 1'b0;
    #18;
    ASYNC_IN = 1'b1;
    #40;

    // Reset during operation
    RST = 1'b1;
    #20;
    RST = 1'b0;
    #40;     

    // Short pulse
    ASYNC_IN = 1'b0;
    #7;  
    ASYNC_IN = 1'b1;
    #40;       

    // Long stable input
    ASYNC_IN = 1'b0;
    #100;
    ASYNC_IN = 1'b1;
    #50;

end

endmodule
