// Test bench for ALU
`timescale 1ns/10ps

`include "Processor.v"

module processorstim();

	parameter delay = 100;

	reg clk = 0;

	processor p(clk);
	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin
		repeat(4000) begin
			#delay clk = !clk;


		//#2000 $finish;//$finish
		end
	end

endmodule
