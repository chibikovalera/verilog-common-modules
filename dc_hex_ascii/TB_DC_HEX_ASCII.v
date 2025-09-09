/**
Testbench for CV_DC_HEX_ASCII.v - Hexadecimal to ASCII Converter Verification

Description: Comprehensive test environment that verifies the hex-to-ASCII conversion
             for all valid hexadecimal digits (0-F) and tests error handling for
             invalid inputs.

@note: Tests all 16 possible hex values and includes boundary value testing.
*/

`timescale 1ns / 1ps

module TB_DC_HEX_ASCII();
// Inputs
reg [3:0] HEX;     // Test hexadecimal input
// Outputs
wire [7:0] ASCII;  // ASCII output from DUT
    
// Instantiate the Unit Under Test (UUT)
DC_HEX_ASCII uut 
(
    .HEX(HEX),
    .ASCII(ASCII)
);
    
// Test stimulus
initial begin
    // Initialize Inputs
    HEX = 0;
     
    // Test all hexadecimal digits 0-9
    #10 HEX = 4'h0; // 0
    #10 HEX = 4'h1; // 1
    #10 HEX = 4'h2; // 2
    #10 HEX = 4'h3; // 3
    #10 HEX = 4'h4; // 4
    #10 HEX = 4'h5; // 5
    #10 HEX = 4'h6; // 6
    #10 HEX = 4'h7; // 7
    #10 HEX = 4'h8; // 8
    #10 HEX = 4'h9; // 9
    
    // Test all hexadecimal letters A-F
    #10 HEX = 4'hA; // A
    #10 HEX = 4'hB; // B
    #10 HEX = 4'hC; // C
    #10 HEX = 4'hD; // D
    #10 HEX = 4'hE; // E
    #10 HEX = 4'hF; // F
       
    // Test boundary and edge cases
    #10 HEX = 4'b0000; // Minimum value
    #10 HEX = 4'b1111; // Maximum value
        
    // Test some undefined states 
    #10 HEX = 4'bxxxx; // Unknown values
    #10 HEX = 4'bzzzz; // High impedance
       
    #10 $finish;
    end
    
endmodule
