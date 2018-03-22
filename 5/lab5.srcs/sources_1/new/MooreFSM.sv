`timescale 1ns / 1ps

module MooreFSM(input logic clk, reset, next,
        input logic [1:0] dd,
        output logic [6:0] fsm_output);
    
    typedef enum logic [2:0] {S0,S1,S2,S3,S4,S5,S6} statetype;
    statetype [2:0] currentState, nextState;
    
    // State Register
    always_ff@(posedge clk)
        if(reset)
            currentState <= S0;
        else if(next)
            currentState <= nextState;
        else
            currentState <= currentState;
    
    // Output Logic
    always_comb
        case(currentState)
            3'b000: fsm_output = 7'b0000001;
            3'b001: fsm_output = 7'b0000010;
            3'b010: fsm_output = 7'b0000100;
            3'b011: fsm_output = 7'b0001000;
            3'b100: fsm_output = 7'b0010000;
            3'b101: fsm_output = 7'b0100000;
            3'b110: fsm_output = 7'b1000000;
            default: fsm_output = 7'b0000000;
        endcase
    
    // Next State Logic
    always_comb
        if(dd == 2'b00) // Input = 00
            begin
                case(currentState)
                    3'b000: nextState = currentState;
                    3'b001: nextState = currentState;
                    3'b010: nextState = currentState;
                    3'b011: nextState = currentState;
                    3'b100: nextState = currentState;
                    3'b101: nextState = currentState;
                    3'b110: nextState = currentState;
                    default: nextState = currentState;
                endcase
            end
        else if(dd == 2'b01) // Input = 01
            begin
                case(currentState)
                    3'b000: nextState = 3'b010;
                    3'b001: nextState = 3'b100;
                    3'b010: nextState = 3'b110;
                    3'b011: nextState = 3'b010;
                    3'b100: nextState = 3'b010;
                    3'b101: nextState = 3'b010;
                    3'b110: nextState = 3'b010;
                    default: nextState = currentState;
                endcase
            end
        else if(dd == 2'b10) // Input = 10
            begin
                case(currentState)
                    3'b000: nextState = 3'b001;
                    3'b001: nextState = 3'b011;
                    3'b010: nextState = 3'b101;
                    3'b011: nextState = 3'b001;
                    3'b100: nextState = 3'b001;
                    3'b101: nextState = 3'b001;
                    3'b110: nextState = 3'b001;
                    default: nextState = currentState;
                endcase
            end
        else if(dd == 2'b11) // Input = 11
            begin
                case(currentState)
                    3'b000: nextState = currentState;
                    3'b001: nextState = currentState;
                    3'b010: nextState = currentState;
                    3'b011: nextState = currentState;
                    3'b100: nextState = currentState;
                    3'b101: nextState = currentState;
                    3'b110: nextState = currentState;
                    default: nextState = currentState;
                endcase
            end
        else
            nextState <= S0;
endmodule
