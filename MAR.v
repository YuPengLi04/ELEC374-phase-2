module MAR #(parameter DATA_WIDTH_IN = 32, DATA_WIDTH_OUT = 9, INIT = 9'b0)(
	input clock, clear, enable, 
	input [DATA_WIDTH_IN-1:0]BusMuxOut,
	output wire [DATA_WIDTH_OUT-1:0]addr
);


reg [DATA_WIDTH_OUT-1:0]q;
initial q = INIT;

always @ (posedge clock)
		begin 
			if (clear) begin
				q <= {DATA_WIDTH_OUT{1'b0}};
			end
			else if (enable) begin
				q <= BusMuxOut[DATA_WIDTH_OUT-1:0];
			end
		end
	assign addr = q[DATA_WIDTH_OUT-1:0];
endmodule
