module filter(
input [7:0]in,
input clock,
output [7:0]out);

wire [7:0]wr1,wr2,wr3,wr4,wr5,wr6,wr7,wr8,wr9,gx,gy;
buffer buffer1(in,clock,wr1,wr2,wr3,wr4,wr5,wr6,wr7,wr8,wr9);
convolute cnv1(wr1,wr2,wr3,wr4,wr5,wr6,wr7,wr8,wr9,gx,gy);
add_mod admd1(gx,gy,out);
endmodule

module buffer(
input [7:0]in,
input clock,
output [7:0]out1,out2,out3,out4,out5,out6,out7,out8,out9);

delaY d1(clock,in,out9); 
delaY d2(clock,out9,out8);
delaY d3(clock,out8,out7);
delaY d4(clock,out7,out6);
delaY d5(clock,out6,out5);
delaY d6(clock,out5,out4);
delaY d7(clock,out4,out3);
delaY d8(clock,out3,out2);
delaY d9(clock,out2,out1);

endmodule 

module delaY(
input clock,
input [7:0]inp,
output reg [7:0]out);

always@(posedge(clock))
begin 
      out <= inp;
end
endmodule


module convolute(
input [7:0]inp1,inp2,inp3,inp4,inp5,inp6,inp7,inp8,inp9,
output [7:0]out1,out2);

wire [7:0] w1,w2,w3,w4;

assign w1 = inp8 + inp8;
assign w2 = inp2 + inp2;
assign w3 = inp6 + inp6;
assign w4 = inp4 + inp4;

wire [7:0]g1,g2,g3,g4;
assign g1 = inp7 + w1 + inp9;
assign g2 = inp1 + w2 + inp3;
assign g3 = inp3 + w3 + inp9;
assign g4 = inp1 + w4 + inp7;

assign out1 = g1 - g2;
assign out2 = g3 - g4;
endmodule 

module add_mod(
input [7:0]inp1,inp2,
output [7:0]out);

reg [7:0]w1,w2;
always@(inp1 or inp2)
begin 
      if(inp1 > 0)
           w1 <= inp1;
      else 
           w1 <= 8'b0 - inp1;
              
      if (inp2 > 0 )
           w2 <= inp2;
      else
           w2 <= 8'b0 - inp2;
end
assign out = w1 + w2;
endmodule