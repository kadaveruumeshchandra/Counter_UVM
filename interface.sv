interface counter_if(input clk,reset);
  logic [2:0]count;

  clocking DRV@(posedge clk);
    default input #1 output #1;
    input count;
  endclocking

  clocking MON@(posedge clk);
    default input #1 output #1;
    input count;
    input reset;
  endclocking

  modport drv_mod(clocking DRV, input clk,reset);
  modport mon_mod(clocking MON, input clk);
endinterface
      
