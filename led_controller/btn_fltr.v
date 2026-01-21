`timescale 1ns / 1ps

module btn_fltr #(CLOCK_ENABLE = 1'b1)
(
    input clk, in_signal,
    output reg OUT_SIGNAL, 
    output reg OUT_SIGNAL_ENABLE
);

wire [1:0] cnt_out;
wire synch_out;

synchronizer synch1
(
    .CLK(clk),
    .IN(in_signal),
    .OUT(synch_out)
);

counter #(.step(1), .cnt_module(4)) cnt1
(
    .clk(clk),
    .reset(synch_out ~^ OUT_SIGNAL),
    .reverse(1'b0), // Добавлен порт reverse
    .cnt(cnt_out)   // Изменено с Q на cnt
);

always@(posedge clk)
begin
    if ((cnt_out[0] & cnt_out[1]) & CLOCK_ENABLE)
        OUT_SIGNAL <= synch_out;
    OUT_SIGNAL_ENABLE <= (cnt_out[0] & cnt_out[1] & CLOCK_ENABLE & synch_out);
end

endmodule
