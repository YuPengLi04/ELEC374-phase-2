module InputPort #(parameter DATA_WIDTH = 32)(
    input clock,
    input clear,
    input InPortout,              // Control signal to load the input port register
    input [DATA_WIDTH-1:0] data_in,   // Data coming from the external input device
    output reg [DATA_WIDTH-1:0] BusMuxIn_InPort // Data driven onto the bus
);

  always @(posedge clock) begin
    if (clear)
      BusMuxIn_InPort <= {DATA_WIDTH{1'b0}};
    else if (InPortout)
      BusMuxIn_InPort <= data_in;
  end

endmodule
