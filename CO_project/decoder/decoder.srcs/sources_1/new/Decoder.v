`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/26 00:00:49
// Design Name: 
// Module Name: Decoder
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


module Decoder();
input clock;
input Jal;
input RegDST;
input RegWrite;
input MemtoReg;
input ALUSrc;
input[31:0] instruction;
input[31:0] data_from_memory;
input[31:0] data_from_ALU;
input[31:0] data_from_PC;

output[5:0] opcode;
output[5:0] Function_opcode;
output[25:0] address;
output[31:0] Sign_extend;
output[31:0] Read_data_1;
output[31:0] Read_data_2;

// decode the instruction
wire[4:0] rs;
wire[4:0] rt;
wire[4:0] rd;
wire[4:0] shamt;
wire[15:0] immediate_number;

assign opcode = instruction[31:26];
assign rs = instruction[25:21];
assign rt = instruction[20:16];
assign rd = instruction[15:11];
assign shamt = instruction[25:21];
assign Function_opcode = instruction[5:0];
assign immediate_number = instruction[15:0];
assign address = instruction[25:0];

// Register file
reg[31:0] register[0:31];
wire[4:0] readR_1;
wire[4:0] readR_2;
wire[4:0] writeR;
wire[31:0] writeD;

assign 
assign Read_data_1 = register[];

endmodule
