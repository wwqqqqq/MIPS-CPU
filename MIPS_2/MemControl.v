`timescale 1ns / 1ps

module MemControl(
input clk,
input [31:0] PC,
output [31:0] Instr,
input [31:0] EM_ALUResult,
input [31:0] EM_WriteData,
input EM_MemRead,
input EM_MemWrite,
output [31:0] ReadData
    );
wire [31:0] RD;
wire [8:0] Instr_Addr,Data_Addr;
assign Instr_Addr=PC[10:2];
assign Data_Addr=EM_ALUResult[10:2];
assign ReadData=(EM_MemRead==1)?RD:32'h0;



Data_Mem u_Data_Mem(
.a(Data_Addr),
.d(EM_WriteData),
.clk(clk),
.we(EM_MemWrite),
.spo(RD)
);

Instr_Mem u_Instr_Mem(
.a(Instr_Addr),
.spo(Instr)
);

endmodule
/*
module Data_Mem(
  a,
  d,
  clk,
  we,
  spo
);

input [8 : 0] a;
input [31 : 0] d;
input clk;
input we;
output [31 : 0] spo;

module Instr_Mem(
  a,
  spo
);

input [8 : 0] a;
output [31 : 0] spo;*/