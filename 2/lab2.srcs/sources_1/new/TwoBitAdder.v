`timescale 1ns / 1ps

module TwoBitAdder(
    output [1:0] sum,
    output cout,
    input [1:0] a,
    input [1:0] b
    );
    
    logic t1;
    FullAdder(sum[0], t1, a[0], b[0], 0);
    FullAdder(sum[1], cout, a[1], b[1], t1);
    
endmodule
