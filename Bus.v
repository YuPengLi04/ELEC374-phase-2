module Bus #(parameter DATA_WIDTH = 32)(
    output wire [DATA_WIDTH-1:0] BusMuxOut,
    
    // Mux Inputs
    input [DATA_WIDTH-1:0] BusMuxInR0, input [DATA_WIDTH-1:0] BusMuxInR1, input [DATA_WIDTH-1:0] BusMuxInR2, input [DATA_WIDTH-1:0] BusMuxInR3, 
    input [DATA_WIDTH-1:0] BusMuxInR4, input [DATA_WIDTH-1:0] BusMuxInR5, input [DATA_WIDTH-1:0] BusMuxInR6, input [DATA_WIDTH-1:0] BusMuxInR7, 
    input [DATA_WIDTH-1:0] BusMuxInR8, input [DATA_WIDTH-1:0] BusMuxInR9, input [DATA_WIDTH-1:0] BusMuxInR10, input [DATA_WIDTH-1:0] BusMuxInR11, 
    input [DATA_WIDTH-1:0] BusMuxInR12, input [DATA_WIDTH-1:0] BusMuxInR13, input [DATA_WIDTH-1:0] BusMuxInR14, input [DATA_WIDTH-1:0] BusMuxInR15, 
    input [DATA_WIDTH-1:0] BusMuxInHI, input [DATA_WIDTH-1:0] BusMuxInLO, input [DATA_WIDTH-1:0] BusMuxInZhigh, input [DATA_WIDTH-1:0] BusMuxInZlow, 
    input [DATA_WIDTH-1:0] BusMuxInPC, input [DATA_WIDTH-1:0] BusMuxInMDR, input [DATA_WIDTH-1:0] BusMuxInCsignExtend, input [DATA_WIDTH-1:0] BusMuxInInPort,

    // Control Signals
    input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, 
    R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, 
    PCout, MDRout, InPortout, Cout
);

reg [DATA_WIDTH-1:0] q;
reg [4:0] select;
reg [23:0] temp;

always @(*) begin



	temp = 24'b0;
	select =  5'b0;	

    temp = {R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, 
            R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, 
            Zlowout, PCout, MDRout, InPortout, Cout}; //Cout is C_sign_extended_out   
		case (temp) 
        
			24'b000000000000000000000001: select = 5'd23;
			24'b000000000000000000000010: select = 5'd22;
			24'b000000000000000000000100: select = 5'd21;
			24'b000000000000000000001000: select = 5'd20;
			24'b000000000000000000010000: select = 5'd19;
			24'b000000000000000000100000: select = 5'd18;
			24'b000000000000000001000000: select = 5'd17;
			24'b000000000000000010000000: select = 5'd16;
			24'b000000000000000100000000: select = 5'd15;
			24'b000000000000001000000000: select = 5'd14;
			24'b000000000000010000000000: select = 5'd13;
			24'b000000000000100000000000: select = 5'd12;
			24'b000000000001000000000000: select = 5'd11;
			24'b000000000010000000000000: select = 5'd10;
			24'b000000000100000000000000: select = 5'd9;
			24'b000000001000000000000000: select = 5'd8;
			24'b000000010000000000000000: select = 5'd7;
			24'b000000100000000000000000: select = 5'd6;
			24'b000001000000000000000000: select = 5'd5;
			24'b000010000000000000000000: select = 5'd4;
			24'b000100000000000000000000: select = 5'd3;
			24'b001000000000000000000000: select = 5'd2;
			24'b010000000000000000000000: select = 5'd1;
			24'b100000000000000000000000: select = 5'd0;

		  		  
	endcase
end
        
always @(*) begin
    case (select) // Evaluate which signal is high (priority encoding)
        5'd0: q = BusMuxInR0;
        5'd1: q = BusMuxInR1;
        5'd2: q = BusMuxInR2;
        5'd3: q = BusMuxInR3;
        5'd4: q = BusMuxInR4;
        5'd5: q = BusMuxInR5;
        5'd6: q = BusMuxInR6;
        5'd7: q = BusMuxInR7;
        5'd8: q = BusMuxInR8;
        5'd9: q = BusMuxInR9;
        5'd10: q = BusMuxInR10;
        5'd11: q = BusMuxInR11;
        5'd12: q = BusMuxInR12;
        5'd13: q = BusMuxInR13;
        5'd14: q = BusMuxInR14;
        5'd15: q = BusMuxInR15;
        5'd16: q = BusMuxInHI;
        5'd17: q = BusMuxInLO;
        5'd18: q = BusMuxInZhigh;
        5'd19: q = BusMuxInZlow;
        5'd20: q = BusMuxInPC;
        5'd21: q = BusMuxInMDR;
        5'd22: q = BusMuxInInPort;
        5'd23: q = BusMuxInCsignExtend;
		  default: q = 32'b0;
    endcase
end

assign BusMuxOut = q;

endmodule
