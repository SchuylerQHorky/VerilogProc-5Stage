/////////////////////
//8X1 Mux
/////////////////////
 
`include "mux2X1.v"
 
module mux8X1(in0,in1,in2,in3,in4,in5,in6,in7,sel,out);
	parameter width=16; 
	input [width-1:0] in0,in1,in2,in3,in4,in5,in6,in7;
	input [2:0] sel;
	output [width-1:0] out;
	wire [width-1:0 ]muxOut0,muxOut1,muxOut2,muxOut3,muxOut4,muxOut5;

		mux2X1 #(width) mo000(
			.in0(in0),
			.in1(in1),
			.sel(sel[0]),
			.out(muxOut0));
		
		mux2X1 #(width) mo001(
			.in0(in2),
			.in1(in3),
			.sel(sel[0]),
			.out(muxOut1));
			
		mux2X1 #(width) mo002(
			.in0(in4),
			.in1(in5),
			.sel(sel[0]),
			.out(muxOut2));	
			
		mux2X1 #(width) mo003(
			.in0(in6),
			.in1(in7),
			.sel(sel[0]),
			.out(muxOut3));
		
		mux2X1 #(width) mo010(
			.in0(muxOut0),
			.in1(muxOut1),
			.sel(sel[1]),
			.out(muxOut4));
			
		mux2X1 #(width) mo020(
			.in0(muxOut2),
			.in1(muxOut3),
			.sel(sel[1]),
			.out(muxOut5));	
			
		mux2X1 #(width) mo100(
			.in0(muxOut4),
			.in1(muxOut5),
			.sel(sel[2]),
			.out(out));	
	
endmodule
 
 