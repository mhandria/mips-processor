`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  MPY_32.v
 * Project:    Lab_Assignment_1
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 1.5
 * Rev. Date:  9/7/2017
 * 
 * Purpose:    used to multiply 2 32-bit integer named S & T.
 *             results to a 64-bit product from the 2 32-bit
 *         
 * Notes:      9/6: hasn't been tested will test later
 *             9/7: tested with wrong values
 *             9/7: must cast to int first then divide
 *
 ****************************************************************************/
module MPY_32(S, T, Y_hi, Y_lo);

   /*INPUT DECLERATION*/
	input		[31:0] 	S, T;
   
   /*OUTPUT DECLERATION*/
	output	[31:0] 	Y_hi, Y_lo;
	
	//INTEGER DECLERATION
	integer				S_int, T_int;
	
   //constantly assign the hi and the lo 
   //with (int)S * (int)T
	assign 	{Y_hi, Y_lo} = S_int * T_int;
	
   //when S or T change assign
   //cast both S and T to integers
	always @ (S, T) begin
		S_int = S;
		T_int = T;
	end
	
	
	
endmodule
