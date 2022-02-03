`timescale 1ns / 1ps
module cut (input [2:0] a,input [11:0] check,input value,output y); //atmost one saf
wire aa,b,c,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13;

assign aa = (check[0]==1) ? value: a[0];
assign b = (check[1]==1) ? value: a[1];
assign c = (check[2]==1) ? value: a[2];
assign w1 = (check[3]==1) ? value: aa;
assign w2 = (check[4]==1) ? value: b;
assign w3 = (check[5]==1) ? value: b;
assign w4 = (check[6]==1) ? value: b;
assign w5 = (check[7]==1) ? value: c;
assign w6 = (check[8]==1) ? value: w1 | w2;
assign w7 = (check[9]==1) ? value: (w4 & w5);
assign w8 = (check[10]==1) ? value: (w3 | w6);
assign w9 = (check[11]==1) ? value: (w7 & w8);
assign y = w9;
//$display("%b %b %b %b %b",a,b,c,d,y);
endmodule
