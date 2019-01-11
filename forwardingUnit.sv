/**********************************************************************
Forwarding Unit
Takes in the input registers for the execute stage, and the register in
the Mem stage, and the 

**********************************************************************/
`include "mux4X1.v"

module forwardingUnit (outA, outB, aluA, aluB, executeFetch, executePipe, 
					   memoryFetch, memoryPipe,aluAValue, aluBValue );
	output [63:0] outA, outB;
	input [63:0] aluA, aluB;
	input [63:0] executeFetch;
	input [63:0] memoryFetch;
	input [4:0] memoryPipe;
	input [4:0] executePipe;
	input [4:0] aluAValue, aluBValue;
	wire [1:0]selectA, selectB;
	wire [4:0] testA0, testA1, testB0, testB1;
	
	
	mux4X1 #(64) mc0(
		.in0(aluA),
		.in1(memoryFetch),
		.in2(executeFetch),
		.in3(executeFetch),
		.sel(selectA),
		.out(outA));
	
	mux4X1 #(64) mc1(
		.in0(aluB),
		.in1(memoryFetch),
		.in2(executeFetch),
		.in3(executeFetch),
		.sel(selectB),
		.out(outB));
		
	assign testA0 = aluAValue ^ memoryPipe;
	assign selectA[0] = ~(| testA0[4:0]);
	assign testA1 = aluAValue ^ executePipe;
	assign selectA[1] = ~(| testA1[4:0]);
	
	assign testB0 = aluBValue ^ memoryPipe;
	assign selectB[0] = ~(| testB0[4:0]);
	assign testB1 = aluBValue ^ executePipe;
	assign selectB[1] = ~(| testB1[4:0]);
	
endmodule