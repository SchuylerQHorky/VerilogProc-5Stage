/******************************************************************
 * Date: 1/18/2018
 * File: mux16_testbench.v
 *
 * 
 *******************************************************************/
`include "mux_2.v" 
`include "mux_4.v" 
`include "BranchSignalMux.v"

module testBench;
	//module for GTK Wave

	wire TakeBranch;
	wire negative, overflow, carry_out, zero;
	wire UncondBr, brZero;
	wire brTaken;
	
	BranchSignalMux pr(TakeBranch, negative, overflow, carry_out, zero, UncondBr, brZero, brTaken);

	Tester test1(TakeBranch, negative, overflow, carry_out, zero, UncondBr, brZero, brTaken);


	initial
	begin
		//these two files support GTK Wave and are required
		$dumpfile("BranchSignalMux_testbench.vcd");
		$dumpvars(2, pr);
	end
endmodule


module Tester(TakeBranch, negative, overflow, carry_out, zero, UncondBr, brZero, brTaken);

	parameter simDelay = 5;
	input TakeBranch;
	output negative, overflow, carry_out, zero;
	output UncondBr, brZero;
	output brTaken;

	wire[6:0] ctrls;
	reg[6:0] ctrlsReg = 7'b0000000;
	assign negative = ctrls[0];
	assign overflow = ctrls[1];
	assign carry_out = ctrls[2];
	assign zero = ctrls[3];
	assign UncondBr = ctrls[4];
	assign brZero = ctrls[5];
	assign brTaken = ctrls[6];

assign ctrls = ctrlsReg;
	initial begin
		ctrlsReg = 7'b0000000;//initialize to all 0's
		#50 ctrlsReg = 7'b0000001;//set negative
		#50 ctrlsReg = 7'b1000001;//set branch taken
		#50 ctrlsReg = 7'b1100001;//set br zero. TakeBranch should be 1
		#50 ctrlsReg = 7'b0000000;
		#50 ctrlsReg = 7'b0000000;
		#50 ctrlsReg = 7'b0000000;

		//$display("clk\trst\tTime");
		//$monitor("%b\t%b\t%b\t%d",OUT, SEL, IN,$time);
	end
	reg [4:0] index = 5'b00000;


	initial begin

		#500 $finish;
	end

	
endmodule



