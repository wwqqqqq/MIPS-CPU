`timescale 1ns / 1ps

module IF_ID(
input clk,
input rst_n,
input IFWrite,
input EM_PCSrc,
input [1:0] EM_jump,
input [31:0]Instr,
input [31:0] PCPlus4,
input IF_Flush,
input branch_taken,
//input branch_utaken,
output reg IF_branch_taken,
//output reg[31:0] IF_branch_utaken,
output reg[31:0] IF_PCPlus4,
output reg[31:0] IF_Instr
    );
wire branch;
assign branch=((EM_PCSrc==1)||(EM_jump==2'h1)||(EM_jump==2'h2))?1'b1:1'b0;
always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
		IF_PCPlus4<=32'h0;
		IF_Instr<=32'h0;
		IF_branch_taken<=1'b0;
		//IF_branch_utaken<=1'b0;
	end
	else if(branch==1'b1||IF_Flush==1'b1)
	begin
		IF_Instr<=32'h0;
		IF_PCPlus4<=32'h0;
		IF_branch_taken<=1'b0;
		//IF_branch_utaken<=1'b0;
	end
	else
	begin
		IF_Instr<=(IFWrite==1)?Instr:IF_Instr;
		IF_PCPlus4<=(IFWrite==1)?PCPlus4:IF_PCPlus4;
		IF_branch_taken<=branch_taken;
		//IF_branch_utaken<=branch_utaken;
	end
end

endmodule
