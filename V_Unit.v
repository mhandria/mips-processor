`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  V_Unit.v
 * Project:    final project
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 1.0
 * Rev. Date:  11/27/2017
 *
 * Purpose:    This is a vector unit that will allow SIMD processing
 *             the number of bits processed will be 64 total.  
 *
 * Notes:      11/27 - made the vector unit. 
 *             11/27 - tested the vector unit. 
 *
 ****************************************************************************/
module V_Unit(clk, reset, 
              //V regfile
              D_En, FS,
              GPR_DATA, from_GPR,
              S_Addrs, D_Addrs, T_Addrs, C_Addrs,
              //V ALU
              Y_out, Y_sel);
   
   //GLOABAL INPUTS clk and reset
   input         clk, reset;
   
   //THIS SINGAL ALLOWS:
   // from_GPR - reading from general purpose register
   // D_En     - writting to Vector Purpose Register
   input         from_GPR, D_En;
   
   //Y_sel is used to read either the lower half of 
   //the 64-bit word or the upper half.
   // Y_sel = 0 -> read lower half
   // Y_sel = 1 -> read upper half
   input         Y_sel;
   
   //FUNCTION STATE. 
   //determines what vector instruction to 
   //do next
   input  [ 4:0] FS;
   
   //this is the GENERAL PURPOSE REGISTER's DATA 
   //that will be written to the VECTOR PURPOSE REGISTER
   input  [63:0] GPR_DATA;
   
   //vector address, unlike the GPR, the vector regfile
   //allows one more data to come out, the C data.
   input  [ 4:0] S_Addrs, D_Addrs, T_Addrs, C_Addrs;
   
   
   //output of the vector unit.
   //allows vector data to be written to the GPR.
   output [31:0] Y_out;
  
   //internal wires
   wire   [63:0] Y, S, T, C;
   //internal reg (used for some pipelining)
   reg    [63:0] S_reg, T_reg, C_reg, Y_reg;
   
   //select Y hi or Y lo
   assign        Y_out = (Y_sel) ? Y_reg[63:32]: Y_reg[31:0];
   
   //Vector RegisterFile INSTANTIATION
   Vregfile64  Vregfile( 
        .clk(clk), 
        .reset(reset), 
        .D(Y_reg), 
        .D_En(D_En), 
        .D_Addr(D_Addrs), 
        .S(S), 
        .S_Addr(S_Addrs), 
        .C_Addr(C_Addrs), 
        .T(T), 
        .C(C), 
        .T_Addr(T_Addrs), 
        .from_GPR(from_GPR), 
        .GPR_DATA(GPR_DATA));
  
  //Vector ALU INSTANTIATION
  V_ALU  ALU(
        .S(S_reg), 
        .T(T_reg), 
        .C(C_reg), 
        .FS(FS), 
        .Y(Y));
  
  //update the register on posedge clk
  always @ (posedge clk) 
      begin
         S_reg <= S;
         T_reg <= T;
         C_reg <= C;
         Y_reg <= Y;
      end
  
endmodule
