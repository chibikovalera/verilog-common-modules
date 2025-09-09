/**
ASCII to Hexadecimal Converter Module

Description: Converts ASCII character codes to their 4-bit hexadecimal equivalents.
             Supports digits ('0'-'9'), uppercase letters ('A'-'F'), and lowercase letters ('a'-'f').
             Provides a flag indicating valid hexadecimal characters.

@note: Combinational logic - outputs update immediately when inputs change.
@note: Invalid characters return HEX=0xF with HEX_FLG=0.
@note: Case-insensitive conversion: both 'A'/'a' -> 0xA, etc.
*/

`timescale 1ns / 1ps

module DC_ASCII_HEX
(
    input [7:0] ASCII, // ASCII character input
    
    output reg [3:0] HEX, // 4-bit hexadecimal output
    output reg HEX_FLG  // Valid hexadecimal flag (1 = valid, 0 = invalid)
);

always@(*)
begin
    case(ASCII)
        // Digits 0-9 (ASCII 0x30-0x39)
        8'h30: begin HEX = 4'h0; HEX_FLG = 1'b1; end
        8'h31: begin HEX = 4'h1; HEX_FLG = 1'b1; end
        8'h32: begin HEX = 4'h2; HEX_FLG = 1'b1; end
        8'h33: begin HEX = 4'h3; HEX_FLG = 1'b1; end
        8'h34: begin HEX = 4'h4; HEX_FLG = 1'b1; end
        8'h35: begin HEX = 4'h5; HEX_FLG = 1'b1; end
        8'h36: begin HEX = 4'h6; HEX_FLG = 1'b1; end
        8'h37: begin HEX = 4'h7; HEX_FLG = 1'b1; end
        8'h38: begin HEX = 4'h8; HEX_FLG = 1'b1; end
        8'h39: begin HEX = 4'h9; HEX_FLG = 1'b1; end

        // Uppercase and lowercase A-F (ASCII 0x41-0x46, 0x61-0x66)
        8'h41, 8'h61: begin HEX = 4'hA; HEX_FLG = 1'b1; end
        8'h42, 8'h62: begin HEX = 4'hB; HEX_FLG = 1'b1; end
        8'h43, 8'h63: begin HEX = 4'hC; HEX_FLG = 1'b1; end
        8'h44, 8'h64: begin HEX = 4'hD; HEX_FLG = 1'b1; end
        8'h45, 8'h65: begin HEX = 4'hE; HEX_FLG = 1'b1; end
        8'h46, 8'h66: begin HEX = 4'hF; HEX_FLG = 1'b1; end

        // Invalid characters
        default: begin
            HEX= 4'hF;
            HEX_FLG = 1'b0;
        end
    endcase      
end

endmodule
