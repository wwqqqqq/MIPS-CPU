`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:04:04 05/13/2017
// Design Name:   CPU
// Module Name:   C:/Users/WQ/Desktop/2017Spring/ComputerOriganization/experiment/E7/MIPS/testcpu.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testcpu;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire [31:0] reg1;
	wire [31:0] reg2;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.reg1(reg1), 
		.reg2(reg2)
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
		//clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#10;
		rst_n=1;
        
		// Add stimulus here

	end
      
endmodule

