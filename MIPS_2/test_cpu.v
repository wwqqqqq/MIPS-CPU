`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:21:08 05/13/2017
// Design Name:   CPU
// Module Name:   C:/Users/WQ/Desktop/2017Spring/ComputerOriganization/experiment/E7/MIPS/test_cpu.v
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

module test_cpu;

	// Inputs
	reg clk;
	reg rst_n;
	reg [31:0] PC_Init;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.PC_Init(PC_Init), 
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
		//clk = 0;
		rst_n = 0;
		PC_Init = 0;

		// Wait 100 ns for global reset to finish
		#10;
      rst_n=1;
		// Add stimulus here

	end
      
endmodule

