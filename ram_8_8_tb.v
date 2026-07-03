`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 10:10:54
// Design Name: 
// Module Name: ram_8_8_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module ram_8_8_tb;

reg clk;
reg we;
reg [2:0] addr;
reg [7:0] din;
wire [7:0] dout;

// Instantiate RAM
ram_8_8 uut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .din(din),
    .dout(dout)
);

// Clock generation (10ns period)
always #5 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    we = 0;
    addr = 0;
    din = 0;

    // ------------------------
    // WRITE OPERATIONS
    // ------------------------
    
    #10;
    we = 1;
    addr = 3'b000;
    din = 8'h11;

    #10;
    addr = 3'b001;
    din = 8'h22;

    #10;
    addr = 3'b010;
    din = 8'h33;

    #10;
    addr = 3'b011;
    din = 8'h44;

    // Stop writing
    #10;
    we = 0;

    // ------------------------
    // READ OPERATIONS
    // ------------------------

    #10;
    addr = 3'b000;

    #10;
    addr = 3'b001;

    #10;
    addr = 3'b010;

    #10;
    addr = 3'b011;

    #10;
    addr = 3'b100;  // not written (should be 00)

    // Finish simulation
    #20;
    $finish;
end

// Monitor output
initial begin
    $monitor("Time=%0t | we=%b | addr=%b | din=%h | dout=%h",
              $time, we, addr, din, dout);
end

endmodule

