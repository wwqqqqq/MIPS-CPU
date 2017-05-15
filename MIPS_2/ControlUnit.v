`timescale 1ns / 1ps


module ControlUnit(
input clk,
input rst_n,
input [31:0] IF_Instr,
input EM_PCSrc,
input [1:0] EM_jump,
input stall,
output reg MemtoReg,
output reg MemWrite,
output reg MemRead,
output reg Branch_bne,
output reg Branch_bgtz,
output reg [1:0] ALUOp,
output reg ALUSrc,
output reg RegDst,
output reg RegWrite,
output reg [1:0] jump
    );
wire [5:0] Opcode;
wire [5:0] Funct;
//wire [4:0] Shamt;
parameter [5:0] addi=6'b001000,r_type=6'b000000,lw=6'b100011,sw=6'b101011,bgtz=6'b000111,j=6'b000010;
parameter [5:0] andi=6'b001100,bne=6'b000101;
assign Opcode=IF_Instr[31:26];
assign Funct=IF_Instr[5:0];



always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		ALUOp=2'h00;
		ALUSrc=1'b0;
		RegDst=1'b0;
		RegWrite=1'b0;
		jump=2'b0;//jump=1->j,jump=2->jr
	end
	else if(EM_PCSrc==1'b1||EM_jump==2'b1||EM_jump==2'h2||stall==1'b1)
	begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		ALUOp=2'h00;
		ALUSrc=1'b0;
		RegDst=1'b0;
		RegWrite=1'b0;
		jump=2'b0;
	end
	else
	begin
		case(Opcode)
		addi:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		ALUOp=2'h1;
		ALUSrc=1'b1;
		RegDst=1'b0;
		RegWrite=1'b1;
		jump=2'b0;
		end
		andi:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		ALUOp=2'h3;//and
		ALUSrc=1'b1;
		RegDst=1'b0;
		RegWrite=1'b1;
		jump=2'b0;
		end
		r_type:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		ALUOp=2'b10;
		ALUSrc=1'b0;
		RegDst=1'b1;
		RegWrite=(Funct==6'b001000)?1'b0:1'b1;//jr:regwrite=0
		jump=(Funct==6'b001000)?2'h2:2'b0;//jr:jump=2
		end
		lw:
		begin
		MemtoReg=1'b1;
		MemWrite=1'b0;
		MemRead=1'b1;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		ALUOp=2'h1;
		ALUSrc=1'b1;
		RegDst=1'b0;
		RegWrite=1'b1;
		jump=2'b0;
		end
		sw:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b1;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		ALUOp=2'h1;
		ALUSrc=1'b1;
		RegDst=1'b0;
		RegWrite=1'b0;
		jump=2'b0;
		end
		bgtz:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b1;
		ALUOp=2'h0;
		ALUSrc=1'b0;
		RegDst=1'b0;
		RegWrite=1'b0;
		jump=2'b0;
		end
		bne:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b1;
		Branch_bgtz=1'b0;
		ALUOp=2'h0;
		ALUSrc=1'b0;
		RegDst=1'b0;
		RegWrite=1'b0;
		jump=2'b0;
		end
		j:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		ALUOp=2'h0;
		ALUSrc=1'b0;
		RegDst=1'b0;
		RegWrite=1'b0;
		jump=2'b1;
		end
		default:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		ALUOp=2'h0;
		ALUSrc=1'b0;
		RegDst=1'b0;
		RegWrite=1'b0;
		jump=2'b0;
		end
		endcase
	end
end

endmodule
