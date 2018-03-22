`timescale 1ns / 1ps

module FSM( input logic clk, reset, sa, sb,
    output logic [5:0] led );
    
    typedef enum logic [2:0] {S0,S1,S2,S3,S4,S5,S6,S7} statetype;
    statetype [2:0] currentState, nextState;

    // Next State Logic
    logic [2:0] muxOutput;
    NextStateMux nextStateLogic( currentState, sa, sb, muxOutput );
    
    // Output Logic
    logic [5:0] fsmOutput;
    OutputDecoder outputLogic( currentState, fsmOutput );
    
    //State register
    always_ff@( posedge clk, posedge reset )
    if (reset)
        currentState <=3'b000;
    else
        begin
            if( ~(sa == 1 && sb == 0 && currentState == S0) && ~(sa == 0 && sb == 1 && currentState == S4));
                begin
                    nextState = muxOutput;
                    led = fsmOutput;
                    currentState = nextState;
                end
        end
endmodule