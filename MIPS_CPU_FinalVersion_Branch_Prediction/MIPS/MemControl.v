`timescale 1ns / 1ps

module MemControl(
input clk,
input [31:0] PC,
output [31:0] Instr,
input [31:0] EM_ALUResult,
input [31:0] EM_WriteData,
input EM_MemRead,
input EM_MemWrite,
input read_mem_en,
input [5:0] read_mem_addr,
//input exe_intr,
//input LD_INTS,
output [31:0] ReadData,
output reg INTS_end,
output reg branch_taken,
//output reg branch_utaken,
output reg [31:0] PC_Predict
    );
wire [31:0] RD;
reg [8:0] Data_Addr;
wire [7:0] Instr_Addr;
wire [31:0] SignImm;
assign SignImm[31:16]=16'hffff;
assign SignImm[15:0]=Instr[15:0];
assign Instr_Addr=PC[9:2];
//assign Data_Addr=(read_mem_en==1'b1)?read_mem_addr:EM_ALUResult[10:2];
assign ReadData=(EM_MemRead==1'b1||read_mem_en==1'b1)?RD:32'h0;

always@(*)
begin
	if(Instr[31:26]==6'b000100||Instr[31:26]==6'b000111||Instr[31:26]==6'b000101)
	begin
		if(Instr[15]==1'b1)//imm is negative
		begin
			branch_taken=1'b1;
			//branch_utaken=1'b0;
			PC_Predict=PC+32'h4+(SignImm<<2);
		end
		else
		begin
			branch_taken=1'b0;
			//branch_utaken=1'b1;
			PC_Predict=32'h0;
		end
	end
	else
	begin
		branch_taken=1'b0;
		//branch_utaken=1'b0;
		PC_Predict=32'h0;
	end
end

always@(posedge clk)
begin
	if(Instr[31:26]==6'b111111)
		INTS_end=1'b1;
	else INTS_end=1'b0;
end

always@(*)
begin
	if(read_mem_en==1'b1)
	begin
		Data_Addr[5:0]=read_mem_addr;
		Data_Addr[8:6]=3'h0;
	end
	else Data_Addr=EM_ALUResult[10:2];
end


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