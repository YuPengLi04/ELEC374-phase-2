// Ripple Carry Adder for Subtraction  
module sub #(parameter DATA_WIDTH = 32)(A, B, Result);

// sub if 1 its subtract, 0 if its add

input [DATA_WIDTH-1:0] A, B;
output [DATA_WIDTH-1:0] Result;

reg [DATA_WIDTH-1:0] Result;
reg [32:0] LocalCarry;
reg [DATA_WIDTH-1:0] Local_B;

integer i;
integer j;
integer k;

always@(A or B)
	begin
		k = 0;
		Local_B = ~B+1;
		/*for (j = 31; j > -1; j = j - 1) begin
			if (Local_B[j] == 0) begin
				if (k == 0)
					Local_B[j] = 0;
				else
					Local_B[j] = 1;
			end
			else begin
				if (k == 0) begin
					Local_B[j] = 0;
					k = 1;
					end
				else if (k == 1)
					Local_B[j] = 0;
			end
    	end */
      
		LocalCarry = 33'd0;
		for(i = 0; i < 32; i = i + 1)
		begin
				Result[i] = A[i]^Local_B[i]^LocalCarry[i];
				LocalCarry[i+1] = (A[i]&Local_B[i])|(LocalCarry[i]&(A[i]|Local_B[i]));
		end
	end
endmodule
