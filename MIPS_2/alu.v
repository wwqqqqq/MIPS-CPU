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
  output reg [31:0] ALUResult,
  output reg [31:0] alu_a,
  output Zero_bne,
  output Zero_bgtz
);

//reg [31:0] alu_a;
reg [31:0] alu_b;
assign Zero_bgtz=(alu_a>32'h0)?1'b1:1'b0;
//bgtz: rs>0, branch
assign Zero_bne=(alu_a!=alu_b)?1'b1:1'b0;
//bne: rs!=rt, branch

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
			6'b000011: begin ALUResult[30:0]=alu_b[30:0]>>IE_Shamt; ALUResult[31]=alu_b[31]; end //sra
			6'b000100: ALUResult=alu_b<<alu_a; //sllv
			6'b000110: ALUResult=alu_b>>alu_b; //srlv
			6'b000111: begin ALUResult[30:0]=alu_b[30:0]>>alu_a; ALUResult[31]=alu_b[31]; end //srav
			default:   ALUResult=3'h0; //nop
		endcase
	end
	else ALUResult=alu_a&alu_b; //and
	
end


endmodule

