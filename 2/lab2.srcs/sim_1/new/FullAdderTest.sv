`timescale 1ns / 1ps

module FullAdderTest;

    logic sum,cout,a,b,c;
    FullAdder fa(sum, cout, a, b, c);
    
    initial begin       
        a=0; b=0; c=0; #10;
        a=0; b=0; c=1; #10;
        a=0; b=1; c=0; #10;
        a=0; b=1; c=1; #10;
        a=1; b=0; c=0; #10;
        a=1; b=0; c=1; #10;
        a=1; b=1; c=0; #10;
        a=1; b=1; c=1; #10;
    end
    
endmodule
