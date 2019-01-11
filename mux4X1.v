/////////////////////
//4X1 Mux
/////////////////////
 
`include "mux2X1.v"
 
module mux4X1( in0,in1,in2,in3,sel,out);
	parameter width=16; 
	input [width-1:0] in0,in1,in2,in3;
	input [1:0] sel;
	output [width-1:0] out;
	wire [width-1:0 ]muxOut0,muxOut1;

		mux2X1 #(width) mo0(
			.in0(in0),
			.in1(in1),
			.sel(sel[0]),
			.out(muxOut0));
		
		mux2X1 #(width) mo1(
			.in0(in2),
			.in1(in3),
			.sel(sel[0]),
			.out(muxOut1));
			
		mux2X1 #(width) mo2(
			.in0(muxOut0),
			.in1(muxOut1),
			.sel(sel[1]),
			.out(out));	
	
endmodule
 
 