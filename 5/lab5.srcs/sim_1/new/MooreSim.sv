`timescale 1ns / 1ps

module MooreSim();

logic clk,reset,next;
logic [1:0] dd;
logic [6:0] out;

MooreFSM mfsm(clk,reset,next,dd,out);


always
begin
clk = ~clk; #5;
end

initial
begin
clk = 1; #10;
reset = 1; #10;
reset = 0; #10;

next = 1; # 200;

dd = 2'b01; #10;
dd = 2'b01; #10;
dd = 2'b01; #10;

reset = 1; #10;
reset = 0; #10;

dd = 2'b10; #10;
dd = 2'b10; #10;
dd = 2'b10; #10;

reset = 1; #10;
reset = 0; #10;

dd = 2'b01; #10;
dd = 2'b01; #10;
dd = 2'b01; #10;

reset = 1; #10;
reset = 0; #10;

dd = 2'b10; #10;
dd = 2'b10; #10;
dd = 2'b10; #10;
end

endmodule
