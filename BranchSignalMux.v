module BranchSignalMux(TakeBranch, negative, overflow, carry_out, zero, UncondBr, brZero, brTaken);
output TakeBranch;
input  negative, overflow, carry_out, zero;
input UncondBr, brZero;
input brTaken;

//BrTaken Logic

wire branchMuxOut;
wire internalBranchTaken;
wire lessThan;
xor lessThanXor(lessThan, negative, overflow);

wire [3:0] branchMuxIn;
assign branchMuxIn[0] = 0;
assign branchMuxIn[1] = 0;
assign branchMuxIn[2] = lessThan;
assign branchMuxIn[3] = zero;

wire [1:0] branchSel;
assign branchSel[0] = brZero;
assign branchSel[1] = brTaken;


mux_4 branchMux(branchMuxOut, branchSel[1:0], branchMuxIn[3:0]);

or branchOr(TakeBranch, UncondBr, branchMuxOut);

endmodule

// brZero	brTaken
// 0			0
// 0			1
// 1			0
// 1			1

// brTaken	brZero	TakeBranch
// 0			0		0
// 0			1		0
// 1			0		1 (LessThan)
// 1			1		1 (Zero)