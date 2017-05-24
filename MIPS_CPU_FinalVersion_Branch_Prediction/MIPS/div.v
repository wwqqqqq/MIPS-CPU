`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module div(
input      clk,
input      rst_n,
output reg [1:0] output_en
    );

reg [24:0] output_div;

always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		output_div<=25'h0;
	else if(output_div == 25'd79_999)
		output_div<=25'h0;
	else
		output_div<=output_div+25'h1;
end


always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		output_en <= 2'b00;
	else if(output_div == 25'd19_999)
		output_en <= 2'b01;
	else if(output_div == 25'd39_999)
		output_en <= 2'b10;
	else if(output_div == 25'd59_999)
		output_en <= 2'b11;
	else if(output_div == 25'd79_999)
		output_en <= 2'b00;
end

endmodule
