`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:44:30 07/21/2014
// Design Name:   lfsr
// Module Name:   E:/Matha-pachhi/VLSI/projects/awgn/lfsr_tb.v
// Project Name:  awgn
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lfsr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lfsr_tb;

	// Inputs
	reg enable;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] data;

	// Instantiate the Unit Under Test (UUT)
	lfsr uut (
		.data(data), 
		//.enable(enable), 
		.clk(clk), 
		.reset(reset)
	);
	
	always
	#5 clk=~clk;

	initial begin
		// Initialize Inputs
		//enable = 0;
		clk = 0;
		reset = 1;
		#10 //enable=1;
			reset=0;
		// Wait 100 ns for global reset to finish
		#100 $finish;
        
		  
		// Add stimulus here

	end
      
endmodule

