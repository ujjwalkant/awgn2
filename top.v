`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:08:58 07/21/2014 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top( clk, reset, x0, x1);
 input clk, reset;
 output[15:0] x0,x1;
 wire [31:0] data1, data2;
 wire [15:0] u1;
 wire [47:0] u0;
 wire [7:0] outlog, e, f ;
 wire [15:0] x_out, y_out;
 
 
 assign u1 = 2* 3 * data2[15:0];
 assign u0 = {data1, data2[31:16]};
 assign e  = 2 * outlog;
 
 lfsr    	l1(.data(data1) ,.clk(clk), .reset(reset));
 lfsr2   	l2(.data(data2) ,.clk(clk), .reset(reset));
 LOG     	l3(.outlog(outlog),.inlog(u0));
 sine    	l4(.phase_in(u1),.x_out(x_out), .y_out(y_out), .clk(clk));
 squarerut 	l5(.x_in(e), .x_out(f),.clk(clk));
 
 
 assign x0 = f* x_out;
 assign x1 = f* y_out;
 
 endmodule
