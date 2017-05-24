`timescale 1ns / 1ps

module I_O(
input clk,
input LorH,
input btn,
input btn1,
input [31:0] ReadData,
input sw_7,
output reg read_mem_en,
output [3:0] an,
output [7:0] seg,
output rst_n,
output External_intr
    );
wire [1:0] output_en;
wire [15:0] data;
wire EI_n;
assign External_intr=~EI_n;
assign data=(LorH==1'b0)?ReadData[15:0]:ReadData[31:16];

always@(posedge clk)
begin
	read_mem_en<=sw_7;
end

debounce u1_debounce(
.clk(clk),
.btn(btn),
.rst_n(rst_n)
);

debounce u2_debounce(
.clk(clk),
.btn(btn1),
.rst_n(EI_n)
);

div u_div(
.clk(clk),
.rst_n(rst_n),
.output_en(output_en)
);

scan u_scan(
.output_en(output_en),
.data(data),
.rst_n(rst_n),
.read_mem_en(read_mem_en),
.an(an),
.seg(seg)
);

endmodule
