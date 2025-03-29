module MDR #(parameter DATA_WIDTH = 32)(
    input wire clk, 
    input wire clr, 
    input wire enable, 
    input wire Read, 
    input wire [DATA_WIDTH-1:0] BusMuxOut, 
    input wire [DATA_WIDTH-1:0] Mdatain,
    output wire [DATA_WIDTH-1:0] BusMuxInMDR
	 
);

	reg [DATA_WIDTH-1:0] MDR_reg;

	always @(posedge clk or posedge clr) begin
		 if (clr) 
			  MDR_reg <= 0;
		 else if (enable) begin
			  if (Read) 
					MDR_reg <= Mdatain; // Load from memory
			  else 
					MDR_reg <= BusMuxOut; // Load from bus
		 end
	end

	assign BusMuxInMDR = MDR_reg;

endmodule