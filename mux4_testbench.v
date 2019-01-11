/******************************************************************
 * Date: 1/18/2018
 * File: mux4_testbench.v
 *
 * 
 *******************************************************************/
`include "mux4X1.v"

module testBench;
	//module for GTK Wave

	wire[15:0]OUT;
	wire[15:0] IN0, IN1, IN2, IN3;
	wire[1:0] SEL;

	mux4X1 #(16) mc0(
		.in0(IN0),
		.in1(IN1),
		.in2(IN2),
		.in3(IN3),
		.sel(SEL),
		.out(OUT));

	Tester test1(OUT, SEL, IN0, IN1, IN2, IN3);


	initial
	begin
		//these two files support GTK Wave and are required
		$dumpfile("mux4X1.vcd");
		$dumpvars(1, mc0);
	end
endmodule


module Tester(OUT, SEL, IN0, IN1, IN2, IN3);

	output [15:0] IN0, IN1, IN2, IN3;
	reg    [15:0] IN0, IN1, IN2, IN3;

	input [15:0]OUT;
	wire  [15:0]OUT;

	output[1:0] SEL;
	reg[1:0] SEL;

	parameter simDelay = 5;
	initial begin
		//$display("clk\trst\tTime");
		//$monitor("%b\t%b\t%b\t%d",OUT, SEL, IN,$time);
	end



	initial begin
	
		#5 IN0 = 4'b0000;
		   IN1 = 4'b0001;
		   IN2 = 4'b0010;
		   IN3 = 4'b0011;
		#5 SEL = 2'b00;
		#5 SEL = 2'b01;
		#5 SEL = 2'b10;
		#5 SEL = 2'b11;
		#5 IN0 = 4'b1111;
		   IN1 = 4'b1110;
		   IN2 = 4'b1101;
	  	   IN3 = 4'b1100;
		#5 SEL = 2'b00;
		#5 SEL = 2'b01;
		#5 SEL = 2'b10;
		#5 SEL = 2'b11;
		
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



