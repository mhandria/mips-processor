`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:26 11/25/2017 
// Design Name: 
// Module Name:    SIMD_PATH 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SIMD_PATH(clk, reset, 
                 s_ld, t_ld, d_ld, 
                 ADDRS, FS);
                 
   input        clk, reset;
   input [31:0] S_ADDRS, T_ADDRS, D_ADDRS;
   input [ 4:0] FS;
   
   
   
   reg   [ 7:0] C, N, Z, V;
   reg   [31:0] SA_REG, TA_REG, DA_REG;
      
   
   always @ (posedge clk, posedge reset) 
      begin
      case({s_ld, t_ld, d_ld})
         3'b001:  
            begin
            SA_REG <= SA_REG;
            TA_REG <= TA_REG;
            DA_REG <= ADDRS;
            end
         3'b010:
            begin
            SA_REG <= SA_REG;
            TA_REG <= ADDRS;
            DA_REG <= DA_REG;
            end
         3'b011:
            begin
            SA_REG <= SA_REG;
            TA_REG <= ADDRS
            DA_REG <= ADDRS;
            end
         3'b100:
            begin
            SA_REG <= ADDRS;
            TA_REG <= TA_REG;
            DA_REG <= DA_REG;
            end
         3'b101:
            begin
            SA_REG <= ADDRS;
            TA_REG <= TA_REG;
            DA_REG <= ADDRS;
            end
         3'b110:
            begin
            SA_REG <= ADDRS;
            TA_REG <= ADDRS;
            DA_REG <= DA_REG;
            end
         3'b111:
            begin
            SA_REG <= ADDRS;
            TA_REG <= ADDRS;
            DA_REG <= ADDRS;
            end
         default:
            begin
            SA_REG <= SA_REG;
            TA_REG <= TA_REG;
            DA_REG <= DA_REG;
            end
      endcase
      end
         
   
   
   
   
   
endmodule
