//Design a 3-bit counter
module counter(
  input clk,
  input reset,
  output reg [2:0]count
);
  always@(posedge clk) begin
    if(reset) begin
      count<=0;
    end
    else begin
      count<=count+1;
    end
  end
endmodule
