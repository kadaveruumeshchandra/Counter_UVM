//transaction Class
class my_transaction extends uvm_sequence_item;
  `uvm_object_utils(my_transaction)
  bit reset;
  bit [2:0]count;

  function new(string name="my_transaction");
    super.new(name,parent);
  endfunction

  function void do_copy(uvm_object rhs);
    my_transaction tr;
    $cast(tr,rhs);
    super.do_copy(rhs);
    reset=tr.reset;
    count=tr.count;
  endfunction

  function string convert2string;
    string s;
    s=$sformatf("reset:%0b count:%0b",reset,count);
    return s;
  endfunction

  virtual function bit do_compare(uvm_object rhs,uvm_comparer comparer);
    bit res;
    my_transaction _pkt;
    $cast(_pkt,rhs);
    super.do_compare(_pkt,comparer);
    res=super.do_compare(_pkt,comparer)&(count==_pkt.count);
    return res;
  endfunction

  function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_int("count",count,$bits(count),UVM_HEX);
  endfunction
endclass
