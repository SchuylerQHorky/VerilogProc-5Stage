/******************************************************************
 * Date: 1/18/2018
 * File: mux4_testbench.v
 *
 * 
 *******************************************************************/
`include "forwardingUnit.sv"

module testBench;
	//module for GTK Wave

	wire [63:0] aluA, aluB; //input
	wire [4:0] aluAValue, aluBValue; //input
	wire [63:0] outA, outB; //output
	wire [63:0] executeFetch;//input
	wire [63:0] memoryFetch;//input
	wire [4:0] memoryPipe;//input
	wire [4:0] executePipe;//input

	forwardingUnit forward(
		.outA(outA),
		.outB(outB),
		.aluA(aluA), 
		.aluB(aluB),
		.executeFetch(executeFetch), 
		.executePipe(executePipe), 
		.memoryFetch(memoryFetch), 
		.memoryPipe(memoryPipe),
		.aluAValue(aluAValue), 
		.aluBValue(aluBValue));

	Tester test1(
		.outA(outA),
		.outB(outB),
		.aluA(aluA), 
		.aluB(aluB),
		.executeFetch(executeFetch), 
		.executePipe(executePipe), 
		.memoryFetch(memoryFetch), 
		.memoryPipe(memoryPipe),
		.aluAValue(aluAValue), 
		.aluBValue(aluBValue));


	initial
	begin
		//these two files support GTK Wave and are required
		$dumpfile("forwardingUnit.vcd");
		$dumpvars(1, forward);
	end
endmodule


module Tester(outA, outB, aluA, aluB, executeFetch, executePipe, 
					   memoryFetch, memoryPipe,aluAValue, aluBValue );

	input [63:0] outA, outB;
	wire [63:0] outA, outB;
	output [63:0] aluA, aluB;
	output [63:0] executeFetch;
	output [63:0] memoryFetch;
	reg [63:0] aluA, aluB, executeFetch, memoryFetch;
	output [4:0] memoryPipe;
	output [4:0] executePipe;
	output [4:0] aluAValue, aluBValue;
	reg [4:0] memoryPipe, executePipe, aluAValue, aluBValue;

	parameter simDelay = 5;
	initial begin
		//$display("clk\trst\tTime");
		//$monitor("%b\t%b\t%b\t%d",OUT, SEL, IN,$time);
	end



	initial begin

	//[63:0] aluA, outA; //input
	//[63:0] outA, outB; //output
	//[63:0] executeFetch;//input
	//[63:0] memoryFetch;//input
	//[4:0] memoryPipe;//input
	//[4:0] executePipe;//input
	
		   aluA      = 64'haaaaaaaaaaaaaaaa;
		   aluAValue = 5'b00001;
		   aluB      = 64'hbbbbbbbbbbbbbbbb;
		   aluBValue = 5'b00010;
		   executeFetch = 64'hcccccccccccccccc;
		   executePipe  = 5'b00010;
		   memoryFetch  = 64'hdddddddddddddddd;
		   memoryPipe   = 5'b00011;
		   
		
		#5 aluAValue = 5'b00010;
		#5 aluBValue = 5'b00011;
		#5 executeFetch = 64'h0000000000000000;
		#5 memoryFetch  = 64'h1111111111111111;
		#5 executePipe  = 5'b00100;
		#5 memoryPipe   = 5'b00101;
		#5 memoryPipe   = 5'b00010;
		#5 executePipe  = 5'b00010;
		
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



