`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/02 09:29:04
// Design Name: 
// Module Name: src1_sim
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


module src1_sim( );
//input
reg [23:0] sw=24'h000000;
//output
wire [23:0] led;
//instantiate the unit 
src1 usrc1(
.sw(sw),
.led(led)
);

always #10 sw=sw+1;
endmodule
