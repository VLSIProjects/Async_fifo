`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2023 08:59:09
// Design Name: 
// Module Name: memory
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


module memory #(parameter n = 4)(
input logic [n-2:0] waddr,
input logic [n-2:0] raddr,
input logic [7:0] data_in,
input logic wclk,rclk, wenable,renable,
output logic [7:0] data_out );

logic [7:0] mem [7:0];

always_ff @(posedge wclk)
begin
    if (wenable)
        mem[waddr] <= data_in;
end

always_ff @(posedge rclk)
begin
    if (renable)
        data_out<=mem[raddr];
end

endmodule
