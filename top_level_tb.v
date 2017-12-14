`timescale 1ns / 1ps

/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  top_level_tb.v
 * Project:    Lab_Assignment_5
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 1.5
 * Rev. Date:  10/13/2017
 *
 * Purpose:    This is a test bench that will test the integer datapath, 
 *             data memory & instruction memory through running some 
 *             micro operations and operations through the UUT(id & dm).  
 *
 * Notes:      10/13 - first made to test integer datapath & data memory
 *             10/14 - realized that DA_sel is needed for I instructions
 *
 ****************************************************************************/

module top_level_tb;
   // Global Input
   reg clk;
	reg reset;
   
	// Inputs Integer Datapath
	reg D_en;
	reg [31:0] DT;
	reg T_sel;
   reg DA_sel;
	reg [31:0] PC_in;
	reg [2:0] Y_sel;
	reg HILO_ld;
   
   // Inputs Data Memory
   reg dm_cs;
   reg dm_wr;
   reg dm_rd;
   reg [31:0] D_in;
   
   
   // Inputs Instruction Unit
   reg pc_ld;
   reg pc_inc;
   reg im_cs;
   reg im_wr;
   reg im_rd;
   reg [31:0] D_In;
   reg ir_ld;
   
	// Outputs Integer Datapath
	wire C;
	wire N;
	wire V;
	wire Z;
	wire [31:0] ALU_out;
   wire [31:0] D_Out;
   
   // Outputs Data Memory
   wire [31:0] D_out;
   
   // Output Instruction Memory
   wire [31:0] PC_Out;
   wire [31:0] IR_Out;
   wire [31:0] SE_Out;

   integer i; 
   
	// Instantiate the Unit Under Test (UUT)
	integer_datapath id (
		.clk(clk), 
		.reset(reset), 
		.S_Addr(IR_Out[25:21]), 
		.T_Addr(IR_Out[20:16]), 
		.D_Addr(IR_Out[15:11]), 
		.D_en(D_en), 
		.DT(SE_Out), 
		.T_sel(T_sel),
      .DA_sel(DA_sel),
		.C(C), 
		.N(N), 
		.V(V), 
		.Z(Z), 
		.DY(D_out), 
		.PC_in(PC_Out), 
		.Y_sel(Y_sel), 
		.ALU_out(ALU_out), 
      .D_Out(D_Out),
		.HILO_ld(HILO_ld), 
		.FS(IR_Out[31:27])
	);
   
   Data_Memory dm(
      .clk(clk),
      .dm_cs(dm_cs), 
      .dm_wr(dm_wr), 
      .dm_rd(dm_rd), 
      .Address(ALU_out), 
      .D_in(D_Out), 
      .D_out(D_out)
   );
   
   instruction_unit iu(
      .clk(clk),
      .reset(reset),
      .pc_ld(pc_ld), 
      .PC_In(ALU_out), 
      .pc_inc(pc_inc),
      .im_cs(im_cs), 
      .im_wr(im_wr), 
      .im_rd(im_rd), 
      .D_In(D_In), 
      .ir_ld(ir_ld),
      .PC_Out(PC_Out), 
      .IR_Out(IR_Out), 
      .SE_Out(SE_Out)
   );
      
   // 100MHz clk simulation
   always #5 clk = ~clk;
   
   
   
   
	initial begin
      
		// Initialize Inputs
		clk = 0;
		reset = 0;
		D_en = 0;
		DT = 0;
		T_sel = 0;
		PC_in = 0;
		Y_sel = 0;
      DA_sel = 0;
		HILO_ld = 0;
      
      dm_cs = 0;
      dm_wr = 0;
      dm_rd = 0;
      D_in = 0;
      
      pc_ld = 0;
      pc_inc = 0;
      im_cs = 0;
      im_wr = 0;
      im_rd = 0;
      D_In = 0;
      ir_ld = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      @(negedge clk)
      reset = 1'b1;
      
      @(negedge clk)
      reset = 1'b0;
      
      $readmemh("IntReg_Lab5.dat", id.regfile.REG);
      $readmemh("dMem_Lab5.dat", dm.MEMORY);
      $readmemb("iMem_Lab5.dat", iu.INSTRUCTION);
      
      $display("*****************************************");
      $display("*************CECS 440 LAB 5**************");
      $display("*****************************************");
      $display("BEFORE OPERATIONS");
      Reg_Dump();
      
      /****r1 = r3 | r4****/
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) IR <- instruction
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_1_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) RS <- data, RT<- data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end

      //@(posedge clk) ALU_Out <- value_data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b1_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      
      /****r2 = r1 - r14****/
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) IR <- instruction
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_1_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) RS <- data, RT<- data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end

      //@(posedge clk) ALU_Out <- value_data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b1_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      /****r3 = shr r4****/
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) IR <- instruction
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_1_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) RS <- data, RT<- data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end

      //@(posedge clk) ALU_Out <- value_data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b1_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      /****r4 = shr r5****/
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) IR <- instruction
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_1_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) RS <- data, RT<- data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end

      //@(posedge clk) ALU_Out <- value_data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b1_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      /****{hi/lo} = r5/r4****/
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) IR <- instruction
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_1_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) 
      //RS <- data, RT<- data
      //PC <- PC+4
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_1_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end

      //@(posedge clk)
      //{Hi,Lo} <- value_data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      //IR <- instruction data
      //PC <- PC + 4
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b1_0_0_0_010;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      //r6 <- Hi
      //PC <- PC + 4
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b1_0_0_0_001;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) r5 <- Lo
      /*{HI, LO} <- r11 * DT(FFFF_FFFB)*/
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) 
      //IR <- instruction
      //PC <- PC+4
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) 
      //RS <- data, RT <- DT
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_1_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) 
      //{HI, LO} <- value_data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      //IR <- instruction
      //PC <- PC+4
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b1_0_0_0_010;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) R8 <- Hi
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      //IR <- instruction
      //PC <- PC+4
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b1_0_0_0_001;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) R7 <- Lo
      /*R12 <- M[R15 + 0]*/
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) 
      //IR <- instruction
      //PC <- PC + 4
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      //RS <- data, RT <- DT
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      //ALU_Out <- value_data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b1_1_0;
      end
      
      //@(posedge clk)
      //DY_Reg <- DY
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b1_1_0_0_011;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      /* r11 <- r0 NOR r11*/
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      //IR <- instruction
      //PC <- PC + 4
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_1_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) RS <- data, RT <- data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) ALU_Reg <- value_data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b1_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //r11 <- value_data
      /* r10 <- r0 - r10*/
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      //IR <- instruction
      //PC <- PC + 4
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_1_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) RS <- data, RT <- data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) ALU_Reg <- value_data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b1_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //r10 <- value_data
      /* r9 <- r10 + r11*/
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      //IR <- instruction
      //PC <- PC + 4
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_1_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) RS <- data, RT <- data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk) ALU_Reg <- value_data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b1_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      /*M[r14+0] <- r12*/
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      //IR <- instruction
      //PC <- PC + 4
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      //RS <- data, RT <- DT
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_1_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //@(posedge clk)
      //ALU_Reg <- value_data 
      //RT <- data
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_1_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b1_0_1;
      end
      
      //this cycle is to turn OFF all signals 
      @(negedge clk)
      begin
         //INSTRUCTION UNIT
         {pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
         //INTEGER DATAPATH
         {D_en, DA_sel, T_sel, HILO_ld, Y_sel} = 7'b0_0_0_0_000;
         //DATA MEMORY
         {dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
      end
      
      //display register and memory after operations 
      //have been completed.
      $display("\nAFTER OPERATIONS");
      @(negedge clk) Reg_Dump();
      $display("time:  %0d ns M[0xFF8:0xFFB]: %h", $time, {dm.MEMORY[12'hFF8], 
                                                        dm.MEMORY[12'hFF9],
                                                        dm.MEMORY[12'hFFA],
                                                        dm.MEMORY[12'hFFB]});
      
      $finish;
	end
   
   
   
   
   /*
      The purpose of the Register Dump task is to 
      display the first 16 register 0 - 16 in a 
      ex: R[0]: 0x00000000 time: 300
      format
   */
   task Reg_Dump;
   begin
      //for loop to go through first 16 registers
      for(i = 0; i < 16; i = i + 1)
      begin
         //cannot display the output with T because 
         //there is no access to T_Addr allowing reg value
         //to be display the T wire 
         //intead use the display below to see inner value.
         $display("time: %0d ns\t R[%0d]: %h", $time, i, id.regfile.REG[i]);
      end
   end
   endtask
   
  
      
endmodule

