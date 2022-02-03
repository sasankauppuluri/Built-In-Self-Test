`timescale 1ns / 1ps

module comp(input [3:0] gSign, input [3:0] cutSign, input enable, output y);
wire [3:0] en; 
assign en  = {enable, enable, enable, enable};
wire [3:0] x0;
wire x1;
assign x0 = gSign ^ cutSign;
assign x1 = x0[0] | x0[1] | x0[2] | x0[3];
and(y,x1,enable);
endmodule

