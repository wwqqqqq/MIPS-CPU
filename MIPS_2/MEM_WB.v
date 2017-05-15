`timescale 1ns / 1ps

module MEM_WB(
input clk,
input rst_n,
input EM_RegWrite,
input EM_MemtoReg,
input [31:0] ReadData,
input [31:0] EM_ALUResult,
input [4:0] EM_WBAddr,
input [4:0] EM_Rd,
//input EM_PCSrc,
//input [1:0] IE_jump,
output reg MW_RegWrite,
output reg [4:0] MW_WBAddr,
output reg [31:0] MW_WBData,
output reg [4:0] MW_Rd
    );
//wire branch;
//assign branch=(EM_PCSrc==1'b1)?1'b1:1'b0;	 
always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
		MW_RegWrite<=1'b0;
		MW_WBData<=32'h0;
		MW_WBAddr<=5'h0;
		MW_Rd<=5'h0;
	end
	else
	begin
		MW_RegWrite<=EM_RegWrite;
		MW_WBData<=(EM_MemtoReg==1)?ReadData:EM_ALUResult;
		MW_WBAddr<=EM_WBAddr;
		MW_Rd<=EM_Rd;
	end
end

endmodule
