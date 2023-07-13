module fifo_wptr #(parameter n = 4)(
        input  logic wclk,
        input  logic wrst_n,
        input  logic winc,
        output logic wfull,
        input  logic [n-1:0] wq2_rptr, 
        output logic [n-1:0] wptr,
        output logic [n-2 : 0] waddr,
        output logic wen
        
    );

localparam ADDRSIZE = n-2 ;

logic wfull_val ;
logic [n-1:0] wgnext ;

assign wen = winc * (!wfull) ;
assign wptr = wgnext ;

assign wfull_val = ((wgnext[ADDRSIZE]    != wq2_rptr[ADDRSIZE] ) &&
                    (wgnext[ADDRSIZE-1]  != wq2_rptr[ADDRSIZE-1]) &&
                    (wgnext[ADDRSIZE-2:0]== wq2_rptr[ADDRSIZE-2:0]));

always @(posedge wclk or negedge wrst_n)
    if (!wrst_n) 
        wfull <= 1'b0;
    else 
        wfull <= wfull_val;

dual_n_bit_gray_counter u_b2g_cntr (
        .clk        ( wclk ) ,
        .rst_n      ( wrst_n ) ,
        .inc 		( winc ) ,
        .full_empty ( wfull ) ,
        .ptr 		( wgnext ) ,
        .addr 		( waddr )
        
    );
endmodule