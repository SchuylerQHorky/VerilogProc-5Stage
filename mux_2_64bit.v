/******************************************************************
 * Date: 1/18/2018
 * File: mux_4.v
 * Uses combinational logic to create a 2 x 1 mux with more bits
 *******************************************************************/
 
 module mux_2_64bit(OUT, SEL, IN0, IN1);

 output  [63:0] OUT;
 input   [63:0] IN0, IN1; 
 input SEL;
 wire [63:0] sign, signBar;

 wire [63:0] aOut;
 wire [63:0] bOut;
 
 assign sign[63:0] = { {63{SEL}}, SEL };
 assign signBar = ~sign;
 assign aOut = IN0 & signBar;
 assign bOut = IN1 & sign;
 assign OUT = aOut | bOut;
 
 endmodule