module carryselectadder64bit(a, b, cin, sum, cout, overflow);
input [63:0] a,b;
input cin;
output [63:0] sum;
output cout, overflow;
 
wire [14:0] c;

ripplecarry4bit rca1(
.a(a[3:0]),
.b(b[3:0]),
.cin(cin),
.sum(sum[3:0]),
.cout(c[0]));
 
// first 4-bit by ripple_carry_adder
carryselect4bit cs1(
.a(a[7:4]),
.b(b[7:4]),
.cin(c[0]),
.sum(sum[7:4]),
.cout(c[1]));
 
carryselect4bit cs2(
.a(a[11:8]),
.b(b[11:8]),
.cin(c[1]),
.sum(sum[11:8]), 
.cout(c[2]));
 
carryselect4bit cs3(
.a(a[15:12]),
.b(b[15:12]),
.cin(c[2]),
.sum(sum[15:12]),
.cout(c[3])); 

carryselect4bit cs4(
.a(a[19:16]),
.b(b[19:16]),
.cin(c[3]),
.sum(sum[19:16]), 
.cout(c[4]));

carryselect4bit cs5(
.a(a[23:20]),
.b(b[23:20]),
.cin(c[4]),
.sum(sum[23:20]), 
.cout(c[5]));

carryselect4bit cs6(
.a(a[27:24]),
.b(b[27:24]),
.cin(c[5]),
.sum(sum[27:24]), 
.cout(c[6]));

carryselect4bit cs7(
.a(a[31:28]),
.b(b[31:28]),
.cin(c[6]),
.sum(sum[31:28]), 
.cout(c[7]));

carryselect4bit cs8(
.a(a[35:32]),
.b(b[35:32]),
.cin(c[7]),
.sum(sum[35:32]), 
.cout(c[8]));

carryselect4bit cs9(
.a(a[39:36]),
.b(b[39:36]),
.cin(c[8]),
.sum(sum[39:36]), 
.cout(c[9]));

carryselect4bit cs10(
.a(a[43:40]),
.b(b[43:40]),
.cin(c[9]),
.sum(sum[43:40]), 
.cout(c[10]));

carryselect4bit cs11(
.a(a[47:44]),
.b(b[47:44]),
.cin(c[10]),
.sum(sum[47:44]), 
.cout(c[11]));

carryselect4bit cs12(
.a(a[51:48]),
.b(b[51:48]),
.cin(c[11]),
.sum(sum[51:48]), 
.cout(c[12]));

carryselect4bit cs13(
.a(a[55:52]),
.b(b[55:52]),
.cin(c[12]),
.sum(sum[55:52]), 
.cout(c[13]));

carryselect4bit cs14(
.a(a[59:56]),
.b(b[59:56]),
.cin(c[13]),
.sum(sum[59:56]), 
.cout(c[14]));

carryselect4bitFinal cs15(
.a(a[63:60]),
.b(b[63:60]),
.cin(c[14]),
.sum(sum[63:60]), 
.cout(cout),
.overflow(overflow));
endmodule
 
//////////////////////////////////////
//4-bit Carry Select Adder Slice
//////////////////////////////////////
 
module carryselect4bit(a, b, cin, sum, cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;
 
wire [3:0] s0,s1;
wire c0,c1;
 
ripplecarry4bit rca1(
.a(a[3:0]),
.b(b[3:0]),
.cin(1'b0),
.sum(s0[3:0]),
.cout(c0));
 
ripplecarry4bit rca2(
.a(a[3:0]),
.b(b[3:0]),
.cin(1'b1),
.sum(s1[3:0]),
.cout(c1));
 
mux2X1 #(4) ms0(
.in0(s0[3:0]),
.in1(s1[3:0]),
.sel(cin),
.out(sum[3:0]));
 
mux2X1 #(1) mc0(
.in0(c0),
.in1(c1),
.sel(cin),
.out(cout));
endmodule

//////////////////////////////////////
//4-bit Carry Select Adder Slice (final)
//////////////////////////////////////
 
module carryselect4bitFinal(a, b, cin, sum, cout, overflow);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout, overflow;
wire test1a, test1b, test2a, test2b, test3a, test3b;
 
wire [3:0] s0,s1;
wire c0,c1,overflow0,overflow1;

 
ripplecarry4bitFinal rca1(
.a(a[3:0]),
.b(b[3:0]),
.cin(1'b0),
.sum(s0[3:0]),
.cout(c0),
.overflow(overflow0));
 
ripplecarry4bitFinal rca2(
.a(a[3:0]),
.b(b[3:0]),
.cin(1'b1),
.sum(s1[3:0]),
.cout(c1),
.overflow(overflow1));

mux2X1 #(4) ms0(
.in0(s0[3:0]),
.in1(s1[3:0]),
.sel(cin),
.out(sum[3:0]));
 
mux2X1 #(1) mc0(
.in0(c0),
.in1(c1),
.sel(cin),
.out(cout));

mux2X1 #(1) mo0(
.in0(overflow0),
.in1(overflow1),
.sel(cin),
.out(overflow));
endmodule
 

/////////////////////////////////
//4-bit Ripple Carry Adder
/////////////////////////////////
module ripplecarry4bit(a, b, cin, sum, cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;

 
wire c1,c2,c3;
 
full_adder fa0(
.a(a[0]),
.b(b[0]),
.cin(cin),
.sum(sum[0]),
.cout(c1));
 
full_adder fa1(
.a(a[1]),
.b(b[1]),
.cin(c1),
.sum(sum[1]),
.cout(c2));
 
full_adder fa2(
.a(a[2]),
.b(b[2]),
.cin(c2),
.sum(sum[2]),
.cout(c3));
 
full_adder fa3(
.a(a[3]),
.b(b[3]),
.cin(c3),
.sum(sum[3]),
.cout(cout));
endmodule

/////////////////////////////////
//4-bit Ripple Carry Adder (final)
/////////////////////////////////
module ripplecarry4bitFinal(a, b, cin, sum, cout, overflow);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;
wire outTemp;
assign cout = outTemp;
output overflow;
wire c1,c2,c3;
assign overflow = c3 ^ outTemp;

 
full_adder fa0(
.a(a[0]),
.b(b[0]),
.cin(cin),
.sum(sum[0]),
.cout(c1));
 
full_adder fa1(
.a(a[1]),
.b(b[1]),
.cin(c1),
.sum(sum[1]),
.cout(c2));
 
full_adder fa2(
.a(a[2]),
.b(b[2]),
.cin(c2),
.sum(sum[2]),
.cout(c3));
 
full_adder fa3(
.a(a[3]),
.b(b[3]),
.cin(c3),
.sum(sum[3]),
.cout(outTemp));
endmodule
 
/////////////////////
//1bit Full Adder
/////////////////////
 
module full_adder(a,b,cin,sum, cout);
input a,b,cin;
output sum, cout;
 
wire x,y,z;
 
half_adder h1(.a(a), .b(b), .sum(x), .cout(y));
half_adder h2(.a(x), .b(cin), .sum(sum), .cout(z));
or or_1(cout,z,y);
endmodule
 
//////////////////////
// 1 bit Half Adder
//////////////////////
 
module half_adder( a,b, sum, cout );
input a,b;
output sum, cout;
xor xor_1 (sum,a,b);
and and_1 (cout,a,b);
endmodule