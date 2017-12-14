`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  MIPS_CU_TB.v
 * Project:    Lab_Assignment_6
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 1.5
 * Rev. Date:  10/25/2017
 *
 * Purpose:    This is a test bench used to instantiate the controller unit,
 *             the integer datapath, the data memory, and the instruction unit.
 *             The testbench itself utilizes a Harvard Architechture approach
 *
 * Notes:      10/25 - first made
 *             10/28 - realized that there is no need to have a module declared 
 *                     for the ID, IU, and DM so I seperated it.
 *
 ****************************************************************************/

module MIPS_CU_TB;

	// Global Input Decleration
	reg sys_clk;
	reg reset;
   
   // Interrupt Input Decleration
	reg intr;

	// Outputs Decleration
	wire int_ack;
	wire pc_ld;
	wire pc_inc;
	wire [1:0] pc_sel;
	wire ir_ld;
	wire im_cs;
	wire im_rd;
	wire im_wr;
	wire [31:0] D_In;
	wire D_En;
	wire [1:0] DA_sel;
	wire T_sel;
	wire HILO_ld;
	wire [2:0] Y_sel;
	wire dm_cs;
	wire dm_rd;
	wire dm_wr;
	wire [4:0] FS;
   wire [4:0] shamnt;
   
   /*----------WIRE DECLERATION----------*/
   wire  [31:0]   IR;
   wire           c, v, z, n;
   wire  [31:0]   ALU_Out, D_Out;
   wire  [31:0]   D_Pass;
   wire  [31:0]   PC_Out, SE_Out;

	// Instantiate the Unit Under Test (UUT)
	MCU mcu (
		.sys_clk(sys_clk), 
		.reset(reset),
      .c(c), .z(z), .v(v), .n(n),
      .IR(IR),
		.intr(intr), 
		.intr_ack(intr_ack), 
		.pc_ld(pc_ld), 
		.pc_inc(pc_inc), 
		.pc_sel(pc_sel), 
		.ir_ld(ir_ld), 
		.im_cs(im_cs), 
		.im_rd(im_rd), 
		.im_wr(im_wr), 
		.D_In(D_In), 
		.D_En(D_En), 
		.DA_sel(DA_sel), 
		.T_sel(T_sel), 
		.HILO_ld(HILO_ld), 
		.Y_sel(Y_sel), 
		.dm_cs(dm_cs), 
		.dm_rd(dm_rd), 
		.dm_wr(dm_wr), 
		.FS(FS)
	);
   
   integer_datapath id (
      .clk(sys_clk), 
      .reset(reset),
      .intr(intr_ack),
      .S_Addr(IR[25:21]),     //5-bits
      .T_Addr(IR[20:16]),     //5-bits
      .D_Addr(IR[15:11]),     //5-bits
      .D_en(D_En),         
      .DT(SE_Out),            //32-bits
      .T_sel(T_sel),          
      .DA_sel(DA_sel),        //2-bits
      .C(c), 
      .N(n), 
      .V(v), 
      .Z(z), 
      .DY(D_Out),             //32-bits
      .PC_in(PC_Out),         //32-bits
      .Y_sel(Y_sel),          //3-bits
      .ALU_out(ALU_Out),      //32-bits
      .D_Out(D_Pass),         //32-bits
      .HILO_ld(HILO_ld),   
      .FS(FS),                 //5-bits
      .shamnt(IR[10:6])
   );
   
    Data_Memory dm(
      .clk(sys_clk),
      .dm_cs(dm_cs), 
      .dm_wr(dm_wr), 
      .dm_rd(dm_rd), 
      .Address(ALU_Out),       //32-bit
      .D_in(D_Pass),           //32-bit
      .D_out(D_Out)            //32_bit
   );
   
   instruction_unit iu(
      .clk(sys_clk),           
      .reset(reset),
      .pc_ld(pc_ld),
      .pc_sel(pc_sel),
      .PC_InW(ALU_Out),        //32-bit
      .pc_inc(pc_inc),        
      .im_cs(im_cs), 
      .im_wr(im_wr), 
      .im_rd(im_rd), 
      .D_In(D_In),             //32-bit
      .ir_ld(ir_ld),          
      .PC_Out(PC_Out),         //32-bit
      .IR_Out(IR),             //32-bit
      .SE_Out(SE_Out)          //32-bit
   );
    
   always #5 sys_clk = ~sys_clk;
	initial begin
		// Initialize Inputs
		sys_clk = 0;
		reset = 0;
		intr = 0;
      

		// Wait for negedge clk
      // for global reset to finish
		@(negedge sys_clk)
      reset = 1'b1;
      
      @(negedge sys_clk)
      reset = 1'b0;
       
      
      //INITIALIZE Register.
      $readmemh("dMem12_Sp17.dat", dm.MEMORY);
      $readmemh("iMem12_Sp17.dat", iu.INSTRUCTION);
      
      //UNCOMMENT CODE BELOW 
      //TO TEST INTERRUPT.
      /*
      @(negedge sys_clk)
      intr = 1;
      
      @(negedge sys_clk)
      intr = 0;
      */
          
	end
      
endmodule

