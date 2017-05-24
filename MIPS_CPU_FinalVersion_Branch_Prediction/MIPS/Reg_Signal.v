`timescale 1ns / 1ps

module Reg_Signal(
input clk,
input rst_n,
input [31:0] Instr,
input [31:0] PCPlus4,
input [31:0] ReadData,
input Zero_bne,
input Zero_bgtz,
input [31:0] r1_dout,
input [31:0] r2_dout,
input [31:0] ALUResult,
input [31:0] alu_a,
input IF_Flush,
input IE_Flush,
input EM_Flush,
input branch_taken,
//input branch_utaken,
//input exe_intr,
//output INTS_end,
output [31:0] IE_PC,
output [1:0] FW_ALUSrc1,
output [1:0] FW_ALUSrc2,
output [4:0] IF_Rs,
output [4:0] IF_Rt,
output [4:0] IE_Shamt,
output [5:0] IE_Funct,
output [1:0] IE_ALUOp,
output [5:0] IE_Opcode,
output [31:0] IE_RegData1,
output [31:0] IE_RegData2,
output [25:0] EM_JAddr,
output [31:0] EM_PCPlus4,
output [31:0] IE_SignImm,
output [31:0] MW_WBData,
output [31:0] EM_WriteData,
output [4:0] MW_WBAddr,
output [31:0] EM_PCBranch,
output [31:0] EM_ALUResult,
output [31:0] EM_alu_a,
output [1:0] EM_jump,
output EM_MemWrite,
output EM_MemRead,
output EM_PCSrc,
output MW_RegWrite,
output PCWrite
//output Branch_Hazzard
    );

wire [31:0] IF_PCPlus4,IF_Instr;
wire [1:0] jump,IE_jump;
wire stall;
wire IFWrite;
wire MemtoReg,MemWrite,MemRead,Branch_bne,Branch_bgtz,Branch_beq;
wire [1:0] ALUOp,RegDst,IE_RegDst;
wire ALUSrc,RegWrite;
wire IE_Branch_bne,IE_Branch_bgtz,IE_Branch_beq,IE_ALUSrc;
wire IE_MemWrite,IE_MemRead,IE_RegWrite,IE_MemtoReg;
wire [4:0] IE_Rt,IE_Rd,IE_Rs,EM_WBAddr;
wire EM_RegWrite,EM_MemtoReg,MW_MemtoReg;
wire [25:0] IE_JAddr;
wire [31:0] IE_PCPlus4;
wire [1:0] FW_MemWDSrc;
wire [1:0] EM_RegDst;
wire IF_branch_taken;
wire IE_branch_taken;
assign IE_PC=IE_PCPlus4-32'h4;
assign IF_Rs=IF_Instr[25:21];
assign IF_Rt=IF_Instr[20:16];
assign IE_Rs=IE_JAddr[25:21];
assign IE_Rt=IE_JAddr[20:16];
assign IE_Rd=IE_JAddr[15:11];
assign IE_Shamt=IE_JAddr[10:6];
assign IE_Funct=IE_JAddr[5:0];

ControlUnit u_ControlUnit(
//input
.clk(~clk),
.rst_n(rst_n),
.IF_Instr(IF_Instr),
.EM_PCSrc(EM_PCSrc),
.EM_jump(EM_jump),
.stall(stall),
//.exe_intr(exe_intr),
//output
//.INTS_end(INTS_end),
.MemtoReg(MemtoReg),
.MemWrite(MemWrite),
.MemRead(MemRead),
.Branch_bne(Branch_bne),
.Branch_bgtz(Branch_bgtz),
.Branch_beq(Branch_beq),
.ALUOp(ALUOp),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
.jump(jump)
);

IF_ID u_IF_ID(
.clk(clk),
.rst_n(rst_n),
.IFWrite(IFWrite),
.Instr(Instr),
.PCPlus4(PCPlus4),
.EM_PCSrc(EM_PCSrc),
.EM_jump(EM_jump),
.IF_Flush(IF_Flush),
.branch_taken(branch_taken),
//.branch_utaken(branch_utaken),
//output
.IF_branch_taken(IF_branch_taken),
//.IF_branch_utaken(IF_branch_utaken),
.IF_PCPlus4(IF_PCPlus4),
.IF_Instr(IF_Instr)
);

ID_EX u_ID_EX(
.clk(clk),
.rst_n(rst_n),
.MemtoReg(MemtoReg),
.MemWrite(MemWrite),
.MemRead(MemRead),
.Branch_bne(Branch_bne),
.Branch_bgtz(Branch_bgtz),
.Branch_beq(Branch_beq),
.ALUOp(ALUOp),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
.jump(jump),
.IF_branch_taken(IF_branch_taken),
//.IF_branch_utaken(IF_branch_utaken),
.IF_Instr(IF_Instr),
.IF_PCPlus4(IF_PCPlus4),
.r1_dout(r1_dout),
.r2_dout(r2_dout),
.EM_PCSrc(EM_PCSrc),
.EM_jump(EM_jump),
.stall(stall),
.IE_Flush(IE_Flush),
//output
.IE_branch_taken(IE_branch_taken),
//.IE_branch_utaken(IE_branch_utaken),
.IE_Opcode(IE_Opcode),
.IE_RegData1(IE_RegData1),
.IE_RegData2(IE_RegData2),
.IE_PCPlus4(IE_PCPlus4),
.IE_JAddr(IE_JAddr),
.IE_SignImm(IE_SignImm),
/*.IE_Rs(IE_Rs),
.IE_Rt(IE_Rt),
.IE_Rd(IE_Rd),*/
.IE_MemtoReg(IE_MemtoReg),
.IE_MemWrite(IE_MemWrite),
.IE_MemRead(IE_MemRead),
.IE_Branch_bne(IE_Branch_bne),
.IE_Branch_bgtz(IE_Branch_bgtz),
.IE_Branch_beq(IE_Branch_beq),
.IE_ALUOp(IE_ALUOp),
.IE_ALUSrc(IE_ALUSrc),
.IE_RegDst(IE_RegDst),
.IE_RegWrite(IE_RegWrite),
.IE_jump(IE_jump)
);

EX_MEM u_EX_MEM(
.clk(clk),
.rst_n(rst_n),
.IE_Branch_bne(IE_Branch_bne),
.IE_Branch_bgtz(IE_Branch_bgtz),
.IE_Branch_beq(IE_Branch_beq),
.IE_MemWrite(IE_MemWrite),
.IE_MemRead(IE_MemRead),
.IE_RegWrite(IE_RegWrite),
.IE_MemtoReg(IE_MemtoReg),
.IE_RegDst(IE_RegDst),
.IE_jump(IE_jump),
.IE_PCPlus4(IE_PCPlus4),
.IE_JAddr(IE_JAddr),
.Zero_bne(Zero_bne),
.Zero_bgtz(Zero_bgtz),
.IE_SignImm(IE_SignImm),
.ALUResult(ALUResult),
.IE_RegData2(IE_RegData2),
.IE_Rt(IE_Rt),
.IE_Rd(IE_Rd),
.FW_MemWDSrc(FW_MemWDSrc),
.MW_WBData(MW_WBData),
.alu_a(alu_a),
.EM_Flush(EM_Flush),
.IE_branch_taken(IE_branch_taken),
//output
//.Branch_Hazzard(Branch_Hazzard),
.EM_jump(EM_jump),
.EM_PCPlus4(EM_PCPlus4),
.EM_RegDst(EM_RegDst),
.EM_JAddr(EM_JAddr),
.EM_WBAddr(EM_WBAddr),
.EM_ALUResult(EM_ALUResult),
.EM_WriteData(EM_WriteData),
.EM_MemWrite(EM_MemWrite),
.EM_MemRead(EM_MemRead),
.EM_RegWrite(EM_RegWrite),
.EM_MemtoReg(EM_MemtoReg),
.EM_PCBranch(EM_PCBranch),
.EM_PCSrc(EM_PCSrc),
.EM_alu_a(EM_alu_a)
);

MEM_WB u_MEM_WB(
.clk(clk),
.rst_n(rst_n),
.EM_RegWrite(EM_RegWrite),
.EM_MemtoReg(EM_MemtoReg),
.ReadData(ReadData),
.EM_ALUResult(EM_ALUResult),
.EM_WBAddr(EM_WBAddr),
.EM_PCPlus4(EM_PCPlus4),
.EM_RegDst(EM_RegDst),
//output
.MW_RegWrite(MW_RegWrite),
.MW_WBAddr(MW_WBAddr),
.MW_WBData(MW_WBData)
);

Forwarding u_Forwarding(
.MW_RegWrite(MW_RegWrite),
.MW_WBAddr(MW_WBAddr),
.EM_RegWrite(EM_RegWrite),
.EM_WBAddr(EM_WBAddr),
.IE_Rs(IE_Rs),
.IE_Rt(IE_Rt),
.IE_ALUSrc(IE_ALUSrc),
//output
.FW_ALUSrc1(FW_ALUSrc1),
.FW_ALUSrc2(FW_ALUSrc2),
.FW_MemWDSrc(FW_MemWDSrc)
);

Hazard_Detection u_Hazard_Detection(
.IE_MemRead(IE_MemRead),
.IF_Instr(IF_Instr),
.IE_Rt(IE_Rt),
//output
.stall(stall),
.PCWrite(PCWrite),
.IFWrite(IFWrite)
);

endmodule
