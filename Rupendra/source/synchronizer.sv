module synchronizer #(parameter n = 4)(
        input logic clk, nrst,
        input  logic [n-1:0]  d,
        output logic [n-1:0]  q
        );
        
 logic  [n-1:0] s;
 
 d_ff u_0 (      
     .clk  ( clk  )  ,       
 	 .nrst ( nrst )  ,       
     .d    ( d    )  ,     
     .q    ( s    )     
     );     
      
 d_ff u_1 (     
     .clk  ( clk  )  ,      
 	 .nrst ( nrst )  ,     
     .d    ( s    )  ,     
     .q    ( q    )     
     );     
      
        
endmodule        