`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/13 11:58:57
// Design Name: 
// Module Name: RAM_control
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


module RAM_control(readData, clock, Address, writeData, memWrite);
input clock;
input [31:0] Address;
input [31:0] writeData;
input memWrite;
output [31:0] readData;
wire clk;
assign clk = !clock;
RAM ram(
    .clka(clk),
    .wea(memWrite),
    .addra(Address[15:2]),
    .dina(writeData),
    .douta(readData)
);
endmodule
