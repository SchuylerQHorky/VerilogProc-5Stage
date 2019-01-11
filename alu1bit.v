//ALU module for 1 bit. 

module alu1bit(A, B, SubMode, AddOut, AndOut, OrOut, XorOut, carry_in, carry_out);
	input wire A;
	input wire B; 

	//when SubMode is true, AddOut = A + (!B). CarryIn is implmented separately.
	input wire SubMode;
	input wire carry_in;

	output AddOut;
	output AndOut;
	output OrOut;
	output XorOut;
	output carry_out;

	//when SubMode is true, flip the B bit and use that for the adder
	wire bPrime;
	assign bPrime = B ^ SubMode;//bPrime is !B when SubMode is true
	FullAdder adder(A, bPrime, AddOut, carry_in, carry_out);

	//set AND/OR/XOR outs
	assign AndOut = A & B;
	assign OrOut = A | B;
	assign XorOut = A ^ B;

endmodule