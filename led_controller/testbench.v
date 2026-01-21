`timescale 1ns / 1ps

module testbench();
wire led;
reg clk = 0;
reg btn = 0;

led_controller cntrl1
(
    .btn_in(btn), 
    .clk(clk), 
    .led_out(led)
);

always #10 clk = ~clk;

initial
begin
    #50
    $srandom(33985);
    repeat(2)
    begin
        repeat($urandom_range(50,0))
        begin
            btn = $random;
            #3;
        end
        btn = 1;
        #200;
        repeat($urandom_range(50,0))
        begin
            btn = $random;
            #3;
        end
        btn = 0;
        #200;
    end
end

wire out_signal;
wire out_signal_enable;

btn_fltr # (1'b1) fltr
(
    .clk(clk),
    .in_signal(btn),
    .OUT_SIGNAL(out_signal),
    .OUT_SIGNAL_ENABLE(out_signal_enable)
);

wire synch_out;

synchronizer sync
(
    .IN(btn),
    .CLK(clk),
    .OUT(synch_out)
);

wire [1:0] count;
counter # (.step(1), .cnt_module(4))cnt
(
    .C(clk),
    .RE(synch_out ~^ out_signal),
    .CE(1'b1),
    .Q(count)
);
endmodule
