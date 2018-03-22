`timescale 1ns / 1ps

module FullAdder(
    output logic sum,cout,
    input logic x,y,cin
    );
    
    logic t1,t2,t3;
    
    assign t1 = x^y;
    assign t2 = x&y;
    assign t3 = t1&cin;
    assign sum = t1^cin;
    assign cout = t3|t2;
endmodule
