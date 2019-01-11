//TODO: implement negative output
`include "mux2X1.v"
`include "ALU.v"
`include "InstructionAdapter.v"
`include "instructmem.sv"
`include "program_counter.v"
`include "datamem.sv"
`include "regfile.v"

module processor(clk);
	input clk;

	//reg [31:0] Instruction;
	wire nextNegative, nextOverflow, nextCarry_out;
	reg negative = 0;
	reg overflow = 0;
	reg carry_out = 0;
	wire [31:0] Instruction;
	wire [4:0] Rd,Rm,Rn,regRead2;
	wire [2:0] ALUOp;
	wire [25:0] BrAddr26;
	wire [18:0] CondAddr19;
	wire [11:0] ALUImm12;
	wire signed [63:0] nextAddress, Dout;
	wire signed [63:0] WriteData, ALUOut;
	reg signed [63:0] curAddress=64'h0000000000000000;
	wire [63:0] A, B;
	wire [3:0] xfer_size;
	wire ALU_Src,SetFlags, MemWrite, MemToReg,RegWrite,Reg2Loc;
	wire UncondBr, BrZero, BrTaken, ALUImm;
	wire TakeBranch;
	wire zero;

	assign xfer_size = 4'b1000;
	//currInstruction, next instruction, Opcode, outputs of the opcode
	//PC module, DataMeM, InstrMeM, RegMeM modules
	//Reg2Loc mux, and MemToReg mex
	
	always @(posedge clk) begin

		if(RegWrite) begin
			if(Rd == 31 && WriteData == 0 && ALUOp == 2) begin
				$write("NOP ");
			end
			else begin
				$write("X%0d = %0d ", Rd, WriteData);
			end
		end


		if(TakeBranch) begin
			$write("BRANCH to PC+%0d",((nextAddress-curAddress)/4));
		end
		if(SetFlags) begin
			negative = nextNegative;
			overflow = nextOverflow;
			carry_out = nextCarry_out;
			if(negative) begin
				$write("neg ");
			end
			if(overflow) begin
				$write("overflow ");
			end
			if(carry_out) begin
				$write("carryout");
			end

		end

		curAddress <= nextAddress;
		$write("\n");
	end
	//InstructionAdapter takes in an instruction and breaks it into it consitutient components
	InstructionAdapter IA  (.Instruction(Instruction), .RegWrite(RegWrite), .Reg2Loc(Reg2Loc),
							.Rd(Rd),.Rm(Rm),.Rn(Rn),.ALUOp(ALUOp),.ALUImm12(ALUImm12),
							.ALUSrc(ALU_Src),.SetFlags(SetFlags), .ALUImm(ALUImm),
							.MemWrite(MemWrite),.MemToReg(MemToReg),.UncondBr(UncondBr),
							.BrZero(BrZero),.BrTaken(BrTaken),
							.BrAddr26(BrAddr26),.CondAddr19(CondAddr19));
							
	//Program Counter determines next address instruction depending on the current instruction
	program_counter PC (.nextAddress(nextAddress), .curAddress(curAddress), .condAddr19(CondAddr19), 
						.brAddr26(BrAddr26), .UncondBr(UncondBr), .brTaken(BrTaken),
						.negative(negative), .overflow(overflow), .carry_out(carry_out),
						.zero(zero), .brZero(BrZero), .TakeBranch(TakeBranch));			
						
	//Instruction Memory holds all of the instructions					
	instructmem     IM (.address(curAddress), .instruction(Instruction), .clk(clk)	);					
	// Memory is combinational, but clk for error-checking
	
	//datamem functions as our main data
	datamem DM (.address(ALUOut), .write_enable(MemWrite), .read_enable(MemToReg),
				.write_data(B), .clk(clk), .xfer_size(xfer_size), 
				.read_data(Dout));
	
	//ALU can add, subtract, AND, OR, XOR, LSL, LSR, 	
	alu     AL (.A(A), .B(B), .cntrl(ALUOp), .ALU_src(ALU_Src), .Immediate(ALUImm), .ALU_Imm12(ALUImm12), .result(ALUOut), 
				.negative(nextNegative), .zero(zero), .overflow(nextOverflow), .carry_out(nextCarry_out));
				
	//32 64-bit registers			
	regfile RM (.ReadData1(A), .ReadData2(B), .WriteData(WriteData),
				.ReadRegister1(Rn), .ReadRegister2(regRead2), 
				.WriteRegister(Rd), .RegWrite(RegWrite), .clk(clk));
	
	
	mux2X1 #(64) writeBack(
	.in0(ALUOut),
	.in1(Dout),
	.sel(MemToReg),
	.out(WriteData));	
	
	mux2X1 #(5) read2(
	.in0(Rd),
	.in1(Rm),
	.sel(Reg2Loc),
	.out(regRead2));						
	
endmodule

