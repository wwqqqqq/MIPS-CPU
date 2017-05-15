`timescale 1ns / 1ps

module EX_MEM(
input clk,
input rst_n,
input IE_Branch_bne,
input IE_Branch_bgtz,
input IE_MemWrite,
input IE_MemRead,
input IE_RegWrite,
input IE_MemtoReg,
input IE_RegDst,
input Zero_bne,
input Zero_bgtz,
input [31:0] IE_PCPlus4,
input [25:0] IE_JAddr,
input [31:0] IE_SignImm,
input [31:0] ALUResult,
input [31:0] IE_RegData1,
input [31:0] IE_RegData2,
input [4:0] IE_Rt,
input [4:0] IE_Rd,
input [1:0] IE_jump,
input [1:0] FW_MemWDSrc,
input [31:0] MW_WBData,
input [31:0] alu_a,
output reg [1:0] EM_jump,
output reg [4:0] EM_WBAddr,
output reg [31:0] EM_ALUResult,
output reg [31:0] EM_WriteData,
output reg [25:0] EM_JAddr,
output reg [31:0] EM_PCPlus4,
output reg [31:0] EM_RegData1,
output reg EM_MemWrite,
output reg EM_MemRead,
output reg EM_RegWrite,
output reg EM_MemtoReg,
output reg [31:0] EM_PCBranch,
output reg [31:0] EM_alu_a,
output reg EM_PCSrc,
output reg [4:0] EM_Rd
    );
wire branch;
assign branch=(EM_PCSrc==1'b1||EM_jump!=2'b00)?1'b1:1'b0;	 

always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		EM_WriteData<=32'h0;
	else if(FW_MemWDSrc==2'h0)
		EM_WriteData<=IE_RegData2;
	else if(FW_MemWDSrc==2'h1)
		EM_WriteData<=EM_ALUResult;
	else if(FW_MemWDSrc==2'h2)
		EM_WriteData<=MW_WBData;
	else
		EM_WriteData<=32'h0;
end

always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
		//EM_jump<=1'b0;
		EM_MemWrite<=1'b0;
		EM_MemRead<=1'b0;
		EM_RegWrite<=1'b0;
		EM_MemtoReg<=1'b0;
		EM_PCSrc<=1'b0;
		EM_PCBranch<=32'h0;
		EM_ALUResult<=32'h0;
		//EM_WriteData<=32'h0;
		EM_WBAddr<=5'h0;
		EM_Rd<=5'h0;
		EM_jump<=2'h0;
		EM_JAddr<=26'h0;
		EM_PCPlus4<=32'h0;
		EM_RegData1<=32'h0;
		EM_alu_a<=32'h0;
	end
	else
	begin
		EM_PCSrc<=(branch==1'b1)?1'b0:(IE_Branch_bne&Zero_bne)|(IE_Branch_bgtz&Zero_bgtz);
		//EM_jump<=IE_jump;
		EM_MemWrite<=(branch==1'b1)?1'b0:IE_MemWrite;
		EM_MemRead<=IE_MemRead;
		EM_RegWrite<=(branch==1'b1)?1'b0:IE_RegWrite;
		EM_MemtoReg<=IE_MemtoReg;
		EM_PCBranch<=IE_PCPlus4+(IE_SignImm<<2);
		EM_ALUResult<=ALUResult;
		//EM_WriteData<=IE_RegData2;
		EM_WBAddr<=(IE_RegDst==1'b1)?IE_Rd:IE_Rt;
		EM_Rd<=IE_Rd;
		EM_jump<=(branch==1'b1)?1'b0:IE_jump;
		EM_JAddr<=IE_JAddr;
		EM_PCPlus4<=IE_PCPlus4;
		EM_RegData1<=IE_RegData1;
		EM_alu_a<=alu_a;
	end
end

endmodule
