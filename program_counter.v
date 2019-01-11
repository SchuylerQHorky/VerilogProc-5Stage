/**********************************************************************
Program Counter
Returns the next address to be sent to instruction memory, which is either

**********************************************************************/

`include "carryselectadder64bit.v"
`include "BranchSignalMux.v"
module program_counter(nextAddress, curAddress, condAddr19, brAddr26, UncondBr, brTaken, negative, overflow, carry_out, zero, brZero, TakeBranch);
//output reg [31:0] address;
input [63:0] curAddress;
output [63:0] nextAddress;//reg = 64'h0000000000000001;
input [18:0] condAddr19;
input [25:0] brAddr26;
wire [63:0] branch1, branch2, branchNone;
input UncondBr, brTaken, brZero;
input negative,zero,carry_out,overflow;
output TakeBranch;

//note that temp1 is used as a dummy port to catch unwanted
//outputs
wire temp1, temp2, temp0;
wire signed [61:0]SECondAddr19, SEBrAddr26;
wire signed [63:0] imm4;

assign imm4 = 32'b00000000000000000000000000000100;
assign temp0 = 0; 
assign SECondAddr19 = {{44{condAddr19[18]}}, condAddr19};
assign SEBrAddr26  = {{36{brAddr26[25]}}, brAddr26};
assign branch1[1:0] = 2'b00;

mux2X1 #(62) unconditionalBranch(
.in0(SECondAddr19),
.in1(SEBrAddr26),
.sel(UncondBr),
.out(branch1[63:2]));

wire dummyWire;
carryselectadder64bit adder1(
.a(curAddress),
.b(branch1),
.cin(temp0),
.cout(temp1),
.sum(branch2),
.overflow(dummyWire)); 
	
BranchSignalMux branchMux(TakeBranch, negative, overflow, carry_out, zero, UncondBr, brZero, brTaken);

wire nothing;
carryselectadder64bit adder2(
.a(curAddress),
.b(imm4),
.cin(temp0),
.cout(temp2),
.sum(branchNone),
.overflow(nothing));


mux2X1 #(64) branchTaken(
.in0(branchNone),
.in1(branch2),
.sel(TakeBranch),
.out(nextAddress));

/*
always @ ( posedge clk ) begin
 address <= nextAddress;
 end
*/


endmodule
