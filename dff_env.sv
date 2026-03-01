class dff_env extends uvm_env;
  `uvm_component_utils(dff_env)
  dff_agent agnth;
  dff_sb sbh;
  function new(string name="dff_env",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    agnth=dff_agent::type_id::create("agnth",this);
    sbh=dff_sb::type_id::create("sbh",this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    agnth.agent_ap.connect(sbh.sb_ap);
  endfunction
  
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TOPOLOGY", "Printing UVM Topology...", UVM_NONE);
    uvm_top.print_topology();
  endfunction
  
endclass:dff_env