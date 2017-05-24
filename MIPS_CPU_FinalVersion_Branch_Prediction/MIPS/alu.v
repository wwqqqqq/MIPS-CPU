`timescale 1ns / 1ps

module ALU(
  input [31:0] IE_RegData1,
  input [31:0]	IE_RegData2,
  input [31:0] IE_SignImm,
  input [31:0] MW_WBData,
  input [31:0] EM_ALUResult,
  input [1:0] FW_ALUSrc1,
  input [1:0] FW_ALUSrc2,
  input [1:0] IE_ALUOp,
  input [4:0] IE_Shamt,
  input [5:0] IE_Funct,
  input [5:0] IE_Opcode,//////
  output reg [31:0] ALUResult,
  output reg [31:0] alu_a,
  output Zero_bne,
  output Zero_bgtz,
  output reg overflow
);

//reg [31:0] alu_a;
reg [31:0] alu_b;
wire [31:0] ZeroImm;//zero-extended imm
assign ZeroImm[15:0]=IE_SignImm[15:0];
assign ZeroImm[31:16]=16'h0;
assign Zero_bgtz=(alu_a[31]==1'b0&&alu_a!=32'h0)?1'b1:1'b0;
//bgtz: rs>0, branch
assign Zero_bne=(alu_a!=alu_b)?1'b1:1'b0;
//bne: rs!=rt, branch
reg [31:0] mask,ALUResult_temp;

always@(*)
begin
	if(FW_ALUSrc1==2'b0)
		alu_a=IE_RegData1;
	else if(FW_ALUSrc1==2'b1)
		alu_a=EM_ALUResult;
	else if(FW_ALUSrc1==2'h2)
		alu_a=MW_WBData;
	else
		alu_a=32'h0;
end

always@(*)
begin
	if(FW_ALUSrc2==2'b00)
		alu_b=IE_RegData2;
	else if(FW_ALUSrc2==2'b01)
		alu_b=EM_ALUResult;
	else if(FW_ALUSrc2==2'b10)
		alu_b=MW_WBData;
	else
		alu_b=IE_SignImm;
end

always@(*)
begin
	if(IE_ALUOp==2'b00) ALUResult=32'h0; //nop
	else if(IE_ALUOp==2'b01) ALUResult=alu_a+alu_b; //add
	else if(IE_ALUOp==2'b10)
	begin
		case(IE_Funct)
			6'b100000: ALUResult=alu_a+alu_b; //add
			6'b100001: ALUResult=alu_a+alu_b; //addu
			6'b100010: ALUResult=alu_a-alu_b; //sub
			6'b100011: ALUResult=alu_a-alu_b; //subu
			6'b100100: ALUResult=alu_a&alu_b; //and
			6'b100101: ALUResult=alu_a|alu_b; //or
			6'b100111: ALUResult=~(alu_a|alu_b); //nor
			6'b100110: ALUResult=alu_a^alu_b; //xor
			6'b001000: ALUResult=32'h0; //jr
			6'b101010: ALUResult=($signed(alu_a)<$signed(alu_b))?32'h1:32'h0; //slt
			6'b101011: ALUResult=($unsigned(alu_a)<$unsigned(alu_b))?32'h1:32'h0; //sltu
			6'b000000: ALUResult=alu_b<<IE_Shamt; //sll
			6'b000010: ALUResult=alu_b>>IE_Shamt; //srl
			6'b000011: 
			begin //sra
				//mask=32'hffffffff;
				mask=32'hffffffff<<(32'd32-IE_Shamt);
				ALUResult_temp=alu_b>>IE_Shamt; 
				ALUResult=(alu_b[31]==1)?ALUResult_temp|mask:ALUResult_temp;
			end
			6'b000100: ALUResult=alu_b<<alu_a; //sllv
			6'b000110: ALUResult=alu_b>>alu_a; //srlv
			6'b000111: //srav
			begin
				//mask=32'hffffffff;
				mask=32'hffffffff<<(32'd32-alu_a);
				ALUResult_temp=alu_b>>alu_a; 
				ALUResult=(alu_b[31]==1)?ALUResult_temp|mask:ALUResult_temp;
			end
			default:   ALUResult=3'h0; //nop
		endcase
	end
	else //i-type
	begin
		case(IE_Opcode)
		6'b001000: ALUResult=alu_a+IE_SignImm;//addi
		6'b001001: ALUResult=alu_a+ZeroImm;//addiu
		6'b001100: ALUResult=alu_a&ZeroImm;//andi
		6'b001101: ALUResult=alu_a|ZeroImm;//ori
		6'b001110: ALUResult=alu_a^ZeroImm;//xori
		6'b001111: ALUResult=IE_SignImm<<16;//lui
		6'b001010: ALUResult=($signed(alu_a)<$signed(IE_SignImm))?32'b1:32'b0;//slti
		6'b001011: ALUResult=($unsigned(alu_a)<$unsigned(IE_SignImm))?32'b1:32'b0;//sltiu
		default:   ALUResult=32'h0;
		endcase
	end
end

always@(*)
begin
	if(IE_Opcode==6'b001000||IE_ALUOp==2'b01||(IE_ALUOp==2'b10&&IE_Funct==6'b100000))
	begin
		if(ALUResult[31]==1'b1&&alu_a[31]==1'b0&&alu_b[31]==1'b0)
			overflow=1'b1;
		else if(ALUResult[31]==1'b0&&alu_a[31]==1'b1&&alu_b[31]==1'b1)
			overflow=1'b1;
		else overflow=1'b0;
	end
	else overflow=1'b0;
end

endmodule

