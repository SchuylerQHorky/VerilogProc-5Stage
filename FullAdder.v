//Implements full adder circuit with NAND gates.
//For schematic see http://www.circuitstoday.com/wp-content/uploads/2012/03/full-adder-using-NAND-logic.png

module FullAdder(A, B, Result, CarryIn, CarryOut);
	input wire A;
	input wire B;
	output Result;
	input wire CarryIn;
	output CarryOut;

	wire n0Out;
	wire n1Out;
	wire n2Out;
	wire n3Out;
	wire n4Out;
	wire n5Out;
	wire n6Out;

	nand n0(n0Out, A, B);
	
	nand n1(n1Out, A, n0Out);
	nand n2(n2Out, B, n0Out);
	
	nand n3(n3Out, n1Out, n2Out);
	
	nand n4(n4Out, n3Out, CarryIn);

	nand n5(n5Out, n3Out, n4Out);
	nand n6(n6Out, n4Out, CarryIn);

	nand n7(Result, n5Out, n6Out);
	
	nand n8(CarryOut, n4Out, n0Out);

endmodule