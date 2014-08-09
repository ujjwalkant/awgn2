`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:30:43 07/21/2014
// Design Name:   top
// Module Name:   E:/Matha-pachhi/VLSI/projects/awgn/top_tb.v
// Project Name:  awgn
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] x0;
	wire [15:0] x1;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.reset(reset), 
		.x0(x0), 
		.x1(x1)
	);

	always
#5 clk =~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#10 reset =0;

		// Wait 100 ns for global reset to finish
		#100 $finish;
      
		
		// Add stimulus here

	end
      
endmodule

