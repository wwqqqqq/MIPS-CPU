`timescale 1ns / 1ps


module ControlUnit(
input clk,
input rst_n,
input [31:0] IF_Instr,
input EM_PCSrc,
input [1:0] EM_jump,
input stall,
//input exe_intr,
//output reg INTS_end,
output reg MemtoReg,
output reg MemWrite,
output reg MemRead,
output reg Branch_bne,
output reg Branch_bgtz,
output reg Branch_beq,
output reg [1:0] ALUOp,
output reg ALUSrc,
output reg [1:0] RegDst,
output reg RegWrite,
output reg [1:0] jump
    );
wire [5:0] Opcode;
wire [5:0] Funct;
//wire [4:0] Shamt;
parameter [5:0] addi=6'b001000,r_type=6'b000000,lw=6'b100011,sw=6'b101011,bgtz=6'b000111,j=6'b000010;
parameter [5:0] andi=6'b001100,bne=6'b000101,jal=6'b000011;
parameter [5:0] addiu=6'b001001,ori=6'b001101,xori=6'b001110,lui=6'b001111;
parameter [5:0] slti=6'b001010,sltiu=6'b001011,beq=6'b000100;
parameter [5:0] rti=6'b111111;


assign Opcode=IF_Instr[31:26];
assign Funct=IF_Instr[5:0];
/*
always@(*)
begin
	if(Opcode==rti&&exe_intr==1'b1)
		INTS_end=1'b1;
	else INTS_end=1'b0;
end*/



always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		Branch_beq=1'b0;
		ALUOp=2'h00;
		ALUSrc=1'b0;
		RegDst=2'b0;
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
		Branch_beq=1'b0;
		ALUOp=2'h00;
		ALUSrc=1'b0;
		RegDst=2'b0;
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
		Branch_beq=1'b0;
		ALUOp=2'h3;//i-type
		ALUSrc=1'b1;
		RegDst=2'b0;
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
		Branch_beq=1'b0;
		ALUOp=2'h3;//i-type
		ALUSrc=1'b1;
		RegDst=2'b0;
		RegWrite=1'b1;
		jump=2'b0;
		end
		addiu:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		Branch_beq=1'b0;
		ALUOp=2'h3;//i-type
		ALUSrc=1'b1;
		RegDst=2'b0;
		RegWrite=1'b1;
		jump=2'b0;
		end
		ori:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		Branch_beq=1'b0;
		ALUOp=2'h3;//i-type
		ALUSrc=1'b1;
		RegDst=2'b0;
		RegWrite=1'b1;
		jump=2'b0;
		end
		xori:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		Branch_beq=1'b0;
		ALUOp=2'h3;//i-type
		ALUSrc=1'b1;
		RegDst=2'b0;
		RegWrite=1'b1;
		jump=2'b0;
		end
		lui:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		Branch_beq=1'b0;
		ALUOp=2'h3;//i-type
		ALUSrc=1'b1;
		RegDst=2'b0;
		RegWrite=1'b1;
		jump=2'b0;
		end
		slti:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		Branch_beq=1'b0;
		ALUOp=2'h3;//i-type
		ALUSrc=1'b1;
		RegDst=2'b0;
		RegWrite=1'b1;
		jump=2'b0;
		end
		sltiu:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		Branch_beq=1'b0;
		ALUOp=2'h3;//i-type
		ALUSrc=1'b1;
		RegDst=2'b0;
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
		Branch_beq=1'b0;
		ALUOp=2'b10;//r-type
		ALUSrc=1'b0;
		RegDst=2'b1;
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
		Branch_beq=1'b0;
		ALUOp=2'h1;//add
		ALUSrc=1'b1;
		RegDst=2'b0;
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
		Branch_beq=1'b0;
		ALUOp=2'h1;//add
		ALUSrc=1'b1;
		RegDst=2'b0;
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
		Branch_beq=1'b0;
		ALUOp=2'h0;//nop
		ALUSrc=1'b0;
		RegDst=2'b0;
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
		Branch_beq=1'b0;
		ALUOp=2'h0;//nop
		ALUSrc=1'b0;
		RegDst=2'b0;
		RegWrite=1'b0;
		jump=2'b0;
		end
		beq:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b1;
		Branch_bgtz=1'b0;
		Branch_beq=1'b1;
		ALUOp=2'h0;//nop
		ALUSrc=1'b0;
		RegDst=2'b0;
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
		Branch_beq=1'b0;
		ALUOp=2'h0;//nop
		ALUSrc=1'b0;
		RegDst=2'b0;
		RegWrite=1'b0;
		jump=2'b1;
		end
		jal:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		Branch_beq=1'b0;
		ALUOp=2'h0;//nop
		ALUSrc=1'b0;
		RegDst=2'h2;//
		RegWrite=1'b1;
		jump=2'b1;
		end
		rti:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		Branch_beq=1'b0;
		ALUOp=2'h0;//nop
		ALUSrc=1'b0;
		RegDst=2'b0;
		RegWrite=1'b0;
		jump=2'b0;
		end
		default:
		begin
		MemtoReg=1'b0;
		MemWrite=1'b0;
		MemRead=1'b0;
		Branch_bne=1'b0;
		Branch_bgtz=1'b0;
		Branch_beq=1'b0;
		ALUOp=2'h0;//nop
		ALUSrc=1'b0;
		RegDst=2'b0;
		RegWrite=1'b0;
		jump=2'b0;
		end
		endcase
	end
end

endmodule
