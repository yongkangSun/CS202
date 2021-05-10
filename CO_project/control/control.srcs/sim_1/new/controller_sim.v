`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/20 11:07:20
// Design Name: 
// Module Name: controller_sim
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


module controller_sim();
    reg [5:0] Opcode, Function_opcode;
    wire [1:0] ALUOp;
    wire Jr, RegDST, ALUSrc, MemtoReg, RegWrite, MemWrite, Branch, nBranch, Jmp, Jal, I_format, Sftmd;

    controller test_control(Jr, Jmp, Jal, Branch, nBranch,
                            RegDST, MemtoReg, RegWrite, MemWrite,
                            ALUSrc, I_format, Sftmd, ALUOp,
                            Opcode, Function_opcode);

    initial begin
        Opcode = 6'h00;
        Function_opcode = 6'h20;
        #20
        Opcode = 6'h00;
        Function_opcode = 6'h08;
        #20
        Opcode = 6'h08;
        Function_opcode = 6'h08;
        #20
        Opcode = 6'h23;
        Function_opcode = 6'h08;
        #20
        Opcode = 6'h2b;
        Function_opcode = 6'h08;
        #20
        Opcode = 6'h04;
        Function_opcode = 6'h08;
        #20
        Opcode = 6'h05;
        Function_opcode = 6'h08;
        #20
        Opcode = 6'h02;
        Function_opcode = 6'h08;
        #20
        Opcode = 6'h03;
        Function_opcode = 6'h08;
        #20
        Opcode = 6'h00;
        Function_opcode = 6'h02;
        #20
        $finish;
    end
endmodule
