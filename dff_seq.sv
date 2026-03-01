class dff_seq extends uvm_sequence#(dff_trans);
  `uvm_object_utils(dff_seq)
  dff_trans txn;
  
  function new(string name="dff_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    dff_trans txn;
    `uvm_info(get_type_name(),"starting dff sequence",UVM_LOW)
    repeat(10) begin
      txn=dff_trans::type_id::create("txn");
      start_item(txn);
      if(!txn.randomize()) begin
        `uvm_error(get_type_name(), "Randomization failed!")
      end
      finish_item(txn);
    end
  endtask
endclass:dff_seq