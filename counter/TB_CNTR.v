/**
Testbench for CNTR.v - Configurable Counter Module Verification

Description: Tests multiple counter configurations simultaneously to verify:
              1. Forward counting with STEP=3, MODULE=17
              2. Reverse counting with STEP=3, MODULE=17  
              3. Edge case: Reverse counting with STEP=5, MODULE=8
@note: Demonstrates proper handling of different bit widths and edge cases.
*/

`timescale 1ns / 1ps

module TB_CNTR;
    
reg  CLK;
reg  RST;
wire [4:0] cnt_forward;
wire [2:0] cnt_edge;
wire [4:0] cnt_reverse; 

// Test Case 1: Forward counter (Step = 3, Module = 17)
CNTR #
(
    .STEP(3),
    .CNT_MODULE(17),
    .REVERSE(0)
) 
uut_forward 
(
    .CLK(CLK),
    .RST(RST),
    .cnt(cnt_forward)
);
  
  // Test Case 2: Reverse counter (Step = 3, Module = 17)
CNTR #(
    .STEP(3),
    .CNT_MODULE(17),
    .REVERSE(1) 
) 
uut_reverse 
(
    .CLK(CLK),
    .RST(RST),
    .cnt(cnt_reverse)
);

  // Test Case 3: Edge case - Reverse counter with large step (Step = 5, Module = 8)
CNTR #
(
    .STEP(5),
    .CNT_MODULE(8),
    .REVERSE(1)
) 
uut_edge_case 
(
    .CLK(CLK),
    .RST(RST),
    .cnt(cnt_edge)
);    

// Clock generation
always 
begin
    CLK = 1'b0;
    #5;
    CLK = 1'b1;
    #5;
end
    
// Test procedure
initial 
begin
    RST = 1'b1;

    #20;
    RST = 1'b0;
       
    #200;

    RST = 1'b1;
    #30;
    RST = 1'b0;
    #100;

    #100;
    $finish;
end

endmodule
