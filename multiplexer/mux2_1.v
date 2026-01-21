`timescale 1ns / 1ps

module mux2_1(
    input a0, x1, x0,
    output f
);
    assign f = ~a0 & x0 | a0 & x1;
endmodule
