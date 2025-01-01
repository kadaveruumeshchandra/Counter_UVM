//Predictor Class
class sb_predictor extends uvm_subscriber#(my_transaction);
  `uvm_component_utils(sb_predictor)

  uvm_analysis_port#(my_transaction)results_ap;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    my_transaction exp_tr;
    exp_tr=sb_calc_exp(t);
    results_ap.write(exp_tr);
  endfunction
  extern function my_transaction sb_calac_exp(my_transaction t);
endclass

//Same like here the above part is same for everything we need to change the below function according to our requirement
function my_transaction sb_predictor::sb_calc_exp(my_transaction t);
  static bit [2:0] prev_out;
  my_transaction trans=my_transaction::type_id::create("trans");
  trans.copy(t);
  if(~trans.reset) begin
    trans.count=prev_out;
    prev_out++;
   end
   else begin
    trans.count=prev_out;
    prev_out=0;
   end
   return trans;
endfunction
