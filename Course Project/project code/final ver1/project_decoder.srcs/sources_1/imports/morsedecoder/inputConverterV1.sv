`timescale 1ns / 1ps
/*
    This module converts button signals  to the dash, dot, or space 
    according to the morse code. 
*/
module inputConverterV1(
    input logic bi, clk, reset,
    output logic enable,
    output logic [14:0] led,
    output logic a, b, c, d, e, f, g, dp, //individual LED output for the 7-segment along with the digital point
    output logic [3:0] an,
    output logic [1:0] signal
    );
    //logic [1:0] signal;
    logic [3:0] in0, in1, in2, in3;
    SevSeg_4digit signalScreen(clk, in0, in1, in2, in3,a, b, c, d, e, f, g, dp,an );
    //logic [27:0] counter, counter2;
    int counter = 0, counter2 = 0;
    //int count = 0;
    //logic clk_en;
     typedef enum logic [2:0] { init, waitBi, space, waitSignal, preSignal, dot, dash } statetype;
     statetype state, nextstate;
     
    /*
    always@ (posedge clk) 
      begin
              count <= count + 1;
              if (count== 100000000) //D: last value for counter
              count <= 27'b0; //N: length of counter
              if (count==27'b0)
              clk_en <= 1'b1;
              else
              clk_en <= 1'b0;
       end
       */
    always@ (posedge clk)
        begin
              if( state == init) // Initializing the counters
              begin
                counter <= 0;
                counter2 <= 0;
              end
               
              if( state == waitSignal || state == preSignal)// Dealing with counter 2
              begin
              counter <= 0;
                counter2 <= counter2 + 1;
                            if (counter2== 100000000) //D: last value for counter
                            counter2 <= 27'b0; //N: length of counter
              end
              
              if( state == waitBi)
              begin
                  counter2 <= 0;
                  counter <= counter + 1;
                              if (counter== 100000000) //D: last value for counter
                              counter <= 27'b0; //N: length of counter
              end
              if( state == space)
              begin
                  counter <= 0;
              end
      end
     //state register
     always_ff @(posedge clk, posedge reset)
         if(reset) state <= init;
         else      state <= nextstate;
     
     //Next State Logic
     always_comb
        case( state)
            init: nextstate = waitBi;
            waitBi: begin
                          if(bi) nextstate = waitSignal;
                          else begin
                             if(counter > 27'b011100100111000011100000000 )
                                nextstate = space;
                              else
                                nextstate = waitBi;
                          end
                       end
            space: nextstate = waitBi;
            waitSignal: begin
                            if(bi && counter2 < 27'b001110010011100001110000000 )
                                nextstate = waitSignal;
                            if( bi && counter2 >= 27'b001110010011100001110000000)
                                nextstate = preSignal;
                            if( !bi)
                                nextstate = waitBi;
                        end
            preSignal:begin
                            if( bi && counter >= 27'b100001011000001110110000000)
                                nextstate = dash;
                            if(bi && counter2 <  27'b101010111010100101010000000 )
                                nextstate = preSignal;
                            if( !bi)
                                nextstate = dot;
                        end
            dot: nextstate = waitBi;
            dash: nextstate = waitBi;
            default: nextstate = init;
         endcase
     
     //Output Logic and Local Variables
     always_comb
        case( state)
            init: begin signal = 2'b00; enable = 0; in3 = 4'b0000; end
            waitBi: begin signal = 2'b00; enable = 0; in3 = 4'b0001;end
            space: begin signal = 2'b00; enable = 1; in3 = 4'b0010;end
            waitSignal: begin signal= 2'b00; in3 = 4'b0011;end
            preSignal: begin signal = 2'b00;in3 = 4'b0100; end
            dot: begin signal = 2'b01; enable= 1; in3 = 4'b0101;end
            dash: begin signal = 2'b10;  enable= 1; in3 = 4'b0110; end
            default: begin signal = 2'b00; enable = 0; in3 = 4'b1111; end
        endcase
        
     //Showing the counter on leds of Basys 3
     always_comb
     begin
        if( counter2 < 27'b000011001001011010101000000 )
            led = 15'b100000000000000;
        if( counter2 >= 27'b000011001001011010101000000 &&
            counter2 <  27'b001010001100101110101000000)
            led = 15'b110000000000000;
        if( counter2 >= 27'b001010001100101110101000000 &&
            counter2 <  27'b001001100010010110100000000)
            led = 15'b111000000000000;
         if( counter2 >= 27'b001001100010010110100000000 &&
             counter2 <  27'b001100011001011101010000000)
            led = 15'b111100000000000;
         if( counter2 >= 27'b001111101111000101001000000 &&
             counter2 <  27'b001100011001011101010000000)
            led = 15'b111110000000000;
         if( counter2 >= 27'b001100011001011101010000000 &&
             counter2 <  27'b010011000100101101000000000)
            led = 15'b111111000000000;
         if( counter2 >= 27'b010011000100101101000000000 &&
             counter2 <  27'b010101111011110011110000000)
            led = 15'b111111100000000;
         if( counter2 >= 27'b010101111011110011110000000 &&
             counter2 <  27'b011001010001011011101000000)
            led = 15'b111111110000000;
         if( counter2 >= 27'b011001010001011011101000000 &&
             counter2 <  27'b011100100111000011100000000)
            led = 15'b111111111000000;
         if( counter2 >= 27'b011100100111000011100000000 &&
             counter2 <  27'b011111011110001010010000000)
            led = 15'b111111111100000;
         if( counter2 >= 27'b011111011110001010010000000 &&
             counter2 <  27'b100010110011110010001000000)
            led = 15'b111111111110000;
         if( counter2 >= 27'b100010110011110010001000000 &&
             counter2 <  27'b100110001001011010000000000)
            led = 15'b111111111111000;
         if( counter2 >= 27'b100110001001011010000000000 &&
             counter2 <  27'b101001000000100000110000000)
            led = 15'b111111111111100;
         if( counter2 >= 27'b101001000000100000110000000 &&
             counter2 <  27'b101100010110001000101000000)
            led = 15'b111111111111110;
         if( counter2 >= 27'b101100010110001000101000000 &&
             counter2 <  27'b101111101011110000100000000)
            led = 15'b111111111111111;
      end
      
      //Displaying the output signals on seven segment
      always_comb
      begin
        if( signal == 2'b00)
            begin in0 = 4'b0000; in1 = 4'b0000; in2 = 4'b0000;  end
        if( signal == 2'b01)
            begin in0 = 4'b0001; in1 = 4'b0000; in2 = 4'b0000;end
        if( signal == 2'b10)
            begin in0 = 4'b0000; in1 = 4'b0001; in2 = 4'b0000; end
      end
      
endmodule
