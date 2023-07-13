module binary_to_gray #(parameter WIDTH=4) 
    (input logic [WIDTH-1:0] binary, 
     output logic [WIDTH-1:0] gray);

  assign gray[WIDTH-1] = binary [WIDTH-1] ;
  
  genvar i;    
  generate
    for(i=1;i<WIDTH-1;i++) begin
      assign gray[WIDTH-i-1] = binary[WIDTH-i] ^ binary[WIDTH-i-1];
    end
  endgenerate
  
  assign gray[WIDTH-1] = binary[WIDTH-1];
  
endmodule
