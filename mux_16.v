/******************************************************************
 * Date: 1/18/2018
 * File: mux_16.v
 * 
 *******************************************************************/
 `include "mux_4.v"
 
 module mux_16(OUT, SEL, IN);

 output  OUT;
 input  [15:0] IN;
 input  [3:0] SEL;
 wire 	[3:0] STAGE;
 
 mux_4 MUX1(.OUT(STAGE[0]), .SEL(SEL[1:0]), .IN(IN[3:0]));//~IN[3:0] ...
 mux_4 MUX2(.OUT(STAGE[1]), .SEL(SEL[1:0]), .IN(IN[7:4]));
 mux_4 MUX3(.OUT(STAGE[2]), .SEL(SEL[1:0]), .IN(IN[11:8]));
 mux_4 MUX4(.OUT(STAGE[3]), .SEL(SEL[1:0]), .IN(IN[15:12]));
 mux_4 MUXF(.OUT(OUT), .SEL(SEL[3:2]), .IN(STAGE));
 
 endmodule