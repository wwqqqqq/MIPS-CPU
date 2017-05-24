`timescale 1ns / 1ps
module CPU(
input clk,
input rst_n,
input read_mem_en,
input [5:0] read_mem_addr,
input External_intr,
//input [31:0] PC_Init,
//input [31:0] Data_Loc,
//output [31:0] reg1,
//output [31:0] reg2,
output [31:0] ReadData,
output [31:0] PC
    );
wire EM_MemWrite,EM_MemRead,MW_RegWrite;
wire [1:0] EM_jump;
wire PCWrite,EM_PCSrc;
wire Zero_bne,Zero_bgtz;
wire [31:0] PCPlus4,EM_PCPlus4,EM_PCBranch;
wire [31:0] ALUResult,EM_ALUResult;
wire [31:0] EM_WriteData;
wire [31:0] alu_a,EM_alu_a;
wire [31:0] Instr;
wire [25:0] EM_JAddr;
wire [31:0] IE_SignImm;
wire [31:0] r1_dout,r2_dout,MW_WBData,IE_RegData1,IE_RegData2;
wire [4:0] MW_WBAddr,IF_Rs,IF_Rt;
wire [1:0] FW_ALUSrc1,FW_ALUSrc2;
wire [1:0] IE_ALUOp;
wire [4:0] IE_Shamt;
wire [5:0] IE_Funct,IE_Opcode;
wire [31:0] IE_PC,EPC,INTS_PC ;
wire IF_Flush,IE_Flush,EM_Flush,LD_INTS,INTS_end,exe_intr;
wire overflow;
wire branch_taken;
wire [31:0] PC_Predict;
//wire Branch_Hazzard;



MemControl u_MemControl(
.clk(~clk),
.PC(PC),
.EM_ALUResult(EM_ALUResult),
.EM_WriteData(EM_WriteData),
.EM_MemRead(EM_MemRead),
.EM_MemWrite(EM_MemWrite),
.read_mem_en(read_mem_en),
.read_mem_addr(read_mem_addr),
//.exe_intr(exe_intr),
//.LD_INTS(LD_INTS),
//output
.Instr(Instr),
.ReadData(ReadData),
.INTS_end(INTS_end),
.branch_taken(branch_taken),
//.branch_utaken(branch_utaken),
.PC_Predict(PC_Predict)
);

RegFile u_RegFile(
.clk(~clk),
.rst_n(rst_n),
.IF_Rs(IF_Rs),
.IF_Rt(IF_Rt),
.MW_RegWrite(MW_RegWrite),
.MW_WBAddr(MW_WBAddr),
.MW_WBData(MW_WBData),
//output
.r1_dout(r1_dout),
.r2_dout(r2_dout)
);

Reg_Signal u_Reg_Signal(
.clk(clk),
.rst_n(rst_n),
.Instr(Instr),
.PCPlus4(PCPlus4),
.ReadData(ReadData),
.Zero_bne(Zero_bne),
.Zero_bgtz(Zero_bgtz),
.r1_dout(r1_dout),
.r2_dout(r2_dout),
.ALUResult(ALUResult),
.alu_a(alu_a),
.IF_Flush(IF_Flush),
.IE_Flush(IE_Flush),
.EM_Flush(EM_Flush),
.branch_taken(branch_taken),
//.branch_utaken(branch_utaken),
//.exe_intr(exe_intr),
//output
//.INTS_end(INTS_end),
//.Branch_Hazzard(Branch_Hazzard),
.EM_alu_a(EM_alu_a),
.FW_ALUSrc1(FW_ALUSrc1),
.FW_ALUSrc2(FW_ALUSrc2),
.IF_Rs(IF_Rs),
.IF_Rt(IF_Rt),
.IE_ALUOp(IE_ALUOp),
.IE_Opcode(IE_Opcode),
.IE_RegData1(IE_RegData1),
.IE_RegData2(IE_RegData2),
.IE_Shamt(IE_Shamt),
.IE_PC(IE_PC),
.IE_Funct(IE_Funct),
.EM_PCPlus4(EM_PCPlus4),
.EM_JAddr(EM_JAddr),
.EM_jump(EM_jump),
.IE_SignImm(IE_SignImm),
.MW_WBData(MW_WBData),
.MW_WBAddr(MW_WBAddr),
.EM_MemWrite(EM_MemWrite),
.EM_MemRead(EM_MemRead),
.EM_PCSrc(EM_PCSrc),
.EM_WriteData(EM_WriteData),
.EM_ALUResult(EM_ALUResult),
.EM_PCBranch(EM_PCBranch),
.MW_RegWrite(MW_RegWrite),
.PCWrite(PCWrite)
);

PC_control u_PC_Control(
.clk(clk),
.rst_n(rst_n),
.EM_jump(EM_jump),
.EM_JAddr(EM_JAddr),
.EM_PCPlus4(EM_PCPlus4),
.PCWrite(PCWrite),
.EM_PCSrc(EM_PCSrc),
.EM_PCBranch(EM_PCBranch),
.LD_INTS(LD_INTS),
.INTS_PC(INTS_PC),
.INTS_end(INTS_end),
.EPC(EPC),
.branch_taken(branch_taken),
.PC_Predict(PC_Predict),
//.branch_utaken(branch_utaken),
//.PC_Init(PC_Init),
.EM_alu_a(EM_alu_a),
//output
.PC(PC),
.PCPlus4(PCPlus4)
);


ALU u_ALU(
.IE_RegData1(IE_RegData1),
.IE_RegData2(IE_RegData2),
.IE_SignImm(IE_SignImm),
.MW_WBData(MW_WBData),
.EM_ALUResult(EM_ALUResult),
.FW_ALUSrc1(FW_ALUSrc1),
.FW_ALUSrc2(FW_ALUSrc2),
.IE_ALUOp(IE_ALUOp),
.IE_Shamt(IE_Shamt),
.IE_Funct(IE_Funct),
.IE_Opcode(IE_Opcode),
//output
.ALUResult(ALUResult),
.alu_a(alu_a),
.Zero_bne(Zero_bne),
.Zero_bgtz(Zero_bgtz),
.overflow(overflow)
);
  
Interrupt u_Interrupt(
.clk(~clk),
.rst_n(rst_n),
.External_intr(External_intr),
.IE_PC(IE_PC),
.IF_Flush(IF_Flush),
.IE_Flush(IE_Flush),
.EM_Flush(EM_Flush),
.overflow(overflow),
//.Branch_Hazzard(Branch_Hazzard),
//.EM_PCPlus4(EM_PCPlus4),
.LD_INTS(LD_INTS),
.INTS_end(INTS_end),
.exe_intr(exe_intr),
.EPC(EPC),
.INTS_PC(INTS_PC)
);


endmodule

