`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  regfile32.v
 * Project:    Lab_Assignment_2
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 1.0
 * Rev. Date:  9/14/2017
 * 
 * Purpose:    Register File 32-bit
 *         
 * Notes:      9/14: made but not tested
 *             9/14: tested but something wrong with writing to register
 *             9/14: tested reset was the problem in test bench
 * 
 ****************************************************************************/
 module regfile32(clk, reset, D, D_En, D_Addr, S, S_Addr, T, T_Addr);
   /*INPUTS DECLERATION*/
   //single signal decleration
   //CLK & RST is global
   //D_En is specific to this module for now
   input               clk, reset, D_En;
   //addresses decleration for input
   input    [   4:0]   D_Addr, S_Addr, T_Addr;
   
   //Data comming into the module.
   input    [  31:0]   D;
   
   /*OUTPUTS DECLERATIONS*/
   //Data going out of module.
   output   [  31:0]   S, T;
   
   //32 registers that is 32 bits wide (1 word)
   reg      [  31:0]   REG [0:31];
     
   //continously assign S and T so that it gets those
   //registers
   assign              S = REG[S_Addr];
   assign              T = REG[T_Addr];
   
   //always block with clk and reset
   always @ (posedge clk, posedge reset)
      //when reset happens then ONLY change REG[0] to 0's
      if(reset) 
         begin
            REG[0]  <= 32'b0;
            REG[29] <= 32'h3FC;
         end
      //when D_EN is up and clk is positive then change REG
      //if and only if it isn't register 0
      else if(D_En == 1'b1 && D_Addr != 5'b00000)
         REG[D_Addr] <= D;
      else
         REG[D_Addr] <= REG[D_Addr];
         
endmodule
