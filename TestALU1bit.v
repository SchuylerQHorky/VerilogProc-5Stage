`include "alu1bit.v"
`include "FullAdder.v"


module testBench;
	//module for GTK Wave

	wire A;
	wire B;
	wire SubMode;
	wire AddOut;
	wire AndOut;
	wire OrOut;
	wire XorOut;
	wire carry_in;
	wire carry_out;

	alu1bit alu(A, B, SubMode, AddOut, AndOut, OrOut, XorOut, carry_in, carry_out);
	Tester register_tester(A, B, SubMode, AddOut, AndOut, OrOut, XorOut, carry_in, carry_out);

	initial
	begin
		//these two files support GTK Wave and are required
		$dumpfile("TestALU1bit.vcd");
		$dumpvars(1, alu);
	end
endmodule


module Tester(A, B, SubMode, AddOut, AndOut, OrOut, XorOut, carry_in, carry_out);
	output A;
	output B;
	output carry_in;
	output SubMode;
	input wire AddOut;
	input wire AndOut;
	input wire OrOut;
	input wire XorOut;
	
	input wire carry_out;

	reg [3:0] testbus;
	assign A = testbus[0];
	assign B = testbus[1];
	assign carry_in = testbus[2];
	assign SubMode = testbus[3];


	parameter simDelay = 5;
	initial begin

		testbus = 4'b0;
		repeat(8) begin
			
			$display ("Current value of testbus is %d", testbus);
			#5 testbus = testbus + 1;
		end



		testbus = 4'b1100;
		repeat(4) begin
			
			$display ("Current value of testbus is %d", testbus);
			#5 testbus = testbus + 1;
		end
		//$display("q\td\treset\tclk\ttime");
		//$monitor("%b\t%b\t%b\t%b\t%d",q, d, reset, clk,$time);
	end



	initial begin
		

		#90 $finish;
	end


endmodule



