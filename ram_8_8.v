`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 10:09:00
// Design Name: 
// Module Name: ram_8_8
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

// 8x8 RAM module
module ram_8_8 (
    input wire clk,
    input wire we,              // write enable
    input wire [2:0] addr,      // 3-bit address for 8 locations
    input wire [7:0] din,       // 8-bit data input
    output reg [7:0] dout       // 8-bit data output
);

reg [7:0] mem [7:0];           // 8 locations of 8-bit memory

integer i;

initial begin
    // Initialize RAM to zero using for loop
    for (i = 0; i < 8; i = i + 1) begin
        mem[i] = 8'b0;
    end
end

always @(posedge clk) begin
    if (we) begin
        mem[addr] <= din;      // Write data
    end
    dout <= mem[addr];         // Read data
end

endmodule

