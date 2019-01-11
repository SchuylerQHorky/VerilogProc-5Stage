/******************************************************************
 * Date: 1/18/2018
 * File: test_mux.v
 * Uses combinational logic to create a 2 x 1 mux with more bits
 *******************************************************************/
 
`include "ALU.v"

module alu_testbench;
	//module for GTK Wave

	wire [63:0] A, B, result;
	wire [2:0] cntrl;
	wire [5:0] SHAMT;
	wire negative, zero, overflow, carry_out;

	alu pr( A, B, SHAMT, cntrl, result, negative, zero, overflow, carry_out);

	Tester test( A, B, SHAMT, cntrl, result, negative, zero, overflow, carry_out);


	initial
	begin
		//these two files support GTK Wave and are required
		$dumpfile("ALU_testbench.vcd");
		$dumpvars(1, pr);
	end
endmodule


module Tester(A, B, SHAMT, cntrl, result, negative, zero, overflow, carry_out);

	output reg [63:0] A, B;
	//reg    [63:0] A, B;
	
	output reg [5:0] SHAMT;
	//reg  		 SHAMT;
	
	output reg [2:0] cntrl;
	//reg    [2:0] cntrl;

	input wire [63:0] result;
	//wire  [63:0] result;

	input negative, zero, overflow, carry_out;
	//reg   negative, zero, overflow, carry_out;

	parameter simDelay = 5;
	initial begin
		//$display("clk\trst\tTime");
		//$monitor("%b\t%b\t%b\t%d",OUT, SEL, IN,$time);
	end



	initial begin
	
		   A = 64'h0000000000000004;
		   B = 64'h0000000000000003;
		   SHAMT = 6'b001000;
		#5 cntrl = 3'b000;
		#5 cntrl = 3'b001;
		#5 cntrl = 3'b010;
		#5 cntrl = 3'b011;
		#5 cntrl = 3'b100;
		#5 cntrl = 3'b101;
		#5 cntrl = 3'b110;
		#5 cntrl = 3'b111;
		
		#5 $finish;
	end
/*
	always begin
		//#simDelay SerialClock = !SerialClock;
	end

	always begin
		//#1 CLOCK_50 = !CLOCK_50;
	end
	*/
endmodule