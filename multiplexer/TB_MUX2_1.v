`timescale 1ns / 1ps

module TB_MUX2_1;

reg a0, x1, x0;    
wire f;            

mux2_1 dut 
(
    .a0(a0),    
    .x1(x1),
    .x0(x0),
    .f(f)
);
    
initial 
begin
    a0 = 0; x1 = 0; x0 = 0;
        
    #10 a0 = 0; x1 = 0; x0 = 0;  
    #10 $display("Time = %0t: a0=%b, x1=%b, x0=%b, f=%b", $time, a0, x1, x0, f);
         
    #10 a0 = 0; x1 = 0; x0 = 1;  
    #10 $display("Time = %0t: a0=%b, x1=%b, x0=%b, f=%b", $time, a0, x1, x0, f);
        
    #10 a0 = 0; x1 = 1; x0 = 0;  
    #10 $display("Time = %0t: a0=%b, x1=%b, x0=%b, f=%b", $time, a0, x1, x0, f);
        
    #10 a0 = 0; x1 = 1; x0 = 1;  
    #10 $display("Time = %0t: a0=%b, x1=%b, x0=%b, f=%b", $time, a0, x1, x0, f);
        
    #10 a0 = 1; x1 = 0; x0 = 0;  
    #10 $display("Time = %0t: a0=%b, x1=%b, x0=%b, f=%b", $time, a0, x1, x0, f);
        
    #10 a0 = 1; x1 = 0; x0 = 1;  
    #10 $display("Time = %0t: a0=%b, x1=%b, x0=%b, f=%b", $time, a0, x1, x0, f);
        
    #10 a0 = 1; x1 = 1; x0 = 0;  
    #10 $display("Time = %0t: a0=%b, x1=%b, x0=%b, f=%b", $time, a0, x1, x0, f);
        
    #10 a0 = 1; x1 = 1; x0 = 1;  
    #10 $display("Time = %0t: a0=%b, x1=%b, x0=%b, f=%b", $time, a0, x1, x0, f);
       
    #10 a0 = 0; x1 = 1'bx; x0 = 1'bx; 
    #10 $display("Time = %0t: a0=%b, x1=%b, x0=%b, f=%b", $time, a0, x1, x0, f);
        
    #10 a0 = 1'bx; x1 = 1; x0 = 0;   
    #10 $display("Time = %0t: a0=%b, x1=%b, x0=%b, f=%b", $time, a0, x1, x0, f);
        
    #10 $display("Simulation completed");
    $finish;
end
endmodule
