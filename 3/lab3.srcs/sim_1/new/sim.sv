`timescale 1ns / 1ps

module sim();
    
    logic clk, reset, sa, sb;
    logic [5:0] led;
    
    FSMClock clock( clk, reset, sa, sb, led );
    
    initial
        begin  
            reset=1; #20;
            reset=0; #20;
            sa=0; sb=0; #20;    
            
              clk=0;#20;    clk=1; #20;   
              clk=0;#20;    clk=1; #20;   
              clk=0;#20;    clk=1; #20;   
              clk=0;#20;    clk=1; #20;   
              clk=0;#20;    clk=1; #20;   
              clk=0;#20;    clk=1; #20;  
               clk=0;#20;    clk=1; #20;   
                           clk=0;#20;    clk=1; #20;   
                           clk=0;#20;    clk=1; #20;   
                           clk=0;#20;    clk=1; #20;   
                           clk=0;#20;    clk=1; #20;   
                           clk=0;#20;    clk=1; #20;
                            clk=0;#20;    clk=1; #20;   
                                        clk=0;#20;    clk=1; #20;   
                                        clk=0;#20;    clk=1; #20;   
                                        clk=0;#20;    clk=1; #20;   
                                        clk=0;#20;    clk=1; #20;   
                                        clk=0;#20;    clk=1; #20;     
           /* clk=0; sa=0; sb=0; #20;    
            clk=1; sa=0; sb=1; #20;
            clk=0; sa=1; sb=0; #20;
            clk=1; sa=1; sb=1; #20;
          
            clk=0; sa=0; sb=0; #20;
            clk=1; sa=0; sb=1; #20;
            clk=0; sa=1; sb=0; #20;
            clk=1; sa=1; sb=1; #20;
            
            clk=0; sa=0; sb=0; #20;
            clk=1; sa=0; sb=1; #20;
            clk=0; sa=1; sb=0; #20;
            clk=1; sa=1; sb=1; #20;
            
            clk=0; sa=0; sb=0; #20;
            clk=1; sa=0; sb=1; #20;
            clk=0; sa=1; sb=0; #20;
            clk=1; sa=1; sb=1; #20;
            
            clk=0; sa=0; sb=0; #20;
            clk=1; sa=0; sb=1; #20;
            clk=0; sa=1; sb=0; #20;
            clk=1; sa=1; sb=1; #20;
                        
            clk=0; sa=0; sb=0; #20;
            clk=1; sa=0; sb=1; #20;
            clk=0; sa=1; sb=0; #20;
            clk=1; sa=1; sb=1; #20;
                                    
            clk=0; sa=0; sb=0; #20;
            clk=1; sa=0; sb=1; #20;
            clk=0; sa=1; sb=0; #20;
            clk=1; sa=1; sb=1; #20;
                                                
            clk=0; sa=0; sb=0; #20;
            clk=1; sa=0; sb=1; #20;
            clk=0; sa=1; sb=0; #20;
            clk=1; sa=1; sb=1; #20;*/
        end
endmodule