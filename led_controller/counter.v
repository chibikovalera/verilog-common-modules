`timescale 1ns / 1ps

module counter # (parameter step = 1, cnt_module = 2)
(
    input wire clk,
    input wire reset,
    input wire reverse,
    output reg [($clog2(cnt_module) - 1) : 0] cnt    
);

initial cnt = 0;
always@(posedge clk, posedge reset)
begin
    if(reset) cnt <= 0;
    else
        case(reverse)
            1'b0: cnt <= (cnt + step) % cnt_module;
            1'b1: if(step > cnt) cnt <= cnt_module + cnt - step;
                  else cnt <= cnt - step;
        endcase
end
endmodule
