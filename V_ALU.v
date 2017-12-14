`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  V_ALU.v
 * Project:    final project
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 1.0
 * Rev. Date:  11/27/2017
 * 
 * Purpose:    Vector ALU that will perform Single Instruction Multiple
 *             Data processing.  
 *         
 * Notes:      11/27: made but not tested
 *             11/27: tested and everything works fine
 * 
 ****************************************************************************/
module V_ALU(S, T, C, FS, Y);
   
   //INPUT VALUES
   input  [63:0] S, T, C;
   //FUNCTION STATE (determines what to perform)
   input  [ 4:0] FS;
   
   //OUTPUT VALUE
   output [63:0] Y;
   
   //reg decleration
   reg    [63:0] Y;
   reg    [ 7:0] wrap;
   
   //DIFFERENT CASES THE FUNCTION STATE CAN PERFORM
   parameter 
   ADDUS  = 5'h00,    MULADD  = 5'h01,   MULEI  = 5'h02,
   MULOI  = 5'h03,    MRGLO   = 5'h06,   MRGHI  = 5'h07,   
   VPACK  = 5'h08,
   VCMPE  = 5'h09,    VCLTU   = 5'h0A,   PASS_S = 5'h0B;
   
   
   //this allows a casting of wire input
   //to integer.
   //since an integer is only 32-bits wide
   //but the input is 64, there needs to be
   //two integer one for low and another for
   //hi for each input.
   integer S_hi, T_hi, C_hi;
   integer S_lo, T_lo, C_lo;
   
   always @ (*) begin
   
      //CAST INPUT incase we need it
      S_hi = S[63:32];
      S_lo = S[31: 0];
      T_hi = T[63:32];
      T_lo = T[31: 0];
      C_hi = C[63:32];
      C_lo = C[31: 0];
      wrap = 0;
      
      //CASE STATEMENT 
      case(FS)
         ADDUS: //ADD UNSIGNED SATURATED
         begin
            {wrap[0], Y[ 7: 0]} = S[ 7: 0] + T[ 7: 0];
            {wrap[1], Y[15: 8]} = S[15: 8] + T[15: 8];
            {wrap[2], Y[23:16]} = S[23:16] + T[23:16];
            {wrap[3], Y[31:24]} = S[31:24] + T[31:24];
            {wrap[4], Y[39:32]} = S[39:32] + T[39:32];
            {wrap[5], Y[47:40]} = S[47:40] + T[47:40];
            {wrap[6], Y[55:48]} = S[55:48] + T[55:48];
            {wrap[7], Y[63:56]} = S[63:56] + T[63:56];
         end
         MULADD: //MULTIPLY AND ADD
         begin
            Y[ 7: 0] = (S_lo[ 7: 0] * T_lo[ 7: 0])+C_lo[ 7: 0];
            Y[15: 8] = (S_lo[15: 8] * T_lo[15: 8])+C_lo[15: 8];
            Y[23:16] = (S_lo[23:16] * T_lo[23:16])+C_lo[23:16];
            Y[31:24] = (S_lo[31:24] * T_lo[31:24])+C_lo[31:24];
            Y[39:32] = (S_hi[ 7: 0] * T_hi[ 7: 0])+C_hi[ 7: 0];
            Y[47:40] = (S_hi[15: 8] * T_hi[15: 8])+C_hi[15: 8];
            Y[55:48] = (S_hi[23:16] * T_hi[23:16])+C_hi[23:16];
            Y[63:56] = (S_hi[31:24] * T_hi[31:24])+C_hi[31:24];
         end
         MULOI:   //MULTIPLY ODD INTEGERS.
         begin
            Y[15: 0] = S_lo[15: 8]*T_lo[15: 8];
            Y[31:16] = S_lo[31:24]*T_lo[31:24];
            Y[47:32] = S_hi[15: 8]*T_hi[15: 8];
            Y[63:48] = S_hi[31:24]*T_hi[31:24];
         end
         MULEI:   //MULTIPLY EVEN INTEGERS
         begin
            Y[15: 0] = S_lo[ 7: 0]*T_lo[ 7: 0];
            Y[31:16] = S_lo[23:16]*T_lo[23:16];
            Y[47:32] = S_hi[ 7: 0]*T_hi[ 7: 0];
            Y[63:48] = S_hi[23:16]*T_hi[23:16];
         end
         MRGLO:   //MERGE LOW VALUES
         begin
            Y[ 7: 0] = S[ 7: 0];
            Y[15: 8] = T[ 7: 0];
            Y[23:16] = S[15: 8];
            Y[31:24] = T[15: 8];
            Y[39:32] = S[23:16];
            Y[47:40] = T[23:16];
            Y[55:48] = S[31:24];
            Y[63:56] = T[31:24];
         end
         MRGHI:   //MERGE HIGH VALUES
         begin
            Y[ 7: 0] = S[39:32];
            Y[15: 8] = T[39:32];
            Y[23:16] = S[47:40];
            Y[31:24] = T[47:40];
            Y[39:32] = S[55:48];
            Y[47:40] = T[55:48];
            Y[55:48] = S[64:56];
            Y[63:56] = T[63:56];
         end
         VCMPE:   //VECTOR COMPARE IF EQUAL
         begin
            Y[ 7: 0] = (S[ 7: 0]==T[ 7: 0]) ? {8{1'b1}}: 8'b0;
            Y[15: 8] = (S[15: 8]==T[15: 8]) ? {8{1'b1}}: 8'b0;
            Y[23:16] = (S[23:16]==T[23:16]) ? {8{1'b1}}: 8'b0;
            Y[31:24] = (S[31:24]==T[31:24]) ? {8{1'b1}}: 8'b0;
            Y[39:32] = (S[39:32]==T[39:32]) ? {8{1'b1}}: 8'b0;
            Y[47:40] = (S[47:40]==T[47:40]) ? {8{1'b1}}: 8'b0;
            Y[55:48] = (S[55:48]==T[55:48]) ? {8{1'b1}}: 8'b0;
            Y[63:56] = (S[63:56]==T[63:56]) ? {8{1'b1}}: 8'b0;
         end
         VCLTU:   //VECTOR COMPARE IF LESS THAN
         begin
            Y[ 7: 0] = (S[ 7: 0]<T[ 7: 0]) ? {8{1'b1}}: 8'b0;
            Y[15: 8] = (S[15: 8]<T[15: 8]) ? {8{1'b1}}: 8'b0;
            Y[23:16] = (S[23:16]<T[23:16]) ? {8{1'b1}}: 8'b0;
            Y[31:24] = (S[31:24]<T[31:24]) ? {8{1'b1}}: 8'b0;
            Y[39:32] = (S[39:32]<T[39:32]) ? {8{1'b1}}: 8'b0;
            Y[47:40] = (S[47:40]<T[47:40]) ? {8{1'b1}}: 8'b0;
            Y[55:48] = (S[55:48]<T[55:48]) ? {8{1'b1}}: 8'b0;
            Y[63:56] = (S[63:56]<T[63:56]) ? {8{1'b1}}: 8'b0;
         end
         PASS_S:  Y = S;   //PASS S VALUE TO Y (used for MVVEC)
         default: Y = S;
         
     endcase
     Y[ 7: 0] = (wrap[0]) ? 8'hFF: Y[ 7: 0];
     Y[15: 8] = (wrap[1]) ? 8'hFF: Y[15: 8];
     Y[23:16] = (wrap[2]) ? 8'hFF: Y[23:16];
     Y[31:24] = (wrap[3]) ? 8'hFF: Y[31:24];
     Y[39:32] = (wrap[4]) ? 8'hFF: Y[39:32];
     Y[47:40] = (wrap[5]) ? 8'hFF: Y[47:40];
     Y[55:48] = (wrap[6]) ? 8'hFF: Y[55:48];
     Y[63:58] = (wrap[7]) ? 8'hFF: Y[63:58];
   end
endmodule
