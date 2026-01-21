`timescale 1ns/1ps

module TB_DC;

parameter WIDTH = 2;
parameter OUTPUT_WIDTH = 4; 
    
reg Ena;
reg [WIDTH-1:0] a;
wire [OUTPUT_WIDTH-1:0] Y;
    
dc #(.width(WIDTH)) dut (
    .Ena(Ena),
    .a(a),
    .Y(Y)
);
    
initial 
begin
    $display("Тест дешифратора с шириной %0d", WIDTH);
    $display("Ena\t a\t Y\t Ожидаемый Y");
    $display("-----------------------------------");
    
    Ena = 0; a = 0; #10;
    $display("%b\t %d\t %b\t %b", Ena, a, Y, 0);
    
    Ena = 0; a = 1; #10;
    $display("%b\t %d\t %b\t %b", Ena, a, Y, 0);
       
    Ena = 0; a = 2; #10;
    $display("%b\t %d\t %b\t %b", Ena, a, Y, 0);
    
    Ena = 0; a = 3; #10;
    $display("%b\t %d\t %b\t %b", Ena, a, Y, 0);
     
    $display("\n");
       
    Ena = 1; a = 0; #10;
    $display("%b\t %d\t %b\t %b", Ena, a, Y, 4'b0001);
       
    Ena = 1; a = 1; #10;
    $display("%b\t %d\t %b\t %b", Ena, a, Y, 4'b0010);
        
    Ena = 1; a = 2; #10;
    $display("%b\t %d\t %b\t %b", Ena, a, Y, 4'b0100);
       
    Ena = 1; a = 3; #10;
    $display("%b\t %d\t %b\t %b", Ena, a, Y, 4'b1000);
      
    $finish;
end

endmodule
