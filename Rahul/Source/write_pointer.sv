`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2023 22:37:52
// Design Name: 
// Module Name: write_pointer
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


module write_pointer #(parameter n=4)(
input logic winc,
input logic [n-1:0]wq2rptr,
input logic wclk,
input logic wrst_n,
output logic [n-1:0]wptr,
output logic [n-2:0]waddr,
output logic wenable);

logic wfull;
logic [n-1:0] waddress_o;

//wite address and write pointer value generation
grey_counter #(.n(4)) write_grey_counter 
(
.clk(wclk),
.rst_n(wrst_n),
.inc(winc),
.flag(wfull),
.ptr(wptr),
.address(waddress_o),
.enable(wenable));

assign wfull = ((wptr[n-1] != wq2rptr [n-1]) && (wptr[n-2] != wq2rptr [n-2]) &&
                 (wptr[n-3:0] == wq2rptr [n-3:0]));
assign waddr = waddress_o [n-2:0];
 
endmodule
