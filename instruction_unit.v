`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  instruction_unit.v
 * Project:    Lab_Assignment_5
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 1.0
 * Rev. Date:  10/16/2017
 *
 * Purpose:    Instruction memory module is a module that will 
 *             be used to store instructions fed to the integer datapath.
 *             Just like the data memory, this module will have a memory 
 *             that is 4K deep and 8-bits wide.
 *
 * Notes:      10/16 - made the instruction memory 
 *
 ****************************************************************************/
module instruction_unit(clk, reset, pc_ld, PC_InW, pc_inc, pc_sel,
                        im_cs, im_wr, im_rd, D_In, ir_ld,  j_flg,
                        PC_Out, IR_Out, SE_Out);

   /*INPUT DECLERATION*/
   input             clk, reset;
   
   //pc signals
   input             pc_ld, pc_inc, j_flg;
   input    [ 1:0]   pc_sel;
   //instruction memory signals
   input             im_cs, im_wr, im_rd;
   //instruction register signal
   input             ir_ld;
   //input value for instruction memory
   input    [31:0]   PC_InW, D_In;
   
   //output value for instruction memory
   output   [31:0]  PC_Out, IR_Out, SE_Out;
   
   // REGISTER DECLERATION
   reg      [31:0]   PC_Reg, IR_Reg;
   
   // MEMORY DECLERATION 
   // 4K    -> deep
   // 8-bit -> wide
   reg      [ 7:0]   INSTRUCTION [0:4095];
   
   // WIRE DECLERATION
   wire     [31:0]   D_Out;
   wire     [11:0]   PC_Wire;
   reg      [31:0]   PC_In;
   
   
   //continous assign for Address. (BIG ENDIAN FORMAT)
   assign      D_Out  = (im_cs & im_rd) ?    {INSTRUCTION[PC_Wire], 
                                              INSTRUCTION[PC_Wire+1],
                                              INSTRUCTION[PC_Wire+2],
                                              INSTRUCTION[PC_Wire+3]}:
                                              {32{1'bz}};
   
                        
   // grab incoming 32 bit and truncate to 12 bits for
   // instruction memory addressing.
   assign      PC_Wire = PC_Reg[11:0];

   // grab 12 bit and concat with 20 bit to make a 
   // 32 bit PC value
   assign      PC_Out  = {20'b0, PC_Wire};
   
   // set IR_Out to the value of IR_Reg
   assign      IR_Out  = IR_Reg;
   
   // sign extend IR if needed. 
   assign      SE_Out  = {{16{IR_Reg[15]}}, IR_Reg[15:0]};

   always @ (*)
      begin
         if(j_flg) PC_In = PC_Reg + ({{12{IR_Reg[25]}}, IR_Reg[25:6]}*4);
         else
            case(pc_sel)
               2'b00: PC_In = PC_Reg + {SE_Out[29:0], 2'b00};
               2'b01: PC_In = {PC_Reg[31:28], IR_Reg[25:0], 2'b00};
               2'b10: PC_In = PC_InW;
               2'b11: PC_In = PC_Reg + (SE_Out * 4);
            endcase
      end
   //register are written to on positive edge of clk 
   //(BIG ENDIAN FORMAT)
   always @(posedge clk, posedge reset)
      if(reset)
      begin
         PC_Reg      <= 32'b0;
         IR_Reg      <= 32'b0;
      end
      else
         /* 
            This entire case statement covers all possible 
            values that is available for all control signals 
            in the instruction unit 
         */
         case ({im_cs, im_wr, ir_ld, pc_inc, pc_ld})
            //5'b00_000:  //default
            5'b00_001:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b00_010:
            begin
               PC_Reg                 <= PC_Reg + 4;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b00_011:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b00_100:
            begin
               PC_Reg                 <= PC_Reg;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b00_101:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b00_110:
            begin
               PC_Reg                 <= PC_Reg + 4;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b00_111:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            //5'b01_000:  //default
            5'b01_001: 
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b01_010:
            begin
               PC_Reg                 <= PC_Reg + 4;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b01_011:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b01_100:
            begin
               PC_Reg                 <= PC_Reg;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b01_101:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b01_110:
            begin
               PC_Reg                 <= PC_Reg + 4;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b01_111:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            //5'b10_000://default
            5'b10_001:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b10_010:
            begin
               PC_Reg                 <= PC_Reg + 4;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b10_011:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b10_100:
            begin
               PC_Reg                 <= PC_Reg;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b10_101:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b10_110:
            begin
               PC_Reg                 <= PC_Reg + 4;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b10_111:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
            5'b11_000:
            begin
               PC_Reg                 <= PC_Reg;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= D_In[31:24];
               INSTRUCTION[PC_Wire+1] <= D_In[23:16];
               INSTRUCTION[PC_Wire+2] <= D_In[15: 8];
               INSTRUCTION[PC_Wire+3] <= D_In[ 7: 0];
            end
            5'b11_001:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= D_In[31:24];
               INSTRUCTION[PC_Wire+1] <= D_In[23:16];
               INSTRUCTION[PC_Wire+2] <= D_In[15: 8];
               INSTRUCTION[PC_Wire+3] <= D_In[ 7: 0];
            end
            5'b11_010:
            begin
               PC_Reg                 <= PC_Reg + 4;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= D_In[31:24];
               INSTRUCTION[PC_Wire+1] <= D_In[23:16];
               INSTRUCTION[PC_Wire+2] <= D_In[15: 8];
               INSTRUCTION[PC_Wire+3] <= D_In[ 7: 0];
            end
            5'b11_011:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= D_In[31:24];
               INSTRUCTION[PC_Wire+1] <= D_In[23:16];
               INSTRUCTION[PC_Wire+2] <= D_In[15: 8];
               INSTRUCTION[PC_Wire+3] <= D_In[ 7: 0];
            end
            5'b11_100:
            begin
               PC_Reg                 <= PC_Reg;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= D_In[31:24];
               INSTRUCTION[PC_Wire+1] <= D_In[23:16];
               INSTRUCTION[PC_Wire+2] <= D_In[15: 8];
               INSTRUCTION[PC_Wire+3] <= D_In[ 7: 0];
            end
            5'b11_101:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= D_In[31:24];
               INSTRUCTION[PC_Wire+1] <= D_In[23:16];
               INSTRUCTION[PC_Wire+2] <= D_In[15: 8];
               INSTRUCTION[PC_Wire+3] <= D_In[ 7: 0];
            end
            5'b11_110:
            begin
               PC_Reg                 <= PC_Reg + 4;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= D_In[31:24];
               INSTRUCTION[PC_Wire+1] <= D_In[23:16];
               INSTRUCTION[PC_Wire+2] <= D_In[15: 8];
               INSTRUCTION[PC_Wire+3] <= D_In[ 7: 0];
            end
            5'b11_111:
            begin
               PC_Reg                 <= PC_In;
               IR_Reg                 <= D_Out;
               INSTRUCTION[PC_Wire]   <= D_In[31:24];
               INSTRUCTION[PC_Wire+1] <= D_In[23:16];
               INSTRUCTION[PC_Wire+2] <= D_In[15: 8];
               INSTRUCTION[PC_Wire+3] <= D_In[ 7: 0];
            end
            default:
            begin
               PC_Reg                 <= PC_Reg;
               IR_Reg                 <= IR_Reg;
               INSTRUCTION[PC_Wire]   <= INSTRUCTION[PC_Wire];
               INSTRUCTION[PC_Wire+1] <= INSTRUCTION[PC_Wire+1];
               INSTRUCTION[PC_Wire+2] <= INSTRUCTION[PC_Wire+2];
               INSTRUCTION[PC_Wire+3] <= INSTRUCTION[PC_Wire+3];
            end
         endcase
         
endmodule
