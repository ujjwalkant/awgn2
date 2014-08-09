`timescale 1ns / 1ps
//p encoder
//8bit p encoder
module p_encoder8to3(outp,eout,inp,ein
);
input [7:0] inp;
input ein;
output [2:0] outp;
output eout;
assign outp[0]=ein & (inp[3] | inp[2] | inp[1] | inp[0]);
assign outp[1]=ein & ((inp[5] & (~inp[3]) & (~inp[2])) | (inp[4] & (~inp[3]) & (~inp[2])) |inp[1] | inp[0]);
assign outp[2]=ein & ((inp[6] & ~inp[5] & ~inp[3] & ~inp[1]) | (inp[4] & ~inp[3] & ~inp[1]) | (inp[2] & ~inp[1]) | inp[0] );
assign eout=ein & ~inp[0] & ~inp[1] & ~inp[2] & ~inp[3] & ~inp[4] & ~inp[5] & ~inp[6] & ~inp[7];
endmodule




//32 BIT P_ENCODER USING 4 8BIT P_ENCODER
////////////////////////////////////////////////////////////////////////////////////////////////////////
module p_encoder48to6(outpt,inpt);
input [47:0] inpt;
output [5:0] outpt;
wire [2:0] peo1,peo2,peo3,peo4,peo5,peo6;
wire eout1,eout2,eout3,eout4,eout5,eout6;
assign eout6=1;
p_encoder8to3 pe1 (peo1,,inpt[47:40],eout1);
p_encoder8to3 pe2 (peo2,eout1,inpt[39:32],eout2);
p_encoder8to3 pe3 (peo3,eout2,inpt[31:24],eout3);
p_encoder8to3 pe4 (peo4,eout3,inpt[23:16],eout4);
p_encoder8to3 pe5 (peo5,eout4,inpt[15:8],eout5);
p_encoder8to3 pe6 (peo6,eout5,inpt[7:0],eout6);


assign outpt[5]=peo1[2] | peo2[2] | peo3[2] | peo4[2] | peo5[2] | peo6[2];
assign outpt[4]=peo1[1] | peo2[1] | peo3[1] | peo4[1] | peo5[1] | peo6[1];
assign outpt[3]=peo1[0] | peo2[0] | peo3[0] | peo4[0] | peo5[0] | peo6[0];
assign outpt[2]= (~eout1) & ~(eout2 ^ eout3);
assign outpt[1]= (~eout1) & ~(eout2 ^ eout3);
assign outpt[0]= (~eout1) & (~eout2);
endmodule




/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//APPROX LOG CALCULATING ALGO USING P_ENCODER
//LOG CALCULATING PROGRAM
module LOG(outlog,inlog
);
input [47:0] inlog;
output [7:0] outlog;
wire [5:0] outpet;
p_encoder48to6 pe48(outpet,inlog);
assign outlog=44-7*outpet/5;
endmodule
