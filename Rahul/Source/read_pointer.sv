`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2023 08:06:09
// Design Name: 
// Module Name: read_pointer
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


module read_pointer #(parameter n=4)(
input logic rclk,rrst_n,
input logic rinc,
input logic [n-1:0] rq2wptr,
output logic [n-1:0] rptr,
output logic [n-2:0] raddr,
output logic renable);

logic rempty;
logic [n-1:0]raddress;

//read address and read pointer value generation    
grey_counter write_grey_counter (
.clk(rclk),
.rst_n(rrst_n),
.inc(rinc),
.flag(rempty),
.ptr(rptr),
.address(raddress),
.enable(renable));

assign rempty = (rptr == rq2wptr);
assign raddr = raddress [n-2:0];

endmodule
