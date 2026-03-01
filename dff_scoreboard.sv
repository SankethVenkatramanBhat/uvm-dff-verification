class dff_sb extends uvm_scoreboard;
  `uvm_component_utils(dff_sb)
  bit [3:0]prev_d;
  int match,mismatch;
  uvm_analysis_imp#(dff_trans,dff_sb) sb_ap;
  
  function new(string name="dff_sb",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sb_ap=new("sb_ap",this);
  endfunction
  
  virtual function void write(dff_trans txnh);
    if(txnh.rst_n==0)begin
     prev_d=4'b0;
      `uvm_info("SB", "System Reset Observed: Expected Q cleared to 0", UVM_NONE)
      return;
    end
    
    if(txnh.q==prev_d) begin
      match++;
      `uvm_info("PASS", $sformatf("MATCH! Input_D_was=%0b | Output_Q_is=%0b", prev_d, txnh.q), UVM_NONE)
    end
    else begin
      mismatch++;
      `uvm_error("FAIL", $sformatf("MISMATCH! Input_D_was=%0b | Output_Q_is=%0b", prev_d, txnh.q))
    end
    
    if (txnh.q_bar !== ~txnh.q) begin
      `uvm_error("FAIL_QBAR", "q_bar is not the inverse of q!")
    end
 prev_d=txnh.d;
  endfunction
  virtual function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    $display("\n--- DFF SCOREBOARD REPORT ---");
    $display("  Matches:    %0d", match);
    $display("  Mismatches: %0d", mismatch);
    $display("-----------------------------\n");
  endfunction
  
endclass:dff_sb
  