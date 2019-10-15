class rv_monitor extends uvm_monitor;
  
  `uvm_component_utils(rv_monitor)
  
  virtual rv_inf v_if;
  
  uvm_analysis_port#(rv_xtn) mon_port;
  rv_xtn trans;
  
  
  function new(string name="rv_monitor", uvm_component parent);
    super.new(name,parent);
    mon_port=new("mon_port",this);
  endfunction
  
  
  
  extern function void build_phase(uvm_phase phase);
    //extern task run_phase(uvm_phase phase);
     //  extern task collect_from_dut();
    
    endclass
    
      function void rv_monitor::build_phase(uvm_phase phase);
        super.build_phase(phase);
       // mon_port = new ("mon_port", this);
        if(!uvm_config_db#(virtual rv_inf)::get(this,"","v_if",v_if)) begin `uvm_fatal(get_type_name(),"this interface not available")
          trans=rv_xtn::type_id::create("trans");
        end
      endfunction
       /*   
          task rv_monitor::run_phase(uvm_phase phase);
           trans=rv_xtn::type_id::create("trans");
            forever begin
            //seq_item_port.get_next_item(req);
            collect_from_dut();
            //seq_item_port.item_done();
             // $display("r_type at monitor: %0h", trans.rv32i);
            end
          endtask
          
          task rv_monitor::collect_from_dut();
            @(v_if.monitor.mon_cb);
            
           if(v_if.monitor.mon_cb.valid)
             begin
             trans.valid = v_if.mon_cb.valid;
             trans.rv32i = v_if.mon_cb.rv32i;
               
            @(v_if.monitor.mon_cb);
               
           wait(v_if.monitor.mon_cb.rv_ack);
           wait(v_if.monitor.mon_cb.op_retire);
               
           trans.rv_out = v_if.monitor.mon_cb.rv_out; 
               
             //@(v_if.monitor.mon_cb);
          end //end for valid
            
         else //if(!v_if.monitor.mon_cb.write_enable)
              begin
               trans.valid = 1'b0;
               trans.rv32i = v_if.mon_cb.rv32i;
               //trans.op_retire = v_if.mon_cb.op_retire;                           //trans.print();

                mon_port.write(trans);

              end
            `uvm_info("mon","monitor Data",UVM_LOW) 
           // trans.print();
          endtask
          */