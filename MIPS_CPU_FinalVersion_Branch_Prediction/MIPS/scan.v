`timescale 1ns / 1ps

module scan(
input [1:0] output_en,
input [15:0] data,
input rst_n,
input read_mem_en,
output reg [3:0] an,
output reg [7:0] seg
    );
reg [3:0] scan_data;
always@(*)
begin
	if(~rst_n) an=4'b0000;
	else
	case(output_en)
		2'h0:    an=4'b1110;
		2'h1:    an=4'b1101;
		2'h2:    an=4'b1011;
		2'h3:    an=4'b0111;
		default: an=4'b0000;
	endcase
end

always@(*)
begin
	if(~rst_n)
		scan_data=4'h0;
	else
	case(output_en)
		2'h0:    scan_data=data[3:0];
		2'h1:    scan_data=data[7:4];
		2'h2:    scan_data=data[11:8];
		2'h3:    scan_data=data[15:12];
		default: scan_data=4'b0000;
	endcase
	
end

always@(*)
begin
	if(read_mem_en==1'b0||~rst_n)
		seg=8'b1111_1101;
	else
	case(scan_data)
		4'h0:    seg=8'b0000_0011;
		4'h1:    seg=8'b1001_1111;
		4'h2:    seg=8'b0010_0101;
		4'h3:    seg=8'b0000_1101;
		4'h4:    seg=8'b1001_1001;
		4'h5:    seg=8'b0100_1001;
		4'h6:    seg=8'b0100_0001;
		4'h7:    seg=8'b0001_1111;
		4'h8:    seg=8'b0000_0001;
		4'h9:    seg=8'b0000_1001;
		4'ha: 	seg=8'b0001_0001;
		4'hb: 	seg=8'b1100_0001;
		4'hc: 	seg=8'b0110_0011;
		4'hd: 	seg=8'b1000_0101;
		4'he: 	seg=8'b0110_0001;
		4'hf: 	seg=8'b0111_0001;

		default: seg=8'b1111_1111;
	endcase
end



endmodule