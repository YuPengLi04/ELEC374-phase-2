module ALU #(parameter DATA_WIDTH = 32)(
    input wire [4:0] opcode,
	 input wire CONout,
    input wire [DATA_WIDTH-1:0] YdataOut,
    input wire [DATA_WIDTH-1:0] BusMuxOut,
    output reg [DATA_WIDTH-1:0] ResultHi, ResultLow        // Output of the ALU
);
    wire [63:0] AdderResult, SubResult, ProductResult, DivResult;

    localparam AND  = 5'b00101;  // AND operation
    localparam OR   = 5'b00110;  // OR operation
    localparam NOT  = 5'b10010;  // NOT operation
    localparam NEG  = 5'b10001;  // NEG ioeration
    localparam ADD  = 5'b00011;  // ADD operation
    localparam SUB  = 5'b00100;  // SUB operation
    localparam MUL  = 5'b10000;  // MUL operation
    localparam DIV  = 5'b01111;  // DIV operation
    localparam SHR  = 5'b01001;  // SHR (Logical Shift Right)
    localparam SHRA = 5'b01010;  // SHRA (Arithmetic Shift Right)
    localparam SHL  = 5'b01011;  // SHL (Logical Shift Left)
    localparam ROR  = 5'b00111;  // ROR (Rotate Right)
    localparam ROL  = 5'b01000;  // ROL (Rotate Left)
	 localparam ADDI = 5'b01100;  // ADD immediate
	 localparam ANDI = 5'b01101;	// AND immediate
	 localparam ORI  = 5'b01110;	// OR immediate
	 localparam CONADD = 5'b11111;  //ADD operation for CON FF
	 
	 integer i;
	 
    always @(*) begin
        case (opcode)
            AND : begin
					for (i = 0; i < 32; i = i + 1) 
					begin
						ResultLow[i] = YdataOut[i] & BusMuxOut[i];
					end
				end
            OR : begin 
					for (i = 0; i < 32; i = i + 1) 
					begin
						ResultLow[i] = YdataOut[i] | BusMuxOut[i];
					end
				end
            NOT: begin
					ResultLow = ~BusMuxOut;																 //5'b10010           // NOT operation (only uses A)
					ResultHi = 32'h0;
				end
				NEG: begin
					ResultLow = ~BusMuxOut+1;															 //5'b10001				 // NEG 
					ResultHi = 32'h0;
				end
				ADD: begin
					ResultLow = AdderResult;															 //5'b00011				 // ADD operation
					ResultHi = 32'h0;
				end
				SUB: begin
					ResultLow = SubResult;																 //5'b00100           // SUB operation
					ResultHi = 32'h0;
				end
            MUL: begin
					ResultHi = ProductResult[63:32];													 //5'b10000           // MUL operation
					ResultLow = ProductResult [31:0];
				end
            DIV: begin
					ResultHi = DivResult[63:32]; 														 //5'b01111           // Handle divide-by-zero as zero result
					ResultLow =  DivResult[31:0];
				end
            SHR: begin
					ResultLow = YdataOut >> BusMuxOut;												 //5'b01001           // SHR (ResultLowgical SResultHift Right)
					ResultHi = 32'h0;
				end
            SHRA: begin
					ResultLow = $signed(YdataOut) >>> BusMuxOut;									 //5'b01010           // SHRA (Arithmetic SResultHift Right)
					ResultHi = 32'h0;
				end
            SHL: begin
					ResultLow = YdataOut << BusMuxOut;												 //5'b01011           // SHL (ResultLowgical SResultHift Left)
					ResultHi = 32'h0;
				end
            ROR: begin
					ResultLow = (YdataOut >> BusMuxOut) | (YdataOut << (32 - BusMuxOut)); //5'b00111           // ROR (Rotate Right)
					ResultHi = 32'h0;
				end
				ROL: begin
					ResultLow = (YdataOut << BusMuxOut) | (YdataOut >> (32 - BusMuxOut)); //5'b01000           // ROL (Rotate Left)
					ResultHi = 32'h0;
				end
				ADDI: begin
					ResultLow = AdderResult;
					ResultHi = 32'h0;
				end
				ANDI : begin
					for (i = 0; i < 32; i = i + 1) 
					begin
						ResultLow[i] = YdataOut[i] & BusMuxOut[i];
					end
				end
            ORI : begin 
					for (i = 0; i < 32; i = i + 1) 
					begin
						ResultLow[i] = YdataOut[i] | BusMuxOut[i];
					end
				end
				CONADD : begin
					if (CONout) begin
						ResultLow = AdderResult;
						ResultHi = 32'h0;
					end
					else begin
						ResultLow = YdataOut;
						ResultHi = 32'h0;
					end
				end
				default : begin
					ResultLow = 32'h0;
					ResultHi = 32'h0;
				end
        endcase
    end
	 
	 adder add(
		.A(YdataOut),
		.B(BusMuxOut),
		.Result(AdderResult)
	 );

	 sub sub(
	 	.A(YdataOut),
		.B(BusMuxOut),
		.Result(SubResult)
	 );
	 
	 BoothMul Mul(
		.M(YdataOut),
		.Q(BusMuxOut),
		.P(ProductResult)
	 );
	 
	 div div(
		.dividend(YdataOut),
		.divisor(BusMuxOut),
		.Result(DivResult)
	 );
endmodule
