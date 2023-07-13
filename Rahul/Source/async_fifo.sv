`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2023 09:02:00
// Design Name: 
// Module Name: async_fifo
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


module async_fifo #(parameter n=4)(
input logic [7:0]wdata,
input logic winc,rinc,
input logic wclk,rclk,
input logic wrst_n,rrst_n,
output logic wenable,renable,
output logic [7:0]rdata
 );

logic [n-1:0] wptr;
logic [n-2:0] waddr;
logic [n-1:0] rptr;
logic [n-2:0] raddr;
logic [n-1:0] rq2wptr;
logic [n-1:0] wq2rptr;

 
write_pointer u_write_pointer(
.winc(winc),
.wq2rptr(wq2rptr),
.wclk(wclk),
.wrst_n(wrst_n),
.wptr(wptr),
.waddr(waddr),
.wenable(wenable)
);

read_pointer u_read_pinter(
.rinc(rinc),
.rq2wptr(rq2wptr),
.rclk(rclk),
.rrst_n(rrst_n),
.rptr(rptr),
.raddr(raddr),
.renable(renable)
);

memory u_dual_port_ram(
.waddr(waddr),
.raddr(raddr),
.data_in(wdata),
.wclk(wclk),
.rclk(rclk), 
.wenable(wenable),
.renable(renable),
.data_out(rdata)
);

synchroniser r_synchroniser(
.din(wptr),
.clk(rclk),
.rst_n(rrst_n),
.q1(rq2wptr)
);

synchroniser w_synchroniser(
.din(rptr),
.clk(wclk),
.rst_n(wrst_n),
.q1(wq2rptr)
);

 
endmodule
