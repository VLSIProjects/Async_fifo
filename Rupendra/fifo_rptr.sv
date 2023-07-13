module fifo_rptr #(parameter n = 4)(
        input  logic rclk,
        input  logic rrst_n,
        input  logic rinc,
        output logic rempty,
        input  logic [n-1:0] rq2_wptr, 
        output logic [n-1:0] rptr,
        output logic [n-2 : 0] raddr,
        output logic ren
        
    );

localparam ADDRSIZE = n-2 ;

logic rempty_val ;
logic [n-1:0] rgnext ;



assign ren = rinc * (!rempty) ;
assign rempty_val = (rgnext == rq2_wptr);

always @(posedge rclk or negedge rrst_n)
if (!rrst_n) rempty <= 1'b1;
else rempty <= rempty_val;


dual_n_bit_gray_counter u_b2g_cntr (
        .clk        ( rclk ) ,
        .rst_n      ( rrst_n ) ,
        .inc 		( rinc ) ,
        .full_empty ( rempty ) ,
        .ptr 		( rgnext ) ,
        .addr 		( raddr )
        
    );
endmodule