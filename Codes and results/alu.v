`timescale 1ns / 1ps
`include "pgen.v"
`include "mux.v"
`include "cut.v"
`include "sir.v"
`include "comp.v"

module alu(input [2:0] in, input clk, reset, enable, input [11:0] check, input value, output y,e);
// 3 inputs,clk,reset , cl output, fault detector

// initiate Pattern Gen blocks
// Let output be [2:0]p
wire [2:0] p;
pgen p1 (clk, enable, reset, p);

// initiate muxes
// outputs ym1, ym2
wire [2:0] ym1, ym2;
mux m1 (in,p,enable,ym1); // to fault-free
mux m2 (in,p,enable,ym2); // to faulty ckt

// execute the combinational logic
// outputs: yc1, yc2
wire yc1, yc2;
cut c1 (ym2,12'b0,1'b0,yc1); // golden
cut c3 (in,12'b0,1'b0,y); // golden
cut c2 (ym1,check,value,yc2); // faulty 

// signature register
// Let outputs be ys1, ys2
wire [3:0] ys1, ys2; // size should be changed. 7 values collected and 4 values are observed
sir s1 (clk,enable,reset,yc1, ys1); // golden
sir s2 (clk,enable,reset,yc2, ys2); // faulty

// comparator
comp c11 (ys1, ys2, enable, e);

//$display("%b %b %b %b %b",a,b,c,d,y);
endmodule
