class rv_driver extends uvm_driver #(rv_xtn);
  
  `uvm_component_utils(rv_driver)
  virtual rv_inf v_if;
  
  
  function new(string name="rv_driver", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task drive_to_dut();
    
  endclass
    
       
    
    
  function void rv_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual rv_inf)::get(this,"","v_if",v_if)) begin `uvm_fatal(get_type_name(),"this interface not available")
        end
  endfunction
  
    
  task rv_driver::run_phase(uvm_phase phase);
           
     forever begin
       
      seq_item_port.get_next_item(req); //get seq-item from req fifo
         
                  drive_to_dut();
 
      seq_item_port.item_done(); //push item to rsp fifo
       //$display("r_type at driver: %0h", req.r_type); 
       //$display("rv32i :%0h", req.rv32i);       
      end
   endtask

    
  task rv_driver::drive_to_dut();
      @(v_if.driver.dr_cb);
    
    v_if.rv32i <= req.instruction;

    
           
        `uvm_info("Drv","Driver Data",UVM_LOW) 
         req.print();
  endtask
   /*   if()
       begin  //begin for valid
              v_if.driver.dr_cb.valid<=1'b1;
              //req.rv32i<=req.r_type;
              v_if.driver.dr_cb.rv32i<= req.rv32i;
              //@(v_if.driver.dr_cb);
         
             wait(v_if.driver.dr_cb.rv_ack);
             // @(v_if.driver.dr_cb);
            wait(v_if.driver.dr_cb.op_retire);
             // v_if.driver.dr_cb.rv_ack<=1'b1;
              //v_if.driver.dr_cb.op_retire<=1'b1;
              //@(v_if.driver.dr_cb);  
              req.rv_out<=v_if.driver.dr_cb.rv_out;
                
        end //end for valid
          
       else
        begin //begin for op_retire and rv_out
               v_if.driver.dr_cb.valid<=1'b0;
               v_if.driver.dr_cb.rv32i<= 1'b0;
              // @(v_if.driver.dr_cb);
               //wait(v_if.driver.dr_cb.rv_ack);
              // @(v_if.driver.dr_cb);
               //wait(v_if.driver.dr_cb.op_retire);
               //@(v_if.driver.dr_cb);
              // v_if.driver.dr_cb.rv_ack<=1'b0;        
               //v_if.driver.dr_cb.op_retire<=1'b0;
               //@(v_if.driver.dr_cb);
               //v_if.driver.dr_cb.rv_out<=1'b0;
         end //end for op_retire and rv_out
             
             
*/
      