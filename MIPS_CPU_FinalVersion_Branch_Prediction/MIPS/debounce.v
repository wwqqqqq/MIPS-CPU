`timescale 1ns / 1ps

module debounce(
input clk,
input btn,
output reg rst_n
    );


//reg cur_rst=1'b0;
reg [19:0] cnt_rst=20'd0;

always@(posedge clk)
begin
	if(rst_n&&~btn)
		rst_n=1'b1;
	else if(rst_n&&btn&&cnt_rst>=20'd999999)
		rst_n=1'b0;
	else if(rst_n&&btn)
		cnt_rst=cnt_rst+20'b1;
	else if(~rst_n&&btn)
		cnt_rst=20'h0;
	else if(~rst_n&&~btn&&cnt_rst>=20'd999999)
		rst_n=1'b1;
	else if(~rst_n&&~btn)
		cnt_rst=cnt_rst+20'b1;
	else rst_n=1'b1;
end
	


/*
reg cur_rst;
always@(posedge clk)
begin
	if(~cur_rst&&btn&&cnt_rst==20'd999_999)
		rst_n=1'b0;
	else
		rst_n=1'b1;
	if(~cur_rst&&btn)
	begin
		if(cnt_rst==20'd999_999)
		begin
			cnt_rst<=20'd0;
			cur_rst<=1'b1;
		end
		else cnt_rst<=cnt_rst+20'd1;
	end
	else if(~cur_rst&&~btn)
		cnt_rst<=20'd0;
	else if(cur_rst&&~btn)
	begin
		cur_rst<=1'b0;
		cnt_rst<=20'd0;
	end
end*/

endmodule
