`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  PROCESSOR.v
 * Project:    SENIOR PROJECT
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 2.0
 * Rev. Date:  11/23/2017
 *
 * Purpose:    This module holds the MICROCONTROLLER UNIT, INTEGER DATAPATH,
 *             and INSTRUCTION UNIT.  The processor will also allow the selection
 *             between reading or writting to the External Device or Data Memory, or both.
 *             In addition there are 2 main select bits that can change register address output
 *             of S to the stack register and another to select the return address ($31).  
 *             
 *
 * Notes:      11/23 - module made
 *             11/24 - mdoule tested against the instruction.dat file
 *
 ****************************************************************************/
module PROCESSOR(//GLOABAL INPUTS 
                 sys_clk, reset, 
                 
                 //DATA MEMORY INPUTS & OUTPUTS
                 dm_cs, dm_wr, dm_rd, mrdy, D_out, 
                 
                 //EXTERNAL IO INPUTS & OUTPUTS
                 out, intr, intr_ack, rdy,
                 cs, rd, wr,
                 
                 //OUTPUT FOR ADDRES & DATA
                 ADDRESS, DATA_OUT
                 );
   
   //global clock input and reset
   input         sys_clk, reset;
   
   //INPUTS for DATA MEMORY 
   input         mrdy;
   input  [31:0] D_out;
   
   
   //OUTPUTS for DATA MEMORY 
   output        dm_cs, dm_wr, dm_rd;
   
   //INPUTS for EXTERNAL IO
   input  [31:0] out;
   input         intr, rdy;
   
   //OUTPUTS for EXTERNAL IO
   output        intr_ack;
   output        cs, rd, wr;
   
   //OUTPUTS for DATA MEMORY & EXTERNAL IO
   output [31:0] ADDRESS;
   output [31:0] DATA_OUT;
   
   
   //INTERNAL WIRE DECLERATION
   wire  [31:0]   IR;
   wire           c, v, z, n;
   wire  [31:0]   ALU_Out, DY;
   wire  [31:0]   D_Pass;
   wire  [31:0]   PC_Out, SE_Out;
   

   
   wire           io_dm;
	wire           pc_ld;
	wire           pc_inc;
	wire  [ 1:0]   pc_sel;
	wire           ir_ld;
	wire           im_cs, im_rd, im_wr;
	wire  [31:0]   D_In;
	wire           D_En;
	wire  [ 1:0]   DA_sel;
	wire           T_sel, S_sel, F_sel, P_sel;
   wire           ld_flg, wr_flg;
	wire           HILO_ld;
	wire  [ 2:0]   Y_sel;
	wire  [ 4:0]   FS;
   wire  [ 4:0]   shamnt;
   wire  [ 4:0]   S_ADDRESS;
   wire  [ 4:0]   T_ADDRESS;
   wire           j_flg;
   wire           push_data;
   
   //SIMD STUFF
   wire  [63:0]   GPR_DATA;
   wire           v_sel, from_GPR, from_VEC;
   wire           SIMD_DEN;
   wire  [31:0]   Y_out;
   
   //data & address for DM and IO
   assign   ADDRESS    = ALU_Out;
   assign   DATA_OUT   = D_Pass;
   
   assign   DY         = (io_dm) ? out: D_out;
   assign   S_ADDRESS  = (S_sel) ? 29 : IR[25:21];
   assign   T_ADDRESS  = (P_sel) ? 31 : IR[20:16];
   
   //MICRO-CONTROLLER UNIT INSTANTIATION
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
      .S_sel(S_sel),
      .F_sel(F_sel),
      .P_sel(P_sel),
      .ld_flg(ld_flg),
      .wr_flg(wr_flg),
		.HILO_ld(HILO_ld), 
		.Y_sel(Y_sel),
      .mrdy(mrdy),
      .j_flg(j_flg),
		.dm_cs(dm_cs), 
		.dm_rd(dm_rd), 
		.dm_wr(dm_wr),
      .cs(cs),
      .rd(rd),
      .wr(wr),
      .io_dm(io_dm),
		.FS(FS),
      .from_GPR(from_GPR),
      .v_sel(v_sel),
      .SIMD_DEN(SIMD_DEN),
      .from_VEC(from_VEC)
	);
   
   //INTEGER DATAPATH UNIT INSTANTIATION
   integer_datapath id (
      .clk(sys_clk), 
      .reset(reset),
      .S_Addr(S_ADDRESS),     //5-bits
      .T_Addr(T_ADDRESS),     //5-bits
      .D_Addr(IR[15:11]),     //5-bits
      .D_en(D_En),         
      .DT(SE_Out),            //32-bits
      .T_sel(T_sel),  
      .F_sel(F_sel),
      .ld_flg(ld_flg),
      .wr_flg(wr_flg),
      .DA_sel(DA_sel),        //2-bits
      .C(c), 
      .N(n), 
      .V(v), 
      .Z(z), 
      .DY(DY),                //32-bits
      .PC_in(PC_Out),         //32-bits
      .Y_sel(Y_sel),          //3-bits
      .ALU_out(ALU_Out),      //32-bits
      .D_Out(D_Pass),         //32-bits
      .HILO_ld(HILO_ld),   
      .FS(FS),                 //5-bits
      .shamnt(IR[10:6]),
      .GPR_DATA(GPR_DATA),
      .V_DATA(Y_out),
      .from_VEC(from_VEC)
   );
  
  //INSTRUCTION UNIT INSTANTIATION
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
      .j_flg(j_flg),
      .D_In(D_In),             //32-bit
      .ir_ld(ir_ld),          
      .PC_Out(PC_Out),         //32-bit
      .IR_Out(IR),             //32-bit
      .SE_Out(SE_Out)          //32-bit
   );
   
   V_Unit      vu(
      .clk(sys_clk), 
      .reset(reset), 
      //V regfile
      .D_En(SIMD_DEN),
      .FS(FS),
      .GPR_DATA(GPR_DATA), 
      .from_GPR(from_GPR),
      .S_Addrs(IR[25:21]), 
      .D_Addrs(IR[15:11]), 
      .T_Addrs(IR[20:16]), 
      .C_Addrs(IR[10: 6]),
      //V ALU
      .Y_out(Y_out), 
      .Y_sel(v_sel));

endmodule
