`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  ALU.v
 * Project:    Lab_Assignment_1
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.como
 * Rev. No.:   Version 1.0
 * Rev. Date:  9/6/2017
 *
 * Purpose:    wrapper module for the:
 *              - Multiplyer
 *              - Divider
 *              - Mips (other instruction logic)
 *         
 * Notes:      9/6: hasn't been tested, will test later date
 *             9/7: tested with wrong MPY and DIV module
 *             9/7: MPY & DIV has been corrected
 *
 ****************************************************************************/
module ALU(S, T, FS, shamnt, Y_hi, Y_lo, C, V, N, Z);
	
   /*INPUT DECLERATION*/
	input 	[31:0]	S, T;
	input		[ 4:0] 	FS;
   input    [ 4:0]   shamnt;
   
   /*OUTPUT DECLERATION*/
	output	[31:0] 	Y_hi, Y_lo;
	output				N, Z, V, C;
	
   //MULTIPLY WIRE DECLERATION
	wire		[31:0]	Yhi_mul,  Ylo_mul;
	
   //DIVIDE WIRE DECLERATION
	wire		[31:0]	Yhi_div,	 Ylo_div;
	
   //MIPS WIRE DECLERATION
	wire		[31:0]	Ylo_mips, Ylo_shft;
   wire              N_mips, Z_mips, V_mips, C_mips;
   wire              N_shft, Z_shft, V_shft, C_shft;
	
   //REGISTER DECLERATION
	reg		[31:0]	Y_hi, Y_lo;
   reg   				N, Z, V, C;
	
	
   //MULTIPLY MODULE INSTANTIATION
	MPY_32	MPY_32(.S(S), 
                   .T(T), 
                   .Y_hi(Yhi_mul), 
                   .Y_lo(Ylo_mul));
	
   //DIVIDE MODULE INSTANTIATION
	DIV_32	DIV_32(.S(S), 
                   .T(T), 
                   .Y_hi(Yhi_div), 
                   .Y_lo(Ylo_div));
	
   //MIPS MODULE INSTANTIATION
	MIPS_32 	MIPS_32(.S(S), 
                    .T(T), 
                    .Y_lo(Ylo_mips), 
                    .FS(FS),
                    .shamnt(shamnt),
                    .N(N_mips), 
                    .Z(Z_mips), 
                    .C(C_mips), 
                    .V(V_mips));
	
   //3-to-1 MUX 
	always @ (*) begin
      //divide
		if(FS == 5'h1F) 
         begin
            {Y_hi, Y_lo} = {Yhi_div, Ylo_div};
            N				 = S[31]^T[31];
            Z				 = (T == 32'b0) ? 1'bz:
                                          ({Y_hi, Y_lo} == 32'b0);
            C				 = 1'bx;
            V				 = 1'bx;
         end
      //multiply
		else if(FS == 5'h1E) 
         begin
            {Y_hi, Y_lo} = {Yhi_mul, Ylo_mul};
            N				 = Y_hi[31];
            Z				 = (Y_lo == 32'b0);
            C				 = 1'bx;
            V				 = 1'bx;
         end
      //mips
		else
         begin 
            {Y_hi, Y_lo} = {32'b0, Ylo_mips};
            C            = C_mips;
            Z            = Z_mips;
            V            = V_mips;
            N            = N_mips;
         end
	end
	

endmodule
