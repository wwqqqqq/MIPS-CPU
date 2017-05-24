`timescale 1ns / 1ps

module adjust_clk(
input clk,
input rst_n,
input read_mem_en,
output clk_cpu
    );
reg slow_cpu;
assign clk_cpu=(read_mem_en==1'b1)?clk_cpu:slow_cpu;
reg [3:0] cnt;


always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		slow_cpu<=1'b0;
	else if(cnt==4'hA)
		slow_cpu<=~slow_cpu;
	else 
		slow_cpu<=slow_cpu;
end

always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		cnt<=4'h0;
	else if(cnt>=4'hA)
		cnt<=4'h0;
	else
		cnt<=cnt+4'b1;
end


endmodule
