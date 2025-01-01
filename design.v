//Design a 3-bit counter
module counter(
  input clk,
  input reset,
  output reg [2:0]a
);
  always@(posedge clk) begin
    if(reset) begin
      a<=0;
    end
    else begin
      a<=a+1;
    end
  end
endmodule
