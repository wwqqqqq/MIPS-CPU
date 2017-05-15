`timescale 1ns / 1ps

module ID_EX(
input clk,
input rst_n,
input MemtoReg,
input MemWrite,
input MemRead,
input Branch_bne,
input Branch_bgtz,
input [1:0] ALUOp,
input ALUSrc,
input RegDst,
input RegWrite,
input [1:0] jump,
input [31:0] IF_Instr,
input [31:0] IF_PCPlus4,
input [31:0] r1_dout,
input [31:0] r2_dout,
input EM_PCSrc,
input [1:0] EM_jump,
output reg [31:0] IE_RegData1,
output reg [31:0] IE_RegData2,
output reg [31:0] IE_PCPlus4,
output reg [25:0] IE_JAddr,
output reg [31:0] IE_SignImm,
/*output reg [4:0] IE_Rs,
output reg [4:0] IE_Rt,
output reg [4:0] IE_Rd,*/
output reg IE_MemtoReg,
output reg IE_MemWrite,
output reg IE_MemRead,
output reg IE_Branch_bne,
output reg IE_Branch_bgtz,
output reg [1:0] IE_ALUOp,
output reg IE_ALUSrc,
output reg IE_RegDst,
output reg IE_RegWrite,
output reg [1:0] IE_jump
    );
wire branch;
assign branch=((EM_PCSrc==1)||(EM_jump==2'h1)||(EM_jump==2'h2))?1'b1:1'b0;
always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
		IE_SignImm<=32'h0;
		/*IE_Rs<=5'h0;
		IE_Rt<=5'h0;
		IE_Rd<=5'h0;*/
		IE_PCPlus4<=32'h0;
		IE_JAddr<=26'h0;
		IE_RegData1<=32'h0;
		IE_RegData2<=32'h0;
	end
	else
	begin
		IE_SignImm<=(IF_Instr[15]==1'b1)?(32'hffff0000|IF_Instr):(32'h0000ffff&IF_Instr);
		/*IE_Rs<=IF_Instr[25:21];
		IE_Rt<=IF_Instr[20:16];
		IE_Rd<=IF_Instr[15:11];*/
		IE_PCPlus4<=IF_PCPlus4;
		IE_JAddr<=IF_Instr[25:0];
		IE_RegData1<=r1_dout;
		IE_RegData2<=r2_dout;
	end
end

always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
		IE_MemtoReg=1'b0;
		IE_MemWrite=1'b0;
		IE_MemRead=1'b0;
		IE_Branch_bne=1'b0;
		IE_Branch_bgtz=1'b0;
		IE_ALUOp=2'h0;
		IE_ALUSrc=1'b0;
		IE_RegDst=1'b0;
		IE_RegWrite=1'b0;
		IE_jump=2'b0;
	end
	else
	begin
		IE_MemtoReg=MemtoReg;
		IE_MemWrite=(branch==1'b1)?1'b0:MemWrite;
		IE_MemRead=MemRead;
		IE_Branch_bne=(branch==1'b1)?1'b0:Branch_bne;
		IE_Branch_bgtz=(branch==1'b1)?1'b0:Branch_bgtz;
		IE_ALUOp=ALUOp;
		IE_ALUSrc=ALUSrc;
		IE_RegDst=RegDst;
		IE_RegWrite=(branch==1'b1)?1'b0:RegWrite;
		IE_jump=(branch==1'b1)?2'b0:jump;
	end
end


endmodule
