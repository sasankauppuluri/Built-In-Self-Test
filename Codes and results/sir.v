`timescale 1ns / 1ps
module sir (input clk,enable, reset,y, output reg [3:0] q);

reg [2:0] temp;
initial q = 4'b0;

always @ (posedge clk) // start generating when enable = 1 by setting check to 1
begin
	if (clk == 1) begin
	temp[0] = q[0] ^ y; // store it temporarily to later assign without clashing with cache update
	temp[1] = q[0] ^ q[3];
	temp[2] = q[0] ^ q[1];

	q[1] <= q[2];
	q[2] <= temp[1];
	q[3] <= temp[0];
	q[0] <= temp[2];
end
	if (reset == 1)	q <= 4'b0;
end

//$display("%b %b %b %b %b",a,b,c,d,y);
endmodule

