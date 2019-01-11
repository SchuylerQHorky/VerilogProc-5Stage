/******************************************************************
 * Date: 1/18/2018
 * File: decoder_2x4.v
 * Uses combinational logic to create a 2 x 4 decoder
 *******************************************************************/
 
 module decoder_2x4(OUT, IN, EN);

 output [3:0] OUT;
 input  [1:0] IN;
 wire   [1:0] IN_BAR;
 input        EN;

 not n0  (IN_BAR[0], IN[0]);
 not n1  (IN_BAR[1], IN[1]);
 and a1 (OUT[0], IN_BAR[1], IN_BAR[0], EN);
 and a2 (OUT[1], IN_BAR[1],     IN[0], EN);
 and a3 (OUT[2],     IN[1], IN_BAR[0], EN);
 and a4 (OUT[3],     IN[1],     IN[0], EN);
 /*
 assign OUT[0] = (~IN[1]) & (~IN[0]) & EN; 
 assign OUT[1] = (~IN[1]) &   IN[0]  & EN; 
 assign OUT[2] =   IN[1]  & (~IN[0]) & EN; 
 assign OUT[3] =   IN[1]  &   IN[0]  & EN; 
 */
 endmodule