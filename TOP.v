`timescale 1ns / 1ps

/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  TOP.v
 * Project:    SENIOR PROJECT
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 2.0
 * Rev. Date:  11/23/2017
 *
 * Purpose:    This module holds the entire MIPS, DATA MEMORY, and EXTERNAL IO.
 *             This is used to verify that the MIPS works as intended 
 *             
 *
 * Notes:      11/23 - module made
 *             11/24 - module tested for test 14. 
 *
 ****************************************************************************/

module TOP;

   // Inputs
   reg sys_clk;
   reg reset;
   wire mrdy;
   wire [31:0] D_out;
   wire [31:0] out;
   wire intr;
   wire rdy;

   // Outputs
   wire dm_cs;
   wire dm_wr;
   wire dm_rd;
   wire [31:0] ADDRESS;
   wire [31:0] DATA_OUT;
   wire intr_ack;
   wire cs;
   wire rd;
   wire wr;
   

   //  Instantiate PROCESSOR
   PROCESSOR cu(
      .sys_clk(sys_clk), 
      .reset(reset), 
      .dm_cs(dm_cs), 
      .dm_wr(dm_wr), 
      .dm_rd(dm_rd), 
      .mrdy(mrdy), 
      .D_out(D_out), 
      .out(out), 
      .intr(intr), 
      .intr_ack(intr_ack), 
      .rdy(rdy), 
      .cs(cs), 
      .rd(rd), 
      .wr(wr),
      .DATA_OUT(DATA_OUT),
      .ADDRESS(ADDRESS)
   );
   
   // Instantiate EXTERNAL_IO
   EXTERNAL_IO io( 
      .sys_clk(sys_clk),
      .reset(reset),
      .address(ADDRESS), 
      .in(DATA_OUT), 
      .out(out), 
      .intr(intr), 
      .intr_ack(intr_ack), 
      .rdy(rdy),
      .cs(cs), 
      .rd(rd), 
      .wr(wr)
  );
   
  //  Instantiate DATA_MEMORY
  Data_Memory dm(
      .clk(sys_clk), 
      .dm_cs(dm_cs), 
      .dm_wr(dm_wr), 
      .dm_rd(dm_rd), 
      .mrdy(mrdy), 
      .Address(ADDRESS), 
      .D_in(DATA_OUT), 
      .D_out(D_out)
  );
  
   always #5 sys_clk = ~sys_clk;
  
	initial begin
      sys_clk = 0;
      reset = 1;
		// Wait 100 ns for global reset to finish
		@(negedge sys_clk)
      reset = 0;
        
		// Add stimulus here
      // INITIALIZE Register.
      //$readmemh("dMem01_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem01_Sp17.dat", cu.iu.INSTRUCTION);
      //$readmemh("dMem02_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem02_Sp17.dat", cu.iu.INSTRUCTION);
      //$readmemh("dMem03_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem03_Sp17.dat", cu.iu.INSTRUCTION);
      //$readmemh("dMem04_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem04_Sp17.dat", cu.iu.INSTRUCTION);
      //$readmemh("dMem05_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem05_Sp17.dat", cu.iu.INSTRUCTION);
      //$readmemh("dMem06_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem06_Sp17.dat", cu.iu.INSTRUCTION);
      //$readmemh("dMem07_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem07_Sp17.dat", cu.iu.INSTRUCTION);
      //$readmemh("dMem08_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem08_Sp17.dat", cu.iu.INSTRUCTION);
      //$readmemh("dMem09_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem09_Sp17.dat", cu.iu.INSTRUCTION);
      //$readmemh("dMem10_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem10_Sp17.dat", cu.iu.INSTRUCTION);
      //$readmemh("dMem11_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem11_Sp17.dat", cu.iu.INSTRUCTION);
      //$readmemh("dMem12_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem12_Sp17.dat", cu.iu.INSTRUCTION);
      $readmemh("dMem14_Sp17.dat", dm.MEMORY);
      //$readmemh("iMem14_Fa17_w_isr.dat", cu.iu.INSTRUCTION);
      $readmemh("E_JUMP.dat", cu.iu.INSTRUCTION);

	end
      
endmodule

