/******************************************************************
 * Date: 1/18/2018
 * File: test_mux.v
 * Uses combinational logic to create a 2 x 1 mux with more bits
 *******************************************************************/
 
`include "mux_8_64bit.v"


module testBench;
	//module for GTK Wave

	wire [63:0] OUT;
	wire [63:0] IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7;
	wire  [2:0] SEL;

	mux_8_64bit pr(OUT, SEL, IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7);

	Tester test1(OUT, SEL, IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7);


	initial
	begin
		//these two files support GTK Wave and are required
		$dumpfile("test_muxPart2.vcd");
		$dumpvars(1, pr);
	end
endmodule


module Tester(OUT, SEL, IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7);

	output [63:0] IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7;
	reg    [63:0] IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7;

	input  [63:0] OUT;
	wire   [63:0] OUT;

	output  [2:0] SEL;
	reg     [2:0] SEL;

	parameter simDelay = 5;
	initial begin
		//$display("clk\trst\tTime");
		//$monitor("%b\t%b\t%b\t%d",OUT, SEL, IN,$time);
	end



	initial begin
	
		 IN0 = 64'h0000000000000000;
		 IN1 = 64'h1111111111111111;
		 IN2 = 64'h2222222222222222;
		 IN3 = 64'h3333333333333333;
		 IN4 = 64'h4444444444444444;
		 IN5 = 64'h5555555555555555;
		 IN6 = 64'h6666666666666666;
		 IN7 = 64'h7777777777777777;
		   SEL = 3'b000;
		#5 SEL = 3'b001;
		#5 SEL = 3'b010;
		#5 SEL = 3'b011;
		#5 SEL = 3'b100;
		#5 SEL = 3'b101;
		#5 SEL = 3'b110;
		#5 SEL = 3'b111;
		
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