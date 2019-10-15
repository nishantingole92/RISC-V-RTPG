

// Code your design here
//module ram (clk, add_wr,
  //          data_wr, wr_en, add_rd, data_rd);
  
 /* parameter D_WIDTH = 16;
  parameter A_WIDTH = 4;
  parameter A_MAX = 16; // 2^A_WIDTH
*/
  
  /*
  // Write port
  input  wire  clk;
  input wire [3:0] add_wr;
  input wire [15:0] data_wr;
  input wire  wr_en;

  // Read port
  //input                clk_read;
  input  wire [3:0] add_rd;
  output reg [15:0] data_rd;
  
  //reg    [15:0] data_rd;
  
  // Memory as multi-dimensional array
  reg [15:0] memory [16];

  // Write data to memory
  always @(posedge clk) 
    begin
    if (wr_en) 
      memory[add_wr] <= data_wr;
      else //if (!write_enable)
      data_rd <= memory[add_rd];
 //$dumpfile("dump.vcd"); $dumpvars;

  // Read data from memory
  //always @(posedge clk_read) begin
    
  end
  
  

endmodule

*/