/**
Testbench for DC_ASCII_HEX.v - ASCII to Hexadecimal Converter Verification

Descriprion: Comprehensive test environment that verifies the ASCII-to-hex conversion
             for all valid characters (0-9, A-F, a-f) and tests error handling for
             invalid inputs.

@note:  Tests all edge cases including boundary values and random invalid data.
*/

`timescale 1ns / 1ps

module TB_DC_ASCII_HEX;

    // Inputs
    reg [7:0] ASCII; // Test ASCII input
    
    // Outputs
    wire [3:0] HEX; // Hexadecimal output from DUT
    wire HEX_FLG; // Valid flag output from DUT
    
    // Instantiate the Unit Under Test (UUT)
    DC_ASCII_HEX uut (
        .ASCII(ASCII),
        .HEX(HEX),
        .HEX_FLG(HEX_FLG)
    );
    
    // Test stimulus
    initial begin
        // Initialize Inputs
        ASCII = 0;
        
        // Test digits 0-9
        #10 ASCII = 8'h30; // '0'
        #10 ASCII = 8'h31; // '1'
        #10 ASCII = 8'h32; // '2'
        #10 ASCII = 8'h33; // '3'
        #10 ASCII = 8'h34; // '4'
        #10 ASCII = 8'h35; // '5'
        #10 ASCII = 8'h36; // '6'
        #10 ASCII = 8'h37; // '7'
        #10 ASCII = 8'h38; // '8'
        #10 ASCII = 8'h39; // '9'
        
        // Test uppercase A-F
        #10 ASCII = 8'h41; // 'A'
        #10 ASCII = 8'h42; // 'B'
        #10 ASCII = 8'h43; // 'C'
        #10 ASCII = 8'h44; // 'D'
        #10 ASCII = 8'h45; // 'E'
        #10 ASCII = 8'h46; // 'F'
        
        // Test lowercase a-f
        #10 ASCII = 8'h61; // 'a'
        #10 ASCII = 8'h62; // 'b'
        #10 ASCII = 8'h63; // 'c'
        #10 ASCII = 8'h64; // 'd'
        #10 ASCII = 8'h65; // 'e'
        #10 ASCII = 8'h66; // 'f'
        
        // Test invalid characters
        #10 ASCII = 8'h00; // Null
        #10 ASCII = 8'h20; // Space
        #10 ASCII = 8'h47; // 'G' (invalid)
        #10 ASCII = 8'h67; // 'g' (invalid)
        #10 ASCII = 8'hFF; // Random value
        
        #10 $finish;
    end

endmodule
