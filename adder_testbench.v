/******************************************************************
 * Date: 1/18/2018
 * File: test_mux.v
 * Uses combinational logic to create a 2 x 1 mux with more bits
 *******************************************************************/
 
`include "carryselectadder64bit.v"

module testbench;
	//module for GTK Wave

	wire [3:0] a, b, sum;
	wire cin, cout, overflow;

	//carryselectadder64bit pr (a, b, cin, sum, cout, overflow);
	carryselect4bitFinal pr(a, b, cin, sum, cout, overflow);
	//ripplecarry4bitFinal pr(a, b, cin, sum, cout, overflow);
	Tester test(a, b, cin, sum, cout, overflow);
	//Tester test(a, b, cin, sum, cout, overflow);

	initial
	begin
		//these two files support GTK Wave and are required
		$dumpfile("adder_testbench.vcd");
		$dumpvars(1, pr);
	end
endmodule


module Tester(a, b, cin, sum, cout, overflow);

	output reg [3:0] a, b;
	//reg    [63:0] A, B;
	output reg cin;

	input wire [3:0] sum;
	//wire  [63:0] result;

	input cout, overflow;
	//reg   negative, zero, overflow, carry_out;

	parameter simDelay = 5;
	initial begin
		//$display("clk\trst\tTime");
		//$monitor("%b\t%b\t%b\t%d",OUT, SEL, IN,$time);
	end



	initial begin
		 cin = 1'b0;
		   a = 16'h0004;
		   b = 16'h0003;
		
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