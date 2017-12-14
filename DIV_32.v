`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  DIV_32.v
 * Project:    Lab_Assignment_1
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 1.5
 * Rev. Date:  9/7/2017
 *
 * Purpose:    used to divide 2 32-bit integer labled S & T
 *             result will be:
 *             - Quotient  -> 32-LEAST significant bit
 *             - Remainder -> 32-MOST significant bit
 *         
 * Notes:      9/6: not tested yet but implemented, test later
 *             9/7: tested with wrong values
 *             9/7: must cast to int first then divide
 *
 ****************************************************************************/
module DIV_32(S, T, Y_hi, Y_lo);
	
   /*INPUT DECLERATION*/
	input		[31:0]	S, T;
   
   /*OUTPUT DECLERATION*/
	output 	[31:0]	Y_hi, Y_lo;
	
	//INTEGER DECLERATION
	integer	S_int, T_int;
	
   //have the low be the quotient
	assign	Y_lo = S_int/T_int;
   
   //have the hi be the remainder
	assign	Y_hi = S_int%T_int;
	
   
   //when S or T changes 
   //cast both S and T to integers
	always @ (S, T) begin
		S_int = S;
		T_int = T;
	end

endmodule
