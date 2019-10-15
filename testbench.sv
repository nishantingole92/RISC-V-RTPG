//`include "dp_test_pkg"
import uvm_pkg::*;

`include "uvm_macros.svh"

`include "rv_xtn.sv"

`include "rv_sequencer.sv"
`include "rv_driver.sv"
`include "rv_monitor.sv"
`include "rv_agent.sv"

`include "rv_seq.sv"

//`include "rv_sb.sv"
`include "rv_env.sv"
`include "rv_test.sv"

`include "rv_interface.sv"


module rv_top;
  
  bit clock;
  
 always
   begin 
    // #5;
     //clock=1'b0;
     #5 clock=~clock;
   end
  
  rv_inf v_if(clock);
  
  
  
  initial begin
    uvm_config_db#(virtual rv_inf)::set(null,"*","v_if",v_if);
    run_test("rv_test");
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
 initial begin
  #1000 $finish;
 end
endmodule