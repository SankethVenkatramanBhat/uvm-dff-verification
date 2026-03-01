module dff(
  input [3:0]d,
  input clk,rst_n,
  output reg [3:0]q,q_bar);
  
  assign q_bar=~q;
  
  always@(posedge clk)begin
    if(!rst_n)
      q<=4'b0;
    else
      q<=d;
  end
  
endmodule