//Monitor Class
`define MON_IF vif.mon_mod.MON
class my_monitor extends uvm_monitor;
  `uvm_component_utils(my_monitor)

  virtual counter_if vif;
  my_transaction req;
  uvm_analysis_port#(my_transaction)mon_ap;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_ap=new("mon_ap",this);
    if(!uvm_config_db#(virtual counter_if)::get(this,"","vif",vif)) begin
      `uvm_fatal(get_type_name(),"VIF is not set")
    end
  endfunction

  virtual task run_phase(uvm_phase phase);
    forever begin
      req=my_transaction::type_id::create("req");
      @(vif.mon_mod.MON);
      req.count=`MON_IF.count;
      req.reset=`MON_IF.reset;
      `uvm_info(get_type_name(),req.convert2string(),UVM_LOW)
      mon_ap.write(req);
    end
  endtask
endclass
