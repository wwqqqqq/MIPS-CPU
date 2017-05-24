`timescale 1ns / 1ps

module Interrupt(
input clk,
input rst_n,
input External_intr,
input [31:0] IE_PC,
input INTS_end,
input overflow,
//input [31:0] EM_PCPlus4,
//input Branch_Hazzard,
output reg exe_intr, //cpu is executing interrupt service
output reg IF_Flush,
output reg IE_Flush,
output reg EM_Flush,
output reg LD_INTS, //load pc of interrupt service
output reg [31:0] EPC,
output reg [31:0] INTS_PC //PC of interrupt service
    );

wire exception;
assign exception=External_intr|overflow;
//assign INTS_PC=(overflow==1'b1)?32'h0000_0300:32'h0000_0200;

always@(*)
begin
	if(overflow==1'b1)
		INTS_PC=32'h0000_0300;
//	else if(Branch_Hazzard==1'b1)
//		INTS_PC=EM_PCPlus4;
	else INTS_PC=32'h0000_0200;
end

always@(posedge clk or posedge exception)
begin
	if(exception)
	begin
		exe_intr<=1'b1;
		IF_Flush<=1'b1;
		IE_Flush<=1'b1;
		EM_Flush<=1'b1;
		LD_INTS<=1'b1;
		EPC<=IE_PC;
	end
	else if(exe_intr==1'b1)
	begin
		IF_Flush<=1'b0;
		IE_Flush<=1'b0;
		EM_Flush<=1'b0;
		LD_INTS<=1'b0;
		exe_intr<=(INTS_end==1'b1)?1'b0:1'b1;
		EPC<=EPC;
	end
	else
	begin
		exe_intr<=1'b0;
		IF_Flush<=1'b0;
		IE_Flush<=1'b0;
		EM_Flush<=1'b0;
		LD_INTS<=1'b0;
		EPC<=EPC;
	end
end

endmodule
