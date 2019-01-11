/******************************************************************
 * Date: 1/18/2018
 * File: decoder_3x8.v
 * Uses combinational logic to create a 3 x 8 decoder with
 * an Enable
 *******************************************************************/
 
 module decoder_3x8(OUT, IN, EN);

 output [7:0] 	OUT;
 input 	[2:0]	IN;
 input      	EN;
 
 wire   [2:0]	IN_BAR;
 
 not n0(IN_BAR[0], IN[0]);
 not n1(IN_BAR[1], IN[1]);
 not n2(IN_BAR[2], IN[2]);

 and a0 (OUT[0], IN_BAR[2], IN_BAR[1], IN_BAR[0], EN);
 and a1 (OUT[1], IN_BAR[2], IN_BAR[1],     IN[0], EN);
 and a2 (OUT[2], IN_BAR[2],     IN[1], IN_BAR[0], EN);
 and a3 (OUT[3], IN_BAR[2],     IN[1],     IN[0], EN);
 and a4 (OUT[4],     IN[2], IN_BAR[1], IN_BAR[0], EN);
 and a5 (OUT[5],     IN[2], IN_BAR[1],     IN[0], EN);
 and a6 (OUT[6],     IN[2],     IN[1], IN_BAR[0], EN);
 and a7 (OUT[7],     IN[2],     IN[1],     IN[0], EN);
 
 /*
 assign OUT[7] = IN_BAR[0] 	& IN_BAR[1] & IN_BAR[2] & EN; 
 assign OUT[6] = IN_BAR[0] 	& IN_BAR[1] &     IN[2] & EN; 
 assign OUT[5] = IN_BAR[0] 	&     IN[1] & IN_BAR[2] & EN; 
 assign OUT[4] = IN_BAR[0] 	&     IN[1] &     IN[2] & EN; 
 assign OUT[3] =     IN[0] 	& IN_BAR[1] & IN_BAR[2] & EN; 
 assign OUT[2] =     IN[0] 	& IN_BAR[1] &     IN[2] & EN; 
 assign OUT[1] =     IN[0] 	&     IN[1] & IN_BAR[2] & EN; 
 assign OUT[0] =     IN[0] 	&     IN[1] &     IN[2] & EN; 
 */
 endmodule