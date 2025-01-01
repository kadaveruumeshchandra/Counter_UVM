`include "interface.sv"
`include "tb_pkg.sv"
`include "design.v"
module tb_top;
  import uvm_pkg::*;
  import tb_pkg::*;

  bit clk,reset;
  bit [2:0]count;

  counter_if vif(.clk(clk),.reset(reset));
  counter dut(.clk(clk),.reset(reset),.count(vif.count));

  initial begin
    uvm_config_db#(virtual counter_if)::set(uvm_root::get(),"*","vif",vif);
  end

  initial begin
    reset=1;
    clk=0;
    #10 reset=0;
  end

  always #5 clk=~clk;

  initial begin
    run_test("base_test");
  end
endmodule
