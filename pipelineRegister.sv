parameter FLAG_COUNT = 10;


module pipelineRegisterRF(outputInstruction, inputInstruction, clk, reset);
	output [31:0] outputInstruction;
	input [31:0] inputInstruction;
	input clk, reset;

	D_FF #(32) instructionReg(outputInstruction, inputInstruction, reset, clk);
endmodule

module pipelineRegisterEX(outputRd,outputRm,outputRn,outputFlags,outputALUOp,outputALUImm12,outputBrAddr26,outputCondAddr19,outputA,outputB,inputRd,inputRm,inputRn,inputFlags,inputALUOp,inputALUImm12,inputBrAddr26,inputCondAddr19,inputA,inputB,clk,reset);
	output [4:0] outputRd;
	output [4:0] outputRm;
	output [4:0] outputRn;
	output [FLAG_COUNT - 1:0] outputFlags;
	output [2:0] outputALUOp;
	output [11:0] outputALUImm12;
	output [25:0] outputBrAddr26;
	output [18:0] outputCondAddr19;

	input [4:0] inputRd;
	input [4:0] inputRm;
	input [4:0] inputRn;
	input [FLAG_COUNT - 1:0] inputFlags;
	input [2:0] inputALUOp;
	input [11:0] inputALUImm12;
	input [25:0] inputBrAddr26;
	input [18:0] inputCondAddr19;

	output [63:0] outputA;
	output [63:0] outputB;

	input [63:0] inputA;
	input [63:0] inputB;

	input clk,reset;

	D_FF #(5) rdReg(outputRd, inputRd, reset, clk);
	D_FF #(5) rnReg(outputRm, inputRm, reset, clk);
	D_FF #(5) rmReg(outputRn, inputRn, reset, clk);
	D_FF #(FLAG_COUNT) flagReg(outputFlags, inputFlags, reset, clk);

	D_FF #(3) aluOpReg(outputALUOp, inputALUOp, reset, clk);
	D_FF #(12) aluImm12Reg(outputALUImm12, inputALUImm12, reset, clk);
	D_FF #(26) brAddr26Reg(outputBrAddr26, inputBrAddr26, reset, clk);
	D_FF #(19) condAddr19Reg(outputCondAddr19, inputCondAddr19, reset, clk);

	D_FF #(64) aReg(outputA, inputA, reset, clk);
	D_FF #(64) bReg(outputB, inputB, reset, clk);

endmodule

module pipelineRegisterMEM(outputRd,outputRm,outputRn,outputFlags,outputALUOp,outputALUImm12,outputBrAddr26,outputCondAddr19,outputALUOut,outputALUB,inputRd,inputRm,inputRn,inputFlags,inputALUOp,inputALUImm12,inputBrAddr26,inputCondAddr19,inputALUOut,inputALUB,clk,reset);
	output [4:0] outputRd;
	output [4:0] outputRm;
	output [4:0] outputRn;
	output [FLAG_COUNT - 1:0] outputFlags;
	output [2:0] outputALUOp;
	output [11:0] outputALUImm12;
	output [25:0] outputBrAddr26;
	output [18:0] outputCondAddr19;

	input [4:0] inputRd;
	input [4:0] inputRm;
	input [4:0] inputRn;
	input [FLAG_COUNT - 1:0] inputFlags;
	input [2:0] inputALUOp;
	input [11:0] inputALUImm12;
	input [25:0] inputBrAddr26;
	input [18:0] inputCondAddr19;

	output [63:0] outputALUOut;
	output [63:0] outputALUB;

	input [63:0] inputALUOut;
	input [63:0] inputALUB;

	input clk,reset;

	D_FF #(5) rdReg(outputRd, inputRd, reset, clk);
	D_FF #(5) rnReg(outputRm, inputRm, reset, clk);
	D_FF #(5) rmReg(outputRn, inputRn, reset, clk);
	D_FF #(FLAG_COUNT) flagReg(outputFlags, inputFlags, reset, clk);

	D_FF #(3) aluOpReg(outputALUOp, inputALUOp, reset, clk);
	D_FF #(12) aluImm12Reg(outputALUImm12, inputALUImm12, reset, clk);
	D_FF #(26) brAddr26Reg(outputBrAddr26, inputBrAddr26, reset, clk);
	D_FF #(19) condAddr19Reg(outputCondAddr19, inputCondAddr19, reset, clk);

	D_FF #(64) aluOUTReg(outputALUOut, inputALUOut, reset, clk);
	D_FF #(64) aluBReg(outputALUB, inputALUB, reset, clk);

endmodule

module pipelineRegisterWB(outputRd,outputRm,outputRn,outputFlags,outputALUOp,outputALUImm12,outputBrAddr26,outputCondAddr19,outputWriteback,inputRd,inputRm,inputRn,inputFlags,inputALUOp,inputALUImm12,inputBrAddr26,inputCondAddr19,inputWriteback,clk,reset);
	output [4:0] outputRd;
	output [4:0] outputRm;
	output [4:0] outputRn;
	output [FLAG_COUNT - 1:0] outputFlags;
	output [2:0] outputALUOp;
	output [11:0] outputALUImm12;
	output [25:0] outputBrAddr26;
	output [18:0] outputCondAddr19;

	input [4:0] inputRd;
	input [4:0] inputRm;
	input [4:0] inputRn;
	input [FLAG_COUNT - 1:0] inputFlags;
	input [2:0] inputALUOp;
	input [11:0] inputALUImm12;
	input [25:0] inputBrAddr26;
	input [18:0] inputCondAddr19;

	output [63:0] outputWriteback;
	input [63:0] inputWriteback;

	input clk,reset;

	D_FF #(5) rdReg(outputRd, inputRd, reset, clk);
	D_FF #(5) rnReg(outputRm, inputRm, reset, clk);
	D_FF #(5) rmReg(outputRn, inputRn, reset, clk);
	D_FF #(FLAG_COUNT) flagReg(outputFlags, inputFlags, reset, clk);

	D_FF #(3) aluOpReg(outputALUOp, inputALUOp, reset, clk);
	D_FF #(12) aluImm12Reg(outputALUImm12, inputALUImm12, reset, clk);
	D_FF #(26) brAddr26Reg(outputBrAddr26, inputBrAddr26, reset, clk);
	D_FF #(19) condAddr19Reg(outputCondAddr19, inputCondAddr19, reset, clk);

	D_FF #(64) writebackReg(outputWriteback, inputWriteback, reset, clk);

endmodule