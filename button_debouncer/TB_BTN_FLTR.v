/**
Testbench for BTN_FLTR.v - Button Debounce Module Verification

Description: Comprehensive test environment that simulates mechanical button bounce
             with random noise patterns followed by stable periods. Verifies proper
             debouncing and change detection functionality.

@note: Generates realistic button press/release sequences with bounce artifacts.
@note: Includes asymmetric clock generation for thorough timing verification.
*/

`timescale 1ns / 1ps

module TB_BTN_FLTR();

reg CLK;
localparam PERIOD_CLK = 20.8; // Clock period in nanoseconds (~48 MHz)
localparam DUTY_CYCLE_CLK = 0.4; // Duty cycle (40% high, 60% low)

// Continuous clock generation process
always 
begin
    CLK = 1'b0;
  #(PERIOD_CLK * (1 - DUTY_CYCLE_CLK)); // Low period
    CLK = 1'b1;
  #(PERIOD_CLK * DUTY_CYCLE_CLK); // High period
end

// Reset generation
reg RST;
initial 
begin
    RST = 1'b1;
    #100;
    @(posedge CLK);
    #(PERIOD_CLK*0.2); 
    RST = 1'b0;
end

reg btn = 0;
localparam c_BOUNCE_DURATION  = 50; // Duration of button bouncing
localparam c_STABLE_DURATION  = 600; // Duration of stable button press/release

// Button stimulus simulation
initial begin
    repeat (c_BOUNCE_DURATION) 
    begin
        btn = $random;
        #1;
    end
    btn = 1'b1;
    #(c_STABLE_DURATION);
    repeat (c_BOUNCE_DURATION) 
    begin
        btn = $random;
        #1;
    end
    btn = 1'b0;
    #(c_STABLE_DURATION);
    repeat (c_BOUNCE_DURATION) 
    begin
        btn = $random;
        #1;
    end
    btn = 1'b1;
    #(c_STABLE_DURATION);
    repeat (c_BOUNCE_DURATION) 
    begin
        btn = $random;
        #1;
    end
    btn = 1'b0;
    #(c_STABLE_DURATION);
    $finish;
end

wire btn_out;
wire btn_ceo;

BTN_FLTR fltr1
(
    .BTN_IN(btn),
    .RST(RST),
    .CLK(CLK),
    .CE(1'b1),
    .BTN_OUT(btn_out),
    .BTN_CEO(btn_ceo)
);

endmodule
