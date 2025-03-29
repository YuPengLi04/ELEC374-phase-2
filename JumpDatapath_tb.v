`timescale 1ns/10ps
module JumpDatapath_tb;
  reg Rout, HIout, LOout, Zhighout, Zlowout, 
      PCout, MDRout, InPortout, OutPortIn, Cout;    
  reg MARin, PCin, MDRin, IRin, Yin, CONin, CONread;
  reg Gra, Grb, Grc, Rin;
  reg Read, we, IncPC, HIin, LOin, ZhighIn, ZlowIn, BAout;
  reg clock, clear;
  parameter  Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, T0 = 4'b0011,
                       T1a = 4'b0100, T1b = 4'b0101, T2a = 4'b0110, T2b = 4'b0111,
                       T3 = 4'b1000;
							  
  reg [3:0] Present_state = Default;

  // Instantiate DataPath module
  DataPath DUT (
    clock, clear, Gra, Grb, Grc,
    Rout, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, OutPortIn, Cout,    
    Yin, Rin, PCin, IRin, HIin, LOin, MARin, MDRin, Read, ZhighIn, ZlowIn, BAout, IncPC, we, CONin, CONread
  );

initial
begin
  clear = 0;
  clock = 0;
  forever #10 clock = ~clock;
end

always@(posedge clock)
  begin
    case(Present_state)
      Default : Present_state = Reg_load1a;
      Reg_load1a : Present_state = Reg_load1b;
      Reg_load1b : Present_state = T0;
      T0 : Present_state = T1a;
      T1a : Present_state = T1b;
      T1b : Present_state = T2a;
      T2a : Present_state = T2b;
      T2b : Present_state = T3;
    endcase
  end
  
always@(Present_state)
  begin
    case(Present_state)
      Default: begin
			Gra<=0; Grb<=0; Grc<=0; Rout<=0;
			HIout<=0; LOout<=0; Zhighout<=0;
			Zlowout<=0; PCout<=0; MDRout<=0;
			InPortout<=0; Cout<=0; Yin<=0;
			Rin<=0; PCin<=0; IRin<=0; HIin<=0;
			LOin<=0; MARin<=0; MDRin<=0; Read<=0;
			ZhighIn<=0; ZlowIn<=0; BAout<=0;
			IncPC<=0; we<=0; CONin<=0; CONread<=0;
			OutPortIn<=0;
      end
      Reg_load1a: begin  //"jr r8" = 32'hAC000000; for "jal r8" = 32'hA4000000;
		   force DUT.R8.q = 32'h00000001;
			force DUT.PC1.q = 32'h00000016;
      end
      Reg_load1b: begin
			release DUT.PC1.q; release DUT.R8.q; 
      end
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
      T3: begin
          MDRout<=0; IRin<=0;
          Rout<=1; PCin<=1;  // for jr r8
			 //Rin<=1; PCout<=1;  // for jal r8
			 Gra<=1;
		end
    endcase
  end
endmodule
