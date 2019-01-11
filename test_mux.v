/******************************************************************
 * Date: 1/18/2018
 * File: test_mux.v
 * Uses combinational logic to create a 2 x 1 mux with more bits
 *******************************************************************/
 
`include "mux_2.v"

module testBench;
	//module for GTK Wave

	wire [63:0]OUT;
	wire[63:0] IN0, IN1;
	wire SEL;

	mux_2 pr(OUT, SEL, IN0, IN1);

	Tester test1(OUT, SEL, IN0, IN1);


	initial
	begin
		//these two files support GTK Wave and are required
		$dumpfile("test_mux.vcd");
		$dumpvars(1, pr);
	end
endmodule


module Tester(OUT, SEL, IN0, IN1);

	output [63:0] IN0, IN1;
	reg    [63:0] IN0, IN1;

	input [63:0] OUT;
	wire  [63:0] OUT;

	output SEL;
	reg    SEL;

	parameter simDelay = 5;
	initial begin
		//$display("clk\trst\tTime");
		//$monitor("%b\t%b\t%b\t%d",OUT, SEL, IN,$time);
	end



	initial begin
	
		#5 IN0 = 64'hf0f0f0f0f0f0f0f0;
		#5 IN1 = 64'hffffffffffffffff;
		#5 SEL = 1'b0;
		#5 SEL = 1'b1;
		#5 IN0 = 64'h0000000000000000;
		#5 SEL = 2'b0;
		#5 SEL = 2'b1;
		
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