class rv_test extends uvm_test;
  
  `uvm_component_utils(rv_test)
  
  function new(string name="rv_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  rv_env rve;
  rv_seq rvs;
  
 /* extern function void build_phase(uvm_phase phase);
    extern function void end_of_elaboration(uvm_phase phase);
      extern task run_phase(uvm_phase phase);*/
  
            
  
        
        
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    rve=rv_env::type_id::create("rve",this);
    rvs=rv_seq::type_id::create("rvs",this);
  endfunction
      
  function void end_of_elaboration_phase(uvm_phase phase);
    //super.end_of_elaboration_phase(phase)
        uvm_top.print_topology();
  endfunction
      
  task run_phase(uvm_phase phase);
   
    
    phase.raise_objection(this);
    rvs.start(rve.rva.rvsq);
    #1000;
    phase.drop_objection(this);
  endtask
      
endclass      