module shift_reg_tb;
reg clk, reset;
reg x;
wire [3:0] q;
  
  sipo_shiftreg S1(
   .x(x),
    .q(q),
   .clk(clk),
   .reset(reset)
);  
  
  initial 
    begin
      $dumpfile("shift_reg.vcd");
      $dumpvars(0,S1);
    end 
  
  initial
begin
    clk =0;
    reset = 1;
    #3 reset = 0;
    forever #5 clk = ~clk;
end
  
  initial
  begin 
  @(posedge clk) x = 1'b1; 
  #5;
  @(posedge clk) x = 1'b1;
  #5;
  @(posedge clk) x = 1'b0;
  #5;
  @(posedge clk) x = 1'b1;
  #5;
  @(posedge clk)x = 1'b0;
  #5;
  @(posedge clk)x = 1'b1;
  #5;
  @(posedge clk)x = 1'b1;
  #5;
  reset=1'b1;
  #5;
  end

  
 initial 
    begin
  #200 $finish;
    end
  
endmodule