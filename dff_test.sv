class dff_test extends uvm_test;
  `uvm_component_utils(dff_test)
  dff_env envh;
  function new(string name="dff_envh",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    envh=dff_env::type_id::create("envh",this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    dff_seq seqh;
    
    phase.raise_objection(this);
    phase.phase_done.set_drain_time(this,20);
    seqh = dff_seq::type_id::create("seqh");
    seqh.start(envh.agnth.seqrh);
    phase.drop_objection(this);
  endtask
endclass:dff_test