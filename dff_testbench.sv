`include "dff_interface.sv"
`include "dff_package.sv"
`include "uvm_macros.svh"

import uvm_pkg::*;
import dff_package::*;

module dff_tb;
  bit clk;
  dff_intf intf(clk);
  
  dff dut(.d(intf.d),
          .rst_n(intf.rst_n),
          .clk(intf.clk),
          .q(intf.q),
          .q_bar(intf.q_bar));
  
  initial begin 
    clk=1'b0;
    forever #5 clk=~clk;
  end
  
  initial begin 
    intf.rst_n<=1'b0;
    intf.d<=1'b0;
    #20 intf.rst_n<=1'b1;
  end
  initial begin
    uvm_config_db#(virtual dff_intf)::set(null,"*","vif",intf);
    run_test("dff_test");
  end
endmodule
  