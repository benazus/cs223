`timescale 1ns / 1ps

module TwoBitAdderTest(

    logic sum[1:0], 
    logic cout,
    logic a[1:0],b[1:0]
    );
    
    TwoBitAdder tba(sum, cout, a, b);
    
    initial begin
        a[0]=0; b[0]=0; a[1]=0; b[1]=0; #10;
        a[0]=0; b[0]=0; a[1]=0; b[1]=1; #10;
        a[0]=0; b[0]=0; a[1]=1; b[1]=0; #10;
        a[0]=0; b[0]=0; a[1]=1; b[1]=1; #10;
        a[0]=0; b[0]=1; a[1]=0; b[1]=0; #10;
        a[0]=0; b[0]=1; a[1]=0; b[1]=1; #10;
        a[0]=0; b[0]=1; a[1]=1; b[1]=0; #10;
        a[0]=0; b[0]=1; a[1]=1; b[1]=1; #10;
        a[0]=1; b[0]=0; a[1]=0; b[1]=0; #10;
        a[0]=1; b[0]=0; a[1]=0; b[1]=1; #10;
        a[0]=1; b[0]=0; a[1]=1; b[1]=0; #10;
        a[0]=1; b[0]=0; a[1]=1; b[1]=1; #10;
        a[0]=1; b[0]=1; a[1]=0; b[1]=0; #10;
        a[0]=1; b[0]=1; a[1]=0; b[1]=1; #10;
        a[0]=1; b[0]=1; a[1]=1; b[1]=0; #10;
        a[0]=1; b[0]=1; a[1]=1; b[1]=1; #10;
    end
    
endmodule
