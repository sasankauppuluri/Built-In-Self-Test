// Test bench for the combinational logic circuit
`include "cl.v"
module test_bench();

// Inputs
reg [3:0] x;
reg [12:0] check;
reg type;

// Variables
integer i,j;

// Outputs	
wire y;

// Instantiate the Unit Under Test (UUT)
cl uut (x[3],x[2],x[1],x[0],check,type,y);

initial begin
	// Initialize Inputs
	$dumpfile("test_bench.vcd");
	$dumpvars;
	for (j=0;j<13;j++) begin
		if(j==0) begin
			for (i=0;i<16;i++) begin
				$write("%b%b%b%b ",i[3],i[2],i[1],i[0]);
			end
			$write("\n");
			for (i=0;i<16;i++) begin
				check =12'b0;
				x = i;
				#5;
				$write("%b ",y);  
			end
			$write("\n\n");
		end
			check = 0;
		for(i=0;i<16;i++) begin
			check[j] = 1;
			x = i;
			type = 0;
			#5;
			$write("%b ",y);
			check[j] = 0;
		end
		$write("\n");
			check = 0;
		for(i=0;i<16;i++) begin
			check[j] = 1;
			x = i;
			type = 1;
			#5;
			$write("%b ",y);
			check[j] = 0;
		end
		$write("\n");
	end
end
endmodule
