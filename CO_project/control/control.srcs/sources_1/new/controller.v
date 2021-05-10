`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/20 11:06:53
// Design Name: 
// Module Name: controller
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


module controller(Jr, Jmp, Jal, Branch, nBranch, RegDST, MemtoReg, RegWrite, MemWrite, ALUSrc, I_format, Sftmd, ALUOp, opcode, Function_opcode);
    input[5:0]  opcode;
    input[5:0]  Function_opcode;
    output  Jr;
    output  Jmp;
    output  Jal;
    output  Branch;
    output  nBranch;
    output  RegDST;
    output  MemtoReg;
    output  RegWrite;
    output  MemWrite;
    output  ALUSrc;
    output  I_format;
    output  Sftmd;
    output[1:0]  ALUOp;

    wire R_format;

    assign Jr = ((opcode == 6'b00_0000) && (Function_opcode == 6'b00_1000)) ? 1'b1 : 1'b0;
    assign Jmp = (opcode == 6'b00_0010) ? 1'b1 : 1'b0;
    assign Jal = (opcode == 6'b00_0011) ? 1'b1 : 1'b0;
    assign Branch = (opcode == 6'b00_0100) ? 1'b1 : 1'b0;
    assign nBranch = (opcode == 6'b00_0101) ? 1'b1 : 1'b0;
    assign R_format = (opcode == 6'b00_0000) ? 1'b1 : 1'b0;
    assign RegDST = R_format;
    assign MemtoReg = (opcode == 6'b10_0011) ? 1'b1 : 1'b0;
    assign RegWrite = ((R_format || opcode == 6'b10_0011 || opcode == 6'b00_0011 || I_format) && !(R_format && Function_opcode == 6'b00_1000)) ? 1'b1 : 1'b0;
    assign MemWrite = (opcode == 6'b10_1011) ? 1'b1 : 1'b0;
    assign ALUSrc = (I_format || opcode == 6'b10_0011 || opcode == 6'b10_1011) ? 1'b1 : 1'b0;
    assign I_format = (opcode[5:3] == 3'b001) ? 1'b1 : 1'b0;
    assign Sftmd = (((Function_opcode == 6'b00_0000) || (Function_opcode == 6'b00_0010) 
                    || (Function_opcode == 6'b00_0010) || (Function_opcode == 6'b00_0010) 
                    || (Function_opcode == 6'b00_0010) || (Function_opcode == 6'b00_0010))
                    && R_format) ? 1'b1 : 1'b0;
    assign ALUOp = {(R_format || I_format), (Branch || nBranch)};

endmodule
