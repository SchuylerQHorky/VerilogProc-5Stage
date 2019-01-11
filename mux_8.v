 
 module mux_8(OUT, SEL, IN);

	output  OUT;
	input  [7:0] IN;
	input [2:0] SEL;

	wire [3:0] outStage1;
	wire [1:0] outStage2;

	mux_2 mux0(outStage1[0], SEL[0], IN[1:0]);
	mux_2 mux1(outStage1[1], SEL[0], IN[3:2]);
	mux_2 mux2(outStage1[2], SEL[0], IN[5:4]);
	mux_2 mux3(outStage1[3], SEL[0], IN[7:6]);

	mux_2 mux4(outStage2[0], SEL[1], outStage1[1:0]);
	mux_2 mux5(outStage2[1], SEL[1], outStage1[3:2]);
	
	mux_2 mux7(OUT, SEL[2], outStage2[1:0]);

	//mux_2 muxStage1 [3:0] (outStage1, SEL[0], IN);
	//mux_2 muxStage2 [1:0] (outStage2, SEL[1], outStage1);
	//mux_2 muxStage3		  (OUT, 	  SEL[3], outStage2);

 endmodule