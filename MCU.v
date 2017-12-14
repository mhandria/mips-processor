`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  MCU.v
 * Project:    Lab_Assignment_6
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 1.0
 * Rev. Date:  10/26/2017
 * 
 * Purpose:    Control Unit that will determine the signal required to
 *             be set based on the instructions recieved.
 *         
 * Notes:      10/26 - Made but not tested
 *             10/26 - did not work because state FETCH had the wrong 
 *                     control signal set.
 *             10/27 - started working but thought that WB_lo & WB_hi is needed
 *                     but it wasn't needed so I removed it. 
 *             11/23 - added all baseline MIPS instruction
 *                     (exception of ENHANCEMENT KEY)
 * 
 ****************************************************************************/
module MCU(//INPUT
           sys_clk, reset, intr, mrdy,
           c, n, z, v,
           IR,
           intr_ack,
           //OUTPUT 
           ld_flg, wr_flg,
           //Instruction Unit Control
           pc_ld, pc_inc, pc_sel, ir_ld, im_cs, im_rd, im_wr, D_In,
           //Datapath Control
           D_En, DA_sel, T_sel, F_sel, P_sel, HILO_ld, Y_sel, S_sel,
           //Data Memory Control
           dm_cs, dm_rd, dm_wr,
           //External IO control
           cs, wr, rd, io_dm,
           //FUNCTION SELECT
           FS,
           //ENHANCE KEY
           j_flg,
           //SIMD controls
           SIMD_DEN, v_sel, from_GPR, from_VEC
           );
   
   /*----------INPUT DECLERATION----------*/
   //global clk & reset
   input          sys_clk, reset;
   
   //interrupt signal
   input          intr;
   
   //control flags. 
   //C - carry
   //N - negative
   //Z - zero
   //V - overflow
   input          c, n, z, v;
   
   //memory ready signal
   input          mrdy;
   
   input [31:0]   IR;
   
   /*----------OUTPUT DECLERATION----------*/
   output          ld_flg, wr_flg;
   output          intr_ack;
   
   //PC_Module
   output          pc_ld, pc_inc;
   output [ 1:0]   pc_sel;
   
   //IR Module
   output [31:0]   D_In;
   output          ir_ld, im_cs, im_rd, im_wr;
   
   //RF Module
   output          D_En;
   output [ 1:0]   DA_sel;
   
   //ALU Module
   output          T_sel, HILO_ld, S_sel, F_sel, P_sel;
   output [ 2:0]   Y_sel;
   
   //DM Module
   output          dm_cs, dm_rd, dm_wr;
   
   //IO Module
   output          cs, rd, wr, io_dm;
   
   //ENHANCE KEY
   output          j_flg, from_VEC;
   output          SIMD_DEN, from_GPR, v_sel;
   
   //FS for ALU
   output [ 4:0]   FS;
   /*----------REGISTER DECLERATION----------*/
   wire            c, z, n, v;
   wire   [31:0]   IR;
   /*----------REGISTER DECLERATION----------*/
   //interrupt acknowledge flag
   reg             ld_flg, wr_flg;
   reg             intr_ack;
   
   //PC control registers
   reg             pc_ld, pc_inc;
   reg    [ 1:0]   pc_sel;
   
   //INSTRUCTION MEMORY control register
   reg    [31:0]   D_In;
   reg             ir_ld, im_cs, im_rd, im_wr;
   
   //REGISTER FILE control register
   reg             D_En;
   reg    [ 1:0]   DA_sel;
   
   //ALU control register
   reg             T_sel, HILO_ld, S_sel, F_sel, P_sel;
   reg    [ 2:0]   Y_sel;
   reg    [ 4:0]   FS;
   //DATA MEMORY control register
   reg             dm_cs, dm_rd, dm_wr;
   reg             cs, rd, wr, io_dm;
   
   //ENHANCE controls
   reg             j_flg, from_VEC;
   reg             SIMD_DEN, v_sel, from_GPR;
   
   //INTEGER declared for dump task
   integer  i;
   integer test = 0;
   
   //@58
   /*----------STATE DECLERATION----------*/
   parameter
   //INITIAL STATES
   RESET       = 00,  FETCH  = 01,  DECODE = 02,
   
   //ADD & SUBTRACT STATES
   ADD         = 10,  ADDU   = 11,  ADDI   = 15, 
   SUB         = 57,  SUBU   = 58,
   
   //LOGICAL STATE
   AND         = 12,  OR     = 13,  NOR    = 14,  XOR    = 16,
   ANDI        = 54,  ORI    = 20,  XORI   = 55,
   
   //LOAD & STORE STATE
   LUI         = 21,  SW     = 23,  LI     = 24,
   LW          = 22,  LW_2   = 27,  LW_3   = 28,
   
   //COMPARISON STATE
   SLT         = 25,  SLTI   = 26,  SLTU   = 17,  SLTIU  = 56, 

   //WRITE STATE
   WB_alu      = 30,  WB_imm = 31,  WB_Din = 32,  WB_mem = 35,
   WB_hi       = 33,  WB_lo  = 34,  MFLO   = 51,  MFHI   = 52,
   
   //SIFT STATES
   SRL         = 36,  SRA    = 37,  SLL    = 38,
   
   //BRANCH AND JUMP STATES
   BEQ_1       = 41,  BEQ_2  = 42,  BNQ_1  = 43,  BNQ_2  = 44,
   BLEZ_1      = 59,  BLEZ_2 = 60,  BGTZ_1 = 61,  BGTZ_2 = 62,
   JUMP        = 45,  JAL    = 46,  JR     = 47,  JR_2   = 48,
   
   //MULTIPLY & DIVIDE STATES
   MULT        = 50,  DIV    = 53,
   
   //INPUT & OUTPUT
   INPUT       = 72,  INPUT_1  = 73, INPUT_2 = 74,
   OUTPUT      = 70,  OUTPUT_2 = 71, 
   
   //ENHANCEMENTS
   RR         = 100,  RL       = 101,
   JV         = 102,  JC       = 103, JZ      = 104, JN       = 105,
   MVGPR      = 200,  MVVPR    = 201, MVVPR_1 = 202, MVVPR_2  = 203,
   VADDUS     = 204,  MULADD   = 205, MULEI   = 206, MULOI    = 207,
   MRGLO      = 208,  MRGHI    = 209, VCMPE   = 210, VCLTU    = 211,
   WB_VREG    = 212,
   
   //INTERRUPT STATES
   RETIE       = 80,  RETIE_2 = 81,  RETIE_3 = 82,   RETIE_4 = 83,
   RETIE_5     = 84,  RETIE_6 = 85,  RETIE_7 = 86,
   INTR_1      = 501, INTR_2  = 502, INTR_3  = 503, 
   INTR_4      = 504, INTR_5  = 505, INTR_6  = 506,  INTR_7  = 507,
   SETIE       = 509, 
   
   //BREAK & ILLEGAL OP STATES
   BREAK       = 510,
   ILLEGAL_OP  = 511;
   
   //STATE REGISTER//
   //state register (up to 512 states)
   reg     [8:0]  state;
   reg            ie;
   
   /************************************************
    * 440 MIPS CONTROL UNIT (FINITE STATE MACHINE) *
    *             SENIOR LEVEL DESIGN              *
    ************************************************/
   always @ (posedge sys_clk, posedge reset)
      if(reset)
         @(negedge sys_clk)
         begin
            //IO signals
            intr_ack                     = 1'b0;
            {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
            //PC signals
            {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
            //Instruction Memory signals
            {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
            //register file signals
            {D_En, DA_sel}               = 3'b0_00;
            //ALU signals
            {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
            //Data Memory signals
            {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
            //ENHANCE controls
            {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
            {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
            from_VEC                     = 1'b0;
            //state register
            state                        = RESET;
         end
      else
         case (state)
            FETCH:
               @(negedge sys_clk)
               if(ie == 1 & intr_ack == 0 & intr == 1)
                  begin
                     //control word assigments:
                     //this will set the state straight for 
                     //interrupt state.
                     //IO signals
                     {intr_ack, ie}               = 2'b0_0;
                     {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                     //PC signals
                     {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                     //Instruction Memory signals
                     {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                     //register file signals
                     {D_En, DA_sel}               = 3'b0_00;
                     //ALU signals
                     {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                     {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                     //Data Memory signals
                     {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                     //Function State
                     FS                           = 5'h15;
                     //ENHANCE controls
                     {ld_flg, j_flg}              = 2'b0_0;
                     {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                     from_VEC                     = 1'b0;
                     //NEXT STATE
                     state                        = INTR_1;
                  end
               else
                  begin
                     //interrupt signal set low
                     //control word assigments:
                     //IR <-- IM[PC]
                     //PC <-- PC + 4 
                     //IO signals
                     if(intr_ack == 1 & intr == 0) 
                        {intr_ack, ie} = 2'b0_1;
                     {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                     if(intr_ack == 1)
                        //PC signals
                        {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                     else
                        //PC signals
                        {pc_ld, pc_inc, pc_sel}      = 4'b0_1_00;
                     //Instruction Memory signals
                     {ir_ld, im_cs, im_rd, im_wr} = 4'b1_1_1_0;
                     //register file signals
                     {D_En, DA_sel}               = 3'b0_00;
                     //ALU signals
                     {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                     {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                     //Data Memory signals
                     {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                     //ENHANCE controls
                     {ld_flg, j_flg}              = 2'b0_0;
                     {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                     from_VEC                     = 1'b0;
                     //state register
                     state                        = DECODE;
                  end
            RESET: 
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h00;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                  from_VEC                     = 1'b0;
                  //Next State
                  state                        = FETCH;
               end
            DECODE:
               @(negedge sys_clk)
               begin
                  //checks for MIPS format
                  if(TOP.cu.iu.IR_Out[31:26] >= 6'h04 && TOP.cu.iu.IR_Out[31:26] <= 6'h07)
                  begin
                     //this if-block contains all the    
                     //BRANCH-statements 
                     //control word assigments: 
                     // RS <-- $rs
                     // RT <-- $rt (default) 
                     //IO signals
                     intr_ack                     = 1'b0;
                     {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                     //PC signals
                     {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                     //Instruction Memory signals
                     {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                     //register file signals1
                     {D_En, DA_sel}               = 3'b0_00;
                     //ALU signals
                     {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                     //Data Memory signals
                     {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                     //Function Select
                     FS                           = 5'h0;
                     
                     //CASE STTEMENT THAT WILL DETERMINE WHICH 
                     //STATE NEXT BASED ON DECODED INSTRUCTION
                     //BEQ_1  => BRANCH IF EQUAL
                     //BNQ_1  => BRANCH IF NOT EQUAL
                     //BLEZ_1 => BRANCH IF LESS/EQUAL THAN ZERO
                     //BGTZ_1 => BRANCH IF GREATER THAN ZERO
                     case  (TOP.cu.iu.IR_Out[31:26])
                        //branch instructions
                        6'h04    : state = BEQ_1;
                        6'h05    : state = BNQ_1;
                        6'h06    : state = BLEZ_1;
                        6'h07    : state = BGTZ_1;
                        default  : state = ILLEGAL_OP;
                     endcase
                  end //end of BRANCH TYPE
                  else if(TOP.cu.iu.IR_Out[31:26] == 6'h1F)
                  begin 
                     //it is an ENHANCEMENT format
                     //control word assigments: 
                     // RS <-- $rs
                     // RT <-- $rt (default) 
                     $display("ENHANCEMENT KEY CALLED");
                     intr_ack                     = 1'b0;
                     {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                     //PC signals
                     {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                     //Instruction Memory signals
                     {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                     //register file signals
                     {D_En, DA_sel}               = 3'b0_00;
                     //ALU signals
                     {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                     //Data Memory signals
                     {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                     //Function Select
                     FS                           = 5'h0;
                     //NEXT STATE
                     case(TOP.cu.iu.IR_Out[5:0])
                        //ENHANCE ROTATES
                        6'h00:   state = RR;
                        6'h01:   state = RL;
                        //JUMP W/ FLAGS
                        6'h02:   state = JV;
                        6'h03:   state = JN;
                        6'h04:   state = JZ;
                        6'h05:   state = JC;
                        //VECTOR OPERTION
                        6'h06:   state = MVGPR;
                        6'h07:   state = MVVPR;
                        6'h08:   state = VADDUS;
                        6'h09:   state = MULADD;
                        6'h0A:   state = MULEI;
                        6'h0B:   state = MULOI;
                        6'h0C:   state = MRGLO;
                        6'h0D:   state = MRGHI;
                        6'h0E:   state = VCMPE; 
                        6'h0F:   state = VCLTU;
                        default: state = ILLEGAL_OP;
                     endcase
                  end //end of ENHANCEMENT TYPE
                  else if(TOP.cu.iu.IR_Out[31:26] == 6'h00)
                  begin
                     //it is an R-type format
                     //control word assigments: 
                     // RS <-- $rs
                     // RT <-- $rt (default)    
                     //IO signals
                     intr_ack                     = 1'b0;
                     {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                     //PC signals
                     {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                     //Instruction Memory signals
                     {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                     //register file signals
                     {D_En, DA_sel}               = 3'b0_00;
                     //ALU signals
                     {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                     //Data Memory signals
                     {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                     //Function Select
                     FS                           = 5'h0;
                     //CASE STTEMENT THAT WILL DETERMINE WHICH 
                     //STATE NEXT BASED ON DECODED INSTRUCTION
                     //ADD    => SIGNED ADDITION
                     //ADDU   => UNSIGNED ADDITION
                     //SUB    => SIGNED SUBTRACTION
                     //SUBU   => UNSIGNED SUBTRACTION
                     //SLL    => SHIFT LEFT LOGICAL
                     //SRL    => SHIFT RIGHT LOGICAL
                     //SLT    => SEE LESS THAN
                     //SLTU   => SEE LESS THAN UNSIGNED
                     //MULT   => MULTIPLICATION
                     //DIV    => DIVISION
                     //MFHI   => MOVE FROM HI REG
                     //MFLO   => MOVE FROM LO REG
                     //AND    => LOGICAL AND
                     //OR     => LOGICAL OR
                     //XOR    => LOGICAL XOR
                     //NOR    => LOGICAL NOR
                     //JR     => JUMP REGISTER
                     //SETIE  => SET INTERRUPT ENABLE
                     case (TOP.cu.iu.IR_Out[5:0])
                        //add & subtract
                        6'h20  :  state = ADD;
                        6'h21  :  state = ADDU;
                        6'h22  :  state = SUB;
                        6'h23  :  state = SUBU;
                        
                        //shift
                        6'h00  :  state = SLL;
                        6'h02  :  state = SRL;
                        6'h03  :  state = SRA;
                        
                        //comparison
                        6'h2A  :  state = SLT;
                        6'h2B  :  state = SLTU;
                        
                        //multiply & divide
                        6'h18  :  state = MULT;
                        6'h1A  :  state = DIV;
                        
                        //write back instruction
                        6'h10  :  state = MFHI;
                        6'h12  :  state = MFLO;
                        
                        //bit logic 
                        6'h24  :  state = AND;
                        6'h25  :  state = OR;
                        6'h26  :  state = XOR;
                        6'h27  :  state = NOR;
                            
                        //jump
                        6'h08  :  state = JR;
                        
                        //interrupt
                        6'h1F  :  state = SETIE;
                        
                        //break & illegal_op
                        6'h0D  :  state = BREAK;
                        default:  state = ILLEGAL_OP;
                     endcase
                  end //end of R-type
                  else
                  begin
                     //it is an I-type or J-type format
                     //control word assigments:
                     //RS <-- $rs
                     //RT <-- DT(se_16)                                     
                     //IO signals
                     intr_ack                     = 1'b0;
                     {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                     //PC signals
                     {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                     //Instruction Memory signals
                     {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;         
                     //register file signals
                     {D_En, DA_sel}               = 3'b0_00;
                     //ALU signals
                     {T_sel, HILO_ld, Y_sel}      = 5'b1_0_000;
                     //Data Memory signals
                     {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                     //Function Select
                     FS                           = 5'h0;
                     //CASE STTEMENT THAT WILL DETERMINE WHICH 
                     //STATE NEXT BASED ON DECODED INSTRUCTION
                     //LUI       => LOAD UPPER IMMEDIATE 
                     //LW        => LOAD WORD
                     //SW        => STORE WORD
                     //ADDI      => ADD IMMEDIATE
                     //JUMP      => JUMP
                     //JAL       => JUMP AND LINK
                     //SLTI      => SEE LESS THAN IMMEDIATE
                     //SLTUI     => SEE LESS THAN UNSIGNED IMMEDIATE
                     //ANDI      => AND IMMEDIATE
                     //ORI       => OR IMMEDIATE
                     //XORI      => XOR IMMEDIATE
                     //INPUT     => INPUT VALUE FROM EXTERNAL
                     //OUTPUT    => OUTPUT VALUE FROM EXTERNAL
                     //RETIE     => RETURN FROM INTERRUPT
                     case  (TOP.cu.iu.IR_Out[31:26])
                        //load & store 
                        6'h0F    : state = LUI;
                        6'h23    : state = LW;
                        6'h2B    : state = SW;
                        
                        //add instruction
                        6'h08    : state = ADDI;
                        
                        //jumps
                        6'h02    : state = JUMP;
                        6'h03    : state = JAL;
                        
                        //comparison
                        6'h0A    : state = SLTI;
                        6'h0B    : state = SLTIU;
                        
                        //bit-logical
                        6'h0C    : state = ANDI;
                        6'h0D    : state = ORI;
                        6'h0E    : state = XORI;
                        
                        //IO 
                        6'h1C    : state = INPUT;
                        6'h1D    : state = OUTPUT;
                        
                        //interrupt
                        6'h1E    : state = RETIE;
                        //illegal op
                        default  : state = ILLEGAL_OP;
                     endcase
                  end //end of else for I-type or J-type formats
               end // end of DECODE
            MVGPR:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h00;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b1_1_0;
                  from_VEC                     = 1'b0;
                  //Next State
                  state                        = FETCH;
               end
            MVVPR:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h0B;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                  from_VEC                     = 1'b0;
                  //Next State
                  state                        = MVVPR_1;
               end
            MVVPR_1:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h0B;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_1;
                  from_VEC                     = 1'b1;
                  //Next State
                  state                        = MVVPR_2;
               end
            MVVPR_2:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_01;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h0B;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                  from_VEC                     = 1'b1;
                  //Next State
                  state                        = FETCH;
               end
            WB_VREG:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h00;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b1_0_0;
                  from_VEC                     = 1'b0;
                  //Next State
                  state                        = FETCH;
               end
            VCLTU:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h0A;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                  from_VEC                     = 1'b0;
                  //Next State
                  state                        = WB_VREG;
               end
            VCMPE:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h09;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                  from_VEC                     = 1'b0;
                  //Next State
                  state                        = WB_VREG;
               end
            MRGHI:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h07;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                  from_VEC                     = 1'b0;
                  //Next State
                  state                        = WB_VREG;
               end
            MRGLO:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h06;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                  from_VEC                     = 1'b0;
                  //Next State
                  state                        = WB_VREG;
               end
            VADDUS:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h00;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                  from_VEC                     = 1'b0;
                  //Next State
                  state                        = WB_VREG;
               end
            MULADD:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h01;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                  from_VEC                     = 1'b0;
                  //Next State
                  state                        = WB_VREG;
               end
            MULEI:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h02;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                  from_VEC                     = 1'b0;
                  //Next State
                  state                        = WB_VREG;
               end
            MULOI:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function State
                  FS                           = 5'h03;
                  //ENHANCE controls
                  {wr_flg, ld_flg, j_flg}      = 3'b0_0_0;
                  {SIMD_DEN, from_GPR, v_sel}  = 3'b0_0_0;
                  from_VEC                     = 1'b0;
                  //Next State
                  state                        = WB_VREG;
               end
            BEQ_1:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h05;
                  state                        = BEQ_2;
                  
               end
            BEQ_2:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = (z == 1'b1) ? 4'b1_0_11:
                                                               4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b1_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h05;
                  state                        = FETCH;
               end
            BNQ_1:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h05;
                  state                        = BNQ_2;
               end
            BNQ_2:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = (z == 1'b0) ? 4'b1_0_11:
                                                               4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b1_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            BLEZ_1:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b1_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h1A;
                  state                        = BLEZ_2;
               end
            BLEZ_2:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = (z == 1'b1) ? 4'b1_0_11:
                                                               4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b1_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h1A;
                  state                        = FETCH;
               end
            BGTZ_1:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b1_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h1B;
                  state                        = BGTZ_2;
               end
            BGTZ_2:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = (z == 1'b1) ? 4'b1_0_11:
                                                               4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b1_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h1B;
                  state                        = FETCH;
               end
            MULT:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_1_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h1E;
                  state                        = WB_alu;
               end //end of MULT
            DIV:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_1_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h1F;
                  state                        = WB_alu;
               end //end of DIV
            ADD:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h02;
                  state                        = WB_alu;
               end //end of ADD
            SUB:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h04;
                  state                        = WB_alu;
               end //end of SUB
            SUBU:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h05;
                  state                        = WB_alu;
               end //end of SUBU
            ADDI:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h02;
                  state                        = WB_imm;
               end //end of ADDI
            AND:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h08;
                  state                        = WB_alu; 
               end //end of AND
            OR:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h09;
                  state                        = WB_alu; 
               end //end of OR
            XOR:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h0A;
                  state                        = WB_alu; 
               end //end of XOR
            NOR:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h0B;
                  state                        = WB_alu; 
               end //end of NOR

            SRL:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h0d;
                  state                        = WB_alu;
               end //end of SRL
            SRA:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h0e;
                  state                        = WB_alu;
               end //end of SRA
            SLL:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h0c;
                  state                        = WB_alu;
               end //end of SLL
            RR:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h1C;
                  state                        = WB_alu;
               end //end of SLL
           RL:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h1D;
                  state                        = WB_alu;
               end //end of SLL
           SLT:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h06;
                  state                        = WB_alu;
               end //end of SLT
            SLTU:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h07;
                  state                        = WB_alu;
               end //end of SLTU
            SLTI:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h06;
                  state                        = WB_imm;
               end //end of SLTI
            SLTIU:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h07;
                  state                        = WB_imm;
               end //end of SLTIU
            ANDI:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h16;
                  state                        = WB_imm; 
               end //end of ANDI
            XORI:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h18;
                  state                        = WB_imm; 
               end //end of XORI
            ORI:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b1;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b1_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h17;
                  state                        = WB_imm;
               end
            LUI:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b1_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h19;
                  state                        = WB_imm;
               end
            LW:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h02;
                  state                        = LW_2;
               end
            LW_2:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b1_0_1;
                  //Function Select
                  FS                           = 5'h02;
                  state                        = LW_3; 
               end
            LW_3:
               @(negedge sys_clk)
               if(mrdy)
                  begin
                     //IO signals
                     intr_ack                     = 1'b0;
                     {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                     //PC signals
                     {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                     //Instruction Memory signals
                     {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                     //register file signals
                     {D_En, DA_sel}               = 3'b1_01;
                     //ALU signals
                     {T_sel, HILO_ld, Y_sel}      = 5'b0_0_011;
                     //Data Memory signals
                     {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                     //Function Select
                     FS                           = 5'h02;
                     state                        = FETCH; 
                  end
               else
                  $display("MEM IS NOT READY");
            SW:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h02;
                  state                        = WB_mem;
               end
            
            JUMP:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b1_0_01;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            JC:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = (c == 1'b1) ? 4'b1_0_01:
                                                               4'b0_0_00;
                   j_flg                       = 1'b1;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            JV:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = (v == 1'b1) ? 4'b1_0_01:
                                                               4'b0_0_00;
                   j_flg                       = 1'b1;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            JN:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = (n == 1'b1) ? 4'b1_0_01:
                                                               4'b0_0_00;
                   j_flg                       = 1'b1;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            JZ:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = (z == 1'b1) ? 4'b1_0_01:
                                                               4'b0_0_00;
                   j_flg                       = 1'b1;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            JAL:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_10;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_100;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = JUMP;
               end
            JR:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = JR_2;
               end
            JR_2:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b1_0_10;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            WB_alu:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            WB_imm:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_01;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            WB_mem:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b1_1_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            MFHI:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_010;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            MFLO:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_001;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            INPUT:
                @(negedge sys_clk)
               begin 
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_1;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h02;
                  state                        = INPUT_1;
               end
            INPUT_1:
                @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b1_1_0_1;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h02;
                  state                        = INPUT_2;
               end
            INPUT_2:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b1_1_0_1;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_01;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_011;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h02;
                  state                        = FETCH; 
               end
            OUTPUT:
               @(negedge sys_clk)
               begin 
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h02;
                  state                        = OUTPUT_2;
               end
            OUTPUT_2:
               @(negedge sys_clk)
               begin
                  //IO signals
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b1_0_1_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            BREAK:
               @(negedge sys_clk)
               begin
                  $display("BREAK INSTRUCTION FETCHED %t", $time);
                  //control word assigments for "deasserting" everything
                  
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                   
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  
                  //Function Select
                  FS                           = 5'h0;
                  
                  $display("R E G I S T E R ' S      A F T E R      B R E A K");
                  $display(" ");
                  $display("G E N E R A L       P U R P O S E        R E G I S T E R");
                  Dump_Register();
                  $display(" ");
                  $display("V E C T O R       P U R P O S E        R E G I S T E R");
                  Dump_VRegister();
                  $display(" ");
                  $display("D A T A         M E M O R Y");
                  Dump_Mem();
                  $display(" ");
                  $display("I N P U T        O U T P U T        M E M O R Y");
                  Dump_IO();                                    
                  $finish;
               end
            ILLEGAL_OP:
               @(negedge sys_clk)
               begin
                  $display("ILLEGAL OPCODE FETCHED %t", $time);
                  Dump_PC_and_IR();
                  //control word assigments for "deasserting" everything
                  
                  //IO signals
                  intr_ack                     = 1'b0;
                  ld_flg                       = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                   
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  
                  //Function Select
                  FS                           = 5'h0;
                  Dump_Register;
                  Dump_PC_and_IR;
                  $finish;
               end
            RETIE:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b0_0;
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = RETIE_2;
               end
            RETIE_2:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b0_0;
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b1_0_1;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = RETIE_3;
               end
            RETIE_3:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b1_0;
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b1_0_1;
                  //Function Select
                  FS                           = 5'h12;
                  state                        = RETIE_4;
               end
            RETIE_4:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b0_0;
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_11;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b1_0_1;
                  //Function Select
                  FS                           = 5'h12;
                  state                        = RETIE_5;
               end
            RETIE_5:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b0_0;
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_11;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b1_0_1;
                  //Function Select
                  FS                           = 5'h12;
                  state                        = RETIE_6;
               end
            RETIE_6:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b0_0;
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b1_0_10;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_11;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_011;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h12;
                  state                        = RETIE_7;
               end
            RETIE_7:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b0_0;
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_11;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            INTR_1:
               @(negedge sys_clk)
               begin
                  //LOAD THE FLAGS
                  {wr_flg, ld_flg}             = 2'b0_1;
                  //IO signals
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_10;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_100;
                  {S_sel, F_sel, P_sel}        = 3'b0_0_0;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h15;
                  state                        = INTR_2;
               end
            INTR_2:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b0_0;
                  intr_ack                     = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  {S_sel, F_sel,   P_sel}      = 3'b1_0_0;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b1_0_1;
                  //Function Select
                  FS                           = 5'h11;
                  state                        = INTR_3;
               end
            INTR_3:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b0_0;
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b1_0_10;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_011;
                  {S_sel, F_sel, P_sel}        = 3'b1_0_1;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h11;
                  state                        = INTR_4;
               end
            INTR_4:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b0_0;
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_11;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  {S_sel, F_sel, P_sel}        = 3'b1_0_1;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b1_1_0;
                  //Function Select
                  FS                           = 5'h11;
                  state                        = INTR_5;
               end
            INTR_5:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b0_0;
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  {S_sel, F_sel, P_sel}        = 3'b1_0_0;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h11;
                  state                        = INTR_6;
               end
            INTR_6:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b0_0;
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  {S_sel, F_sel, P_sel}        = 3'b1_1_0;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h11;
                  state                        = INTR_7;
               end
            INTR_7:
               @(negedge sys_clk)
               begin
                  {wr_flg, ld_flg}             = 2'b0_0;
                  {intr_ack, ie}               = 2'b0_0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b1_11;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  {S_sel, F_sel, P_sel}        = 3'b0_1_0;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b1_1_0;
                  //Function Select
                  FS                           = 5'h00;
                  state                        = FETCH;
               end
            SETIE:
               @(negedge sys_clk)
               begin
                  //IO signals
                  {intr_ack, ie}               = 2'b0_1;
                  ld_flg                       = 1'b0;
                  {cs, rd, wr, io_dm}          = 4'b0_0_0_0;
                  //PC signals
                  {pc_ld, pc_inc, pc_sel}      = 4'b0_0_00;
                  //Instruction Memory signals
                  {ir_ld, im_cs, im_rd, im_wr} = 4'b0_0_0_0;
                  //register file signals
                  {D_En, DA_sel}               = 3'b0_00;
                  //ALU signals
                  {T_sel, HILO_ld, Y_sel}      = 5'b0_0_000;
                  //Data Memory signals
                  {dm_cs, dm_wr, dm_rd}        = 3'b0_0_0;
                  //Function Select
                  FS                           = 5'h15;
                  state                        = FETCH;
               end
         endcase
   
   /*
      The purpose of the Register Dump task is to 
      display the first 16 register 0 - 31 in a 
      ex: time: 300 ns R[0]: 0x00000000 
      format
   */
   task Dump_Register;
      //for loop to go through first 16 registers
      for(i = 0; i < 16; i = i + 1)
         //cannot display the output with T because 
         //there is no access to T_Addr allowing reg value
         //to be display the T wire 
         //intead use the display below to see inner value.
         $display("time: %t ns\t R[%0d]: %h || R[%0d]: %h", 
                   $time, 
                   i, 
                   TOP.cu.id.regfile.REG[i],
                   (i+16),
                   TOP.cu.id.regfile.REG[i+16]);
   endtask
   
   /*
      The purpose of the Register Dump task is to 
      display the first 16 register 0 - 31 in a 
      ex: time: 300 ns R[0]: 0x00000000 
      format
   */
   task Dump_VRegister;
      //for loop to go through first 16 registers
      for(i = 0; i < 16; i = i + 1)
         //cannot display the output with T because 
         //there is no access to T_Addr allowing reg value
         //to be display the T wire 
         //intead use the display below to see inner value.
         $display("time: %t ns\t V[%0d]: %h || V[%0d]: %h", 
                   $time, 
                   i, 
                   TOP.cu.vu.Vregfile.REG[i],
                   (i+16),
                   TOP.cu.vu.Vregfile.REG[i+16]);
   endtask
   
   /*
      The purpose of the PC and IR Dump task is to 
      display the PC register and IR register in a 
      ex: 
      time: 300 ns PC[0]: 0x00000000
      time: 300 ns IR[0]: 0x00000000
      format
   */
   task  Dump_PC_and_IR;
      begin
         $display("time: %t ns\t PC: %h", $time, TOP.cu.iu.PC_Reg);
         $display("time: %t ns\t IR: %h", $time, TOP.cu.iu.IR_Reg);
      end
   endtask
   
   task  Dump_Mem;
      begin
         $display("time:%t ns\t M[0C0]=%h", $time, 
                                            {TOP.dm.MEMORY[12'h0C0],
                                             TOP.dm.MEMORY[12'h0C1],
                                             TOP.dm.MEMORY[12'h0C2],
                                             TOP.dm.MEMORY[12'h0C3]});
         $display("time:%t ns\t M[0C4]=%h", $time, 
                                            {TOP.dm.MEMORY[12'h0C4],
                                             TOP.dm.MEMORY[12'h0C5],
                                             TOP.dm.MEMORY[12'h0C6],
                                             TOP.dm.MEMORY[12'h0C7]});
         $display("time:%t ns\t M[0C8]=%h", $time, 
                                            {TOP.dm.MEMORY[12'h0C8],
                                             TOP.dm.MEMORY[12'h0C9],
                                             TOP.dm.MEMORY[12'h0CA],
                                             TOP.dm.MEMORY[12'h0CB]});
         $display("time:%t ns\t M[0CC]=%h", $time, 
                                            {TOP.dm.MEMORY[12'h0CC],
                                             TOP.dm.MEMORY[12'h0CD],
                                             TOP.dm.MEMORY[12'h0CE],
                                             TOP.dm.MEMORY[12'h0CF]});
         $display("time:%t ns\t M[0D0]=%h", $time, 
                                            {TOP.dm.MEMORY[12'h0D0],
                                             TOP.dm.MEMORY[12'h0D1],
                                             TOP.dm.MEMORY[12'h0D2],
                                             TOP.dm.MEMORY[12'h0D3]});
         $display("time:%t ns\t M[0D8]=%h", $time, 
                                            {TOP.dm.MEMORY[12'h0D8],
                                             TOP.dm.MEMORY[12'h0D9],
                                             TOP.dm.MEMORY[12'h0DA],
                                             TOP.dm.MEMORY[12'h0DB]});
          $display("time:%t ns\t M[0DC]=%h", $time, 
                                            {TOP.dm.MEMORY[12'h0DC],
                                             TOP.dm.MEMORY[12'h0DD],
                                             TOP.dm.MEMORY[12'h0DE],
                                             TOP.dm.MEMORY[12'h0DF]}); 
      end
   endtask
   
   task  Dump_IO;
      begin
         $display("time:%t ns\t IO[0C0]=%h", $time, 
                                            {TOP.io.mem[12'h0C0],
                                             TOP.io.mem[12'h0C1],
                                             TOP.io.mem[12'h0C2],
                                             TOP.io.mem[12'h0C3]});
         $display("time:%t ns\t IO[0C4]=%h", $time, 
                                            {TOP.io.mem[12'h0C4],
                                             TOP.io.mem[12'h0C5],
                                             TOP.io.mem[12'h0C6],
                                             TOP.io.mem[12'h0C7]});
         $display("time:%t ns\t IO[0C8]=%h", $time, 
                                            {TOP.io.mem[12'h0C8],
                                             TOP.io.mem[12'h0C9],
                                             TOP.io.mem[12'h0CA],
                                             TOP.io.mem[12'h0CB]});
         $display("time:%t ns\t IO[0CC]=%h", $time, 
                                            {TOP.io.mem[12'h0CC],
                                             TOP.io.mem[12'h0CD],
                                             TOP.io.mem[12'h0CE],
                                             TOP.io.mem[12'h0CF]});
         $display("time:%t ns\t IO[0D0]=%h", $time, 
                                            {TOP.io.mem[12'h0D0],
                                             TOP.io.mem[12'h0D1],
                                             TOP.io.mem[12'h0D2],
                                             TOP.io.mem[12'h0D3]});
         $display("time:%t ns\t IO[0D8]=%h", $time, 
                                            {TOP.io.mem[12'h0D8],
                                             TOP.io.mem[12'h0D9],
                                             TOP.io.mem[12'h0DA],
                                             TOP.io.mem[12'h0DB]});
          $display("time:%t ns\t IO[0DC]=%h", $time, 
                                            {TOP.io.mem[12'h0DC],
                                             TOP.io.mem[12'h0DD],
                                             TOP.io.mem[12'h0DE],
                                             TOP.io.mem[12'h0DF]}); 
      end
   endtask 
   
endmodule
