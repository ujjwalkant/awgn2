`timescale 1ns / 1ps
//-----------------------------------------------------
// Design Name : lfsr
// File Name   : lfsr.v
// Function    : Linear feedback shift register
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module lfsr    (
data            ,  // Output of the counter
//enable          ,  // Enable  for counter
clk             ,  // clock input
reset              // reset input
);

//----------Output Ports--------------
//output [31:0] out;
//------------Input Ports--------------
//inout [31:0] data;
input  clk, reset;
//------------Internal Variables--------
output reg [31:0] data;
//output reg [31:0] out;
wire  linear_feedback;

//-------------Code Starts Here-------
assign linear_feedback = !(data[31] ^ data[21] ^ data[1] ^ data[0]);
//assign out =data;
always @(posedge clk)
if (reset) begin // active high reset
  data <= 32'd11111001 ;
end else  begin
  data <= {data[30],data[29],data[28],data[27],data[26],data[25],data[24],data[23],
          data[22],data[21],data[20],data[19],data[18],data[17],data[16],data[15],data[14],
          data[13],data[12],data[11],data[10],data[9] ,data[8],data[7],data[6],data[5],
			 data[4],data[3],data[2],data[1],data[0],linear_feedback};
//out <= data;
end 


endmodule  // End Of Module counter