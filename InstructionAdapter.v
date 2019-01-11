module InstructionAdapter(Instruction,RegWrite,Reg2Loc,Rd,Rm,Rn,ALUOp,ALUImm12,ALUSrc,ALUImm,SetFlags,MemWrite,MemToReg,UncondBr,BrZero,BrTaken,BrAddr26,CondAddr19);
	input wire [31:0] Instruction;

	//reg file flags
	output RegWrite,Reg2Loc;
	output [4:0] Rd,Rm,Rn;

	assign Rd[4:0] = Instruction[4:0];


	//ALU flags
	output [2:0] ALUOp;
	output [11:0] ALUImm12;
	output ALUSrc, ALUImm, SetFlags;	

	//data mem flags
	output MemWrite,MemToReg;

	//branch flags
	output UncondBr,BrZero,BrTaken;
	output [25:0] BrAddr26;
	output [18:0] CondAddr19;
	assign BrAddr26[25:0] = Instruction[25:0];
	assign CondAddr19[18:0] = Instruction[23:5];


	wire[11:0] SHAMTWires;
	reg[6:0] Zeros = 7'b0000000;
	assign SHAMTWires[5:0] = Instruction[15:10];
	assign SHAMTWires[11:6] = Zeros[6:0];

	wire notShamt;

	genvar i;
	generate for (i=0;i<12;i=i+1) begin : adapterbits1
		wire[1:0] bitSet;
		assign bitSet[0] = SHAMTWires[i];
		assign bitSet[1] = Instruction[10+i];
		mux_2 immMux(ALUImm12[i], notShamt, bitSet[1:0]);
	end 
	endgenerate

	//OpCode values	  
	parameter ADDI	= 11'b1001000100?;
	parameter ADDS	= 11'b10101011000;
	parameter SUBS	= 11'b11101011000;
	parameter LSL	= 11'b11010011011;
	parameter LSR	= 11'b11010011010;
	parameter MUL	= 11'b10011011000;
	parameter B		= 11'b000101?????;
	parameter BLT	= 11'b01010100???;
	parameter CBZ	= 11'b10110100???;
	parameter LDUR	= 11'b11111000010;
	parameter STUR	= 11'b11111000000;

	//op code wires. Only 1 should be HIGH at any given time
	//a wire being HIGH indicates this is the current command
	wire addi, adds, subs, lsl, lsr, mul, b, blt, cbz, ldur, stur;
	assign addi = Instruction[31:22] == ADDI[10:1];
	assign adds = Instruction[31:21] == ADDS[10:0];
	assign subs = Instruction[31:21] == SUBS[10:0];
	assign lsl = Instruction[31:21] == LSL[10:0];
	assign lsr = Instruction[31:21] == LSR[10:0];
	assign mul = Instruction[31:21] == MUL[10:0];
	assign b = Instruction[31:26] == B[10:5];
	assign blt = Instruction[31:24] == BLT[10:3];
	assign cbz = Instruction[31:24] == CBZ[10:3];
	assign ldur = Instruction[31:21] == LDUR[10:0];
	assign stur = Instruction[31:21] == STUR[10:0];

	//assign table for the different flag bits
	assign Reg2Loc =  addi | adds | subs | lsl | lsr | 				mul;
	assign ALUSrc =   addi | 			   			   ldur | stur;
	assign ALUImm =   addi;// |						   ldur | stur;
	assign MemToReg = 								   ldur;
	assign RegWrite = addi | adds | subs | lsl | lsr | ldur       |  mul;
	assign MemWrite = 										  stur;
	assign BrTaken =  													  b | cbz | blt;
	assign UncondBr = 													  b;
	assign BrZero =   														 cbz;
	assign SetFlags = 		 adds | subs;

	assign notShamt = ALUImm | ldur | stur;
//ALU_LSR=0, ALU_MUL=1, ALU_ADD=2, ALU_SUBTRACT=3, ALU_AND=4, ALU_OR=5, ALU_XOR=6, ALU_LSL=7;

	// parameter 
	// ALU_LSR=			3'b000,
	// ALU_MUL=			3'b001,
	// ALU_ADD=			3'b010,
	// ALU_SUBTRACT=	3'b011,
	// ALU_AND=			3'b100,
	// ALU_OR=			3'b101,
	// ALU_XOR=			3'b110,
	// ALU_LSL=			3'b111,

	assign ALUOp[0] = mul | 		subs | lsl;
	assign ALUOp[1] = adds | addi | subs | lsl | cbz | ldur | stur;
	assign ALUOp[2] = 					   lsl;


	reg [4:0] R31Bits = 5'b11111;

	mux2X1 #(5) ms0(
	.in0(Instruction[9:5]),
	.in1(R31Bits),
	.sel(cbz),//SELECT ON ALL CB-TYPE OP CODES
	.out(Rn));

	//assign Rn[4:0] = Instruction[9:5];
	assign Rm[4:0] = Instruction[20:16];

endmodule
