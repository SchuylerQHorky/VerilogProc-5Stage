`include "decoder_5x32.v"
`include "registerArray.v"
`include "mux_2.v"
`include "mux_4.v"
`include "mux_16.v"
`include "mux_32.v"
`include "decoder_2x4.v"
`include "decoder_3x8.v"
`include "Mux_64x32Array.v"


module regfile(ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegWrite, clk);
	output [63:0] ReadData1;
	output [63:0] ReadData2;

	input wire [63:0] WriteData;
	
	input wire [4:0] ReadRegister1;
	input wire [4:0] ReadRegister2;
	input wire [4:0] WriteRegister;
	
	input wire RegWrite;
	input wire clk;

	/*internal connections*/
	wire [31:0] RegWriteSelectLines;
	wire [2047:0] RegDatabus;

	//write select mux
	decoder_5x32 regWriteSelect(RegWriteSelectLines, WriteRegister, RegWrite);

	//registers
	registerArray registers(RegDatabus, WriteData, RegWriteSelectLines, RegWrite, clk);

	Mux_64x32Array Read1Mux(ReadData1, RegDatabus, ReadRegister1, clk);
	Mux_64x32Array Read2Mux(ReadData2, RegDatabus, ReadRegister2, clk);


endmodule