`timescale 1ns / 1ps

module mux(input [2:0] primary, input [2:0] test, input enable, output [2:0] y);

wire [2:0] en; 
assign en = {enable, enable, enable};
wire [2:0] enNot, out1, out2;

assign enNot = ~en;
assign out1 = primary & enNot;
assign out2 = test & en;
assign y = out1 | out2;

endmodule

