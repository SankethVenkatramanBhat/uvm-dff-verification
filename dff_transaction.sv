class dff_trans extends uvm_sequence_item;
  `uvm_object_utils(dff_trans)
  rand bit [3:0]d;
  rand bit rst_n;
  constraint reset_c { rst_n dist {1 := 90, 0 := 10}; } 
  bit[3:0] q;
  bit [3:0]q_bar;
  
  function new(string name="dff_trans");
    super.new(name);
  endfunction
endclass:dff_trans