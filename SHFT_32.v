`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  SHFT_32.v
 * Project:    Lab_Assignment_7
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 1.0
 * Rev. Date:  11/19/2017
 *
 * Purpose:    Holds the shift instruction available to the mips
 *             - output will result in a 32-bit data
 *
 * Notes:      11/19: created, but not tested
 *
 ****************************************************************************/
module SHFT_32(T, FS, shamnt, Y_lo, C, N, Z, V);

   input  [31:0] T;
   input  [ 4:0] FS;
   input  [ 4:0] shamnt;
   
   
   output [31:0] Y_lo;
   output        C, Z, N, V;
   
   reg    [31:0] Y_lo;
   reg           C, V;
   
   integer       shamnt_int;
   parameter   SLL	  = 5'h0C,	SRL	  = 5'h0D,	SRA	  = 5'h0E;
   
   
   assign      Z       = (Y_lo == 32'b0);
   assign      N       = (Y_lo[31] == 1'b1);
   
   always @ * begin
      shamnt_int = shamnt;
      case(FS)
         SLL:  {C, Y_lo}	    = T << shamnt_int;
         SRL:  {Y_lo, C}	    = {1'b0, T};
         SRA:  
            begin
               Y_lo[31]        = T[31];
               {Y_lo[30:0], C} = T >> shamnt_int;
            end
      endcase   
   end
   
endmodule
