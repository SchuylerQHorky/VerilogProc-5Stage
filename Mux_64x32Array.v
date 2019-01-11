`include "decoder_2x4.v"
`include "mux_32.v"
`include "mux_16.v"
`include "mux_2.v"
`include "mux_4.v"


module Mux_64x32Array(ReadData, RegDatabus, ReadRegister, clk);
	output [63:0] ReadData;
	input wire [2047:0] RegDatabus;
	input wire [4:0] ReadRegister;

	input wire clk;

	genvar i, j;
		generate for (i = 0; i < 64; i = i + 1) begin : reg_bits_gen3
			wire [31:0] data;
			for (j = 0; j < 32; j = j + 1) begin : reg_bits_gen4
				assign data[j] = RegDatabus[i+(j*64)];
			end
			mux_32 mux(ReadData[i], ReadRegister, data);

		end endgenerate
	
	// always @(posedge clk) begin
	// 	$display("Reg %d : %h", clogb2(ReadRegister), ReadData);
	// end

	// function integer clogb2;
	//    input [31:0] value;
	//    integer 	i;
	//    begin
	//       clogb2 = 0;
	//       for(i = 0; 2**i < value; i = i + 1)
	// 	clogb2 = i + 1;
	//    end
	// endfunction

endmodule