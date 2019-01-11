/******************************************************************
 * Date: 1/18/2018
 * File: register.v
 * 
 *******************************************************************/
 
module register (REGISTER, EN, CLK, WRITE);
	output [63:0] REGISTER;
	input EN, CLK;
	input [63:0] WRITE;
	wire [63:0] ENABLED;
	
	//generates, how do they work?
	genvar i;
		generate for (i = 0; i < 64; i = i + 1) begin : reg_bits_gen
    	  	//$display ("Current value of i is %",i);
			//bufifs are tristates
			bufif1(ENABLED[i], WRITE[i], EN);
			bufif0(ENABLED[i], REGISTER[i], EN);
			DFlipFlop reg_bit (REGISTER[i], CLK, ENABLED[i]);
		end endgenerate

endmodule

// A simple DFF module
module DFlipFlop (OUT , CLK, IN);
	output reg OUT=0;
	input IN;
	input CLK;

	always @(posedge CLK) begin
		OUT <= IN;
	end
endmodule