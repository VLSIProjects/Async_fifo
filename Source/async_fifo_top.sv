module async_fifo_top (
        input logic wclk,
        input logic rclk,
        input logic wrst_n,
        input logic rrst_n,
        input logic [15:0] wdata,
        input logic winc,
        input logic rinc,
        output logic wfull,
        output logic rempty,
        output logic [15:0] rdata,
        output logic rvalid
        
            );
            
  logic rptr, wptr;
  logic wq2_rptr, rq2_wptr ;
  logic waddr, raddr, wen, ren ;
            
  synchronizer u_wq2_rptr (
        .clk  ( wclk ) , 
		.nrst ( wrst_n ) ,
        .d 	  ( rptr ) ,
        .q    ( wq2_rptr ) 
        );

		
fifo_wptr u_fifo_wptr (
        .wclk 	  ( wclk 	  ) ,
        .wrst_n   ( wrst_n   ) ,
        .winc 	  ( winc 	  ) ,
        .wfull 	  ( wfull 	  ) ,
        .wq2_rptr ( wq2_rptr ) , 
        .wptr 	  ( wptr 	  ) ,
        .waddr    ( waddr    ),
        .wen      ( wen )
        
    );
		
fifo_dp u_fifo_dp (
    .wclk 	( wclk ) ,
    .rclk   ( rclk   ) ,
    .wrst_n ( wrst_n ) ,
    .rrst_n ( rrst_n ) ,
    .wdata  ( wdata  ) ,
    .waddr  ( waddr  ) ,
    .raddr  ( raddr  ) ,
    .wen 	( wen 	 ) ,
    .ren 	( ren 	 ) ,
    .rdata  ( rdata  ) ,
    .rvalid ( rvalid ) 

    );

synchronizer u_rq2_wptr (
        .clk  ( rclk ) , 
		.nrst ( rrst_n ) ,
        .d 	  ( wptr ) ,
        .q    ( rq2_wptr ) 
        );
        
        
        
fifo_rptr u_fifo_rptr (
        .rclk 	  ( rclk 	  ) ,
        .rrst_n   ( rrst_n   ) ,
        .rinc 	  ( rinc 	  ) ,
        .rempty   ( rempty   ) ,
        .rq2_wptr ( rq2_wptr ) , 
        .rptr     ( rptr     ) ,
        .raddr    ( raddr    ) ,
        .ren      ( ren )
        
    );

	          
            
endmodule            