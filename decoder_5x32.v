/******************************************************************
 * Date: 1/18/2018
 * File: decoder_5x32.v
 * With the use of 4 3x8 decoders and 1 2x4 decoder to create a
 * 5x32 decoder
 * an Enable
 *******************************************************************/
`include "decoder_2x4.v"
`include "decoder_3x8.v"

module decoder_5x32(OUT, IN, EN);

output 	[31:0] 	OUT;
input 	[4:0] 	IN;
input 			EN;
wire            EN_BAR;
wire 	[3:0] 	D5OUT;
wire    [4:0]   ENABLED;


not n0 (EN_BAR, EN);

or  a0 (ENABLED[0], IN[0], EN_BAR);
or  a1 (ENABLED[1], IN[1], EN_BAR);
or  a2 (ENABLED[2], IN[2], EN_BAR);
or  a3 (ENABLED[3], IN[3], EN_BAR);
or  a4 (ENABLED[4], IN[4], EN_BAR);

/*
assign ENABLED[0] = IN[0] | ~(EN);
assign ENABLED[1] = IN[1] | ~(EN);
assign ENABLED[2] = IN[2] | ~(EN);
assign ENABLED[3] = IN[3] | ~(EN);
assign ENABLED[4] = IN[4] | ~(EN);
*/

decoder_3x8 D1(.OUT(OUT[7:0]), 		.IN(ENABLED[2:0]), .EN(D5OUT[0]));
decoder_3x8 D2(.OUT(OUT[15:8]), 	.IN(ENABLED[2:0]), .EN(D5OUT[1]));
decoder_3x8 D3(.OUT(OUT[23:16]), 	.IN(ENABLED[2:0]), .EN(D5OUT[2]));
decoder_3x8 D4(.OUT(OUT[31:24]), 	.IN(ENABLED[2:0]), .EN(D5OUT[3]));

decoder_2x4 D5(.OUT(D5OUT), .IN(ENABLED[4:3]), .EN(1'b1));




endmodule