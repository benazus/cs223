`timescale 1ns / 1ps
module Motor(input logic clk,reset,
        output logic [3:0] out,
        output logic x);

    typedef enum logic [1:0] {S0,S1,S2,S3} statetype;
    statetype [1:0] currentState, nextState;
    
    // State Register
    always_ff@(posedge clk)
        begin
            currentState <= nextState;
            if(reset)
                currentState = S0;
        end
        
    // Next State Logic
    always_comb
        begin
            case(currentState)
                2'b00:
                    begin
                        nextState = 2'b01;
                        x = 1'b0;
                    end
                2'b01: 
                    begin
                        nextState = 2'b10;
                        x = 1'b0;
                    end
                2'b10: 
                    begin
                        nextState = 2'b11;
                        x = 1'b0;
                    end
                2'b11:
                    begin
                        nextState = 2'b00;
                        x = 1'b1;
                    end
                default:
                    begin
                        nextState = 2'b00;
                        x = 1'b0;
                    end
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
           

endmodule
