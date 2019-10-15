interface rv_inf(input bit clock);
  
   //logic clk;
  logic [31:0] rv32i;
  //logic instruction;
  //logic type_;
 // logic valid;
  //logic rv_ack;
  //logic op_retire;
  //logic [31:0]rv_out;
  
  
  //logic clk;
  
  clocking dr_cb@(posedge clock);
    default input #1 output #1; 
    
    output rv32i;
   // output instruction;
   // output type_;
    
    //output valid;
    //input op_retire;
    //input rv_out;
    //input rv_ack;
    
    
  endclocking
  
  clocking mon_cb@(negedge clock);
    default input #1 output #1;
    //input op_retire;
    //input rv_out;
    //input rv_ack;
    input rv32i;
    //input instruction;
    //input type_;
    //input valid;
    
  endclocking
  
  modport driver(clocking dr_cb, /*input op_retire*/ /*rv_out, rv_ack*/ output rv32i /*output instruction, output type_ valid*/);
    modport monitor(clocking mon_cb,/* input op_retire, rv_out, rv_ack*/ input rv32i/* input instruction, input type_  valid*/);
  
endinterface