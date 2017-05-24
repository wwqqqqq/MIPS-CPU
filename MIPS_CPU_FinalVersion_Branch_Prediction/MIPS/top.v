`timescale 1ns / 1ps

module top(
input clk,
input btn,//rst_n
input btn1,//external interrupt signal
input [7:0] sw,
output [3:0] an,
output [7:0] seg,
output [7:0] led
    );
//sw[0]   low word(0) or high word(1)
//sw[6:1] read_mem_addr
//sw[7]   read_mem_en
//when read_mem_en==1, set the program clk unchanged (read mem is assyn)
wire clk_cpu; 
wire read_mem_en;
wire [5:0] read_mem_addr;
wire rst_n;
wire LorH;
wire [31:0] ReadData;
wire [31:0] PC;
assign LorH=sw[0];
//assign read_mem_en=sw[7];
assign read_mem_addr=sw[6:1];
//assign clk_cpu=(read_mem_en==1)?clk_cpu:clk;
assign led=(~rst_n)?8'hff:PC[9:2];

adjust_clk u_adjust_clk(
.clk(clk),
.rst_n(rst_n),
.read_mem_en(read_mem_en),
.clk_cpu(clk_cpu)
);

CPU MIPS_CPU(
.clk(clk_cpu),
.rst_n(rst_n),
.External_intr(External_intr),
.read_mem_en(read_mem_en),
.read_mem_addr(read_mem_addr),
.ReadData(ReadData),
.PC(PC)
);

I_O u_I_O(
//input
.clk(clk),
.LorH(LorH),
.btn(btn),
.btn1(btn1),
.ReadData(ReadData),
.sw_7(sw[7]),
//output
.an(an),
.seg(seg),
.rst_n(rst_n),
.read_mem_en(read_mem_en),
.External_intr(External_intr)
);


endmodule
