class rv_agent extends uvm_agent;
  
  `uvm_component_utils(rv_agent)
  
  function new(string name="rv_agent", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  rv_driver rvd;
  rv_monitor rvm;
  rv_sequencer rvsq;
  
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
    endclass
    
    function void rv_agent::build_phase(uvm_phase phase);
      super.build_phase(phase);
      rvm=rv_monitor::type_id::create("rvm",this);
      rvd=rv_driver::type_id::create("rvd",this);
      
      rvsq=rv_sequencer::type_id::create("rvsq",this);
    endfunction
    
    function void rv_agent::connect_phase(uvm_phase phase);
      rvd.seq_item_port.connect(rvsq.seq_item_export);
    endfunction
    
    
    