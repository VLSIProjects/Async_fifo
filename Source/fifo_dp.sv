`timescale 1ns / 1ps


module fifo_dp(
    input logic wclk,
    input logic rclk,
    input logic wrst_n,
    input logic rrst_n,
    input logic [15:0] wdata,
    input logic [2:0] waddr,
    input logic [2:0] raddr,
    input logic wen,
    input logic ren,
    output logic [15:0] rdata,
    output logic rvalid

    );
    
    reg [15:0] mem [7:0] ;
    
    always_ff @(posedge wclk, negedge wrst_n)
        begin
            if(!wrst_n)
                begin
                    mem[0] <= 0;
                    mem[1] <= 0;
                    mem[2] <= 0;
                    mem[3] <= 0;
                    mem[4] <= 0;
                    mem[5] <= 0;
                    mem[6] <= 0;
                    mem[7] <= 0;
                end
            else if (wen)
                mem[waddr] <= wdata;    
        end
    
    
    always_ff @(posedge wclk, negedge wrst_n)
        begin
            if(!rrst_n)
                begin
                    rdata  <= 0;
                    rvalid <= 0;
                end
            else if (ren)
                begin
                    rdata  <= mem[waddr];
                    rvalid <= 1;
                end
           else              
                 begin
                    rdata  <= rdata;
                    rvalid <= 0;
                end   
        end
endmodule
