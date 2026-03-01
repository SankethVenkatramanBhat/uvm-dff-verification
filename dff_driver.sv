class dff_driver extends uvm_driver#(dff_trans);
  `uvm_component_utils(dff_driver)
  virtual dff_intf vif;
  
  function new(string name="dff_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual dff_intf)::get(this,"","vif",vif)))
      `uvm_fatal("DRV_CFG_ERR", "Virtual interface not found in config_db");
  endfunction
      
      task run_phase(uvm_phase phase);
         forever begin
           seq_item_port.get_next_item(req);
           @(posedge vif.clk);
           vif.rst_n<=req.rst_n;
           vif.d<=req.d;
           `uvm_info(get_type_name(),$sformatf("driving rst_n=%0b, d=%0b",req.rst_n,req.d),UVM_MEDIUM);
           seq_item_port.item_done();
         end
     endtask
     endclass:dff_driver