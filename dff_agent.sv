class dff_agent extends uvm_agent;
  `uvm_component_utils(dff_agent)
  dff_driver drvh;
  dff_seqr seqrh;
  dff_monitor monh;
  uvm_analysis_port#(dff_trans) agent_ap;
  function new(string name="dff_agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent_ap=new("agent_ap",this);
    monh=dff_monitor::type_id::create("monh",this);
    
    if(get_is_active()==UVM_ACTIVE) begin
      drvh=dff_driver::type_id::create("drvh",this);
      seqrh=dff_seqr::type_id::create("seqrh",this);
    end
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    monh.mon_ap.connect(this.agent_ap);
    if(get_is_active()==UVM_ACTIVE) begin
      drvh.seq_item_port.connect(seqrh.seq_item_export);
    end
  endfunction
endclass:dff_agent
  
  