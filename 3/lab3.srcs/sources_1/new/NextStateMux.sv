`timescale 1ns / 1ps

module NextStateMux( input logic [2:0] state,
    input logic sa, sb,
    output logic [2:0] next );
    
    always_comb
        case(state)
            3'b000: if( sa == 1 && sb == 0 )
                        next = 3'b000;
                    else if ( sa == 0 && sb == 1 )
                        next = 3'b001;
                    else if ( sa == 1 && sb == 1 )
                        next = 3'b000;
                    else
                        next = 3'b001;
            3'b001: next = 3'b010;
            3'b010: next = 3'b011;
            3'b011: next = 3'b100;
            3'b100: if( sb == 1 && sb == 0 )
                        next = 3'b100;
                    else if ( sb == 0 && sa == 1)
                        next = 3'b101;
                    else if ( sb == 1 && sa == 1 )
                        next = 3'b100;
                    else
                        next = 3'b101;
            3'b101: next = 3'b110;
            3'b110: next = 3'b111;
            3'b111: next = 3'b000;
            default: next = 3'b000;
    
    endcase
endmodule
