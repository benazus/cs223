`timescale 1ns / 1ps
// Revised FSM module: 4 states, 3 inputs, outputs each state
module MotorFsm(input logic clk, start,
        input logic reverse,
        input logic [1:0] speed,
        input logic [1:0] push,
        output logic [3:0] out,
        output logic a, b, c, d, e, f, g, dp,
        output logic [3:0] an,
        output logic [1:0] show);
   
    int count = 0;
    int x = 0;
    logic enable = 1'b0;
    
    logic [3:0] led1,led2,led3,led4;
    assign led2 = 4'd0;
    assign led3 = 4'd0;
    assign led4 = 4'd0;
    
    always_comb
        case(speed)
            2'b00: x = 10;
            2'b01: x = 2000000;
            2'b10: x = 1000000;
            2'b11: x = 500000;
        endcase 
        
    always@(posedge clk)
        begin
            count <= count + 1;
            if(count == x)
                begin
                    count <= 0;
                    if(x != 10)
                        enable = 1'b1;
                end
            else if(count == 4000000)
                count <= 1;
            else
                enable <= 1'b0;
        end
    
    typedef enum logic [1:0] {S0,S1,S2,S3} statetype;
    statetype [1:0] currentState, nextState;

    // State Register
    always_ff@(posedge enable)
        if(start)
            currentState <= nextState;
        else
            begin
                if(reverse)
                    currentState = S3;
                else
                    currentState = S0;
            end
           
    // Next State Logic
    always_comb
        begin
            if(reverse == 0)
                case(currentState)
                    2'b00: nextState = 2'b01;
                    2'b01: nextState = 2'b10;
                    2'b10: nextState = 2'b11;
                    2'b11: nextState = 2'b00;
                    default: nextState = 2'b00;
                endcase
            else if(reverse == 1)
                case(currentState)
                    2'b11: nextState = 2'b10;
                    2'b10: nextState = 2'b01;
                    2'b01: nextState = 2'b00;
                    2'b00: nextState = 2'b11;
                    default: nextState = 2'b11;
                endcase
        end
        
        // Output
        always_comb
            case(currentState)
                2'b00: out <= 4'b1100;
                2'b01: out <= 4'b0110;
                2'b10: out <= 4'b0011;
                2'b11: out <= 4'b1001;
            endcase
           
    // 7 seg
    always_comb
        case(speed)
            2'b00: led1 <= 4'd0;
            2'b01: led1 <= 4'd1;
            2'b10: led1 <= 4'd2;
            2'b11: led1 <= 4'd3;
            default: led1 <= 4'd0;
        endcase   
           
    SevSeg_4digit(enable,led1,led2,led3,led4,a, b, c, d, e, f, g, dp,an);
    
    // Push Buttons
    always_comb
        case(push)
            2'b00: show = 2'b00;
            2'b01: show = 2'b01;
            2'b10: show = 2'b10;
            2'b11: show = 2'b00;
            default: show = 2'b00;
        endcase
endmodule