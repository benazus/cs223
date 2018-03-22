`timescale 1ns / 1ps

module test();

logic clk, reset;
logic[3:0] out;
logic x;
Motor aq (clk,reset,out,x);
initial
begin
reset = 0; #10;
reset = 1; #10;

clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
clk = 0; #10;
clk = 1; #10;
end
endmodule
