// Test bench for the combinational logic circuit
`include "alu.v"
module test_bench();

// Inputs
reg [2:0] in;
reg [11:0] check;
reg clk,reset,enable,value;

// Variables
integer i,j;

// Outputs	
wire y,e;

// Instantiate the Unit Under Test (UUT)
alu uut (in,clk,reset,enable,check,value,y,e);

always #5  clk = ~clk ;//setup clk
initial begin
	// Initialize Inputs
	$dumpfile("test_bench.vcd");
	$dumpvars;

	// initialise all the wires
	reset = 1'b0;
	enable = 1'b1;
	value = 1'b0;
	check = 12'b0;
	clk = 0;
	in = 3'b110;

	#5 // se3tting wire B sa1
	check = 12'b000000000010;
//	enable = 1'b1;
	value = 1;
	#100

	// reset the wires
	reset = ~reset;
	#5
	reset = ~reset;

	#5 // setting ckt fault free
	check = 12'b0;
	#100
	$finish;
/*
	// reset the wires
	reset = ~reset;
	#5
	reset = ~reset;

	#5 // setting wire w9  to sa1
	check = 9'b100000000;
	value = 0;

	#100
*/
end
endmodule
