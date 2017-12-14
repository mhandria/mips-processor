`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  EXTERNAL_IO.v
 * Project:    SENIOR PROJECT
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 2.0
 * Rev. Date:  11/23/2017
 *
 * Purpose:    This module's purpose is to simulate an external IO 
 *             device that will be used to INPUT, & OUTPUT data to the
 *             MIPS Processor.
 *             
 *
 * Notes:      11/23 - module made
 *             11/24 - mdoule tested against the instruction.dat file
 *
 ****************************************************************************/
module EXTERNAL_IO( sys_clk, reset,
                    address, in, out, 
                    intr, intr_ack, rdy,
                    cs, rd, wr);
   
   //global variable of clock and reset
   input         sys_clk, reset;
   
   //control enables for 
   // cs - allows data manipulation of IO
   // rd - allows data to be read from IO
   // wr - allows data to be written to IO
   input         cs, rd, wr;
   
   //address of the IO to access data
   input  [31:0] address;
   
   //incoming DATA 
   input  [31:0] in;
   
   //interrupt acknowledge signal
   input         intr_ack;
   
   
   //this signal will be used to determine 
   //if the IO is ready or not
   output        rdy;
   
   //this is the output DATA from the IO
   output [31:0] out;
   //interrupt signal that is sent to CU
   output        intr;
   
   //the memory of the IO
   reg    [7:0]  mem [0:4095];
   //this reg is used to shoot an 
   //interrupt signal once.
   reg           once;
   
   
   //this is a counter to delay the interrupt 
   //signal sent to the CU.
   integer       counter = 0;
   
   //truncate the incomming address to 12 bits
   wire   [11:0] act_addr;
   
   //truncation of address data happens here
   assign act_addr   =  address[11:0];
   
   //read out data and assign the ready signal when
   //data is collected from IO.
   assign {out, rdy} =  (cs & rd) ? {mem[act_addr+0], 
                                     mem[act_addr+1],
                                     mem[act_addr+2], 
                                     mem[act_addr+3], 1'b1} :
                                     {{32{1'bz}}, 1'b0};
   
   //interrupt signal assertion/dessertion.
   assign intr       = (intr_ack == 0) ? (counter == 6): 1'b0;
   
   
   always @ (posedge sys_clk, posedge reset)
      //on reset set the counter for interrupt delay 
      //to 0
      if(reset)
         counter <= 0;
      else
         begin
            //increment counter every clock until 6
            counter <= (counter < 6) ? counter + 1: counter;
            //when the interrupt is acknowledge 
            //increment the counter one more to stop the intr 
            //signal
            if(intr_ack)
               counter <= counter + 1;
               
            //this if & else statement will allow DATA
            //to be written to the IO memory 
            //however, if the cs & wr is not asserted
            //then just rewrite old data stored in memory 
            //back to the same location (Do nothing). 
            if(cs & wr)
            begin
               mem[act_addr+3] <= in[ 7: 0];
               mem[act_addr+2] <= in[15: 8];
               mem[act_addr+1] <= in[23:16];
               mem[act_addr]   <= in[31:24];
            end
            else
            begin
               mem[act_addr+3] <= mem[act_addr+3];
               mem[act_addr+2] <= mem[act_addr+2];
               mem[act_addr+1] <= mem[act_addr+1];
               mem[act_addr]   <= mem[act_addr];
            end
         end
   
   
   
endmodule
