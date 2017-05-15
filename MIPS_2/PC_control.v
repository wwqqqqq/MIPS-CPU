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
input [31:0] EM_PCBranch,
//input [31:0] PC_Init,
output reg[31:0]PC,
output [31:0] PCPlus4
    );

wire [31:0]PC_next,PC1;
reg [31:0] PCJump;
assign PCPlus4=PC+32'h4;
assign PC1=(EM_PCSrc==1'b1)?EM_PCBranch:PCPlus4;
assign PC_next=(EM_jump!=2'b0)?PCJump:PC1;

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
	else
		PC<=(PCWrite==1'b1)?PC_next:PC;
end

endmodule
