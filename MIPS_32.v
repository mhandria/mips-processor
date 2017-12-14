`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  MIPS_32.v
 * Project:    Lab_Assignment_1
 * Designer:   Michael Handria
 *             Liam    Howland
 * Email:      michaelhandria@gmail.com
 *             howland.liam@gmail.com
 * Rev. No.:   Version 1.0
 * Rev. Date:  9/6/2017
 *
 * Purpose:    Holds the other instruction sets of the MIPS processor
 *             - output will result in a 32-bit data
 *
 * Notes:      9/6: not tested yet will test later
 *             9/7: updated and added flags according to specification
 *             9/7: all falgs added ACCORDINGLY, except for:
 *                      - logical immediate
 *                      - ZEROS
 *                      - ONES
 *                      - SP_INIT
 *             9/8: discussed with professor all flags are set 
 *                  accordingly now
 *           11/27: added a RR, BLEZ, BGTZ, RL instruction.
 ****************************************************************************/
module MIPS_32(S, T, Y_lo, FS, shamnt, C, Z, N, V);
	
   /*INPUT DECLERATION*/
	input 	[31:0]	S, T;       
	input		[ 4:0] 	FS;         //Function Select
   input    [ 4:0]   shamnt;
	
   /*OUTPUT DECLERATION*/
	output				N, C, Z, V; //flag status
	output	[31:0]	Y_lo;       //32-bit output
	
   //REGISTER DECLERATION
	reg		[31:0] 	Y_lo;
	reg					C, V;
   
   //INTEGER DECLERATION
   integer           S_int, T_int;
	
   //OP CODE DECLERATION AS PARAMETERS
	parameter	PASS_S  = 5'h00,	PASS_T  = 5'h01,	ADD	  = 5'h02,
					ADDU	  = 5'h03,	SUB	  = 5'h04,	SUBU 	  = 5'h05,
					SLT	  = 5'h06,	SLTU	  = 5'h07,	AND	  = 5'h08,
					OR		  = 5'h09,	XOR	  = 5'h0A,	NOR	  = 5'h0B,
					ANDI	  = 5'h16,	ORI	  = 5'h17, 	XORI	  = 5'h18,
               SLL	  = 5'h0C,	SRL	  = 5'h0D,	SRA	  = 5'h0E,
					LUI	  = 5'h19,	INC	  = 5'h0F, 	DEC	  = 5'h10,
					INC4	  = 5'h11, 	DEC4	  = 5'h12,	ZEROS	  = 5'h13,
					ONES	  = 5'h14, 	SP_INIT = 5'h15,  BLEZ    = 5'h1A,
               BGTZ    = 5'h1B,  RR      = 5'h1C,  RL      = 5'h1D; 
	
	
   assign   Z	       = (Y_lo == 32'b0);
   assign   N         = (FS   == ADDU || FS == SUBU || FS == SLTU) ? 1'b0:
                         Y_lo[31];
   integer  i;                     
   //this always block holds 90% of the logic
	always @ *	begin
      //initialize all flag, besides Z, 
      //to x first
		C = 1'bx;
		V = 1'bx;
      S_int = S;
      T_int = T;
      //case statement to determine which 
      //function to execute
		case(FS)
         //pass S to Y_lo
			PASS_S :    Y_lo      = S;
         
         //pass T to Y_lo
			PASS_T :    Y_lo      = T;
         
         //signed addition w/ logic to update flags C, V, Z & N
			ADD : 
         begin
				{C, Y_lo} = S+T; 
				V         = ((Y_lo[31] != T[31])&(T[31] == S[31]));
			end
         
         //unsigned addition w/ logic to update flag V, Z & C
			ADDU : 
         begin
				{C, Y_lo} = S+T; 
				V			 = C;
			end
         
         //signed subtraction w/ logic to update flag C, N, Z & V
			SUB : 
         begin
				{C, Y_lo} = S-T; 
				V			 = ((S[31] == 1'b0) & (T[31]&Y_lo[31])) ? 1'b1:
                        ((S[31] == 1'b1) & ((T[31]|Y_lo[31]) == 1'b0)) ? 1'b1:
                        1'b0;    
			end
         
         //unsigned subtraction w/ logic to update flag C, N, Z & V
			SUBU : 
         begin
				{C, Y_lo} = S-T;
				V			 = C;
			end
         
         //signed comparison of less than w/ logic to update flag N, Z & V
			SLT : 
         begin
            S_int     = S;
            T_int     = T;
            Y_lo      = S_int < T_int;
			end
         
         //unsigned comparison of less than w/ logic to update N & Z
			SLTU     :     Y_lo      = S < T;

         
         //signed logical AND operation w/ logic to update N & Z
			AND      :	   Y_lo		 = S & T;
         
         //signed logical OR operation w/ logic to update N & Z
			OR       :     Y_lo		 = S | T;
         //singed logical XOR operation w/ logic to update N & Z
			XOR      :     Y_lo		 = S ^ T;
         
         //signed logical NOR operation w/ logic to update N & Z
         NOR      :     Y_lo      = ~(S | T);
         
         //Imediate AND operation
			ANDI     : 	   Y_lo  = S & {16'h0, T[15:0]};
         
         //Imediate OR operation
			ORI      :	   Y_lo	= S | {16'h0, T[15:0]};
         
         //Imediate XOR operation
			XORI     :	   Y_lo  = S ^ {16'h0, T[15:0]};
         
         //Load Upper Immediate 
			LUI      :	   Y_lo	    = {T[15:0], 16'h0};
         
         SLL      :  {C, Y_lo}	 = T <<  (shamnt);
         SRL      :  {Y_lo, C}	 = T >>  (shamnt-1);
         SRA      : 
         begin
            if(T[31] == 1'b1)
               {Y_lo, C}    = {32{1'b1}} <<  {32-shamnt}| T >> (shamnt-1);
            else
               {Y_lo, C}    = T >> (shamnt-1);
         end
         RR       :  Y_lo         = T <<  (32-shamnt)  | T >> (shamnt);
         RL       :  Y_lo         = T >>  (32-shamnt)  | T << (shamnt);
         //increment S by one w/ logic to update V, C, N & Z
			INC      :	
         begin
				{C, Y_lo} = S + 1'b1;
            V         = (S[31] == 1'b0) & (Y_lo[31] == 1'b1);
			end
         
         //decrement S by one w/ logic to update V, C, N & Z
			DEC      :	
         begin
            {C, Y_lo} = S - 1'b1;
            V         = (S[31] == 1'b1) & (Y_lo[31] == 1'b0);
         end
         
         //increment S by four w/ logic to update V, C, N & Z
			INC4     :	
         begin
				{C, Y_lo} = S + 4;
				V         = (S[31] == 1'b0) & (Y_lo[31] == 1'b1);
			end
         
         //decrement S by four w/ logic to update V, C, N & Z
			DEC4     :	
         begin
            {C, Y_lo} = S - 4;
            V         = (S[31] == 1'b1) & (Y_lo[31] == 1'b0);
         end
         
         //change the output to 0's 
			ZEROS    :     Y_lo		 = 32'b0;
         
         
         //change the output to 1's
			ONES     :	   Y_lo		 = 32'hFFFFFFFF;
         
         //initalize Y_lo to stack pointer of 32'h3FC
			SP_INIT	:	   Y_lo		 = 32'h3FC;
         
         //branch if s is less than or equal to zero
         BLEZ     :     Y_lo      = (S_int <= 0) ? 32'b0: 32'hFFFFFFFF;
         
         //branch if s is greater than zero
         BGTZ     :     Y_lo      = (S_int > 0) ? 32'b0: 32'hFFFFFFFF;
         
         //the default will be execute PASS_S;
         default  :     Y_lo      = S;
         
		endcase
	end			
					
	
endmodule
