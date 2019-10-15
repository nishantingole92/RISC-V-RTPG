class rv_sequencer extends uvm_sequencer #(rv_xtn);
  
  `uvm_component_utils(rv_sequencer)
  
  function new(string name="rv_sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction
endclass