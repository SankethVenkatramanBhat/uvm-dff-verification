interface dff_intf(input bit clk);
  logic [3:0]d;
  logic rst_n;
  logic [3:0]q;
  logic [3:0]q_bar;
endinterface:dff_intf