`timescale 1ns / 1ns
module Load_tb;

  reg Zout, Rout, HIout, LOout, Zhighout, Zlowout, 
      PCout, MDRout, InPortout, OutPortIn, Cout;    
  reg MARin, Zin, PCin, MDRin, IRin, Yin;
  reg Gra, Grb, Grc, Rin, CONin, CONread, we;
  reg Read, IncPC, HIin, LOin, ZhighIn, ZlowIn, BAout;
  reg clock, clear;

  // State encoding
  parameter Default = 4'b0000, T0 = 4'b0001, T1a = 4'b0010, T1b = 4'b0011,
            T2a = 4'b0100, T2b = 4'b0101, T3 = 4'b0110, T4 = 4'b0111, T5 = 4'b1000, T6a = 4'b1001, T6b = 4'b1010,T7 = 4'b1011, T8 = 4'b1100;
  reg [3:0] Present_state = Default;

  // Instantiate DataPath module
  DataPath DUT (
    clock, clear, Gra, Grb, Grc,
	 Rout, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, OutPortIn, Cout,
	 Yin, Rin, PCin, IRin, HIin, LOin, MARin, MDRin, Read, ZhighIn, ZlowIn, BAout, IncPC, we, CONin, CONread
  );

  // Clock generation
  initial begin
    clock = 0;
    clear = 0;
    forever #10 clock = ~clock;
  end

  // State transition logic
  always @(posedge clock) begin
    if (clear)
      Present_state <= Default;
    else begin
      case (Present_state)
        Default: Present_state <= T0;
        T0: Present_state <= T1a;
        T1a: Present_state <= T1b;
        T1b: Present_state <= T2a;
        T2a: Present_state <= T2b;
		  T2b: Present_state <= T3;
        T3: Present_state <= T4;
        T4: Present_state <= T5;
		  T5: Present_state <= T6a;
        T6a: Present_state <= T6b;
		  T6b: Present_state <= T7;
		  T7: Present_state <= T8;
       
      endcase
    end
  end

  always @(Present_state) begin
    case(Present_state)
      Default: begin
		
			Zout<=0; Rout<=0; HIout<=0; LOout<=0; Zhighout<=0; Zlowout<=0; 
			PCout<=0; MDRout<=0; InPortout<=0; Cout<=0;    
			MARin<=0; Zin<=0; PCin<=0; MDRin<=0; IRin<=0; Yin<=0;
			Gra<=0; Grb<=0; Grc<=0; Rin<=0; OutPortIn<=0;
			Read<=0; IncPC<=0; HIin<=0; LOin<=0; ZhighIn<=0; ZlowIn<=0; BAout<=0;
			CONin<=0; CONread<=0; we<=0;
			DUT.PC1.q = 32'h00000000;
			 
		   force DUT.bus.BusMuxInInPort = 32'h00000000;
			
      end

      // Load instruction address into MAR
      T0: begin
        PCout <= 1; IncPC<=1; PCin <= 1;
		  ZlowIn<=1; MARin <= 1;
		end

		// Read instruction into MDR
		T1a: begin
			PCout <= 0; IncPC<=0; PCin <= 0;
			ZlowIn<=0; MARin <= 0;
			Read <= 1; Zlowout <= 1; 
      end 
      T1b: begin
        MDRin <= 1; 
      end

      // Move instruction from MDR to IR
      T2a: begin
        MDRin <= 0; Read <= 0; Zlowout <= 0;
        MDRout <= 1;
      end
		
		T2b: begin
        IRin <= 1;
      end

      // Extract memory location (0x54) from IR and store in MAR
      T3: begin
        IRin <= 0;
		  MDRout <= 0; 
		  
        BAout <= 1; Grb <= 1; Yin <= 1;
      end

      // Read memory at address 0x54 and store in MDR
      T4: begin
        BAout <= 0; Grb <= 0; Yin <= 0;
		  
        Cout <= 1; Zin <= 1; MARin <= 1; 
      end

      // Move value from MDR to R4
      T5: begin
		  Zin <= 0;
      end
		
		T6a: begin
        MARin <= 0; Cout <= 0; 
        Read <= 1; 
      end
		
		T6b: begin
			MDRin <= 1;
		end
			
		T7: begin
        MDRin <= 0 ;Read <= 0;
        MDRout <= 1; Gra <= 1; Rin <= 1;
      end
		T8: begin
        MDRout <= 0; Gra <= 0; Rin <= 0;
      end
    endcase
  end

endmodule
