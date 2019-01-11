//`include "regfile.v"

module registerArray(OutputBus, Input, InputSelect, RegWrite, Clk);
	output[2047:0] OutputBus;// [0:31];
	input wire signed [63:0] Input;
	input wire [31:0] InputSelect;
	input wire Clk;
	input wire RegWrite;

	genvar i;
		generate for (i = 0; i < 31; i = i + 1) begin : reg_bits_gen2
			register cpuReg(OutputBus[((i+1)*64)-1:(i*64)], InputSelect[i], Clk, Input);
		end endgenerate

	reg [63:0] ZeroReg = 32'b0;
	assign OutputBus[(64*32)-1:(64*31)] = ZeroReg;

	// always @(posedge Clk) begin

	// end


endmodule