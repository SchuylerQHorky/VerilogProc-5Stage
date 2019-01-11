 
`include "mux_2_64bit.v"

 module mux_8_64bit(OUT, SEL, IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7);

	output  [63:0] OUT;
	input   [63:0] IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7;
	input [2:0] SEL;

	wire [63:0] outStage1 [0:3];
	wire [63:0] outStage2 [0:1];

	mux_2_64bit mux0(outStage1[0], SEL[0], IN0, IN1);
	mux_2_64bit mux1(outStage1[1], SEL[0], IN2, IN3);
	mux_2_64bit mux2(outStage1[2], SEL[0], IN4, IN5);
	mux_2_64bit mux3(outStage1[3], SEL[0], IN6, IN7);

	mux_2_64bit mux4(outStage2[0], SEL[1], outStage1[0], outStage1[1]);
	mux_2_64bit mux5(outStage2[1], SEL[1], outStage1[2], outStage1[3]);
	
	mux_2_64bit mux7(OUT, SEL[2], outStage2[0], outStage2[1]);
	

 endmodule