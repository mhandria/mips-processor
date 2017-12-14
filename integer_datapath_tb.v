`timescale 1ns / 1ps

/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  integer_datapath_tb.v
 * Project:    Lab_Assignment_3
 * Designer:   Michael Handria
 * Email:      michaelhandria@gmail.com
 * Rev. No.:   Version 1.0
 * Rev. Date:  9/30/2017
 *
 * Purpose:    This is a test bench that will test the integer datapath
 *             through running some micro operations and operations through
 *             the UUT.  
 *
 * Notes:      9/30 - first made to test integer datapath
 *             10/2 - added comment for clarity 
 *
 ****************************************************************************/
module integer_datapath_tb;
   
   //hold the values to be loaded into register
   reg  [31:0] REGISTER [0:15];
   
	// Inputs
	reg clk;
	reg reset;
	reg [4:0] S_Addr;
	reg [4:0] D_Addr;
	reg [4:0] T_Addr;
	reg D_en;
	reg [31:0] DT;
	reg T_sel;
	reg [31:0] DY;
	reg [31:0] PC_in;
	reg [2:0] Y_sel;
	reg HILO_ld;
	reg [4:0] FS;

	// Outputs
	wire C;
	wire N;
	wire V;
	wire Z;
	wire [31:0] ALU_out;
   

   
   // Iterator
   integer i;

	// Instantiate the Unit Under Test (UUT)
	integer_datapath uut (
		.clk(clk), 
		.reset(reset), 
		.S_Addr(S_Addr), 
		.D_Addr(D_Addr), 
		.T_Addr(T_Addr), 
		.D_en(D_en), 
		.DT(DT), 
		.T_sel(T_sel), 
		.C(C), 
		.N(N), 
		.V(V), 
		.Z(Z), 
		.DY(DY), 
		.PC_in(PC_in), 
		.Y_sel(Y_sel), 
		.ALU_out(ALU_out), 
		.HILO_ld(HILO_ld), 
		.FS(FS)
	);
   
   // 100MHz clk simulation
   always #5 clk = ~clk;
   
	initial begin
		// Initialize Inputs
      // set everything into 0 when simulation starts
		clk = 0;
		reset = 0;
		S_Addr = 0;
		D_Addr = 0;
		T_Addr = 0;
		D_en = 0;
		DT = 0;
		T_sel = 0;
		DY = 0;
		PC_in = 0;
		Y_sel = 0;
		HILO_ld = 0;
		FS = 0;

      // reset the machine by asserting reset high
		@(negedge clk);
      reset = 1'b1;
      
      // deassert reset
      @(negedge clk);
      reset = 1'b0;
        
		// Display Banner 
      $display("******************************************");
      $display("******** CECS 440 LAB 3 TESTBENCH ********");
      $display("******************************************");     
      
      // Initialize register in register file
		$readmemh("IntReg_Lab3.txt", uut.regfile.REG);
		
      $display("Before Operations Executed"); 
      // Add stimulus here
      #1 Reg_Dump();
      
      //R1 <- R3|R4
      @(negedge clk)
      begin
         //set operation to OR
         FS     = 5'h09;
         
         //give RS register 3
         S_Addr = 5'h03;
         
         //give RT register 4
         T_Addr = 5'h04;
         
         //allow T to go through the
         //ALU instead of DT
         T_sel  = 1'b1;
         
         //select Y_lo to be written into the 
         //ALU_out wire.
         Y_sel  = 3'b0;
         
         //save the result into register 1
         //in the register file
         D_Addr = 5'h01;
         
         //enable a write to the register
         D_en   = 1'b1;
      end
      
      //R2 <- R1 - R14
      @(negedge clk)
      begin
         //set operation to subtract SIGNED
         FS     = 5'h04;
         
         //give RS register 1
         S_Addr = 5'h01;
         
         //give RT register 14
         T_Addr = 5'h0E;
         
         //allow T to go through the
         //ALU instead of DT
         T_sel  = 1'b1;
         
         //select Y_lo to be written into the
         //ALU_out wire.
         Y_sel  = 3'b0;
         
         //save the result into register 2 
         //in the register file
         D_Addr = 5'h02;
         
         //enable writting into the register file
         D_en   = 1'b1;
      end
      
      //R3 <- SHR R4
      @(negedge clk)
      begin
         //set operation to shift right logical
         FS     = 5'h0D;
         
         //SHIFT RIGHT LOGICAL will only take
         //register T and shift it right NOT S
         //give T register 4
         T_Addr = 5'h04;
         
         //allows T to go into the ALU instead of DT
         T_sel  = 1'b1;

         //select Y_lo to be written into the
         //ALU_out wire.
         Y_sel  = 3'b0;
         
         //save the result into register 3
         //in the register file
         D_Addr = 5'h03;
         
         //enable writting into the register file
         D_en   = 1'b1;
      end
      
      //R4 <- SHL R5
      @(negedge clk)
      begin
         //set operation to shift left logical
         FS     = 5'h0C;
         
         //SHIFT LEFT LOGICAL will only take
         //register T and shift it left NOT S
         //give T register 5
         T_Addr = 5'h05;
         
         //allows T to go into the ALU isntead of DT
         T_sel  = 1'b1;
         
         //select Y_lo 
         Y_sel  = 3'b0;
         
         //save the result into register 4
         D_Addr = 5'h04;
         
         //enable writting into the register file
         D_en   = 1'b1;
      end
      
      /*
         this is a 3 clock operation for a division
         - the first step is to set up the proper controls
           in order to get the registers into the ALU
         
         - the second step is to set a way to have the 
           HI register written into the register file
           
         - the last step is to set a way to have the 
           LO register written into the register file
      */
      //{R6, R5} <- R15/R14
      @(negedge clk)
      begin
         //set operation to divide S/T
         FS      = 5'h1F;
         
         //give RT register 14
         T_Addr  = 5'h0E;
         
         //give RS register 15
         S_Addr  = 5'h0F;
         
         //allow T to go to the ALU instead of DT
         T_sel   = 1'b1;
         
         //allow HI and LO registers to be loaded
         HILO_ld = 1'b1;
         
         //DISABLE writting into the register file
         D_en    = 1'b0;
      end
      
      @(negedge clk)
      begin
         //enable writting into the register file
         D_en    = 1'b1;
         
         //have HI register pass through the Y-MUX
         Y_sel   = 3'b010;
         
         //write the contents of HI register into the 
         //register file register 6
         D_Addr  = 5'h06;
      end
      
      @(negedge clk)
      begin
         //enable writting into the register file
         D_en    = 1'b1;
         
         //have LO register pass through the Y-MUX
         Y_sel   = 3'b001;
         
         //write the contents of LO register into the 
         //register file register 5
         D_Addr  = 5'h05;
      end
      
     /*
         this is a 3 clock operation for a multiplication
         - the first step is to set up the proper controls
           in order to get the registers into the ALU
         
         - the second step is to set a way to have the 
           HI register written into the register file
           
         - the last step is to set a way to have the 
           LO register written into the register file
      */
      //{R8, R7} <- R11*0xFFFF_FFFB
      @(negedge clk)
      begin
         //set operation to multiply S*0xFFFF_FFFB
         FS      = 5'h1E;
         
         //allow DT to go through the T-MUX instead 
         //of T
         T_sel   = 1'b0;
         
         //have a constant FFFF_FFFB go through to be
         //multiplied
         DT      = 32'hFFFF_FFFB;
         
         //give RS register 11
         S_Addr  = 5'h0B;
         
         //allow register HI and LO to be written to 
         HILO_ld = 1'b1;
         
         //DISABLE writting to the register file
         D_en    = 1'b0;
      end
      
      @(negedge clk)
      begin
         //enable writting to the register file
         D_en    = 1'b1;
         
         //allow contents of register HI to pass
         //through Y-MUX
         Y_sel   = 3'b010;
         
         //save contents of HI register into 
         //register 8
         D_Addr  = 5'h08;
      end
      
      @(negedge clk)
      begin
         //enable writting to the register file
         D_en    = 1'b1;
         
         //allow contents of register LO to pass
         //through Y-MUX
         Y_sel   = 3'b001;
         
         //save contents of LO register onto 
         //register 7
         D_Addr  = 5'h07;
      end
      
      //R12 <- 0xABCD_EF01
      @(negedge clk)
      begin
         //allows DY to pass through 
         //the Y-MUX
         Y_sel   = 3'b011;
         
         //this is a constant value 
         //written to DY wire
         DY      = 32'hABCD_EF01;
         
         //write to register 12
         D_Addr  = 5'h0C;
         
         //enable writting to the register file
         D_en    = 1'b1;
      end
      
      //R11 <- ~(R0 | R11)
      @(negedge clk)
      begin
         //set operation for a NOR
         FS     = 5'h0B;
         
         //give RS register 0
         S_Addr = 5'h00;
         
         //give RT register 11
         T_Addr = 5'h0B;
         
         //allow T to go into the ALU
         //instead of DT
         T_sel  = 1'b1;
         
         //write to register 11
         D_Addr = 5'h0B;
         
         //enable writting to the register file
         D_en   = 1'b1;
         
         //allow Y_lo to pass to Y-MUX
         Y_sel  = 3'b0;
      end

      //R10 <- R0 - R10
      @(negedge clk)
      begin
         //set operation for subtraction
         FS     = 5'h04;
         
         //give RS register 0
         S_Addr = 5'h00;
         
         //give RT register 10
         T_Addr = 5'h0A;
         
         //allow T to pass through T-MUX
         //instead of DT
         T_sel  = 1'b1;
         
         //write to register 10 
         D_Addr = 5'h0A;
         
         //enable writting to the register file
         D_en   = 1'b1;
         
         //allow Y-lo to come through Y-MUX
         Y_sel  = 3'b0;
      end
      
      //R9 <- R10 + R11
      @(negedge clk)
      begin
         //set operation for addition
         FS     = 5'h02;
         
         //give RS register 10
         S_Addr = 5'h0A;
         
         //give RT register 11
         T_Addr = 5'h0B;
         
         //allow T to pass through T-MUX
         //instead of DT
         T_sel  = 1'b1;
         
         //write to register 9
         D_Addr = 5'h09;
         
         //allow writting to register file
         D_en   = 1'b1;
         
         //allow Y_lo to pass through Y-MUX
         Y_sel  = 3'b0;
      end
      
      //R13 <- 0x100100C0
      @(negedge clk)
      begin
         //set PC_in to 32'h100100C0
         PC_in  = 32'h100100C0;
         
         //write to register 13
         D_Addr = 5'h0D;
         
         //allow writting to register file
         D_en   = 1'b1;
         
         //let PC_in pass through Y-MUX
         Y_sel  = 3'b100;
      end
      
      
      @(negedge clk) D_en = 1'b0;
      $display("Before Operations Executed"); 
      #1 Reg_Dump();
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
         //set everything on negetive edge clk
         @(negedge clk)
         begin
            S_Addr = i;
            
            //pass to T 
            FS     = 5'b0;
            
            //allow Y_lo to come out 
            Y_sel  = 3'b0;
            
            //write out value grabed through register file 
            //from the ALU_out bus. 
            //then display the time.
            #1 $display("R[%0d]: %h time: %0d", S_Addr, ALU_out, $time);
         end
      end
      //print 2 new line
      $display("\n");
   end
   endtask
            
      
endmodule

