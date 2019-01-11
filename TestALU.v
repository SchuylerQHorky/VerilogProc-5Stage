`include "alu1bit.v"
`include "FullAdder.v"


module testBench;
	//module for GTK Wave

	wire [63:0] A;
	wire [63:0] B;
	wire [2:0] cntrl;
	wire [63:0] result;
	wire negative;
	wire zero;
	wire overflow;
	wire carry_out;

	alu alu1(A, B, cntrl, result, negative, zero, overflow, carry_out);
	Tester register_tester(A, B, cntrl, result, negative, zero, overflow, carry_out);

	initial
	begin
		//these two files support GTK Wave and are required
		$dumpfile("TestALU.vcd");
		$dumpvars(1, alu1);
	end
endmodule


module Tester(A, B, cntrl, result, negative, zero, overflow, carry_out);
	

	parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;

	output reg [63:0] A=64'b0;
	output reg [63:0] B=64'b0;
	output reg [2:0] cntrl
	input wire [63:0] result;
	output reg negative;
	output reg zero;
	output reg overflow;
	output reg carry_out;


	reg [3:0] testbus;
	assign A = testbus[0];
	assign B = testbus[1];
	assign carry_in = testbus[2];
	assign SubMode = testbus[3];


	parameter simDelay = 5;
	initial begin
		//$display("clk\trst\tTime");
		//$monitor("%b\t%b\t%d",SerialClock,reset,$time);

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



