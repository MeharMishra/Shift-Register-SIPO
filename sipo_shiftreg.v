module sipo_shiftreg( clk,reset,x,q);
  input clk, reset;
  input x;
  output reg[3:0] q;
  reg [3:0] temp;
  always @(posedge clk or posedge reset)
    if(reset) 
      begin
      temp<=4'b0;
      end
  else
    begin
      temp[3:1] <= temp[2:0];
      temp[0] <= x;
    end
  
  assign q = temp;
  
endmodule
  
 
