/******************************************************************
 * Date: 1/18/2018
 * File: mux_4.v
 * Uses combinational logic to create a 2 x 4 decoder
 *******************************************************************/
 
 `include "decoder_2x4.v"
 
 module mux_4(OUT, SEL, IN);

 output  OUT;
 input  [3:0] IN;
 input  [1:0] SEL;
 // wire [3:0] DOUT;
 // wire [3:0] AND;
 
 // decoder_2x4 decode(.OUT(DOUT), .IN(SEL), .EN(1'b1));

 //  and a1 ( AND[0], DOUT[0], IN[0]);
 //  and a2 ( AND[1], DOUT[1], IN[1]);
 //  and a3 ( AND[2], DOUT[2], IN[2]);
 //  and a4 ( AND[3], DOUT[3], IN[3]);
 //  or  o0 ( OUT, AND[3], AND[2], AND[1], AND[0]);
 

  wire [1:0] outStage2;
  
  mux_2 mux4(outStage2[0], SEL[0], IN[1:0]);
  mux_2 mux5(outStage2[1], SEL[0], IN[3:2]);
  
  mux_2 mux7(OUT, SEL[1], outStage2[1:0]);

 endmodule
 
/*
`include "decoder_2x4.v"
 
module mux_4(OUT, SEL, IN);

  output  OUT;
  input  [3:0] IN;
  input  [1:0] SEL;
  wire [3:0] DOUT;
  wire [3:0] AND;

  decoder_2x4 decode(.OUT(DOUT), .IN(SEL), .EN(1'b1));

  and a1 (AND[0], DOUT[0],IN[0]);
  and a2 ( AND[1], DOUT[1], IN[1]);
  and a3 ( AND[2], DOUT[2], IN[2]);
  and a4 ( AND[3], DOUT[3], IN[3]);
  or  o1 ( OUT, AND[0], AND[q], AND[2], AND[3]);
 
endmodule*/