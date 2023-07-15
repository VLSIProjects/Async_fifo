`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2023 14:16:06
// Design Name: 
// Module Name: d_ff
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


module d_ff #(parameter n = 4)(
    input logic clk, nrst,
    input  logic [n-1:0]  d,
    output logic [n-1:0] q
    );
    
    
    always_ff@(posedge clk, negedge nrst)
        begin
            if(!nrst)
                begin
                    q <= 0;
                end
             else   
                begin
                    q <= d;
                end 
        end
    
endmodule
