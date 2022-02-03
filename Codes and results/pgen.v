`timescale 1ns / 1ps
module pgen (input clk, enable, reset, output reg [2:0] q);

reg temp;
initial q = 3'b101;

always @ (posedge clk) // start generating when enable = 1 by setting check to 1
begin
	if (enable == 1'b1 && reset == 1'b0)
	begin
	temp = q[1] ^ q[2]; // store it temporarily to later assign without clashing with cache update
	q[2] <= q[1];
	q[1] <= q[0];
	q[0] <= temp;
	end
	else if (reset == 1'b1) q <= 3'b110;
end

//$display("%b %b %b %b %b",a,b,c,d,y);
endmodule

