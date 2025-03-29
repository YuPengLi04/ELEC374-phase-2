`timescale 1ns/10ps
module InOutPortDatapath_tb;
  reg Rout, HIout, LOout, Zhighout, Zlowout, 
      PCout, MDRout, InPortout, Cout;    
  reg MARin, PCin, MDRin, IRin, Yin, OutportIn, CONin, CONread;
  reg Gra, Grb, Grc, Rin;
  reg Read, we, IncPC, HIin, LOin, ZhighIn, ZlowIn, BAout;
  reg clock, clear;

  parameter  Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
                       Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, T0 = 4'b0110, T1 = 4'b0111,
                       T2 = 4'b1000, T3 = 4'b1001, T4 = 4'b1010, T5 = 4'b1011, T6 = 4'b1100;
							  
  reg [3:0] Present_state = Default;

  // Instantiate DataPath module
  DataPath DUT (
    clock, clear, Gra, Grb, Grc,
    Rout, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout,    
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
      Reg_load1b : Present_state = Reg_load2a;
      Reg_load2a : Present_state = Reg_load2b;
      Reg_load2b : Present_state = Reg_load3a;
      Reg_load3a : Present_state = T0;
      T0 : Present_state = T1;
      T1 : Present_state = T2;
      T2 : Present_state = T3;
      T3 : Present_state = T4;
      T4 : Present_state = T5;
		T5 : Present_state = T6;
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
			OutportIn<=0; IncPC<=0; we<=0; CONin<=0;
			CONread<=0;
      end/*
      Reg_load1a: begin
		    Read<=1; MDRin<=1;
          Mdatain<=32'h00000022;
      end
      Reg_load1b: begin
	       Read<=0; MDRin<=0;
          MDRout<=1; R6in<=1;
      end
      Reg_load2a: begin
		    MDRout<=0; R6in<=0; // initialize R6 with value 0x22
	      
	       Read<=1; MDRin<=1;
          Mdatain<=32'h00000024;
      end
      Reg_load2b: begin
	       Read<=0; MDRin<=0;
          MDRout<=1; PCin<=1;
      end
      Reg_load3a: begin 
	       MDRout<=0; PCin<=0; //initialize PC with value 0x24
	      
		    PCout<=1; MARin<=1; ZlowIn<=1; //incrementing pc counter by 1
      end*/
      T0: begin
			 PCout<=0; MARin<=0; ZlowIn<=0;
			 Zlowout<=1; PCin<=1;
      end
      T1: begin
			 Zlowout<=0; PCin<=0;
			 Read<=1; MDRin<=1;
          //Mdatain<=32'hb3000000;  //"in r6,27" = 32'hb3000000; "out r6,27" = 32'hbb000000;
      end
      T2: begin
          Read<=0; MDRin<=0;
          MDRout<=1; IRin<=1;
      end
      T3: begin
          MDRout<=0; IRin<=0;
          Rout<=1; Gra<=1; OutportIn<=1; //or Inportin
		end
    endcase
  end
endmodule
