/******************************************************************
 * Date: 1/18/2018
 * File: mux16_testbench.v
 *
 * 
 *******************************************************************/
`include "InstructionAdapter.v"
`include "mux_2.v"

module testBench;
	//module for GTK Wave

	wire [31:0] Instruction;

	//reg file flags
	wire RegWrite,Reg2Loc;
	wire[4:0] Rd,Rm,Rn;

	//ALU flags
	wire [2:0] ALUOp;
	wire [11:0] ALUImm12;
	wire ALUSrc,ALUImm, SetFlags;

	//data mem flags
	wire MemWrite,MemToReg;

	//branch flags
	wire UncondBr,BrZero,BrTaken;
	wire [25:0] BrAddr26;
	wire [18:0] CondAddr19;
	
	InstructionAdapter pr(Instruction, RegWrite, Reg2Loc, Rd,Rm,Rn,ALUOp,ALUImm12,ALUSrc,ALUImm,SetFlags,MemWrite,MemToReg,UncondBr,BrZero,BrTaken,BrAddr26,CondAddr19);

	Tester test1(Instruction, RegWrite, Reg2Loc, Rd,Rm,Rn,ALUOp,ALUImm12,ALUSrc,ALUImm,SetFlags,MemWrite,MemToReg,UncondBr,BrZero,BrTaken,BrAddr26,CondAddr19);


	initial
	begin
		//these two files support GTK Wave and are required
		$dumpfile("InstructionAdapter_testbench.vcd");
		$dumpvars(2, pr);
	end
endmodule


module Tester(Instruction, RegWrite, Reg2Loc, Rd,Rm,Rn,ALUOp,ALUImm12,ALUSrc,ALUImm,SetFlags,MemWrite,MemToReg,UncondBr,BrZero,BrTaken,BrAddr26,CondAddr19);


	output reg [31:0] Instruction;

	//reg file flags
	input wire RegWrite,Reg2Loc;
	input wire[4:0] Rd,Rm,Rn;

	//ALU flags
	input wire [2:0] ALUOp;
	input wire [11:0] ALUImm12;
	input wire ALUSrc, ALUImm,SetFlags;

	//data mem flags
	input wire MemWrite,MemToReg;

	//branch flags
	input wire UncondBr,BrZero,BrTaken;
	input wire [25:0] BrAddr26;
	input wire [18:0] CondAddr19;

	parameter simDelay = 5;


	// reg [31:0] Instructions [0:7] = '{ //'
	// 32'b10010001000000000000001111100000,// ADDI X0, X31, #0
	// 32'b10010001000000000000010000000001,// ADDI X1, X0, #1
	// 32'b00010100000000000000000000000000,// HALT:B HALT
	// 0,
	// 0,
	// 0,
	// 0,
	// 0};

	initial begin

		//$display("clk\trst\tTime");
		//$monitor("%b\t%b\t%b\t%d",OUT, SEL, IN,$time);
	end
	reg [4:0] index = 5'b00000;


	initial begin
		
/*		
		Instruction[31:0] = 32'b10010001000000000000001111100000;// ADDI X0, X31, #0
		#50
		Instruction[31:0] = 32'b10010001000000000000010000000001;// ADDI X1, X0, #1
		#50
		Instruction[31:0] = 32'b00010100000000000000000000000000;// HALT:B HALT
		#50
*/
		Instruction[31:0] = 32'b10010001000000000000001111100000; //ADDI
		#50
		Instruction[31:0] = 32'b10101011000000000000001111100000; //ADDS
		#50
		Instruction[31:0] = 32'b11101011000000000000001111100000; //SUBS
		#50
		Instruction[31:0] = 32'b11010011011000000000001111100000; //LSL
		#50
		Instruction[31:0] = 32'b11010011010000000000001111100000; //LSR
		#50
		Instruction[31:0] = 32'b10011011000000000000001111100000; //MUL
		#50
		Instruction[31:0] = 32'b00010100000000000000001111100000; //B
		#50
		Instruction[31:0] = 32'b01010100000000000000001111100000; //BLT
		#50
		Instruction[31:0] = 32'b10110100000000000000001111100000; //CBZ
		#50
		Instruction[31:0] = 32'b11111000010000000000001111100000; //LDUR
		#50
		Instruction[31:0] = 32'b11111000000000000000001111100000; //STUR
		#50
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



