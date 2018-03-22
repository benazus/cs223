`timescale 1ns / 1ps

module FSMClock( input logic clk, reset ,sa , sb,
    output logic[5:0] led );
    
    int count = 0;
    logic enable = 1'b0;
    
    always@( posedge clk )
        begin
            count <= count + 1;
            if( count == 300000000 )
                count <= 29'd0;
            if( count == 29'd0 )
                enable <= 1'b1;
            else
                enable <= 1'b0;
        end
    
    FSM fsm( enable, reset, sa, sb, led );
    
endmodule
