class dp_sb extends uvm_scoreboard;
  `uvm_component_utils(dp_sb)
  
  uvm_tlm_analysis_fifo#(dp_xtn) fifo_sb;
  
dp_xtn wr_data;
dp_xtn rd_data;
  
  function new(string name="dp_sb",uvm_component parent);
    super.new(name,parent);
    fifo_sb=new("fifo_sb",this);
     endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     wr_data=dp_xtn::type_id::create("wr_data");
    rd_data=dp_xtn::type_id::create("rd_data");
    //wr_data=new("wr_data",this);
    //rd_data=new("rd_data",this);
  endfunction
  
  
  logic [15:0] ref_data [bit[3:0]];// associative array act like reference model
  
  //write method for associative array
  
  virtual function void mem_write(dp_xtn wr);
   // if(wr.data_write)
      begin
        ref_data[wr.address_write]=wr.data_write;
        `uvm_info(get_type_name(),$sformatf("writing %s",wr.sprint()),UVM_HIGH)
      end
  endfunction
  
  virtual function mem_read(ref dp_xtn rd,dp_xtn wr);
   // if(rd.data_read)
      
        `uvm_info(get_type_name(),$sformatf("reading %s",rd.sprint()),UVM_HIGH)
        if(ref_data.exists(wr.address_read))
          begin
            rd.data_read=ref_data[rd.address_read];
            return(1);
          end
        else
          begin
            rd.data_read=0;
            `uvm_info(get_type_name(),$sformatf("no data written %s",rd.sprint()),UVM_HIGH)
          end
      
  endfunction
  
  //run phase
  
  task run_phase(uvm_phase phase);
    fork
      begin
        forever begin
          fifo_sb.get(wr_data);
          if(wr_data.write_enable)
            begin
              mem_write(wr_data);
              `uvm_info("WRITE SB","write data" , UVM_LOW)
              wr_data.print;
            end
          else
            begin
              `uvm_info("READ SB", "read data" , UVM_LOW)
              wr_data.print;
              check_data(wr_data,rd_data);
            end              
        end
      end
    join
  endtask
  
  //check data
  
  virtual function void check_data(dp_xtn rd, dp_xtn ref_xtn);
    //dp_xtn ref_xtn;
    
    if(mem_read(ref_xtn,rd))
      begin
        if(rd.data_read==ref_xtn.data_read)
          begin
             `uvm_info(get_type_name(), $sformatf("Scoreboard -Data    Match successful"), UVM_MEDIUM)
          end
        else
          begin
            `uvm_info(get_type_name(), $sformatf("Scoreboard -Data    do not Match successful",rd.sprint,ref_xtn.sprint), UVM_MEDIUM)
          end
      end     
      endfunction
  
  
/*  covergroup dp_cg;
    @(v_if.monitor.mon_cb)
    {
    coverpoint address_write[3:0];
    coverpoint data_write[15:0];
    coverpoint write_enable;
    coverpoint address_read[3:0];
    coverpoint data_read[15:0];
    }
    
    
    
  endgroup
  */
  
  
  
endclass
      //type_id::create() is a static method in the factory registration class ovm_component_registry/ovm_object_registry. When you create a class and want to register it with the factory, you add that type to your class.