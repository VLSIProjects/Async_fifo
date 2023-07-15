`timescale 1ns / 1ps

module tb_fifo( );

logic wclk;
logic rclk;
logic wrst_n;
logic rrst_n;
logic [15:0] wdata;
logic winc;
logic rinc;
 logic wfull;
 logic rempty;
 logic [15:0] rdata;
 logic rvalid;

async_fifo_top  dut (
        .wclk 	( wclk 	 ) ,
        .rclk 	( rclk 	 ) ,
        .wrst_n ( wrst_n  ) ,
        .rrst_n ( rrst_n  ) ,
        .wdata  ( wdata   ) ,
        .winc 	( winc 	 ) ,
        .rinc 	( rinc 	 ) ,
        .wfull  ( wfull   ) ,
        .rempty ( rempty  ) ,
        .rdata  ( rdata   ) ,
        .rvalid ( rvalid ) ) ;
        
        
initial wclk = 0;
initial rclk = 0;

always #2 wclk = ~wclk;
always #1 rclk = ~rclk;

initial
    begin
        wrst_n = 0;
        rrst_n = 0;
        winc   = 1;
        rinc   = 1;
        
   #25  wrst_n = 1;
        rrst_n = 1;
    end        
   
   always @(posedge wclk)
    if (!wrst_n)
        wdata <= 0;
   else
        wdata <= wdata + 1;     
   
        
endmodule
