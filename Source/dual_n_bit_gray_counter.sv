`timescale 1ns / 1ps

module dual_n_bit_gray_counter #(parameter n = 4)(
        input  logic clk,
        input  logic rst_n,
        input  logic inc,
        input  logic full_empty,
        output logic [n-1:0] ptr,
        output logic [n-2 : 0] addr
        
    );
    
    logic [n-1:0] bin ;
    logic [n-1:0] bnext ;
    logic [n-1:0] gnext ;
    logic [n-1:0] and_out ;
    
    assign and_out = inc & full_empty ;
    assign bnext   = bin + and_out ;
    
    always @(posedge clk, negedge rst_n)
        begin
            if (!rst_n)
                bin <= 0;
            else
                bin <= bnext;    
        end
    
    assign addr = bin[n-2:0] ;
    
  binary_to_gray #(.WIDTH(n)) 
		u_b2g		( .binary ( bnext ) , 
					  .gray   ( gnext ) );
  
    always @(posedge clk, negedge rst_n)
        begin
            if (!rst_n)
                ptr <= 0;
            else
                ptr <= gnext;    
        end
    
endmodule
