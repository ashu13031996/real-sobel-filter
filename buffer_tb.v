module buffer_tb  ; 
 
  wire  [7:0]  out8   ; 
  wire  [7:0]  out4   ; 
  reg    clock   ; 
  wire  [7:0]  out9   ; 
  wire  [7:0]  out5   ; 
  wire  [7:0]  out1   ; 
  wire  [7:0]  out6   ; 
  wire  [7:0]  out2   ; 
  wire  [7:0]  out7   ; 
  wire  [7:0]  out3   ; 
  reg  [7:0]  in   ; 
  buffer  
   DUT  ( 
       .out8 (out8 ) ,
      .out4 (out4 ) ,
      .clock (clock ) ,
      .out9 (out9 ) ,
      .out5 (out5 ) ,
      .out1 (out1 ) ,
      .out6 (out6 ) ,
      .out2 (out2 ) ,
      .out7 (out7 ) ,
      .out3 (out3 ) ,
      .in (in ) ); 
    
    always #50 clock = ~clock;
      initial 
      begin 
      clock = 1;
      
             in = 8'b00000001; 
             #100
             in = 8'b00000010; 
             #100
             in = 8'b00000011; 
             #100
             in = 8'b00000100; 
             #100
             in = 8'b00000101; 
             #100
             in = 8'b00000110; 
             #100
             in = 8'b00000111; 
             #100
             in = 8'b00001000; 
             #100
             in = 8'b00001001; 
                    
  end
endmodule

