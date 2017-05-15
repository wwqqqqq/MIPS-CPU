`timescale 1ns / 1ps


module test;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.result(result)
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
		
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst_n=1;
		// Add stimulus here

	end
      
endmodule

