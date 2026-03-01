class dff_monitor extends uvm_monitor;
  `uvm_component_utils(dff_monitor)
  virtual dff_intf vif;
  uvm_analysis_port#(dff_trans) mon_ap;
  
  function new(string name="dff_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!(uvm_config_db#(virtual dff_intf)::get(this,"","vif",vif)))begin
      `uvm_fatal("MON_CFG_ERR", "Cannot get virtual interface from config_db");
    end
    mon_ap=new("mon_ap",this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    dff_trans txnh;
    forever begin
      @(posedge vif.clk);
      txnh=dff_trans::type_id::create("txnh");
      txnh.d=vif.d;
      txnh.q=vif.q;
      txnh.q_bar=vif.q_bar;
      txnh.rst_n=vif.rst_n;
      mon_ap.write(txnh);
      `uvm_info(get_type_name(), $sformatf("Sampled: rst=%0d, d=%0d, q=%0d, q_bar=%0d", txnh.rst_n, txnh.d, txnh.q,txnh.q_bar), UVM_NONE)
    end
  endtask
endclass:dff_monitor