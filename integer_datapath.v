`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  integer_datapath.v
 * Project:    Lab_Assignment_5
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 2.0
 * Rev. Date:  10/16/2017
 *
 * Purpose:    This allows the register file to communicate with the 
 *             Arithmatic Logic Unit (ALU).  The module also comes with 2 muxes 
 *             and a register for Y_lo and Y_hi for Multiply and Divide operation.
 *             2 Muxes
 *             - T-Mux => allows DT or T to go into ALU in place of T
 *             - Y-Mux => allows DY, Y, PC_in HI, or LO to go out as ALU_OUT 
 *
 * Notes:      9/30  - first made
 *             10/1  - added comment for clarity 
 *             10/5  - added pipelining including:
 *                     REG for S
 *                     REG for T
 *                     REG for ALU_out
 *                     REG for DY
 *             10/16 - added a mux for to sel between t_addr and d_addr
 *             10/26 - modified D_Mux and added PC_Mux for MCU 
 *
 ****************************************************************************/
module integer_datapath(clk, reset,
                        S_Addr, D_Addr, T_Addr, DA_sel, D_en, shamnt,
                        DT, T_sel, ld_flg, F_sel, wr_flg,
                        C, N, V, Z, D_Out, 
                        DY, PC_in, Y_sel, ALU_out, HILO_ld, FS,
                        GPR_DATA, V_DATA, from_VEC);

   /* INPUT DECLERATION */
   input             clk, reset;
   
   // Address inputs decleration
   input    [ 4:0]   S_Addr, D_Addr, T_Addr;
   //instruction code input wire
   input    [ 4:0]   FS;
   input    [ 4:0]   shamnt;
   
   //D_en      - allows writting to register file
   //T_sel     - select for T-MUX
   //S_sel     - select for S-MUX
   //HILO_ld   - allows load for register HI and LO
   //DA_sel    - allows T_Addr to be written to instead 
   //            of D_Addr
   input             D_en,   T_sel, F_sel, HILO_ld;
   input             ld_flg, wr_flg;
   input    [ 1:0]   DA_sel;
   
   //DT        - immediate value that can be passed through
   //            to the ALU
   //DY        - immediate value that can be passed through
   //            to the Y-MUX
   //PC_in     - program counter
   input    [31:0]   DT, DY, PC_in, V_DATA;
   input             from_VEC;
   
   //select for the Y-MUX
   input    [ 2:0]   Y_sel;
   
   /* OUTPUT DECLERTAION */
   //flags decleration
   output            C, Z, N, V;
   
   //32-bit output wire decleration 
   //ALU_out - comes out from Y-MUX
   output   [31:0]   ALU_out, D_Out;
   output   [63:0]   GPR_DATA;
   
   // WIRE DECLERATION
   wire     [31:0]   D, S, T, T_ALU, DATA_IN;
   wire     [31:0]   Y_hi, Y_lo;
   wire     [ 4:0]   Dest_Addr;
   wire              C_Out, Z_Out, V_Out, N_Out;
   
   
   // REGISTER DECLERATION
   reg      [31:0]   HI, LO;
   reg      [31:0]   ALU_Reg, DY_Reg;
   reg      [31:0]   RegS, D_Out;
   reg               C_Reg, Z_Reg, V_Reg, N_Reg;
   
   
   assign            GPR_DATA = {S, T};
   assign            DATA_IN  = (from_VEC) ? V_DATA : ALU_out;
   
   // instantiation of register file 
   // for the integer datapath
   regfile32   regfile(.clk(clk), 
                       .reset(reset), 
                       .D(DATA_IN), 
                       .D_En(D_en), 
                       .D_Addr(Dest_Addr), 
                       .S(S), 
                       .S_Addr(S_Addr), 
                       .T(T), 
                       .T_Addr(T_Addr));
                       
   // instantiation of ALU   
   ALU             ALU(.S(RegS), 
                       .T(D_Out), 
                       .FS(FS),
                       .shamnt(shamnt),
                       .Y_hi(Y_hi), 
                       .Y_lo(Y_lo), 
                       .C(C_Out), 
                       .V(V_Out), 
                       .N(N_Out), 
                       .Z(Z_Out));
   
   assign   {C,V,Z,N} = {C_Reg, V_Reg, Z_Reg, N_Reg};
   
   // register file for Y_hi and Y_lo
   always @ ( posedge clk, posedge reset ) begin
      // reset HI and LO register to 0 if reset is high
      if(reset) 
      begin
         {HI, LO} <= 64'b0;
         RegS     <= 32'b0;
         D_Out    <= 32'b0;
         ALU_Reg  <= 32'h0000_03FC;
         DY_Reg   <= 32'b0;
      end
      else
         begin
           if(wr_flg)
               {C_Reg, V_Reg, Z_Reg, N_Reg} <= DY[3:0];
           else if(ld_flg)
               {C_Reg, V_Reg, Z_Reg, N_Reg} <= {C_Out, V_Out, Z_Out, N_Out};
           else
               {C_Reg, V_Reg, Z_Reg, N_Reg} <= {C_Reg, V_Reg, Z_Reg, N_Reg};
            // on a posetive clk edge and if HILO_ld is asserted
            // change the value of the register of HI and LO
           if(HILO_ld)
               {HI, LO} <= {Y_hi, Y_lo};
           // if HILO_ld is not asserted then keep HI and LO the
           // same
           else
               {HI, LO} <= {HI, LO};
           RegS     <= S;
           D_Out    <= T_ALU;
           ALU_Reg  <= Y_lo;
           DY_Reg   <= DY;
         end
   end
   
   // T-Mux
   // if T_sel is high then T_ALU gets T
   // if T_sel is low then T_ALU gets DT
   assign          T_ALU     =  (F_sel) ? {28'b0, C_Reg, V_Reg, Z_Reg, N_Reg}: 
                                (T_sel) ? DT : 
                                          T  ; 
                                          
   
   assign          Dest_Addr = (DA_sel == 2'b01) ? T_Addr : 
                               (DA_sel == 2'b00) ? D_Addr :
                               (DA_sel == 2'b10) ? 31     :
                               (DA_sel == 2'b11) ? 29     :
                                D_Addr;
                                
   // Y-Mux
   // Y_sel == 3'b000 allows Y_lo to come out
   // Y_sel == 3'b001 allows LO register content to pass through
   // Y_sel == 3'b010 allows HI register content to pass through
   // Y_sel == 3'b011 allows DY (immediate value) to pass through
   // Y_sel == 3'b100 allows PC_in to pass through
   // default will fall into case 000 where Y_lo is pass through
   assign          ALU_out   =  (Y_sel == 3'b000) ? ALU_Reg:
                                (Y_sel == 3'b001) ? LO:
                                (Y_sel == 3'b010) ? HI:
                                (Y_sel == 3'b011) ? DY_Reg:
                                (Y_sel == 3'b100) ? PC_in:
                                                    ALU_Reg;
         
   

endmodule
