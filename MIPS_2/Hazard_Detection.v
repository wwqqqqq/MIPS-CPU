`timescale 1ns / 1ps

module Hazard_Detection(
input IE_MemRead,
input [31:0] IF_Instr,
input [4:0] IE_Rt,
output reg stall,
output reg PCWrite,
output reg IFWrite
    );
wire [4:0] IF_Rs,IF_Rt;
assign IF_Rs=IF_Instr[25:21];
assign IF_Rt=IF_Instr[20:16];
always@(*)
begin
	if(IE_MemRead==1&&((IE_Rt==IF_Rs)||(IE_Rt==IF_Rt)))
	begin
		stall=1'b1;
		PCWrite=1'b0;
		IFWrite=1'b0;
	end
	else
	begin
		stall=1'b0;
		PCWrite=1'b1;
		IFWrite=1'b1;
	end
end

endmodule
