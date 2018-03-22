`timescale 1ns / 1ps

module OutputDecoder( input logic [2:0] currentState,
    output logic [5:0] fsmOutput );
    
    always_comb
    case(currentState)
        3'b000: fsmOutput[2:0] = 3'b001;
        3'b001: fsmOutput[2:0] = 3'b010;
        3'b010: fsmOutput[2:0] = 3'b100;
        
        3'b011: fsmOutput[2:0] = 3'b100;
        3'b100: fsmOutput[2:0] = 3'b100;
        3'b101: fsmOutput[2:0] = 3'b100;
        
        3'b110: fsmOutput[2:0] = 3'b100;
        3'b111: fsmOutput[2:0] = 3'b010;  
        default: fsmOutput[2:0] = 3'b000;
    endcase
    
    always_comb
    case(currentState)
        3'b000: fsmOutput[5:3] = 3'b100;
        3'b001: fsmOutput[5:3] = 3'b100;
        3'b010: fsmOutput[5:3] = 3'b100;
        
        3'b011: fsmOutput[5:3] = 3'b010;
        3'b100: fsmOutput[5:3] = 3'b001;
        3'b101: fsmOutput[5:3] = 3'b010;
        
        3'b110: fsmOutput[5:3] = 3'b100;
        3'b111: fsmOutput[5:3] = 3'b100;
        default: fsmOutput[5:3] = 3'b000;
     endcase
     
endmodule
