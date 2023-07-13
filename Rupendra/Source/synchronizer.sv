module synchronizer (
        input logic clk, nrst,
        input  logic d,
        output logic q
        );
        
 logic s;
 
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