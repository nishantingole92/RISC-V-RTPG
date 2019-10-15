class rv_seq extends uvm_sequence #(rv_xtn);
  
  `uvm_object_utils(rv_seq)
  
  function new(string name="rv_seq");
    super.new(name);
  endfunction
  
  extern task body();
endclass

    task rv_seq::body();//create for xtn class
      req=rv_xtn::type_id::create("req");
      req.r_type = {req.funct7, req.rs2, req.rs1, req.funct3, req.rd, req.opcode};
      repeat(100) begin
        start_item(req);  //sequence calls for start-item and it waits for grant from seqr 
        assert(req.randomize());
        finish_item(req);
      end
  endtask
  