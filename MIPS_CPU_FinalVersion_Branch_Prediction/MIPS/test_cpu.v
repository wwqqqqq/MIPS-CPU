`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:04:14 05/18/2017
// Design Name:   CPU
// Module Name:   C:/Users/WQ/Desktop/2017Spring/ComputerOriganization/experiment/E7/MIPS_CPU_FinalVersion_With_Pipeline_Can_Interruption_Can_Download/MIPS/test_cpu.v
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
	reg read_mem_en;
	reg [5:0] read_mem_addr;
	reg External_intr;

	// Outputs
	wire [31:0] ReadData;
	wire [31:0] PC;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.read_mem_en(read_mem_en), 
		.read_mem_addr(read_mem_addr), 
		.External_intr(External_intr), 
		.ReadData(ReadData), 
		.PC(PC)
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
		read_mem_en = 0;
		read_mem_addr = 0;
		External_intr = 0;

		// Wait 100 ns for global reset to finish
		#10;
		rst_n=1;
		#50
		External_intr = 1 ;
		#2
		External_intr = 0 ;
        
		// Add stimulus here

	end
      
endmodule

