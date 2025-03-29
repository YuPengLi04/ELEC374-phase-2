module RAM #(parameter DATA_WIDTH = 32, parameter ADDR_WIDTH = 9, parameter MEM_DEPTH = 512)(
    input wire clk,                      // Clock signal
    input wire we,                       // Write enable signal (1 = write)
    input wire read,                     // Read signal (1 = read)
    input wire [ADDR_WIDTH-1:0] addr,    // Address input
    input wire [DATA_WIDTH-1:0] data_in, // Data input (used for writing)
    output reg [DATA_WIDTH-1:0] data_out // Data output (used for reading)
);
    // Declare memory storage
    reg [DATA_WIDTH-1:0] mem [0:MEM_DEPTH-1];
    
    // Load memory contents from a hex file at simulation start
    initial begin
        //$readmemh("MemoryLoad4.hex", mem);  // Load from "MemoryLoad.hex"
		  //$readmemh("MemoryStore2.hex", mem);  // Load from "MemoryStore.hex"
		  //$readmemh("immediatemem.hex", mem);  // Load from "immediatemem.hex"
		  $readmemh("branchmem.hex", mem);  // Load from "branchmem.hex"
		  //$readmemh("specialmem.hex", mem);  // Load from "specialmem.hex"
		  //$readmemh("jumpmem.hex", mem);  // Load from "jumpmem.hex"
		  //$readmemh("inoutportmem.hex", mem);  // Load from "inoutportmem.hex"
    end 
    
    always @(posedge clk) begin
        // Write operation (when we = 1)
        if (we == 1) begin
            mem[addr] <= data_in; // Write data
				//$writememh("MemoryStore2.hex", mem);
        end
        
        // Read operation (when read = 1)
        if (read == 1) begin
            data_out <= mem[addr]; // Read data
        end
    end
endmodule
