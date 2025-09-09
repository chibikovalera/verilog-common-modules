/**
Hexadecimal to ASCII Converter Module

Description: Converts 4-bit hexadecimal values to their corresponding ASCII character codes.
             Supports hexadecimal digits 0-9 and uppercase letters A-F.

@note:          Combinational logic - outputs update immediately when inputs change.
@note:          Outputs uppercase ASCII characters (A-F).
*/

`timescale 1ns / 1ps

module DC_HEX_ASCII
(
    input [3:0] HEX, // 4-bit hexadecimal input (0x0-0xF)
    output reg [7:0] ASCII // ASCII character output
);

always@(*)
begin
    case(HEX)
        // Digigts 0-9: ASCII codes 0x30-0x39
        4'h0: ASCII = 8'h30;
        4'h1: ASCII = 8'h31;
        4'h2: ASCII = 8'h32;
        4'h3: ASCII = 8'h33;
        4'h4: ASCII = 8'h34;
        4'h5: ASCII = 8'h35;
        4'h6: ASCII = 8'h36;
        4'h7: ASCII = 8'h37;
        4'h8: ASCII = 8'h38;
        4'h9: ASCII = 8'h39;
        
        // Letters A-F: ASCII codes 0x41-0x46
        4'hA: ASCII = 8'h41;
        4'hB: ASCII = 8'h42;
        4'hC: ASCII = 8'h43;
        4'hD: ASCII = 8'h44;
        4'hE: ASCII = 8'h45;
        4'hF: ASCII = 8'h46;

        default: ASCII = 8'hff;
    endcase
end

endmodule
