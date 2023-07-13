`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2023 09:01:26
// Design Name: 
// Module Name: synchroniser
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


module synchroniser #(parameter n=4)(
input logic [n-1:0] din,
input logic clk,rst_n,
output logic [n-1:0]q1
    );
logic [n-1:0] q0;

always_ff @(posedge clk, negedge rst_n)
    begin
        if(!rst_n)
            begin
            q0<=0;
            q1<=0;
            end
        else
            begin
            q0<=din;
            q1<=q0;
            end
    end
    
        


endmodule
