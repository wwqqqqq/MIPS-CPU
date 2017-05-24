`timescale 1ns / 1ps

module PC_control(
input clk,
input rst_n,
input [1:0] EM_jump,
input [31:0] EM_alu_a,
input [25:0] EM_JAddr,
input [31:0] EM_PCPlus4,
input PCWrite,
input EM_PCSrc,
input INTS_end,
input [31:0] EPC,
input [31:0] EM_PCBranch,
input LD_INTS,
input [31:0] INTS_PC,
input [31:0] PC_Predict,
input branch_taken,
output reg[31:0]PC,
output [31:0] PCPlus4
    );
//reg [31:0] PC_Store;
wire [31:0]PC_next,PC1,PC2;
reg [31:0] PCJump;
assign PCPlus4=PC+32'h4;
assign PC1=(EM_PCSrc==1'b1)?EM_PCBranch:PCPlus4;
assign PC2=(branch_taken==1'b1)?PC_Predict:PC1;
assign PC_next=(EM_jump!=2'b0)?PCJump:PC2;

always@(*)
begin
	if(EM_jump==2'b1)//j
	begin
		PCJump[31:28]=EM_PCPlus4[31:28];
		PCJump[27:2]=EM_JAddr;
		PCJump[1:0]=2'b00;
	end
	else if(EM_jump==2'h2)//jr
		PCJump=EM_alu_a;
	else
		PCJump=32'h0;
end

always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		//PC<=PC_Init;
		PC<=32'h0;
	else if(LD_INTS==1'b1)
		PC<=INTS_PC;
	else if(INTS_end==1'b1)
		PC<=EPC;
	else
		PC<=(PCWrite==1'b1)?PC_next:PC;
end

endmodule
