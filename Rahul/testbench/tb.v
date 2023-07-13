`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2023 20:50:58
// Design Name: 
// Module Name: tb
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


module tb();

reg wclk;
reg rclk;
reg wrst_n;
reg rrst_n;
reg winc;
reg rinc;
reg [7:0] wdata;
wire [7:0] rdata;
wire wenable,renable;

async_fifo dut(
.wdata(wdata),
.winc(winc),
.rinc(rinc),
.wclk(wclk),
.rclk(rclk),
.wrst_n(wrst_n),
.rrst_n(rrst_n),
.wenable(wenable),
.renable(renable),
.rdata(rdata));

//clk and reset generation
//write clock
initial 
  begin
    wclk = 1'b0;
    forever
    #5 wclk = ~wclk;
  end

//read clock
initial 
  begin
    rclk = 1'b0;
    forever
    #5 rclk = ~rclk;
  end 
  
//wrst
initial 
  begin
    wrst_n=0;
    #10
    wrst_n=1;
  end 
//rrst
initial 
  begin
    rrst_n=0;
    #10
    rrst_n=1;
  end 
  
initial
    begin
    winc=0;
    rinc=0;
    #5
    winc=1;
    rinc=1;
    end 
  
always @(posedge wclk, negedge wrst_n)
    begin
        if (!wrst_n)
           wdata<=0;
        else
           wdata<= wdata+1;
    end      

//initial
 //  begin
 //  wdata =0;
//   #30
//   wdata =1;
//   #50
//   wdata =1;
//   end
        


endmodule
