`timescale 1ns / 1ps

module REG_FILE(
input clk,
input rst_n,
input [4:0] IF_Rs,
input [4:0] IF_Rt,
input MW_RegWrite,
input [4:0] MW_WBAddr,
input [31:0] MW_WBData,
output [31:0] r1_dout,
output [31:0] r2_dout
    );

reg [31:0] r [0:31];
wire [4:0] r1_addr,r2_addr;
assign r1_dout=r[IF_Rs];
assign r2_dout=r[IF_Rt];


always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
	r[0]		<=32'h0;
	r[1]		<=32'h0;
	r[2]		<=32'h0;
	r[3]		<=32'h0;
	r[4]		<=32'h0;
	r[5]		<=32'h0;
	r[6]		<=32'h0;
	r[7]		<=32'h0;
	r[8]		<=32'h0;
	r[9]		<=32'h0;
	r[10]		<=32'h0;
	r[11] 	<=32'h0;
	r[12]		<=32'h0;
	r[13]		<=32'h0;
	r[14]		<=32'h0;
	r[15]		<=32'h0;
	r[16]		<=32'h0;
	r[17]		<=32'h0;
	r[18]		<=32'h0;
	r[19]		<=32'h0;
	r[20]		<=32'h0;
	r[21]		<=32'h0;
	r[22]		<=32'h0;
	r[23]		<=32'h0;
	r[24]		<=32'h0;
	r[25]		<=32'h0;
	r[26]		<=32'h0;
	r[27]		<=32'h0;
	r[28]		<=32'h0;
	r[29]		<=32'h0;
	r[30]		<=32'h0;
	r[31]		<=32'h0;
	end
	else
	begin
		if(MW_RegWrite==1'b1)
		begin
			r[MW_WBAddr]<=MW_WBData;
		end
		else r[0]<=r[0];
	end
end




endmodule
