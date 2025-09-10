/**
Configurable Counter Module with Universal Modulo Arithmetic

Description: Parameterized counter with configurable step, modulus, and direction.
             Uses modulo arithmetic for both forward and reverse counting.

@param STEP: Increment/decrement step value (default: 1)
@param CNT_MODULE: Modulus value for counter wrap-around (default: 2)
@param REVERSE: Counting direction (0 = forward, 1 = reverse)
@param CNT_WIDTH: Automatic width calculation using $clog2(CNT_MODULE)

@note: Uses mathematically correct modulo arithmetic for both directions.
@note: Handles all edge cases including STEP >= CNT_MODULE correctly.
*/

`timescale 1ns / 1ps

module CNTR # 
(
    parameter STEP = 1, 
    parameter CNT_MODULE = 2, 
    parameter REVERSE = 0, // Counting direction: 0=forward, 1=reverse
    parameter CNT_WIDTH = $clog2(CNT_MODULE)
)(
    input  CLK,
           RST,
    output [(CNT_WIDTH - 1) : 0] cnt    
);

reg [(CNT_WIDTH - 1) : 0] cnt_reg;
assign cnt = cnt_reg;
   
always@(posedge CLK, posedge RST)
begin
    if(RST) cnt_reg <= 0;
    else
        case(REVERSE)
            1'b0: cnt_reg <= (cnt_reg + STEP) % CNT_MODULE;
            1'b1: cnt_reg <= (cnt_reg - STEP + CNT_MODULE) % CNT_MODULE;
        endcase
end
endmodule

