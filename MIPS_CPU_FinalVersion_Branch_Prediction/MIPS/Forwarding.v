`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Forwarding(
input MW_RegWrite,
input [4:0] MW_WBAddr,
input EM_RegWrite,
input [4:0] EM_WBAddr,
input [4:0] IE_Rs,
input [4:0] IE_Rt,
input IE_ALUSrc,
output reg [1:0]FW_ALUSrc1,
output reg [1:0]FW_ALUSrc2,
output reg [1:0] FW_MemWDSrc
    );
always@(*)
begin
	if(EM_WBAddr==IE_Rs&&EM_RegWrite==1'b1)
		FW_ALUSrc1=2'b1;//alusrc1=em_aluresult
	else if(MW_WBAddr==IE_Rs&&MW_RegWrite==1'b1)
		FW_ALUSrc1=2'h2;//alusrc1=mw_wbdata
	else
		FW_ALUSrc1=2'b0;//alusrc1=ie_regdata1
end

always@(*)
begin
	if(IE_ALUSrc==1'b1)
		FW_ALUSrc2=2'h3;//alusrc2=signimm
	else if(EM_WBAddr==IE_Rt&&EM_RegWrite==1'b1)
		FW_ALUSrc2=2'b1;//alusrc2=em_aluresult
	else if(MW_WBAddr==IE_Rt&&MW_RegWrite==1'b1)
		FW_ALUSrc2=2'h2;//alusrc2=mw_wbdata
	else
		FW_ALUSrc2=2'b0;//alusrc2=ie_regdata2
end

always@(*)
begin
	if(EM_WBAddr==IE_Rt&&EM_RegWrite==1'b1)
		FW_MemWDSrc=2'b1;//emwritedata=em_aluresult
	else if(MW_WBAddr==IE_Rt&&MW_RegWrite==1'b1)
		FW_MemWDSrc=2'h2;//emwritedata=mw_wbdata
	else
		FW_MemWDSrc=2'b0;//emwritedata=ie_regdata2
end

endmodule
