`timescale 1ns / 1ps

module led_controller
(
    input btn_in, clk,
    output reg led_out = 0
);

wire out_signal;

btn_fltr # (1'b1) fltr1
(
    .clk(clk),
    .in_signal(btn_in),
    .OUT_SIGNAL(out_signal),
    .OUT_SIGNAL_ENABLE()
);

always@(posedge out_signal) led_out = ~led_out;

endmodule
