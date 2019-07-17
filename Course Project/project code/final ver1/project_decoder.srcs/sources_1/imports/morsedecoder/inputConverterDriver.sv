`timescale 1ns / 1ps

module inputConverterDriver(
    input logic bi, clk, reset,
    //output logic [1:0] signal,
    output logic enable,
    output logic [14:0] led,
    output logic a, b, c, d, e, f, g, dp, //individual LED output for the 7-segment along with the digital point
    output logic [3:0] an,
    output logic [1:0] signal
    );
    
    logic [3:0] in0, in1;
    int count = 0;
    logic clk_en;
    
    inputConverterV2 converter( bi, clk, reset, in0, in1, signal, enable, led, a, b, c, d, e, f, g, dp, an);
    
    always_ff@ (posedge enable, posedge reset)
    begin
    if(reset) begin in0 = 4'b0011; in1 = 4'b0011; end
    else
    begin
        if( signal == 2'b00)
            begin in0 = 4'b0000; in1 = 4'b0000; end
        if( signal == 2'b01)
            begin in0 = 4'b0001; in1 = 4'b0000; end
        if( signal == 2'b10)
            begin in0 = 4'b0000; in1 = 4'b0001; end
    end
    end
endmodule
