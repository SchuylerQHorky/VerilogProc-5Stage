//TODO: implement negative output
`include "carryselectadder64bit.v"
`include "mux_8_64bit.v"

module alu( A, B, cntrl, ALU_src, Immediate, ALU_Imm12, result, negative, zero, overflow, carry_out);
	input wire signed [63:0] A;
	input wire signed [63:0] B; 
	wire [5:0] SHAMT;
	input wire [2:0] cntrl;
	input wire [11:0] ALU_Imm12;
	input wire ALU_src, Immediate;

	//NOT REGS!
	output signed [63:0] result;
	output negative;
	output zero;
	output overflow;
	output carry_out;

	//Mux'd ALU outputs. Each alu1bit module has an output for each bus
	wire [63:0] ADD;//A + B
	wire [63:0] AND;//A & B
	wire [63:0] OR; //A | b
	wire [63:0] XOR;//A ^ B
	wire [63:0] LSL;//A << SHAMT
	wire [63:0] LSR;//A >> SHAMT
	wire [63:0] MUL;//A * B
	
	//ALU_LSR=0, ALU_MUL=1, ALU_ADD=2, ALU_SUBTRACT=3, ALU_AND=4, ALU_OR=5, ALU_XOR=6, ALU_LSL=7;
	parameter ALU_LSR=0, ALU_MUL=1, ALU_ADD=2, ALU_SUBTRACT=3, ALU_AND=4, ALU_OR=5, ALU_XOR=6, ALU_LSL=7;

	//for subtraction mode, we're still using the same adder, but we send a signal to each
	//alu1bit module that flips each B bit. We also set CarryIn[0] to 1, to add 1.
	//In the output mux's, we assign the ALU_ADD and ALU_SUBTRACT channels to be the ADD bus.
	wire SubMode;//is HIGH for subtraction, LOW for addition
	assign SubMode = (cntrl == ALU_SUBTRACT);
	//assign CarryIn[0] = SubMode;
	//used for subtraction
	wire [63:0] sum, BPrime, SubModePrime; //hacky solution ples halp
	assign SubModePrime = {{63{SubMode}}, SubMode};
	assign BPrime = B ^ SubModePrime;

	
	//MUX logic that takes care of choosing either B or dataSource
	wire [63:0] DAddr9Extend;
	wire [63:0] ALU_Imm12Ext;
	wire [63:0] Bfinal;
	wire [63:0] muxOut;
	wire [8:0] DAddr9;
	assign SHAMT  = ALU_Imm12[5:0];
	assign DAddr9 = ALU_Imm12[10:2];
	assign ALU_Imm12Ext = {{52{ALU_Imm12[11]}}, ALU_Imm12};
	assign DAddr9Extend = {{55{DAddr9[8]}}, DAddr9};
	
	mux2X1 #(64) ms0(
		.in0(DAddr9Extend),
		.in1(ALU_Imm12Ext),
		.sel(Immediate),
		.out(muxOut));
		
	mux2X1 #(64) ms1(
		.in0(BPrime),
		.in1(muxOut),
		.sel(ALU_src),
		.out(Bfinal));
		
	//TODO get this inverter removed
	//used for shifter
	wire direction;
	assign direction = ~cntrl[2];
	
	//used for multiplier
	wire doSigned;
	assign doSigned = 1'b0;
	wire [63:0] MUL_UNUSED;


	//set the carry OUT of each ALU bit to be the carry IN bit of the next ALU bit
	//assign CarryIn[63:1] = CarryOut[62:0];
	//assign carry_out = CarryOut[63] ^ SubMode;

	//last carry out is the overflow
	assign zero = ~|result[63:0];
	//positive overflow: add 2 LARGE numbers
	//negative overflow: add 2 LARGELY NEGATIVE numbers

	assign negative = result[63];
	
	//TODO remove this if remains unused
	//Used for the 2 unused ALU control channels
	//reg [63:0] empty = 64'hffffffffffffffff;
	
	
	carryselectadder64bit slice0(.a(A), .b(Bfinal), .cin(SubMode), .sum(ADD), .cout(carry_out), .overflow(overflow));
	//shifter slice1(.value(A), .direction(direction), .distance(SHAMT), .result(SHIFT));

	//ALU_LSR=0, ALU_MUL=1, ALU_ADD=2, ALU_SUBTRACT=3, ALU_AND=4, ALU_OR=5, ALU_XOR=6, ALU_LSL=7;
	//TODO: OR all the result bits (AND CarryOut[63]) together and NOT it and assign to zero wire


	wire [63:0] muxBus [0:7];
	assign muxBus[0] = A >> SHAMT; //change to LSR
	assign muxBus[1] = A * B; //change to mult
	assign muxBus[2] = ADD; //change to add output
	assign muxBus[3] = ADD; 
	assign muxBus[4] = A & B;
	assign muxBus[5] = A | B;		
	assign muxBus[6] = A ^ B;
	assign muxBus[7] = A << SHAMT;
	
	mux_8_64bit ALUmux (.OUT(result), .SEL(cntrl), .IN0(muxBus[0]),
						.IN1(muxBus[1]), .IN2(muxBus[2]), .IN3(muxBus[3]),
						.IN4(muxBus[4]), .IN5(muxBus[5]), .IN6(muxBus[6]),
						.IN7(muxBus[7]));

wire [63:0] B_bar;
assign B_bar = ~B + 1;

	always @(*) begin
		if(cntrl == 2) begin
			//$display("A+B: %d + %d = %d. CarryOut = %b Overflow = %d AT TIME %d",A, B, result, carry_out, overflow, $time);
//			$display("A + B: EXPECTED (%d)\tGOT\t(%d) AT TIME %d", A+B, result, $time);
		end
		if(cntrl == 3) begin

			//$display("A-B: %d - %d = %d. CarryOut = %b Overflow = %d AT TIME %d",A, B, result, carry_out, overflow, $time);
			//$display("A-B: %d - %d = %d. EXPECTED %d AT TIME %d",A, B, result, A-B, $time);
		end// A + B_bar
	end

	
endmodule
/*
module shifter( value, direction, distance, result );
	
	input	[63:0]	value;
	input			direction; // 0: left, 1: right
	input 	[5:0]	distance;
	output	[63:0]	result;
	
	always@ (value, distance, direction) begin
		if (direction == 0)
			result = value << distance;
		else
			result = value >> distance;
	end
endmodule
*/
