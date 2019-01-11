/******************************************************************
 * Date: 1/18/2018
 * File: mux_4.v
 * Uses combinational logic to create a 2 x 1 mux with more bits
 *******************************************************************/
 
 module mux_2(OUT, SEL, IN);

 output  OUT;
 input  [1:0] IN;
 input SEL;

 wire aOut;
 wire bOut;
 wire SELBar;
 not selInv(SELBar, SEL);
 and a(aOut, IN[0], SELBar);
 and b(bOut, IN[1], SEL);
 or outOr(OUT, aOut, bOut);
 
 endmodule