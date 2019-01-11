//TODO: implement negative output

module alu(A, B, cntrl, result, negative, zero, overflow, carry_out);
	input wire signed [63:0] A;
	input wire signed [63:0] B; 
	input wire [2:0] cntrl;

	//NOT REGS!
	output signed [63:0] result;
	output negative;
	output zero;
	output overflow;
	output carry_out;

	//Mux'd ALU outputs. Each alu1bit module has an output for each bus
	wire [63:0] ADD;//A + B
	wire [63:0] AND;//A * B
	wire [63:0] OR; //A | b
	wire [63:0] XOR;//A ^ B

	//connects the ALU bits to each other
	wire [63:0] CarryIn;
	wire [63:0] CarryOut;

	parameter ALU_PASS_B=0, ALU_ADD=2, ALU_SUBTRACT=3, ALU_AND=4, ALU_OR=5, ALU_XOR=6;

	//for subtraction mode, we're still using the same adder, but we send a signal to each
	//alu1bit module that flips each B bit. We also set CarryIn[0] to 1, to add 1.
	//In the output mux's, we assign the ALU_ADD and ALU_SUBTRACT channels to be the ADD bus.
	wire SubMode;//is HIGH for subtraction, LOW for addition
	assign SubMode = (cntrl == ALU_SUBTRACT);
	assign CarryIn[0] = SubMode;

	//set the carry OUT of each ALU bit to be the carry IN bit of the next ALU bit
	assign CarryIn[63:1] = CarryOut[62:0];
	assign carry_out = CarryOut[63] ^ SubMode;

	//last carry out is the overflow
	assign overflow = CarryOut[63] ^ CarryIn[63];
	assign zero = ~|result[63:0];
	//positive overflow: add 2 LARGE numbers
	//negative overflow: add 2 LARGELY NEGATIVE numbers

	assign negative = result[63];

	//Used for the 2 unused ALU control channels
	reg [63:0] empty = 64'hffffffffffffffff;

	//ALU_PASS_B=0, ALU_ADD=2, ALU_SUBTRACT=3, ALU_AND=4, ALU_OR=5, ALU_XOR=6;
	//TODO: OR all the result bits (AND CarryOut[63]) together and NOT it and assign to zero wire

	genvar i;
	generate for (i = 0; i < 64; i = i + 1) begin : alu_bits_gen1
		alu1bit alubit(A[i], B[i], SubMode, ADD[i], AND[i], OR[i], XOR[i], CarryIn[i], CarryOut[i]);
		wire [7:0] tempBus;
		assign tempBus[0] = B[i];
		assign tempBus[1] = empty[i];
		assign tempBus[2] = ADD[i];
		assign tempBus[3] = ADD[i];
		assign tempBus[4] = AND[i];
		assign tempBus[5] = OR[i];
		assign tempBus[6] = XOR[i];
		assign tempBus[7] = empty[i];
		//ALU_PASS_B=0, ALU_ADD=2, ALU_SUBTRACT=3, ALU_AND=4, ALU_OR=5, ALU_XOR=6;
		mux_8 aluMux(result[i], cntrl[2:0], tempBus[7:0]);
	end endgenerate


wire [63:0] B_bar;
assign B_bar = ~B + 1;

	always @(*) begin
		if(cntrl == 2) begin
			$display("A+B: %d + %d = %d. CarryOut = %b Overflow = %d AT TIME %d",A, B, result, carry_out, overflow, $time);
//			$display("A + B: EXPECTED (%d)\tGOT\t(%d) AT TIME %d", A+B, result, $time);
		end
		if(cntrl == 3) begin

			$display("A-B: %d - %d = %d. CarryOut = %b Overflow = %d AT TIME %d",A, B, result, carry_out, overflow, $time);
			//$display("A-B: %d - %d = %d. EXPECTED %d AT TIME %d",A, B, result, A-B, $time);
		end// A + B_bar
	end

	
endmodule

