module OutputPort #(parameter DATA_WIDTH = 32)(
    input clock,
    input clear,
    input OutPortin,               // Control signal to load output register
    input [DATA_WIDTH-1:0] BusMuxOut, // Data coming from the bus
    output reg [DATA_WIDTH-1:0] out_port // Output register (to the external output device)
);

  always @(posedge clock) begin
    if (clear)
      out_port <= {DATA_WIDTH{1'b0}};
    else if (OutPortin)
      out_port <= BusMuxOut;
  end

endmodule
