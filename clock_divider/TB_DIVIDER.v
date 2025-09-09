/**
Testbench for DIVIDER.v

Description: This module verifies the functionality of the clock divider.
             It generates a clock and reset stimulus, instantiates the DUT (Device Under Test),
             and monitors the outputs.
*/

`timescale 1ns / 1ps

module TB_DIVIDER();

reg clk = 0;
reg rst = 0;
wire [2:0] state;

wire CE;

always #10 clk = ~clk;

DIVIDER #(7) uut1 
(
    .CLK(clk),
    .RST(rst),
    .CEO(CE),
    .STATE(state)
);

initial
begin
    rst = 1'b1;
    #100;
    rst = 1'b0;
    #500;
    rst = 1'b1;
    #50;
    rst = 1'b0;
    #300;
    $finish;
end

endmodule

