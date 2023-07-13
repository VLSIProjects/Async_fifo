`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2023 08:54:50
// Design Name: 
// Module Name: grey_counter
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


module grey_counter #(parameter n = 4)(
input logic clk,rst_n,
input logic inc,flag, //full or empty flag used , along with increment control signal
output logic [(n-1):0] ptr,
output logic [(n-1):0] address,
output logic enable
);
logic [n-1:0]bnext;//incremented value after reading or writing
logic [n-1:0]gnext; //grey code value corresponding to bnext

assign enable = inc & !(flag);
assign bnext = address + enable;

always_ff @(posedge clk,negedge rst_n)
 begin
  if (!rst_n)
   address <=0;
  else 
   address <= bnext;
 end
 
 // binary to gray logic : start
assign gnext[n-1] = bnext[n-1];

genvar i;
generate 
    begin
        for (i=1;i<n;i++)
            assign gnext[n-1-i] = bnext[n-i] ^ bnext[n-1-i];
    end
endgenerate
// binary to gray logic : end

//n bit grey code pointer
always_ff @(posedge clk,negedge rst_n)
 begin
  if (!rst_n)
   ptr <=0;
  else 
   ptr <= gnext;
 end

endmodule
