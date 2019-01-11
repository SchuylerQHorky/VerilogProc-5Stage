/******************************************************************
 * Date: 1/18/2018
 * File: test_mux.v
 * Uses combinational logic to create a 2 x 1 mux with more bits
 *******************************************************************/
 
`include "program_counter.v"

module alu_testbench;
	//module for GTK Wave
	wire [31:0] address;
	wire [31:0] curAddress;
	wire [18:0] condAddr19;
	wire [25:0] brAddr26;
	wire UncondBr, brTaken, clk;

	program_counter pr(address, curAddress, condAddr19, brAddr26, UncondBr, brTaken, clk);

	Tester test(address, curAddress, condAddr19, brAddr26, UncondBr, brTaken, clk);


	initial
	begin
		//these two files support GTK Wave and are required
		$dumpfile("pc_test.vcd");
		$dumpvars(1, pr);
	end
endmodule


module Tester(address, curAddress, condAddr19, brAddr26, UncondBr, brTaken, clk);
	input [31:0] address;
	output reg[31:0] curAddress;
	output reg[18:0] condAddr19;
	output reg[25:0] brAddr26;
	output reg brTaken, UncondBr, clk;

	parameter simDelay = 5;
	initial begin
		//$display("clk\trst\tTime");
		//$monitor("%b\t%b\t%b\t%d",OUT, SEL, IN,$time);
	end



	initial begin
	
		#5 clk = 1'b0;
		#5 clk = 1'b1;
		   UncondBr = 1'b0;
		   brTaken = 1'b0;
		   condAddr19 = 19'b0000000000000000001;
		   brAddr26 = 26'b00000000000000000000000010;
		   curAddress = 32'b00000000000000000000000000000000;
		#5 clk = 1'b0;
		#5 clk = 1'b1;
		   brTaken = 1'b1;
		#5 clk = 1'b0;
		#5 clk = 1'b1;
		   UncondBr = 1'b1;
		#5 clk = 1'b0;
		#5 clk = 1'b1;
		   UncondBr = 1'b0;
		   brTaken = 1'b0;
		#5 clk = 1'b0;
		#5 clk = 1'b1;
		#5 clk = 1'b0;
		#5 clk = 1'b1;
			
		
		
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