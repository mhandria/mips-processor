`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:33:14 11/25/2017 
// Design Name: 
// Module Name:    SIMD_REG32 
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
`
module SIMD_REG32(clk, reset,
                  DSIMD_EN,
                  DATA,
                  S_ADDR, T_ADDR, D_ADDR,
                  S_OUT,  T_OUT);
   
   input          clk, reset;
   input [255:0]  DATA;
   input [31:0]   S_ADDR, T_ADDR, D_ADDR;
   
   output [255:0] S_OUT, T_OUT;
   
   reg    [31:0]  REG [0:15];
   
   assign         S_OUT = {REG[S_ADDR[ 3: 0]], 
                           REG[S_ADDR[ 7: 4]],
                           REG[S_ADDR[11: 8]], 
                           REG[S_ADDR[15:12]],
                           REG[S_ADDR[19:16]], 
                           REG[S_ADDR[23:20]],
                           REG[S_ADDR[27:24]], 
                           REG[S_ADDR[31:28]]};
                           
   assign         T_OUT = {REG[T_ADDR[ 3: 0]], 
                           REG[T_ADDR[ 7: 4]],
                           REG[T_ADDR[11: 8]], 
                           REG[T_ADDR[15:12]],
                           REG[T_ADDR[19:16]], 
                           REG[T_ADDR[23:20]],
                           REG[T_ADDR[27:24]], 
                           REG[T_ADDR[31:28]]};
   
   always @ (posedge clk, posedge reset)
      if(reset)
         REG[0] <= 32'b0;
      else if(DSIMD_EN)
         begin
            REG[D_ADDR[ 3: 0]] <= (D_ADDR == 0) ? 32'b0 : DATA[ 31:  0];
            REG[D_ADDR[ 7: 4]] <= (D_ADDR == 0) ? 32'b0 : DATA[ 63: 32];
            REG[D_ADDR[11: 8]] <= (D_ADDR == 0) ? 32'b0 : DATA[ 95: 64];
            REG[D_ADDR[15:12]] <= (D_ADDR == 0) ? 32'b0 : DATA[127: 96];
            REG[D_ADDR[19:16]] <= (D_ADDR == 0) ? 32'b0 : DATA[159:128];
            REG[D_ADDR[23:20]] <= (D_ADDR == 0) ? 32'b0 : DATA[191:160];
            REG[D_ADDR[27:24]] <= (D_ADDR == 0) ? 32'b0 : DATA[223:192];
            REG[D_ADDR[31:28]] <= (D_ADDR == 0) ? 32'b0 : DATA[255:224];
         end
      else
         begin
            REG[D_ADDR[ 3: 0]] <= REG[D_ADDR[ 3: 0]];
            REG[D_ADDR[ 7: 4]] <= REG[D_ADDR[ 7: 4]];
            REG[D_ADDR[11: 8]] <= REG[D_ADDR[11: 8]];
            REG[D_ADDR[15:12]] <= REG[D_ADDR[15:12]];
            REG[D_ADDR[19:16]] <= REG[D_ADDR[19:16]];
            REG[D_ADDR[23:20]] <= REG[D_ADDR[23:20]];
            REG[D_ADDR[27:24]] <= REG[D_ADDR[27:24]];
            REG[D_ADDR[31:28]] <= REG[D_ADDR[31:28]];
         end
endmodule
