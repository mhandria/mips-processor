`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  Data_Memory.v
 * Project:    Lab_Assignment_4
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 1.0
 * Rev. Date:  10/07/2017
 *
 * Purpose:    This is the data memory that will has 4K bytes of address.
 *             Keep in mind that each are 8-bits wide. 
 *
 * Notes:      10/5 - made the data memory
 *             10/7 - added a way to "extract" the 12 least significant 
 *                    bit for addressing.
 *
 ****************************************************************************/
module Data_Memory(clk, 
                   dm_cs, dm_wr, dm_rd, mrdy, 
                   Address, D_in, D_out);
   
   /*INPUT DECLERATION*/
   input            clk;
   //control for data memory 
   //dm_cs: enables read/write to data memory
   //dm_wr: allows write 
   //dm_rd: allows read
   input            dm_cs, dm_wr, dm_rd;
   input   [31:0]   Address;
   input   [31:0]   D_in;
   
   
   /*OUTPUT DECLERATION*/
   output  [31:0]   D_out;
   output           mrdy;
   
   //MEMORY:
   // 4K deep 
   // 8-bits wide
   reg     [ 7:0]   MEMORY [0:4095];
   
   wire    [ 3:0]   read_ready;
   
   //this is used to get the 12 lsb of Address
   wire    [11:0]   ADDRESS;
   
   //continously assign allows xilinx to do truncation to fit 12 bits
   assign ADDRESS      = Address;
   
   
   //continous assign for Address. (BIG ENDIAN FORMAT)
   assign {D_out[ 7: 0], read_ready[0]} = (dm_cs & dm_rd) ? {MEMORY[ADDRESS+3], 1'b1} :
                                                            {8'bzzzz_zzzz, 1'b0};
                                           
   assign {D_out[15: 8], read_ready[1]} = (dm_cs & dm_rd) ? {MEMORY[ADDRESS+2], 1'b1} :
                                                            {8'bzzzz_zzzz, 1'b0};
                                           
   assign {D_out[23:16], read_ready[2]} = (dm_cs & dm_rd) ? {MEMORY[ADDRESS+1], 1'b1} :
                                                            {8'bzzzz_zzzz, 1'b0};
                                           
   assign {D_out[31:24], read_ready[3]} = (dm_cs & dm_rd) ? {MEMORY[ADDRESS], 1'b1} :
                                                            {8'bzzzz_zzzz, 1'b0};
   
   assign mrdy = (read_ready == 4'hF);
   //register are written to on positive edge of clk 
   //(BIG ENDIAN FORMAT)
   always @ ( posedge clk )
      if(dm_cs & dm_wr)
      begin
         MEMORY[ADDRESS+3] <= D_in[ 7: 0];
         MEMORY[ADDRESS+2] <= D_in[15: 8];
         MEMORY[ADDRESS+1] <= D_in[23:16];
         MEMORY[ADDRESS]   <= D_in[31:24];
      end
      else
      begin
         MEMORY[Address+3] <= MEMORY[Address+3];
         MEMORY[Address+2] <= MEMORY[Address+2];
         MEMORY[Address+1] <= MEMORY[Address+1];
         MEMORY[Address]   <= MEMORY[Address];
      end
     
   
 
endmodule
