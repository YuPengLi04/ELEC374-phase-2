module DataPath(
    input wire clock, clear, Gra, Grb, Grc,
    input wire Rout, HIout, LOout, Zhighout, Zlowout, 
               PCout, MDRout, InPortout, OutPortIn, Cout,    
    input wire Yin, Rin, PCin, IRin, HIin, LOin, MARin, MDRin, Read, ZhighIn, ZlowIn, BAout, IncPC, we, CONin, CONread
);
    // Bus Mux Inputs
    wire [31:0] BusMuxInZ, BusMuxInR0, BusMuxInR1,
                BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5,
                BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9,
                BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13,
                BusMuxInR14, BusMuxInR15, BusMuxInPC, BusMuxInHI,
                BusMuxInLO, BusMuxInMDR, BusMuxInZhigh, BusMuxInZlow,
                BusMuxInCsignExtend, BusMuxInInPort;
    
    // Internal Signals
    wire [31:0] BusMuxOut, IRdataOut, YdataOut, MARdataOut;
    wire [31:0] Zregin, Zhighregin, Zlowregin, Mdatain;
    wire [4:0] opcode;
	 wire [8:0] addr;
	 wire ConFFOut;
		
    // Registers R0-R15
    register_zero R0(clear, clock, R0in, BAout, BusMuxOut, BusMuxInR0);
    register R1(clear, clock, R1in, BusMuxOut, BusMuxInR1);
    register R2(clear, clock, R2in, BusMuxOut, BusMuxInR2);
    register R3(clear, clock, R3in, BusMuxOut, BusMuxInR3);
    register R4(clear, clock, R4in, BusMuxOut, BusMuxInR4);
    register R5(clear, clock, R5in, BusMuxOut, BusMuxInR5);
    register R6(clear, clock, R6in, BusMuxOut, BusMuxInR6);
    register R7(clear, clock, R7in, BusMuxOut, BusMuxInR7);
    register R8(clear, clock, R8in, BusMuxOut, BusMuxInR8);
    register R9(clear, clock, R9in, BusMuxOut, BusMuxInR9);
    register R10(clear, clock, R10in, BusMuxOut, BusMuxInR10);
    register R11(clear, clock, R11in, BusMuxOut, BusMuxInR11);
    register R12(clear, clock, R12in, BusMuxOut, BusMuxInR12);
    register R13(clear, clock, R13in, BusMuxOut, BusMuxInR13);
    register R14(clear, clock, R14in, BusMuxOut, BusMuxInR14);
    register R15(clear, clock, R15in, BusMuxOut, BusMuxInR15);

    // Special Purpose Registers
    PC PC1 (clear, clock, PCin, IncPC, BusMuxOut, BusMuxInPC);
    register IR(clear, clock, IRin, BusMuxOut, IRdataOut);
    register Y(clear, clock, Yin, BusMuxOut, YdataOut);
    register ZHigh(clear, clock, ZhighIn, Zhighregin, BusMuxInZhigh);
    register ZLow(clear, clock, ZlowIn, Zlowregin, BusMuxInZlow);
    register HI(clear, clock, HIin, BusMuxOut, BusMuxInHI);
    register LO(clear, clock, LOin, BusMuxOut, BusMuxInLO);

    // Bus Multiplexer
    Bus bus(
        BusMuxOut, BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, 
        BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, 
        BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, 
        BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
        BusMuxInHI, BusMuxInLO, BusMuxInZhigh, BusMuxInZlow, 
        BusMuxInPC, BusMuxInMDR, BusMuxInCsignExtend, BusMuxInInPort,
        R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, 
        R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout,
        Zlowout, PCout, MDRout, InPortout, Cout
    );

    // Memory Data Register (MDR)
    MDR MDR1(clock, clear, MDRin, Read, BusMuxOut, Mdatain, BusMuxInMDR);
	 
	 
    // Memory Data Register (MDR)
    MAR MAR1(clock, clear, MARin, BusMuxOut, addr);
	 

    // RAM Memory Module
    RAM ram1(clock, we, Read, addr, BusMuxInMDR, Mdatain);

    // Register Selection and Control
    Select_and_encode SaE1(
        IRdataOut, Gra, Grb, Grc, Rin, Rout, BAout, 
        R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, 
        R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
        R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, 
        R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
        BusMuxInCsignExtend, opcode
    );

    // Condition Code Flip-Flop
    CON_FF con_ff(CONin, CONread, IRdataOut, BusMuxOut, ConFFOut);

    // ALU for Arithmetic Operations
    ALU ALU1(opcode, ConFFOut, YdataOut, BusMuxOut, Zhighregin, Zlowregin);

endmodule
