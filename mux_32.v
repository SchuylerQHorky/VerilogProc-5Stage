/******************************************************************
 * Date: 1/18/2018
 * File: mux_64.v
 * 
 *******************************************************************/
 //`include "mux_16.v"
 
 module mux_32(OUT, SEL, IN);

 output  OUT;
 input  [31:0] IN;
 input  [4:0] SEL;
 wire 	[1:0] STAGE;
 
 mux_16 MUX1(.OUT(STAGE[0]), .SEL(SEL[3:0]), .IN(IN[15:0]));
 mux_16 MUX2(.OUT(STAGE[1]), .SEL(SEL[3:0]), .IN(IN[31:16]));
 mux_2 MUXF(.OUT(OUT), .SEL(SEL[4]), .IN(STAGE));

 endmodule