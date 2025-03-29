module CON_FF #(parameter DATA_WIDTH = 32)(
    input wire CONin,                    // CONin signal
	 input wire CONread,
    input wire [DATA_WIDTH-1:0] IRdata,
	 input wire [DATA_WIDTH-1:0]BusMuxOut,
    output reg branch_output					// Data output (used for reading)
);

	 localparam ISZERO = 4'b0000;
	 localparam NOTZERO = 4'b0001;
	 localparam GREATERTHANZERO = 4'b0010;
	 localparam LESSTHANZERO = 4'b0011;

	 reg bus_nor, bus_or;
	 reg [31:0] bus_not, bus_data;
	 reg s1, s2, s3, s4, s5;
	 
	 reg [3:0] decoder, andsig;
	 
	 reg [31:0] q;
	 
	 reg [31:0] busQ;
	 
	 integer i;
	 
	 always @ (*) begin
		 
		 if (CONread == 1) begin
			busQ = BusMuxOut;
		 end
		 
		 decoder = {{2{1'b0}}, IRdata [20:19]};
		 andsig = 4'b0;
		 
		 case(decoder)
			ISZERO: begin
				andsig[0] = 1'b1;
			end
			NOTZERO: begin
				andsig[1] = 1'b1;
			end
			GREATERTHANZERO: begin
				andsig[2] = 1'b1;
			end
			LESSTHANZERO: begin
				andsig[3] = 1'b1;
			end
		 endcase 
		 
		 bus_nor = ~|busQ;
		 bus_or = |busQ;
		 bus_not = ~busQ[31];
		 bus_data = busQ[31];
		 
		 s1 = bus_nor & andsig[0]; 
		 s2 = bus_or  & andsig[1]; 
		 if (bus_not[31] == 0 && andsig[2]) begin
			s3 = 1;
		 end
		 if (bus_data[31] == 0 && andsig[3]) begin
			s4 = 1;
		 end
		 s5 = s1 | s2 | s3 | s4;
	 
		 if (CONin ==  1 && s5 == 1) begin
			branch_output = s5;
		 end else
			branch_output = 1'b0;
		 end

endmodule
