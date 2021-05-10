`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/25 11:38:21
// Design Name: 
// Module Name: RAM_sim
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


module RAM_sim();
reg clock = 1'b0;
reg memWrite = 1'b0;
reg [31:0] addr = 32'h0000_0000;
reg [31:0] writeData = 32'ha000_0000;
wire [31:0] readData;

RAM_control test_RAM(readData, clock, addr, writeData, memWrite);

always begin
    #10 clock = ~clock;
end 
always begin
    #20 addr <= addr + 32'h0000_0004;
end  

/*initial begin
    #200
    writeData = 32'ha000_00f5;
    memWrite = 1'b1;
    #200
    memWrite = 1'b0;
end*/
endmodule
