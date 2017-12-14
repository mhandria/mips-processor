`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:00:01 11/26/2017 
// Design Name: 
// Module Name:    SIMD_ID 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SIMD_ID(clk, reset, 
               ADDRS, FS, DSIMD_EN,
               s_ld, t_ld, d_ld, SIMD_SEL,
               lo_ld, hi_ld,
               SIMD_OUT);
   
   input          clk, reset;
   input  [31:0]  ADDRS;
   input          DSIMD_EN;
   input          s_ld, t_ld, d_ld;
   input  [ 3:0]  SIMD_SEL;
   
   output [31:0]  SIMD_OUT;
   
   
   wire  [255:0] Y_lo, Y_hi;
   
   reg   [  7:0] C, N, Z, V;
   reg   [255:0] LO_REG, HI_REG;
   
   
   
   SIMD_DATAREG datareg( .clk(clk), 
                         .reset(reset), 
                         .s_ld(s_ld), 
                         .t_ld(t_ld), 
                         .d_ld(d_ld), 
                         .ADDRS(ADDRS), 
                         .FS(FS),
                         .S_ADDRS(S_ADDRS), 
                         .T_ADDRS(T_ADDRS), 
                         .D_ADDRS(D_ADDRS));
                        
   SIMD_REG32   regfile( .clk(clk), 
                         .reset(reset),
                         .DSIMD_EN(DSIMD_EN),
                         .DATA(DATA),
                         .S_ADDR(S_ADDRS), 
                         .T_ADDR(T_ADDRS), 
                         .D_ADDR(D_ADDRS),
                         .S_OUT(S),  
                         .T_OUT(T));
   
   ALU          ALU_0(   .S(S[31:0]), 
                         .T(T[31:0]), 
                         .FS(FS), 
                         .shamnt(T[3:0]), 
                         .Y_hi(Y_hi[31:0]), 
                         .Y_lo(Y_lo[31:0]), 
                         .C(C[0]), 
                         .V(V[0]), 
                         .N(N[0]), 
                         .Z(Z[0]));
  
   ALU          ALU_1(   .S(S[63:32]), 
                         .T(T[63:32]), 
                         .FS(FS), 
                         .shamnt(T[7:4]), 
                         .Y_hi(Y_hi[63:32]), 
                         .Y_lo(Y_lo[63:32]), 
                         .C(C[1]), 
                         .V(V[1]), 
                         .N(N[1]), 
                         .Z(Z[1]));
   
   ALU          ALU_2(   .S(S[95:64]), 
                         .T(T[95:64]), 
                         .FS(FS), 
                         .shamnt(T[11:8]), 
                         .Y_hi(Y_hi[95:64]), 
                         .Y_lo(Y_lo[95:64]), 
                         .C(C[2]), 
                         .V(V[2]), 
                         .N(N[2]), 
                         .Z(Z[2]));
  
   ALU          ALU_3(   .S(S[127:96]), 
                         .T(T[127:96]), 
                         .FS(FS), 
                         .shamnt(T[15:12]), 
                         .Y_hi(Y_hi[127:96]), 
                         .Y_lo(Y_lo[127:96]), 
                         .C(C[3]), 
                         .V(V[3]), 
                         .N(N[3]), 
                         .Z(Z[3]));
   
   ALU          ALU_4(   .S(S[159:128]), 
                         .T(T[159:128]), 
                         .FS(FS), 
                         .shamnt(T[19:16]), 
                         .Y_hi(Y_hi[159:128]), 
                         .Y_lo(Y_lo[159:128]), 
                         .C(C[4]), 
                         .V(V[4]), 
                         .N(N[4]), 
                         .Z(Z[4]));
  
   ALU          ALU_5(   .S(S[191:160]), 
                         .T(T[191:160]), 
                         .FS(FS), 
                         .shamnt(T[23:20]), 
                         .Y_hi(Y_hi[191:160]), 
                         .Y_lo(Y_lo[191:160]), 
                         .C(C[5]), 
                         .V(V[5]), 
                         .N(N[5]), 
                         .Z(Z[5]));
   
   ALU          ALU_6(   .S(S[223:192]), 
                         .T(T[223:192]), 
                         .FS(FS), 
                         .shamnt(T[27:24]), 
                         .Y_hi(Y_hi[223:192]), 
                         .Y_lo(Y_lo[223:192]), 
                         .C(C[6]), 
                         .V(V[6]), 
                         .N(N[6]), 
                         .Z(Z[6]));
  
   ALU          ALU_7(   .S(S[255:224]), 
                         .T(T[255:224]), 
                         .FS(FS), 
                         .shamnt(T[31:28]), 
                         .Y_hi(Y_hi[255:224]), 
                         .Y_lo(Y_lo[255:224]), 
                         .C(C[7]), 
                         .V(V[7]), 
                         .N(N[7]), 
                         .Z(Z[7]));
                         
                              
   assign       SIMD_OUT = //LO REG SELECT
                           (SIMD_SEL == 4'b0000) ? LO_REG[ 31:  0]:
                           (SIMD_SEL == 4'b0001) ? LO_REG[ 63: 32]:
                           (SIMD_SEL == 4'b0010) ? LO_REG[ 95: 64]:
                           (SIMD_SEL == 4'b0011) ? LO_REG[127: 96]:
                           (SIMD_SEL == 4'b0100) ? LO_REG[159:128]:
                           (SIMD_SEL == 4'b0101) ? LO_REG[191:160]:
                           (SIMD_SEL == 4'b0110) ? LO_REG[223:192]:
                           (SIMD_SEL == 4'b0111) ? LO_REG[255:224]:
                           //HI REG SELECT
                           (SIMD_SEL == 4'b1000) ? HI_REG[ 31:  0]:
                           (SIMD_SEL == 4'b1001) ? HI_REG[ 63: 32]:
                           (SIMD_SEL == 4'b1010) ? HI_REG[ 95: 64]:
                           (SIMD_SEL == 4'b1011) ? HI_REG[127: 96]:
                           (SIMD_SEL == 4'b1100) ? HI_REG[159:128]:
                           (SIMD_SEL == 4'b1101) ? HI_REG[191:160]:
                           (SIMD_SEL == 4'b1110) ? HI_REG[223:192]:
                           (SIMD_SEL == 4'b1111) ? HI_REG[255:224]:
                                                   LO_REG[ 31:  0];
      
   
   always @(posedge clk)
      begin
         LO_REG <= (lo_ld) ? Y_lo: LO_REG;
         HI_REG <= (hi_ld) ? Y_hi: HI_REG;
      end
      
      
endmodule
