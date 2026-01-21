`timescale 1ns / 1ps

module synchronizer
(
    input IN, CLK,
    output OUT
);

reg reg1, reg2;

always@(posedge CLK)
begin
    reg1 <= IN;
    reg2 <= reg1; 
end

assign OUT = reg2;

endmodule
