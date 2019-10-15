class rv_env extends uvm_env;
  
  `uvm_component_utils(rv_env)
  
  function new(string name="rv_env", uvm_component parent);
    super.new(name,parent);
  endfunction  

  rv_agent rva;
  //rv_sb rvsb;
  
  extern function void build_phase(uvm_phase phase);
  //extern function void connect_phase(uvm_phase phase);
endclass

function void rv_env::build_phase(uvm_phase phase);
  super.build_phase(phase);
  rva=rv_agent::type_id::create("rva",this);
 // rvsb=rv_sb::type_id::create("rvsb",this);
endfunction

    /*
function void rv_env::connect_phase(uvm_phase phase);
 // rva.rvm.mon_port.connect(rvsb.fifo_sb.analysis_export);
endfunction
  */




  
  
  
  
  
  
  
  
  
  
  
//endclass
