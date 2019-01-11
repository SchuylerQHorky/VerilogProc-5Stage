/******************************************************************
 * Date: 1/18/2018
 * File: mux16_testbench.v
 *
 * 
 *******************************************************************/
`include "mux_8.v"
`include "mux_2.v"

module testBench;
	//module for GTK Wave

	wire OUT;
	wire[7:0] IN;
	wire[2:0] SEL;

	mux_8 pr(OUT, SEL, IN);

	Tester test1(OUT, SEL, IN);


	initial
	begin
		//these two files support GTK Wave and are required
		$dumpfile("mux_8.vcd");
		$dumpvars(1, pr);
	end
endmodule


module Tester(OUT, SEL, IN);

	output [7:0] IN;
	reg    [7:0] IN;

	input OUT;
	wire  OUT;

	output[2:0] SEL;
	reg[2:0] SEL = 3'b0;

	parameter simDelay = 5;
	initial begin
		//$display("clk\trst\tTime");
		//$monitor("%b\t%b\t%b\t%d",OUT, SEL, IN,$time);
	end



	initial begin
		
		#5 IN = 8'b00110011;
		repeat(8) begin
			
			$display ("Current value of SEL is %d", SEL);
			#5 SEL = SEL + 1;
		end
		
		#5 IN = ~IN;
	
		repeat(8) begin
			$display ("Current value of SEL is %d", SEL);
			#5 SEL = SEL + 1;
		end

		// for (SEL = 0; SEL <= 7; SEL = SEL + 1) begin
  //   	  	$display ("Current value of SEL is %d", SEL);
		// 	#5 SEL = SEL;
  //   	end
		// #5 IN = ~IN;
		// for (SEL = 0; SEL <= 7; SEL = SEL + 1) begin
  //   	  	$display ("Current value of SEL is %d", SEL);
		// 	#5 SEL = SEL;
  //   	end
		
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



