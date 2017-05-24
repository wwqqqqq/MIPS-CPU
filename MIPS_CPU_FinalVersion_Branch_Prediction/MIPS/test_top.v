`timescale 1ns / 1ps


module test_top;

	// Inputs
	reg clk;
	reg btn;
	reg [7:0] sw;

	// Outputs
	wire [3:0] an;
	wire [7:0] seg;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.btn(btn), 
		.sw(sw), 
		.an(an), 
		.seg(seg)
	);
	
	always
	begin
	clk=0;
	#1
	clk=1;
	#1;
	end
	
	initial begin
		// Initialize Inputs
		clk = 0;
		btn = 1;
		sw = 0;

		// Wait 100 ns for global reset to finish
		#10;
		btn=0;
		#10
		sw[7]=1;
		#10
		sw[6:0]=sw[6:0]+1;
		#10
		sw[6:0]=sw[6:0]+1;
		#10
		sw[6:0]=sw[6:0]+1;
		#10
		sw[6:0]=sw[6:0]+1;
		#10
		sw[6:0]=sw[6:0]+1;
		
		#10
		sw[7]=0;
        
		// Add stimulus here

	end
      
endmodule

