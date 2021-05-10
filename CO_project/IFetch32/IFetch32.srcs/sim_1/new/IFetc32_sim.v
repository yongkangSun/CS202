`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/27 11:56:08
// Design Name: 
// Module Name: IFetc32_sim
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


module IFetc32_sim();
reg[31:0] PC;
reg clock;
wire [31:0] Instruction;
program instmem(.clka(clock),.addra(PC[15:2]),.douta(Instruction));
always #5 clock = ~clock;
initial begin
clock = 1'b0;
#2 PC = 32'h0000_0000;
repeat(5)
#10 PC = PC+4;
#10 $finish;
end
endmodule
